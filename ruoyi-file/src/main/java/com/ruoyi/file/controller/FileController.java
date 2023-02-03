package com.ruoyi.file.controller;

import cn.hutool.core.bean.BeanUtil;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.core.search.HighlighterEncoder;
import co.elastic.clients.elasticsearch.core.search.Hit;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qiwenshare.common.anno.MyLog;
import com.qiwenshare.common.exception.QiwenException;
import com.qiwenshare.common.result.RestResult;
import com.qiwenshare.common.util.DateUtil;
import com.qiwenshare.common.util.security.JwtUser;
import com.qiwenshare.common.util.security.SessionUtil;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.file.api.IFileService;
import com.ruoyi.file.api.IUserFileService;
import com.ruoyi.file.component.AsyncTaskComp;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.config.es.FileSearch;
import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.dto.file.*;
import com.ruoyi.file.io.QiwenFile;
import com.ruoyi.file.util.QiwenFileUtil;
import com.ruoyi.file.util.TreeNode;
import com.ruoyi.file.vo.file.FileDetailVO;
import com.ruoyi.file.vo.file.FileListVo;
import com.ruoyi.file.vo.file.SearchFileVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.eclipse.jetty.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.*;

@Tag(name = "file", description = "该接口为文件接口，主要用来做一些文件的基本操作，如创建目录，删除，移动，复制等。")
@RestController
@Slf4j
@RequestMapping("/file")
public class FileController extends BaseController {

    @Resource
    IFileService fileService;
    @Resource
    IUserFileService userFileService;

    @Resource
    FileDealComp fileDealComp;
    @Resource
    AsyncTaskComp asyncTaskComp;
    @Resource
    private ElasticsearchClient elasticsearchClient;

    public static final String CURRENT_MODULE = "文件接口";


    @Operation(summary = "创建文件", description = "目录(文件夹)的创建", tags = {"file"})
    @RequestMapping(value = "/createfile", method = RequestMethod.POST)
    @MyLog(operation = "创建文件", module = CURRENT_MODULE)
    public AjaxResult createFile(@Valid @RequestBody CreateFileDTO createFileDto) {

         LoginUser sessionUserBean= SecurityUtils.getLoginUser();


        boolean isDirExist = fileDealComp.isDirExist(createFileDto.getFileName(), createFileDto.getFilePath(), sessionUserBean.getUserId());

        if (isDirExist) {
            return error("创建文件夹'" + createFileDto.getFileName() + "'失败，同名文件已存在");
        }

        UserFile userFile = QiwenFileUtil.getQiwenDir(sessionUserBean.getUserId(), createFileDto.getFilePath(), createFileDto.getFileName());

        userFileService.save(userFile);
        fileDealComp.uploadESByUserFileId(userFile.getUserFileId());
        return AjaxResult.success();
    }

