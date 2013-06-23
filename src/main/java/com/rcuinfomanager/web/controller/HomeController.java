package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.model.ClientManager;
import com.rcuinfomanager.model.OrganizationInfo;
import com.rcuinfomanager.service.*;
import com.rcuinfomanager.session.*;
import com.rcuinfomanager.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
    @Autowired
    private ClientManagerService clientManagerService;
    @Autowired
    private AreasInfoService areasInfoService;

    @RequestMapping(value = "/")
    public String home() {
       return "redirect:/index";
    }

    //客户电子信息管理
    @RequestMapping(value ="/index")
    public String index(@RequestParam(value = "page", required = false) Integer pageNum,
                        @RequestParam(value="organizationName", required=false) String organizationName,
                        @RequestParam(value="areaName", required=false) String areaName,
                        @RequestParam(value="village", required=false) String village,
                        @RequestParam(value="customerName", required=false) String customerName,
                        ModelMap map) {

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
            /*if(!Strings.isNullOrEmpty(organizationName) && !Strings.isNullOrEmpty(areaName) && !Strings.isNullOrEmpty(village) && !Strings.isNullOrEmpty(customerName)){
            map.put("pageCount", baseInfoService.getAllFamilyInfoListByCount() / offset);
            map.put("familyInfoList",baseInfoService.getAllFamilyInfoListByPage(organizationName,areaName,village,customerName,pageNum, offset));
            map.put("areasInfoList",baseInfoService.getAreasInfo());
            map.put("netWorkList",baseInfoService.getNetWorkByAdmin());
          }else if (!Strings.isNullOrEmpty(organizationName) && !Strings.isNullOrEmpty(areaName) && !Strings.isNullOrEmpty(village)){
              map.put("pageCount", baseInfoService.getAllFamilyInfoListByCount() / offset);
              map.put("familyInfoList",baseInfoService.getAllFamilyInfoListByPage(organizationName,areaName,village,customerName,pageNum, offset));
              map.put("areasInfoList",baseInfoService.getAreasInfo());
              map.put("netWorkList",baseInfoService.getNetWorkByAdmin());
          }else if (!Strings.isNullOrEmpty(organizationName) && !Strings.isNullOrEmpty(areaName)){
              map.put("pageCount", baseInfoService.getAllFamilyInfoListByCount() / offset);
              map.put("familyInfoList",baseInfoService.getAllFamilyInfoListByPage(organizationName,areaName,village,customerName,pageNum, offset));
              map.put("areasInfoList",baseInfoService.getAreasInfo());
              map.put("netWorkList",baseInfoService.getNetWorkByAdmin());
          } else if (!Strings.isNullOrEmpty(organizationName)){
              map.put("pageCount", baseInfoService.getAllFamilyInfoListByCount() / offset);
              map.put("familyInfoList",baseInfoService.getAllFamilyInfoListByPage(organizationName,areaName,village,customerName,pageNum, offset));
              map.put("areasInfoList",baseInfoService.getAreasInfo());
              map.put("netWorkList",baseInfoService.getNetWorkByAdmin());
          }
            else {
              map.put("pageCount", baseInfoService.getAllFamilyInfoListByCount() / offset);
              map.put("familyInfoList",baseInfoService.getAllFamilyInfoListByPage(pageNum, offset));
              map.put("areasInfoList",baseInfoService.getAreasInfo());
              map.put("netWorkList",baseInfoService.getNetWorkByAdmin());
          }
        }else{*/


            map.put("pageCount", baseInfoService.getAllFamilyInfoListByCount() / offset);
            map.put("familyInfoList",baseInfoService.getAllFamilyInfoListByPage(pageNum, offset));
            map.put("areasInfoList",areasInfoService.getAreasInfoByFatherId(350521));
            map.put("netWorkList",baseInfoService.getNetWorkByAdmin());
        }else{
            map.put("pageCount", baseInfoService.getFamilyInfoListByCount(sessionUser.getId()) / offset);
            map.put("familyInfoList", baseInfoService.getFamilyInfoListByPage(sessionUser.getId(), pageNum, offset));
            map.put("netWorkList",baseInfoService.getNetWorkByNormal(sessionUser.getId()));
            map.put("areasInfoList",areasInfoService.getAreasInfoByFatherId(350521));
        }
        return "farmer/main";
    }

    //客户端管理
    @RequestMapping(value ="/clientManager")
    public String clientManager(@RequestParam(value = "page", required = false) Integer pageNum,ModelMap map) {
        if (pageNum == null) {
            pageNum = 1;
        }
        int offset = 10;
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());

        map.put("pageCount", clientManagerService.getAllClientManagerCount() /offset );
        map.put("clientManagers", clientManagerService.getAllClientManagerByPage(pageNum, offset));
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
