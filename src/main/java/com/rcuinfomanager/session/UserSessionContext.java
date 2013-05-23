package com.rcuinfomanager.session;

import com.rcuinfomanager.util.CodeGenerator;

import java.io.Serializable;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class UserSessionContext implements Serializable {

    private static final long serialVersionUID = 1L;

    private SessionUser sessionUser;

    /**
     * 获取会话令牌
     *
     * @param sessionId
     * @param logonIp
     * @return
     */
    public static String getSessionToken(String sessionId, String logonIp) {
        return CodeGenerator.getSHADigest(sessionId + logonIp);
    }

    public SessionUser getSessionUser() {
        return sessionUser;
    }

    public String getDisplayUserName() {
        return getSessionUser().getDisplayUserName();
    }

    public void setSessionUser(SessionUser sessionUser) {
        this.sessionUser = sessionUser;
    }
}
