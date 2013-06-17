package com.rcuinfomanager.util;

import org.apache.commons.io.IOUtils;

import java.io.*;


public class ImageStore {

    public static void storeImage(String certNum,String storeDir, String name, InputStream is) throws IOException {
        File file = new File(storeDir + File.separator + certNum + File.separator + name);
        if (!file.exists()) {
            file.getParentFile().mkdirs();
        }
        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
        IOUtils.copy(is, out);
        out.close();
    }
}
