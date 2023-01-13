package com.ruoyi.file.controller;

//import co.elastic.clients.elasticsearch.ElasticsearchClient;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ruoyi.file.api.IShareFileService;
import com.ruoyi.file.component.FileDealComp;
import com.ruoyi.file.domain.ShareFile;
import com.ruoyi.file.domain.UserFile;
import com.ruoyi.file.io.QiwenFile;
import com.ruoyi.file.service.UserFileService;
import com.ruoyi.framework.web.service.WebSocketService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

@Slf4j
@Controller
public class TaskController {

    @Resource
    UserFileService userFileService;
    @Resource
    FileDealComp fileDealComp;
    @Resource
    IShareFileService shareFileService;
    @Resource
    WebSocketService webSocketService;


    @Scheduled(fixedRate = 1000 * 60 * 60 * 24)
    public void updateElasticSearch() {
        List<UserFile> userfileList = userFileService.list(new QueryWrapper<UserFile>().eq("deleteFlag", 0));
        for (int i = 0; i < userfileList.size(); i++) {
            try {

                QiwenFile ufopFile = new QiwenFile(userfileList.get(i).getFilePath(), userfileList.get(i).getFileName(), userfileList.get(i).getIsDir() == 1);
                fileDealComp.restoreParentFilePath(ufopFile, userfileList.get(i).getUserId());
                if (i % 1000 == 0 || i == userfileList.size() - 1) {
                    log.info("目录健康检查进度：" + (i + 1) + "/" + userfileList.size());
                }

            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }
        userfileList = userFileService.list(new QueryWrapper<UserFile>().eq("deleteFlag", 0));
//        for (UserFile userFile : userfileList) {
//            fileDealComp.uploadESByUserFileId(userFile.getUserFileId());
//        }

    }

    @Scheduled(fixedRate = Long.MAX_VALUE)
    public void updateFilePath() {
        List<UserFile> list = userFileService.list();
        for (UserFile userFile : list) {
            try {
                String path = QiwenFile.formatPath(userFile.getFilePath());
                if (!userFile.getFilePath().equals(path)) {
                    userFile.setFilePath(path);
                    userFileService.updateById(userFile);
                }
            } catch (Exception e) {
                // ignore
            }
        }
    }

    @Scheduled(fixedRate = Long.MAX_VALUE)
    public void updateShareFilePath() {
        List<ShareFile> list = shareFileService.list();
        for (ShareFile shareFile : list) {
            try {
                String path = QiwenFile.formatPath(shareFile.getShareFilePath());
                shareFile.setShareFilePath(path);
                shareFileService.updateById(shareFile);
            } catch (Exception e) {
                //ignore
            }
        }
    }

    @Scheduled(cron = "*/5 * * * * ?")
    private void pushAlarm() throws IOException {
        System.out.println("开始执行");
        webSocketService.sendAllMessages("告警推送");
    }
}
