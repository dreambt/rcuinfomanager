/**
 * 
 */
package com.rcuinfomanager.util.zip.extend;


import com.rcuinfomanager.util.FileUtils;
import com.rcuinfomanager.util.zip.EncryptZipEntry;
import com.rcuinfomanager.util.zip.EncryptZipInput;

import java.io.*;


public class UnzipFromFlex {

        public static void unzipFiles(byte[] zipBytes, String password, String dir) throws IOException {
                InputStream bais = new ByteArrayInputStream(zipBytes);
                EncryptZipInput zin = new EncryptZipInput(bais,password);
                EncryptZipEntry ze;
                while ((ze = zin.getNextEntry()) != null) {
                        ByteArrayOutputStream toScan = new ByteArrayOutputStream();
                        byte[] buf = new byte[1024];
                        int len;
                        while ((len = zin.read(buf)) > 0) {
                                toScan.write(buf, 0, len);
                        }
                        byte[] fileOut = toScan.toByteArray();
                        toScan.close();                 
                        FileUtils.writeByteFile(fileOut, new File(dir + File.separator + ze.getName()));
                        
                }
                zin.close();
                bais.close();
        }
        
}
