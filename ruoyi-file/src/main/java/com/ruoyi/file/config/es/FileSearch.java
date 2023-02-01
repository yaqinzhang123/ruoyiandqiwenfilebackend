package com.ruoyi.file.config.es;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class FileSearch {
    private String indexName;
    private String userFileId;
    private String fileId;
    private String fileName;
    private String content;
    private String fileUrl;
    private Long fileSize;
    private Integer storageType;
    private String identifier;
    private Long userId;
    private String filePath;
    private String extendName;
    private Integer isDir;
    private String uploadTime;
    private Integer deleteFlag;
    private String deleteTime;
    private String deleteBatchNum;
//    private String index_name;
//    private String user_file_id;
//    private String file_id;
//    private String file_name;
//    private String content;
//    private String file_url;
//    private Long file_size;
//    private Integer storage_type;
//    private String identifier;
//    private Long user_id;
//    private String file_path;
//    private String extend_name;
//    private Integer is_dir;
//    private String upload_time;
//    private Integer delete_flag;
//    private String delete_time;
//    private String delete_batch_num;
}
