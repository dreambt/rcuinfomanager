package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
@Controller

public class HomeController {

     @Autowired
     private BaseInfoService baseInfoServer;

    @RequestMapping(value ="/login")
    public String logout(){
        return "login";
    }

     @RequestMapping(value ="/index")
     public String index(Map map) {
         UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
         SessionUser sessionUser = userSessionContext.getSessionUser();
         map.put("firstLogin",sessionUser.isFirstLogon());
         return "main";
    }

    @RequestMapping("top")
    public String top(Map map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName",sessionUser.getDisplayUserName());
        return "top";
    }

    @RequestMapping("left")
    public String left() {
        return "left";
    }

    public String customerInfoManage(Map map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        if(sessionUser.getId()==1){
            map.put("familyInfoList",baseInfoServer.getAllFamilyInfoList());
        }else{
            map.put("familyInfoList",baseInfoServer.getFamilyInfoList(sessionUser.getId()));
        }
        return "farmer/index";
    }

}
