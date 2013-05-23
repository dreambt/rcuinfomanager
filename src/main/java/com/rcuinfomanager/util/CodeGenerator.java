package com.rcuinfomanager.util;

import org.springframework.util.Assert;

import java.security.MessageDigest;
import java.util.UUID;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class CodeGenerator {

    /**
     * 生成36个字符长度的UUID编码串，所有的字母转换为大写的格式。
     *
     * @return 36个字符长度的UUID。
     */
    public static String getUUID() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().toUpperCase();
    }

    /**
     * 通过SHA算法对srcStr进行MD5编码（十六进制表示）
     *
     * @param srcStr 需要获取MD5的字符串，不能为null
     * @return srcStr的SHA代码（40个字符）
     */
    public static String getSHADigest(String srcStr) {
        return getDigest(srcStr, "SHA-1");
    }

    private static String getDigest(String srcStr, String alg) {
        Assert.notNull(srcStr);
        Assert.notNull(alg);
        try {
            MessageDigest alga = MessageDigest
                    .getInstance(alg);
            alga.update(srcStr.getBytes());
            byte[] digesta = alga.digest();
            return byte2hex(digesta);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 二进制转十六进制字符串
     *
     * @param b
     * @return
     */
    private static String byte2hex(byte[] b) {
        StringBuilder hs = new StringBuilder();
        String stmp = "";
        for (int n = 0; n < b.length; n++) {
            stmp = (Integer.toHexString(b[n] & 0XFF));
            if (stmp.length() == 1) {
                hs.append("0");
            }
            hs.append(stmp);
        }
        return hs.toString().toUpperCase();
    }
}
