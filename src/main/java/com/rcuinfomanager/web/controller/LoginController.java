package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.model.CustomerListInfo;
import com.rcuinfomanager.model.LogonUser;
import com.rcuinfomanager.model.User;
import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.service.UserService;
import com.rcuinfomanager.util.CookieUtil;
import com.rcuinfomanager.util.RequestUtils;
import com.rcuinfomanager.web.form.LoginForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * @author 王文庭(xorbytes@qq.com)
 *
 */

@Controller
@RequestMapping("login.html")
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String showForm(Map model) {
        LoginForm loginForm = new LoginForm();
        model.put("loginForm", loginForm);
        return "login";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processForm(HttpServletRequest request, HttpServletResponse response,LoginForm loginForm, BindingResult result, Map model) {
        if (result.hasErrors()) {
            return "login";
        }

        UserService.LogonResult logonResult;
        String logonIP = RequestUtils.getIpAddress(request);
        loginForm = (LoginForm) model.get("loginForm");

        LogonUser logonUser = new LogonUser(loginForm.getUserName().trim(), loginForm.getPassword().trim(), logonIP);

        //如果登录正确，将创建用户会话并绑定到UserSessionContextHolder中
        logonResult = userService.logon(logonUser);
        //登录成功后，根据用户显示数据
        User users = userService.getUserByUserManager(logonUser.getUserName());
        //对登录结果进行处理
        if (logonResult.isSuccessful()) {//登录成功
            CookieUtil.setUserInfoCookies(response);
            return "redirect:/index";
        }  else {//用户密码有错误
            model.put("msg", "用户或密码错误");
            return "login";
        }
    }
}
