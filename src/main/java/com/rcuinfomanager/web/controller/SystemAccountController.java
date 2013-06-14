package com.rcuinfomanager.web.controller;


import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/systemAccount")
public class SystemAccountController {
    @RequestMapping(value ="/addAccount")
    public String addAccount(){

        return "ps/addAccount";
    }

    @RequestMapping(value ="/addStipple")
    public String addStipple(){

        return "ps/addStipple";
    }

    @RequestMapping(value ="/editAccount")
    public String editAccount(){
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();

        return "ps/editAccount";
    }
    @RequestMapping(value ="/deleteAccount")
    public String deleteAccount(){

        return "ps/systemAccountManage";
    }
}
