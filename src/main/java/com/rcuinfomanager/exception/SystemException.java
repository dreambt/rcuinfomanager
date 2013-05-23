package com.rcuinfomanager.exception;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class SystemException extends RuntimeException {

    public SystemException() {
    }

    public SystemException(String s) {
        super(s);
    }

    public SystemException(String s, Throwable throwable) {
        super(s, throwable);
    }

    public SystemException(Throwable throwable) {
        super(throwable);
    }
}
