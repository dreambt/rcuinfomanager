package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
@Controller
public class HomeController {

     @Autowired
     private BaseInfoService baseInfoServer;

     @RequestMapping(value ="/index")
     public String index(ModelMap map) {
         UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
         SessionUser sessionUser = userSessionContext.getSessionUser();
         map.put("firstLogin",sessionUser.isFirstLogon());
         map.put("displayUserName", sessionUser.getDisplayUserName());
         if(sessionUser.getId()==1){
             map.put("familyInfoList",baseInfoServer.getAllFamilyInfoList());
         }else{
             map.put("familyInfoList", baseInfoServer.getFamilyInfoList(sessionUser.getId()));
         }
         return "farmer/main";
    }

    @RequestMapping(value ="/version")
    public String clientVersion(){

        return "device/clientVersion";
    }

    @RequestMapping(value ="/account")
    public String account(){

        return "device/clientVersion";
    }

    @RequestMapping(value ="/login")
    public String logout(){
        return "login";
    }

}
