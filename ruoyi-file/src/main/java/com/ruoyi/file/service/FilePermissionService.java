package com.ruoyi.file.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.file.api.IFilePermissionService;
import com.ruoyi.file.domain.FilePermission;
import com.ruoyi.file.mapper.FilePermissionMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@Transactional(rollbackFor=Exception.class)
public class FilePermissionService extends ServiceImpl<FilePermissionMapper, FilePermission> implements IFilePermissionService {

}
