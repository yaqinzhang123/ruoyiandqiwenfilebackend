package com.ruoyi.file.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.file.domain.StorageBean;

public interface IStorageService extends IService<StorageBean> {
    Long getTotalStorageSize(Long deptId);
    void setTotalStorageSize(Long deptId,Long totalStorageSize);
    boolean checkStorage(Long deptId, Long fileSize);
}
