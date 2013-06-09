package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.model.LogonUser;
import com.rcuinfomanager.service.UserService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionCookieName;
import com.rcuinfomanager.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
@Controller
public class AccountController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/account/login", method = RequestMethod.GET)
    public String showLogon() {
        return "logon";
    }

    @RequestMapping(value = "/account/checkPassword")
    public void logon(HttpServletRequest request, HttpServletResponse response, String userName, String pwd) {
        Assert.notNull(userName, "用户名不能为空");
        Assert.notNull(pwd, "密码不能为空");
        Map<String, Object> logonResultJsonMap = new HashMap<String, Object>();

        UserService.LogonResult logonResult;
        String logonIP = RequestUtils.getIpAddress(request);

        LogonUser logonUser = new LogonUser(userName.trim(), pwd.trim(), logonIP);

        //如果登录正确，将创建用户会话并绑定到UserSessionContextHolder中
        logonResult = userService.logon(logonUser);

        //对登录结果进行处理
        if (logonResult.isSuccessful()) {//登录成功
            CookieUtil.setUserInfoCookies(response);
        }  else {//用户密码有错误
            String newLogonId = CodeGenerator.getUUID();
            logonResultJsonMap.put("logonId", newLogonId);
        }
        logonResultJsonMap.put("resultCode", logonResult.getResultCode());
        UserSessionContext context = this.getUserSessionContext();
        if (context != null) {
            SessionUser sessionUser = context.getSessionUser();
            logonResultJsonMap.put(UserSessionCookieName.SESSION_ID, sessionUser.getSessionId());
        }
        flushResponse(response, JsonParser.obj2json(logonResultJsonMap));
    }

    /**
     * 登录成功跳转页面
     *
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "/account/successLogonPage")
    public String successLogonPage(ModelMap modelMap, HttpServletRequest request) {
        return "index";
    }

}
