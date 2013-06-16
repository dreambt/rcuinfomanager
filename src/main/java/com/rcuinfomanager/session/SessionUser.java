package com.rcuinfomanager.session;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class SessionUser {

    private Long id;

    private String userName;

    private String displayUserName;

    private String sessionId; //用户登录会话的ID

    private String clientId;

    private String lastLoginTime;

    private int needModifyPassword;

    public boolean isFirstLogon() {
        return lastLoginTime == null;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDisplayUserName() {
        return displayUserName;
    }

    public void setDisplayUserName(String displayUserName) {
        this.displayUserName = displayUserName;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public int getNeedModifyPassword() {
        return needModifyPassword;
    }

    public void setNeedModifyPassword(int needModifyPassword) {
        this.needModifyPassword = needModifyPassword;
    }
}
