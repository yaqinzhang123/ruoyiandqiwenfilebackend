package com.ruoyi.file.api;

import com.ruoyi.file.domain.FileBean;
import com.ruoyi.file.dto.file.DownloadFileDTO;
import com.ruoyi.file.dto.file.PreviewDTO;
import com.ruoyi.file.dto.file.UploadFileDTO;
import com.ruoyi.file.vo.file.UploadFileVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

public interface IFiletransferService {

    UploadFileVo uploadFileSpeed(UploadFileDTO uploadFileDTO,Long userId);

    void uploadFile(HttpServletRequest request, UploadFileDTO UploadFileDto, Long userId);

    void downloadFile(HttpServletResponse httpServletResponse, DownloadFileDTO downloadFileDTO);
    void downloadUserFileList(HttpServletResponse httpServletResponse, String filePath, String fileName, List<String> userFileIds);
    void previewFile(HttpServletResponse httpServletResponse, PreviewDTO previewDTO);
    void previewFileDWG(InputStream inputStream);
    void previewPictureFile(HttpServletResponse httpServletResponse, PreviewDTO previewDTO);
    void deleteFile(FileBean fileBean);

    Long selectStorageSizeByUserId(Long userId);
    Long selectStorageSizeByUserIdDept(Long userId);
}
