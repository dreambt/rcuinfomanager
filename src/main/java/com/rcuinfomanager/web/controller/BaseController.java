package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.exception.SystemException;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import com.rcuinfomanager.util.LocalStringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class BaseController {

    /**
     * 获得上下文
     *
     * @return
     */
    public UserSessionContext getUserSessionContext() {
        return UserSessionContextHolder.getUserSessionContext();
    }

    /**
     * Method to flush a String as response.
     *
     * @param response
     * @param responseContent
     * @throws java.io.IOException
     */
    protected void flushResponse(HttpServletResponse response, String responseContent) {
        try {
            response.setCharacterEncoding("UTF-8");
            /*针对ajax中页面编码为GBK的情况，一定要加上以下两句*/
            response.setHeader("Cache-Control", "no-cache");
            response.setContentType("text/html;charset=utf-8");
            PrintWriter writer = response.getWriter();
            if (LocalStringUtils.isEmpty(responseContent)) {
                writer.write("");
            } else {
                writer.write(responseContent);
            }
            writer.flush();
            writer.close();
        } catch (IOException e) {
            throw new SystemException(e);
        }
    }
}
