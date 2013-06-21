package com.rcuinfomanager.util;

public class EncryptUtils {

    /**
     * 功能：加混淆<p>
     *
     * @param str
     * @return
     */
    public static String encryptStr(String str) {
        char[] a = str.toCharArray();
        for (int i = 0; i < a.length; i++) {
            a[i] = (char) (a[i] ^ '-');
            a[i] = (char) (a[i] ^ 'v');
            a[i] = (char) (a[i] ^ 'r');
        }
        String s = new String(a);
        return s;
    }

    /**
     * 功能：解混淆
     *
     * @param str
     * @return
     */
    public static String decryptStr(String str) {
        char[] a = str.toCharArray();
        for (int i = 0; i < a.length; i++) {
            a[i] = (char) (a[i] ^ 'r');
            a[i] = (char) (a[i] ^ 'v');
            a[i] = (char) (a[i] ^ '-');
        }
        String s = new String(a);
        return s;
    }

}
