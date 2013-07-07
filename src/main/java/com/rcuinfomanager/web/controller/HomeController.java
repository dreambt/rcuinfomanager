package com.rcuinfomanager.web.controller;

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
                        @RequestParam(value="areaId", required=false) String areaId,
                        @RequestParam(value="areaName", required=false) String areaName,
                        @RequestParam(value="displayUserName", required=false) String displayUserName,
                        ModelMap map) {

        if (pageNum == null) {
            pageNum = 1;
        }
        if("-1".equals(areaId)){
            areaId = "";
        }

        if ("按客户经理".equals(displayUserName)) {
            displayUserName = "";
        }

        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("needModifyPassword",sessionUser.isNeedModifyPassword());
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("userName", sessionUser.getUserName());
        int offset = 20;
        if ("admin".equalsIgnoreCase(sessionUser.getUserName())){
            long totalCount = baseInfoService.getAllFamilyInfoListByCount(organizationName, areaId, areaName, displayUserName, pageNum, offset);
            map.put("pageCount", totalCount % offset == 0 ? totalCount / offset : totalCount / offset +1);
            map.put("familyInfoList",baseInfoService.getAllFamilyInfoListByPage(organizationName,areaId,areaName,displayUserName,pageNum, offset));
            map.put("areasInfoList",areasInfoService.getAreasInfoByFatherId(350521));
            map.put("netWorkList",baseInfoService.getNetWorkByAdmin());
        } else {
            Long totalCount = baseInfoService.getFamilyInfoListByCount(organizationName, areaId, areaName, displayUserName, sessionUser.getId(), pageNum, offset);
            map.put("pageCount", totalCount % offset == 0 ? totalCount / offset : totalCount / offset + 1);
            map.put("familyInfoList", baseInfoService.getFamilyInfoListByPage(organizationName,areaId,areaName,displayUserName,sessionUser.getId(), pageNum, offset));
            map.put("areasInfoList",areasInfoService.getAreasInfoByFatherId(350521));
            map.put("netWorkList",baseInfoService.getNetWorkByNormal(sessionUser.getId()));
        }
        map.put("userNameList", baseInfoService.getUserNameList());
        map.put("currentPage", pageNum);
        map.put("baseInfoStat", baseInfoService.getBaseInfoStat());
        map.put("familyAssetsStat", baseInfoService.getFamilyAssetsStat());
        map.put("villageEvaStat",baseInfoService.getVillageManagerEvaStat());
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
        map.put("userName", sessionUser.getUserName());

        long totalCount = clientManagerService.getAllClientManagerCount();
        map.put("pageCount", totalCount % offset == 0 ? totalCount / offset : totalCount / offset + 1);
        map.put("clientManagers", clientManagerService.getAllClientManagerByPage(pageNum, offset));
        map.put("currentPage", pageNum);
        return "device/clientVersion";
    }

    //系统帐号管理
    @RequestMapping(value ="/accountManager")
    public String accountManager(@RequestParam(value = "page", required = false) Integer pageNum,ModelMap map) {
        if (pageNum == null) {
            pageNum = 1;
        }
        int offset = 20;
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("userName", sessionUser.getUserName());

        map.put("orgList", organizationInfoService.getAllOrganizations());
        map.put("organizationInfo", new OrganizationInfo());
        map.put("accountList",systemAccountService.getSystemAccountByPage(pageNum, offset));
        long totalCount = systemAccountService.getSystemAccountByCount();
        map.put("pageCount", (totalCount % offset) == 0 ? totalCount / offset : totalCount / offset + 1);
        map.put("currentPage", pageNum);
        return "ps/systemAccountManage";
    }

    //系统角色管理
    @RequestMapping(value ="/roleManager")
    public String roleManager(ModelMap map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("userName", sessionUser.getUserName());
        if(sessionUser.getId()==1){
            map.put("roleList",systemRoleService.getSystemRoleByAdminList());
        }else{
            map.put("roleList",systemRoleService.getSystemRoleByCommonList(sessionUser.getId()));
        }

        return "ps/systemRoleManager";
    }

    //系统日志
    @RequestMapping(value ="/systemLogManager")
    public String systemLogManager(@RequestParam(value = "page", required = false) Integer pageNum,
                                   @RequestParam(value="beginTime", required=false) String beginTime,
                                   @RequestParam(value="endTime", required=false) String endTime,
                                   @RequestParam(value="userName", required=false) String userName,
                                   ModelMap map)  {

        if (pageNum == null || pageNum <= 0) {
            pageNum = 1;
        }
        if ("按系统帐号".equals(userName)) {
            userName = "";
        }
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("userName", sessionUser.getUserName());
        int offset = 20;
        Long totalCount = logsInfoService.getAllLogsInfoListByCount(beginTime, endTime, userName, pageNum, offset);
        map.put("pageCount", totalCount % offset == 0 ? totalCount / offset : totalCount / offset + 1);
        map.put("logsInfoList",logsInfoService.getLogsInfoByAdminListPage(beginTime,endTime,userName,pageNum,offset));
        map.put("currentPage", pageNum);

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
