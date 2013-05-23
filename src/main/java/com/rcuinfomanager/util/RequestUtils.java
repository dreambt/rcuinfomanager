package com.rcuinfomanager.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class RequestUtils {

    /**
     * 获取客户端的IP信息.
     *
     * @param request HttpServletRequest对象.
     * @return
     */
    public static final String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("X-Real-IP");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("x-forwarded-for");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 判断是否为Ajax请求.
     *
     * @param request HttpServletRequest对象.
     * @return
     */
    public static final boolean isAjax(HttpServletRequest request) {
        return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }
}
