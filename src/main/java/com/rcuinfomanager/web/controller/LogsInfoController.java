package com.rcuinfomanager.web.controller;

import com.google.common.base.Strings;
import com.rcuinfomanager.service.LogsInfoService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/logs")
public class LogsInfoController {
    @Autowired
    private LogsInfoService logsInfoService;

    //查询日志
    @RequestMapping(value ="/queryLogs")
    public String queryLogs(@RequestParam(value="beginTime", required=false) String beginTime,@RequestParam(value="endTime", required=false) String endTime,@RequestParam(value="userName", required=false) String userName,ModelMap map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("firstLogin",sessionUser.isFirstLogon());
        map.put("displayUserName", sessionUser.getDisplayUserName());
        if(sessionUser.getId()==1){
            if(!Strings.isNullOrEmpty(beginTime) && !Strings.isNullOrEmpty(endTime) && !Strings.isNullOrEmpty(userName)){
                map.put("logsInfoList",logsInfoService.getLogsAllByAdminList(beginTime, endTime, userName));
            }else if(!Strings.isNullOrEmpty(beginTime) && !Strings.isNullOrEmpty(endTime)){
                map.put("logsInfoList",logsInfoService.getLogsBeginAndEndTimeByAdminList(beginTime, endTime));
            }else if(!Strings.isNullOrEmpty(beginTime)){
                map.put("logsInfoList",logsInfoService.getLogsBeginTimeByAdminList(beginTime));
            }else if(!Strings.isNullOrEmpty(endTime)){
                map.put("logsInfoList",logsInfoService.getLogsEndTimeByAdminList(endTime));
            }else if(!Strings.isNullOrEmpty(userName)){
                map.put("logsInfoList",logsInfoService.getLogsUNameByAdminList(userName));
            }else{
                map.put("logsInfoList",logsInfoService.getLogsInfoByAdminList());
            }
        }else {
            if(!Strings.isNullOrEmpty(beginTime) && !Strings.isNullOrEmpty(endTime) && !Strings.isNullOrEmpty(userName)){
                map.put("logsInfoList",logsInfoService.getLogsAllList(beginTime, endTime, userName, sessionUser.getId()));
            }else if(!Strings.isNullOrEmpty(beginTime) && !Strings.isNullOrEmpty(endTime)){
                map.put("logsInfoList",logsInfoService.getLogsBeginAndEndTimeList(beginTime, endTime, sessionUser.getId()));
            }else if(!Strings.isNullOrEmpty(beginTime)){
                map.put("logsInfoList",logsInfoService.getLogsBeginTimeList(beginTime, sessionUser.getId()));
            }else if(!Strings.isNullOrEmpty(endTime)){
                map.put("logsInfoList",logsInfoService.getLogsEndTimeList(endTime, sessionUser.getId()));
            }else if(!Strings.isNullOrEmpty(userName)){
                map.put("logsInfoList",logsInfoService.getLogsUNameList(userName, sessionUser.getId()));
            }else{
                map.put("logsInfoList",logsInfoService.getLogsInfoByNormalList(sessionUser.getId()));
            }
        }
        return "logsystem/systemLog";
    }


}
