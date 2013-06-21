package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.model.OrganizationInfo;
import com.rcuinfomanager.service.*;
import com.rcuinfomanager.session.*;
import com.rcuinfomanager.util.CookieUtil;
import com.rcuinfomanager.web.form.AddUserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */

@Controller
public class HomeController {

    @Autowired
    private BaseInfoService baseInfoService;
    @Autowired
    private SystemAccountService systemAccountService;
    @Autowired
    private LogsInfoService logsInfoService;
    @Autowired
    private SystemRoleService systemRoleService;
    @Autowired
    private OrganizationInfoService organizationInfoService;

    @RequestMapping(value = "/")
    public String home() {
       return "redirect:/index";
    }

    //客户电子信息管理
    @RequestMapping(value ="/index")
    public String index(@RequestParam(value = "page", required = false) Integer pageNum, ModelMap map) {

        if (pageNum == null) {
            pageNum = 1;
        }

        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("needModifyPassword",sessionUser.isNeedModifyPassword());
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("userNameByAdmin", sessionUser.getUserName());
        int offset = 20;
        if("admin".equalsIgnoreCase(sessionUser.getUserName())){
            map.put("pageCount", baseInfoService.getAllFamilyInfoListByCount() / offset);
            map.put("familyInfoList",baseInfoService.getAllFamilyInfoListByPage(pageNum,offset));
        }else{
            map.put("pageCount", baseInfoService.getFamilyInfoListByCount(sessionUser.getId()) / offset);
            map.put("familyInfoList", baseInfoService.getFamilyInfoListByPage(sessionUser.getId(), pageNum, offset));
        }
        return "farmer/main";
    }

    //客户端管理
    @RequestMapping(value ="/clientManager")
    public String clientManager(ModelMap map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());


        return "device/clientVersion";
    }

    //系统帐号管理
    @RequestMapping(value ="/accountManager")
    public String accountManager(ModelMap map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());

        map.put("orgList", organizationInfoService.getAllOrganizations());
        map.put("organizationInfo", new OrganizationInfo());
        if(sessionUser.getId()==1){
            map.put("accountList",systemAccountService.getSystemAccountByAdminList());
        }else{
            map.put("accountList",systemAccountService.getSystemAccountByCommonList(sessionUser.getId()));
        }

        return "ps/systemAccountManage";
    }

    //系统角色管理
    @RequestMapping(value ="/roleManager")
    public String roleManager(ModelMap map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());
        if(sessionUser.getId()==1){
            map.put("roleList",systemRoleService.getSystemRoleByAdminList());
        }else{
            map.put("roleList",systemRoleService.getSystemRoleByCommonList(sessionUser.getId()));
        }

        return "ps/systemRoleManager";
    }

    //系统日志
    @RequestMapping(value ="/systemLogManager")
    public String systemLogManager(@RequestParam(value = "page", required = false) Integer pageNum,ModelMap map) {
        if (pageNum == null) {
            pageNum = 1;
        }
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());
        int offset = 20;
        if("admin".equalsIgnoreCase(sessionUser.getUserName())){
            map.put("pageCount", logsInfoService.getAllLogsInfoListByCount() / offset);
            map.put("logsInfoList",logsInfoService.getLogsInfoByAdminListPage(pageNum,offset));

        }else{
            map.put("pageCount", logsInfoService.getLogsInfoListByCount(sessionUser.getId()) / offset);
            map.put("logsInfoList",logsInfoService.getLogsInfoByNormalListPage(sessionUser.getId(), pageNum, offset));
        }
        return "logsystem/systemLog";
    }


    //退出
    @RequestMapping(value ="/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response){
        String sessionId = CookieUtil.getCookieValue(request, UserSessionCookieName.SESSION_ID);
        UserSessionContextManager.getInstance().removeUserSessionContext(sessionId);
        try {
            SessionFilter.forwardToLogonPage(request,response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

}
