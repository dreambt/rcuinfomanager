package com.rcuinfomanager.model;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class LogonUser {

    private String userName;
    private String password;
    private String sessionId;

    public LogonUser() {

    }

    /**
     * 登录用户构造函数
     *
     * @param userName
     * @param password
     */
    public LogonUser(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

    public LogonUser(String userName, String password, String sessionId) {
        this.userName = userName;
        this.password = password;
        this.sessionId = sessionId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
}
