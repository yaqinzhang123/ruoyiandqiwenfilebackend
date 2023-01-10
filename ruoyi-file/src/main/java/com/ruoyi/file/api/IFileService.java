package com.ruoyi.file.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.vo.file.FileDetailVO;

public interface IFileService  extends IService<FileBean> {

    Long getFilePointCount(String fileId);
    void unzipFile(String userFileId, int unzipMode, String filePath);

    void updateFileDetail(String userFileId, String identifier, long fileSize, long modifyUserId);

    FileDetailVO getFileDetail(String userFileId);

}
