package com.rcuinfomanager.util;

import org.apache.commons.io.IOUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;


public class ImageUtils {

    public static void storeFile(String storeDir, String fileName, InputStream is) throws IOException {
        File file = new File(storeDir + File.separator + File.separator + fileName);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
        }
        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
        IOUtils.copy(is, out);
        out.close();
    }

    public static void storeImage(String certNum,String storeDir, String name, InputStream is) throws IOException {
        File file = new File(storeDir + File.separator + certNum + File.separator + name);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
        }
        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
        IOUtils.copy(is, out);
        out.close();
    }

    public static InputStream getImageStream(String certNum, String storeDir, String name) throws IOException {
        File file = new File(storeDir + File.separator + certNum + File.separator + name + ".jpg");
        if (!file.exists()) {
            file = new File(storeDir + File.separator + certNum + File.separator + name + ".apk");
        }

        if (!file.exists()) {
            return null;
        }

        return new FileInputStream(file);
    }

    public static List<String> getFileNames(String certNum, String storeDir) {
        File file = new File(storeDir + File.separator + certNum);
        if (!file.exists()) {
            return null;
        }

        String[] tmpList = file.list(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                if (name.endsWith(".jpg") || name.endsWith(".apk")) {
                    return true;
                }
                return false;
            }
        });

        List retVal = null;
        if (tmpList!= null && tmpList.length > 0) {
            retVal = new ArrayList(tmpList.length);
            for (int i = 0; i < tmpList.length; i++) {
                retVal.add(certNum+ "/" +tmpList[i].replaceAll("\\.jpg",""));
            }
        }

        return retVal;
    }
}
