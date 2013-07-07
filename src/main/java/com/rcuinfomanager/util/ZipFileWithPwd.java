/**
 * 
 */
package com.rcuinfomanager.util;

import com.rcuinfomanager.util.zip.ZipUtils;
import com.rcuinfomanager.util.zip.extend.UnzipFromFlex;
import com.rcuinfomanager.util.zip.extend.ZipOutput2Flex;
import com.security.mdfive.MDFive;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;


/**
 * ��������ѹ���ļ�����(����)<br>
 * ����ʱ�䣺2013-5-2 ����11:28:10 �����ˣ����Ǧ
 */
public class ZipFileWithPwd {

	private static final String PASSWORD = "test";
	private static final String SP = File.separator;

	public static void encryptZipFile(String zipDir, String encryptFileDir,
			String fileName) {
		try {
			File zipFile = new File(zipDir + SP + fileName);
			byte[] zipByte = ZipOutput2Flex
					.getEncryptZipByte(zipFile, MDFive.getEncryptPwd());
			FileUtils.writeByteFile(zipByte, new File(encryptFileDir + SP
					+ zipFile.getName()));
			FileUtils.deleteFile(zipDir + SP + fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public static void decryptZipFile(String zipDir, String encryptFileDir,
			String fileName) {

		try {
			File file = new File(encryptFileDir + SP + fileName);
			byte[] zipByte = FileUtils.readFileByte(file);
			UnzipFromFlex.unzipFiles(zipByte, MDFive.getEncryptPwd(), zipDir);

			File decryptFile = new File(zipDir + SP + file.getName());
			ZipUtils.upZipFile(decryptFile, zipDir);
			FileUtils.deleteFile(zipDir + SP + fileName);
			/*if(decryptFile.exists()){
				decryptFile.delete();
			}*/
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
