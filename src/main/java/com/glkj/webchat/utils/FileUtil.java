package com.glkj.webchat.utils;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
public class FileUtil {

    /**
     * 按照分隔符将地址字符串切割开,然后拼装成FIle数组
     * @param files 字符串
     * @param split 分隔符,可以为正则
     * @return
     */
    public File[] getFileArrayByString(String files, String split){
        String[] aa = files.split(split);
        File[] attachments = new File[aa.length];
        for(int i=0;i<aa.length;i++){
            attachments[i] = new File(aa[i]);
        }
        return attachments;
    }

    public String getFilePrefix(MultipartFile file){
        String fileName=file.getOriginalFilename();
        String prefix=fileName.substring(fileName.lastIndexOf(".")+1);
        return prefix;
    }

}
