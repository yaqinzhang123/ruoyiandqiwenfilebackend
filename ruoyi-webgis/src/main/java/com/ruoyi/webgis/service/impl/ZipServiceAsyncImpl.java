package com.ruoyi.webgis.service.impl;

import com.ruoyi.webgis.common.CMDUtil;
import com.ruoyi.webgis.common.CommonFields;
import com.ruoyi.webgis.conf.Configer;
import com.ruoyi.webgis.constant.SysConfigConstant;
import com.ruoyi.webgis.exception.NginxServiceManagerException;
import com.ruoyi.webgis.mapper.ResourceMapper;
import com.ruoyi.webgis.model.po.ProjectPO;
import com.ruoyi.webgis.model.po.ResourcePO;
import com.ruoyi.webgis.utils.CommonUtil;
import com.ruoyi.webgis.utils.FileUtils;
import com.ruoyi.webgis.utils.UtilFuns;
import lombok.extern.slf4j.Slf4j;
import net.lingala.zip4j.core.ZipFile;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

@Service
@Slf4j
public class ZipServiceAsyncImpl {

    @Autowired
    private ResourceMapper resourceMapper;

    @Async
    public void extractZip(File zipFilePath, String desDirectory, ResourcePO resource){
        try {
            ZipFile zipFile = new ZipFile(zipFilePath);
            //给的vr是gbk，如果这里，你上传的zip包为utf-8，那么这里改为utf-8
            zipFile.setFileNameCharset("gbk");
            //解压到指定目录
            File filepath = new File(desDirectory);
            if (!filepath.exists()) {
                filepath.mkdirs();
            }
            zipFile.extractAll(desDirectory);

            //压缩原文件删除
//            zipFilePath.delete();
            resource.setResourceStatus(2);

            String optionPath = resource.getResourcePath().substring(0,resource.getResourcePath().lastIndexOf("."));
            String exchangeFilePath = com.ruoyi.webgis.utils.FileUtils.hasExchangeFile(optionPath);
            //apiTailPath  ==> /id/目录/**/ Data，数据文件的根目录
//            exchangeFilePath.replaceAll("","/");
            exchangeFilePath = exchangeFilePath.replaceAll("\\\\","/");
            String apiTailPath=exchangeFilePath.substring(exchangeFilePath.indexOf(resource.getResourceNo()));
            resource.setResourceApiUrl(resource.getResourceApiUrl()+File.separator+apiTailPath+File.separator+"tileset.json");
            resource.setResourceShareUrl(resource.getResourceShareUrl()+apiTailPath);
            resourceMapper.updateById(resource);
//            // 读入流
//            ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(zipFilePath), Charset.forName("GBK"));
//            // 遍历每一个文件
//            ZipEntry zipEntry = zipInputStream.getNextEntry();
//
//            File desDir = new File(desDirectory);
//            if (!desDir.exists()) {
//                boolean mkdirSuccess = desDir.mkdir();
//                if (!mkdirSuccess) {
//                    throw new Exception("创建解压目标文件夹失败");
//                }
//            }
//
//            while (zipEntry != null) {
//
//                if (!zipEntry.isDirectory()) {
//                    // 文件
//                    String generateFileName = CommonUtil.generateUUID();
//
//                    String filePath=zipEntry.getName().replace("/", "\\");;
//
//                    String fileName="";
//                    if (filePath.lastIndexOf("\\")>=0){
//                        fileName=zipEntry.getName().substring(filePath.lastIndexOf("\\")+1);
//                    }else {
//                        fileName=zipEntry.getName();
//                    }
//
//                    // 写出文件流  文件根路径+文件编号+文件后缀名
//                    String unzipFilePath = desDirectory + generateFileName + fileName.substring(fileName.lastIndexOf("."));
//                    BufferedOutputStream bufferedOutputStream =
//                            new BufferedOutputStream(new FileOutputStream(unzipFilePath));
//                    byte[] bytes = new byte[1024];
//                    int readLen;
//                    while ((readLen = zipInputStream.read(bytes)) != -1) {
//                        bufferedOutputStream.write(bytes, 0, readLen);
//                    }
//                    bufferedOutputStream.close();
//
//                    zipInputStream.closeEntry();
//                    zipEntry = zipInputStream.getNextEntry();
//                    ResourcePO resourcePO = new ResourcePO();
////                    resourcePO.setResourceId(resourceId);
//                    resourcePO.setProjectId(projectPO.getProjectId());
//                    resourcePO.setResourceName(fileName);
//                    resourcePO.setResourceDownUrl("http://localhost:"+projectPO.getProjectPort()+"/"+generateFileName+fileName.substring(fileName.lastIndexOf(".")));
//                    resourcePO.setResourceStatus(2);
//                    resourcePO.setResourceNo(generateFileName);
//                    resourcePO.setResourcePath(unzipFilePath);
//                    resourcePOS.add(resourcePO);
//                }
//                zipEntry = zipInputStream.getNextEntry();
//            }
//            zipInputStream.close();
//
//            //压缩原文件删除
//            zipFilePath.delete();
//
//            for (ResourcePO resourcePo:resourcePOS) {
//                resourceMapper.insert(resourcePo);
//            }
//            resourceMapper.deleteById(resourceId);
//            return resourcePOS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("解压结束......");
        //执行数据转换
        exchangeOsgb(desDirectory,resource);
    }

//    /**
//     * 解压
//     *
//     * @param zipFilePath 带解压文件
//     * @param desDirectory 解压到的目录
//     * @throws Exception
//     */
//    public List<ResourcePO> unzip(File zipFilePath, String desDirectory, Long resourceId) throws Exception {
//
//
//
//    }
@Async
public void exchangeOsgb(String optionPath, ResourcePO resource){
    File file = new File(optionPath);
    if (!file.exists()) return;
    String exchangeFilePath = FileUtils.hasExchangeFile(optionPath);
//    String _3dtileExe=System.getProperty("user.dir")+"\\3dtile\\3dtile.exe";
    String _3dtileExe = SysConfigConstant.configs.get("3dtile_Path");
    log.info("3dtilPath::"+_3dtileExe);
    log.info("3dtile,cmd::"+_3dtileExe + " -f osgb -i " + exchangeFilePath+" -o "+ exchangeFilePath);
    String excuse = CMDUtil.excuseSingel(_3dtileExe + " -f osgb -i " + exchangeFilePath+" -o "+ exchangeFilePath);
    System.out.println(excuse);
//    if (!"".equals(excuse.trim())) {
//        throw new NginxServiceManagerException("Nginx启动异常:" + excuse);
//    }
    FileUtils.delExchangeResourceFile(file);
    resource.setResourceStatus(3);
    resourceMapper.updateById(resource);
    System.out.println("转换结束......");
}


//    /**
//     * 解压
//     *
//     * @param zipFilePath 带解压文件
//     * @param desDirectory 解压到的目录
//     * @throws Exception
//     */
//    public static void unzip(File zipFilePath, String desDirectory) throws Exception {
//
//        File desDir = new File(desDirectory);
//        if (!desDir.exists()) {
//            boolean mkdirSuccess = desDir.mkdir();
//            if (!mkdirSuccess) {
//                throw new Exception("创建解压目标文件夹失败");
//            }
//        }
//        // 读入流
//        ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(zipFilePath));
//        // 遍历每一个文件
//        ZipEntry zipEntry = zipInputStream.getNextEntry();
//        while (zipEntry != null) {
//            if (zipEntry.isDirectory()) { // 文件夹
//                String unzipFilePath = desDirectory + File.separator + zipEntry.getName();
//                // 直接创建
//                mkdir(new File(unzipFilePath));
//            } else { // 文件
//                String unzipFilePath = desDirectory + File.separator + zipEntry.getName();
//                File file = new File(unzipFilePath);
//                // 创建父目录
//                mkdir(file.getParentFile());
//                // 写出文件流
//                BufferedOutputStream bufferedOutputStream =
//                        new BufferedOutputStream(new FileOutputStream(unzipFilePath));
//                byte[] bytes = new byte[1024];
//                int readLen;
//                while ((readLen = zipInputStream.read(bytes)) != -1) {
//                    bufferedOutputStream.write(bytes, 0, readLen);
//                }
//                bufferedOutputStream.close();
//            }
//            zipInputStream.closeEntry();
//            zipEntry = zipInputStream.getNextEntry();
//        }
//        zipInputStream.close();
//    }

    // 如果父目录不存在则创建
    private static void mkdir(File file) {
        if (null == file || file.exists()) {
            return;
        }
        mkdir(file.getParentFile());
        file.mkdir();
    }

}
