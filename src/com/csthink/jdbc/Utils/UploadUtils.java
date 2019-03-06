package com.csthink.jdbc.Utils;

import java.util.UUID;

public class UploadUtils {

    /*

    public static String getUUIDFileName(String fileName) {
        // 将文件名的前面部分进行截取：xx.jpg   --->   .jpg
        int idx = fileName.lastIndexOf(".");
        String ext = fileName.substring(idx);

        return UUID.randomUUID().toString().replace("-", "") + ext;
    }
    */


    public static String getUUIDFileName(String fileName) {
        // 将文件名的前面部分进行截取：xx.jpg   --->   .jpg
        int idx = fileName.lastIndexOf(".");
        String ext = fileName.substring(idx);

        return UUID.randomUUID().toString().replace("-", "") + ext;
    }
}