    @Operation(summary = "文件搜索", description = "文件搜索", tags = {"file"})
    @GetMapping(value = "/search")
    @MyLog(operation = "文件搜索", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult searchFile(SearchFileDTO searchFileDTO) {
        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();

        int currentPage = (int)searchFileDTO.getCurrentPage() - 1;
        int pageCount = (int)(searchFileDTO.getPageCount() == 0 ? 10 : searchFileDTO.getPageCount());

        SearchResponse<FileSearch> search = null;
        try {
            search = elasticsearchClient.search(s -> s
                            .index("filesearch")
                            .query(_1 -> _1
                                    .bool(_2 -> _2
                                            .must(_3 -> _3
                                                    .bool(_4 -> _4
                                                            .should(_5 -> _5
                                                                    .match(_6 -> _6
                                                                            .field("fileName")
                                                                            .query(searchFileDTO.getFileName())))
                                                            .should(_5 -> _5
                                                                    .wildcard(_6 -> _6
                                                                            .field("fileName")
                                                                            .wildcard("*" + searchFileDTO.getFileName() + "*")))
                                                            .should(_5 -> _5
                                                                    .match(_6 -> _6
                                                                            .field("content")
                                                                            .query(searchFileDTO.getFileName())))
                                                            .should(_5 -> _5
                                                                    .wildcard(_6 -> _6
                                                                            .field("content")
                                                                            .wildcard("*" + searchFileDTO.getFileName() + "*")))
                                                    ))
                                            .must(_3 -> _3
                                                    .term(_4 -> _4
                                                            .field("userId")
                                                            .value(sessionUserBean.getUserId())))
                                    ))
                            .from(currentPage)
                            .size(pageCount)
                            .highlight(h -> h
                                    .fields("fileName", f -> f.type("plain")
                                            .preTags("<span class='keyword'>").postTags("</span>"))
                                    .encoder(HighlighterEncoder.Html))
                            ,
                    FileSearch.class);
        } catch (IOException e) {
            e.printStackTrace();
            log.error(e.getMessage());
        }

        List<SearchFileVO> searchFileVOList = new ArrayList<>();
        if(search!=null){
            for (Hit<FileSearch> hit : search.hits().hits()) {
                SearchFileVO searchFileVO = new SearchFileVO();
                BeanUtil.copyProperties(hit.source(), searchFileVO);
                searchFileVO.setHighLight(hit.highlight());
                searchFileVOList.add(searchFileVO);
                asyncTaskComp.checkESUserFileId(searchFileVO.getUserFileId());
            }
            return AjaxResult.success(searchFileVOList);
        }else{
            return AjaxResult.error("查询失败");
        }

    }


    @Operation(summary = "文件重命名", description = "文件重命名", tags = {"file"})
    @RequestMapping(value = "/renamefile", method = RequestMethod.POST)
    @MyLog(operation = "文件重命名", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult renameFile(@RequestBody RenameFileDTO renameFileDto) {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();
        UserFile userFile = userFileService.getById(renameFileDto.getUserFileId());

        List<UserFile> userFiles = userFileService.selectUserFileByNameAndPath(renameFileDto.getFileName(), userFile.getFilePath(), sessionUserBean.getUserId());
        if (userFiles != null && !userFiles.isEmpty()) {
            return AjaxResult.error("同名文件已存在");
        }

        LambdaUpdateWrapper<UserFile> lambdaUpdateWrapper = new LambdaUpdateWrapper<>();
        lambdaUpdateWrapper.set(UserFile::getFileName, renameFileDto.getFileName())
                .set(UserFile::getUploadTime, DateUtil.getCurrentTime())
                .eq(UserFile::getUserFileId, renameFileDto.getUserFileId());
        userFileService.update(lambdaUpdateWrapper);
        if (1 == userFile.getIsDir()) {
            List<UserFile> list = userFileService.selectUserFileByLikeRightFilePath(new QiwenFile(userFile.getFilePath(), userFile.getFileName(), true).getPath(), sessionUserBean.getUserId());

            for (UserFile newUserFile : list) {
                newUserFile.setFilePath(newUserFile.getFilePath().replaceFirst(new QiwenFile(userFile.getFilePath(), userFile.getFileName(), userFile.getIsDir() == 1).getPath(),
                        new QiwenFile(userFile.getFilePath(), renameFileDto.getFileName(), userFile.getIsDir() == 1).getPath()));
                userFileService.updateById(newUserFile);
            }
        }
        fileDealComp.uploadESByUserFileId(renameFileDto.getUserFileId());
        return AjaxResult.success();
    }

    @Operation(summary = "获取文件列表", description = "用来做前台列表展示", tags = {"file"})
    @RequestMapping(value = "/getfilelist", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult getFileList(
            @Parameter(description = "文件路径", required = true) String filePath,
            @Parameter(description = "当前页", required = true) long currentPage,
            @Parameter(description = "页面数量", required = true) long pageCount){


//        IPage<FileListVo> fileList = userFileService.userFileList(null, filePath, currentPage, pageCount);
        IPage<FileListVo> fileList = userFileService.userFileListByDept(null, filePath, currentPage, pageCount);
        Map<String, Object> map = new HashMap<>();
        if(fileList==null){
            map.put("total", 0);
            map.put("list", "");
        }else{
            map.put("total", fileList.getTotal());
            map.put("list", fileList.getRecords());
        }
        return AjaxResult.success(map);

    }

    @Operation(summary = "批量删除文件", description = "批量删除文件", tags = {"file"})
    @RequestMapping(value = "/batchdeletefile", method = RequestMethod.POST)
    @MyLog(operation = "批量删除文件", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult deleteImageByIds(@RequestBody BatchDeleteFileDTO batchDeleteFileDto) {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();
        List<UserFile> userFiles = JSON.parseArray(batchDeleteFileDto.getFiles(), UserFile.class);
        DigestUtils.md5Hex("data");
        for (UserFile userFile : userFiles) {

            userFileService.deleteUserFile(userFile.getUserFileId(),sessionUserBean.getUserId());
            fileDealComp.deleteESByUserFileId(userFile.getUserFileId());
        }

        return AjaxResult.success("批量删除文件成功");
    }

    @Operation(summary = "删除文件", description = "可以删除文件或者目录", tags = {"file"})
    @RequestMapping(value = "/deletefile", method = RequestMethod.POST)
    @MyLog(operation = "删除文件", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult deleteFile(@RequestBody DeleteFileDTO deleteFileDto) {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();
        userFileService.deleteUserFile(deleteFileDto.getUserFileId(), sessionUserBean.getUserId());
        fileDealComp.deleteESByUserFileId(deleteFileDto.getUserFileId());
        return AjaxResult.success();
    }

    @Operation(summary = "解压文件", description = "解压文件。", tags = {"file"})
    @RequestMapping(value = "/unzipfile", method = RequestMethod.POST)
    @MyLog(operation = "解压文件", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult unzipFile(@RequestBody UnzipFileDTO unzipFileDto) {

        try {
            fileService.unzipFile(unzipFileDto.getUserFileId(), unzipFileDto.getUnzipMode(), unzipFileDto.getFilePath());
        } catch (QiwenException e) {
            return AjaxResult.error(e.getMessage());
        }

        return AjaxResult.success();

    }

    @Operation(summary = "文件复制", description = "可以复制文件或者目录", tags = {"file"})
    @RequestMapping(value = "/copyfile", method = RequestMethod.POST)
    @MyLog(operation = "文件复制", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult copyFile(@RequestBody CopyFileDTO copyFileDTO) {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();

        String userFileId = copyFileDTO.getUserFileId();
        UserFile userFile = userFileService.getById(userFileId);
        String oldfilePath = userFile.getFilePath();
        String newfilePath = copyFileDTO.getFilePath();
        String fileName = userFile.getFileName();
        if (userFile.getIsDir() == 1) {
            QiwenFile qiwenFile = new QiwenFile(oldfilePath, fileName, true);
            if (newfilePath.startsWith(qiwenFile.getPath() + QiwenFile.separator) || newfilePath.equals(qiwenFile.getPath())) {
                return AjaxResult.error("原路径与目标路径冲突，不能复制");
            }
        }

        userFileService.userFileCopy(userFileId, newfilePath,sessionUserBean.getUserId());
        fileDealComp.deleteRepeatSubDirFile(newfilePath, sessionUserBean.getUserId());
        return AjaxResult.success();

    }

    @Operation(summary = "文件移动", description = "可以移动文件或者目录", tags = {"file"})
    @RequestMapping(value = "/movefile", method = RequestMethod.POST)
    @MyLog(operation = "文件移动", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult moveFile(@RequestBody MoveFileDTO moveFileDto) {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();
        UserFile userFile = userFileService.getById(moveFileDto.getUserFileId());
        String oldfilePath = userFile.getFilePath();
        String newfilePath = moveFileDto.getFilePath();
        String fileName = userFile.getFileName();
        String extendName = userFile.getExtendName();
        if (StringUtil.isEmpty(extendName)) {
            QiwenFile qiwenFile = new QiwenFile(oldfilePath, fileName, true);
            if (newfilePath.startsWith(qiwenFile.getPath() + QiwenFile.separator) || newfilePath.equals(qiwenFile.getPath())) {
                return AjaxResult.error("原路径与目标路径冲突，不能移动");
            }
        }

        userFileService.updateFilepathByUserFileId(moveFileDto.getUserFileId(), newfilePath, sessionUserBean.getUserId());

        fileDealComp.deleteRepeatSubDirFile(newfilePath, sessionUserBean.getUserId());
        return AjaxResult.success();

    }

    @Operation(summary = "批量移动文件", description = "可以同时选择移动多个文件或者目录", tags = {"file"})
    @RequestMapping(value = "/batchmovefile", method = RequestMethod.POST)
    @MyLog(operation = "批量移动文件", module = CURRENT_MODULE)
    @ResponseBody
    public AjaxResult batchMoveFile(@RequestBody BatchMoveFileDTO batchMoveFileDto) {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();

        String files = batchMoveFileDto.getFiles();
        String newfilePath = batchMoveFileDto.getFilePath();

        List<UserFile> fileList = JSON.parseArray(files, UserFile.class);

        for (UserFile userFile : fileList) {
           
            if (StringUtil.isEmpty(userFile.getExtendName())) {
                QiwenFile qiwenFile = new QiwenFile(userFile.getFilePath(), userFile.getFileName(), true);
                if (newfilePath.startsWith(qiwenFile.getPath() + QiwenFile.separator) || newfilePath.equals(qiwenFile.getPath())) {
                    return AjaxResult.error("原路径与目标路径冲突，不能移动");
                }
            }
            userFileService.updateFilepathByUserFileId(userFile.getUserFileId(), newfilePath, sessionUserBean.getUserId());
        }

        return AjaxResult.success("批量移动文件成功");

    }



    @Operation(summary = "通过文件类型选择文件", description = "该接口可以实现文件格式分类查看", tags = {"file"})
    @RequestMapping(value = "/selectfilebyfiletype", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult selectFileByFileType(@Parameter(description = "文件类型", required = true) int fileType,
                                                                      @Parameter(description = "当前页", required = true) @RequestParam(defaultValue = "1") long currentPage,
                                                                      @Parameter(description = "页面数量", required = true) @RequestParam(defaultValue = "10") long pageCount) {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();

        long userId = sessionUserBean.getUserId();

        IPage<FileListVo> result = userFileService.getFileByFileType(fileType, currentPage, pageCount, userId);
        Map<String, Object> map = new HashMap<>();
        map.put("list", result.getRecords());
        map.put("total", result.getTotal());
        return AjaxResult.success(map);

    }

    @Operation(summary = "获取文件树", description = "文件移动的时候需要用到该接口，用来展示目录树", tags = {"file"})
    @RequestMapping(value = "/getfiletree", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult getFileTree() {

        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();

        List<UserFile> userFileList = userFileService.selectFilePathTreeByUserId(sessionUserBean.getUserId());
        TreeNode resultTreeNode = new TreeNode();
        resultTreeNode.setLabel(QiwenFile.separator);
        resultTreeNode.setId(0L);
        long id = 1;
        for (int i = 0; i < userFileList.size(); i++){
            UserFile userFile = userFileList.get(i);
            QiwenFile qiwenFile = new QiwenFile(userFile.getFilePath(), userFile.getFileName(), false);
            String filePath = qiwenFile.getPath();

            Queue<String> queue = new LinkedList<>();

            String[] strArr = filePath.split(QiwenFile.separator);
            for (int j = 0; j < strArr.length; j++){
                if (!"".equals(strArr[j]) && strArr[j] != null){
                    queue.add(strArr[j]);
                }

            }
            if (queue.size() == 0){
                continue;
            }

            resultTreeNode = fileDealComp.insertTreeNode(resultTreeNode, id++, QiwenFile.separator, queue);


        }
        List<TreeNode> treeNodeList = resultTreeNode.getChildren();
        Collections.sort(treeNodeList, (o1, o2) -> {
            long i = o1.getId() - o2.getId();
            return (int) i;
        });
        return AjaxResult.success(resultTreeNode);

    }

    @Operation(summary = "修改文件", description = "支持普通文本类文件的修改", tags = {"file"})
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult updateFile(@RequestBody UpdateFileDTO updateFileDTO) {
        LoginUser sessionUserBean =  SecurityUtils.getLoginUser();
        UserFile userFile = userFileService.getById(updateFileDTO.getUserFileId());
        FileBean fileBean = fileService.getById(userFile.getFileId());
        Long pointCount = fileService.getFilePointCount(userFile.getFileId());
        String fileUrl = fileBean.getFileUrl();
        if (pointCount > 1) {
            fileUrl = fileDealComp.copyFile(fileBean, userFile);
        }
        String content = updateFileDTO.getFileContent();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(content.getBytes());
        try {
            int fileSize = byteArrayInputStream.available();
            fileDealComp.saveFileInputStream(fileBean.getStorageType(), fileUrl, byteArrayInputStream);

            String md5Str = fileDealComp.getIdentifierByFile(fileUrl, fileBean.getStorageType());

            fileService.updateFileDetail(userFile.getUserFileId(), md5Str, fileSize, sessionUserBean.getUserId());


        } catch (Exception e) {
            throw new QiwenException(999999, "修改文件异常");
        } finally {
            try {
                byteArrayInputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return AjaxResult.success("修改文件成功");
    }

    @Operation(summary = "查询文件详情", description = "查询文件详情", tags = {"file"})
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult queryFileDetail(
            @Parameter(description = "用户文件Id", required = true) String userFileId){
        FileDetailVO vo = fileService.getFileDetail(userFileId);
        return AjaxResult.success(vo);
    }




}
