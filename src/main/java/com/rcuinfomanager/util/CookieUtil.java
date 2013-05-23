package com.rcuinfomanager.util;

import com.rcuinfomanager.exception.SystemException;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import com.rcuinfomanager.session.UserSessionCookieName;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class CookieUtil {

    /**
     * 根据cookies名称获取值
     *
     * @param request
     * @param cookieName
     * @return
     */
    public static String getCookieValue(HttpServletRequest request, String cookieName) {
        Cookie cookieList[] = request.getCookies();
        if (cookieList == null || cookieName == null) {
            return null;
        }
        try {
            for (Cookie cookie : cookieList) {
                if (cookie.getName().equalsIgnoreCase(cookieName)) {
                    return URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }

    /**
     * 将用户的上下文信息保存在cookies中
     *
     * @param response
     */
    public static void setUserInfoCookies(HttpServletResponse response) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        setCookie(response, UserSessionCookieName.SESSION_ID, userSessionContext.getSessionUser().getSessionId());
        setCookie(response, UserSessionCookieName.USER_NAME, userSessionContext.getSessionUser().getUserName());
        setCookie(response, UserSessionCookieName.LOGON_STATUS, "1");
        setCookie(response, UserSessionCookieName.APPROVED_STATUS, "1");
        setCookie(response, UserSessionCookieName.DISPLAY_USER_NAME, userSessionContext.getDisplayUserName());
    }

    /**
     * 设置cookies值
     *
     * @param response
     * @param cookieName
     * @param cookieValue
     */
    public static void setCookie(HttpServletResponse response, String cookieName, String cookieValue) {
        try {
            if (cookieValue == null) {
                cookieValue = "";
            }
            Cookie theCookie = new Cookie(java.net.URLEncoder.encode(cookieName,
                    "UTF-8"), java.net.URLEncoder.encode(cookieValue, "UTF-8"));
            theCookie.setPath("/");
            theCookie.setMaxAge(3600 * 24 * 14);
            response.addCookie(theCookie);
        } catch (UnsupportedEncodingException e) {
            throw new SystemException(e);
        }
    }
}
