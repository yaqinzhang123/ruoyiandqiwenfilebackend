package com.ruoyi.webgis.utils;

import com.ruoyi.webgis.enums.BizCodeEnum;
import lombok.extern.slf4j.Slf4j;
import net.lingala.zip4j.core.ZipFile;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;


@Slf4j
public class FileUtils {

    /**
     * 文件上传
     *
     * @param file 文件
     * @param subdirectory 文件夹名称
     * @return
     */
    public static JsonData saveFileCompress(MultipartFile file, String subdirectory) {
        //上传文件路径
        String path = subdirectory;
        // 获取文件名称
        String filename = CommonUtil.generateUUID();
        String fielExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
//        //重新修改文件名防止重名
//        filename = new SimpleDateFormat("yyyyMMddHHmmssSSS")
//                .format(new Date())
//                + (new Random().nextInt(9000) % (9000 - 1000 + 1) + 1000) + CommonUtil.generateUUID() + fielhouzhui;
        File filepath = new File(path, filename+fielExt);
        //判断路径是否存在，没有就创建一个
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        File fileExchange = new File(path + File.separator + filename);
        try {
            long fileSize = file.getSize()/1024;
            log.info(filename+"文件大小:"+fileSize+"kb");

            file.transferTo(fileExchange);
            return JsonData.buildSuccess(filename);
        } catch (IOException e) {
            log.info(filename + "文件上传失败:" + e);
            return JsonData.buildResult(BizCodeEnum.FILE_UPLOAD_ERROR);
        }
    }
    public static String saveFileAndExtractall(MultipartFile file, String subdirectory){
        String filename = CommonUtil.generateUUID();
        String fielExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        File file1 = new File(subdirectory + filename+".zip");
        //上传文件到服务器/opt/目录下
        //File file1 = new File("E:/zip/" + entity.getValue()+".zip");
        try {
        org.apache.commons.io.FileUtils.writeByteArrayToFile(file1,file.getBytes());
            ZipFile zipFile = new ZipFile(file1);
            //给的vr是gbk，如果这里，你上传的zip包为utf-8，那么这里改为utf-8
            zipFile.setFileNameCharset("utf-8");
            String path=subdirectory+"/"+filename;
            //解压到指定目录
            File filepath = new File(path);
            if (!filepath.exists()) {
                filepath.mkdirs();
            }
            zipFile.extractAll(path);
            file1.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return filename;
    }

    public static Boolean delete(String filePath) {
        File file = new File(filePath);
        if (file.exists()) {
            file.delete();
            return true;
        } else {
            return false;
        }
    }

    public static String hasExchangeFile(String filePath){
        File file = new File(filePath);
        String[] list = file.list();
        File[] files = file.listFiles();
        for (File listFile:files) {
            //存在文件则退出，输出文件路径
            if (listFile.getName().equals("Data")){
                file=listFile.getParentFile();
                break;
            }else {
                return FileUtils.hasExchangeFile(listFile.getPath());
            }
        }
        return file.getPath();
    }

    public static void delExchangeResourceFile(File optionFile){
        File[] files=optionFile.listFiles();//获取文件列表
        for (File fd:files) {
            if (fd.isDirectory()){
                //如果是文件夹，则递归遍历
                delExchangeResourceFile(fd);
                continue;
            }
            if(fd.getName().endsWith(".osgb") || fd.getName().endsWith(".xml")) fd.delete();//后缀名为osgb\xml就删除
        }
    }
}