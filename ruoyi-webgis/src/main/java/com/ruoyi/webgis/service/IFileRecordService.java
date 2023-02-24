package com.ruoyi.webgis.service;


import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.webgis.common.entity.Result;
import com.ruoyi.webgis.model.po.FileRecord;
import com.ruoyi.webgis.model.po.FileZoneRecord;
import com.baomidou.mybatisplus.extension.service.IService;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 文件上传记录 服务类
 * </p>
 *
 * @author haijun
 * @since 2020-02-14
 */
public interface IFileRecordService extends IService<FileRecord> {

    AjaxResult upload(HttpServletRequest request, Integer uploadType, Integer storageYear);

    AjaxResult zoneUpload(HttpServletRequest request, String contentType, FileZoneRecord fileZoneRecord);

    AjaxResult md5Check(FileZoneRecord fileZoneRecord, Integer checkType, String contentType, HttpServletRequest request);

    AjaxResult mergeZoneFile(String totalmd5, HttpServletRequest request,Long projectId);

    AjaxResult delZoneFile(String totalmd5);

    AjaxResult delFile(String fileId);

//    void recordDownloadLog(String fileId, FileRecord fileRecord);
}
