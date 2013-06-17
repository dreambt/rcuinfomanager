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
    public String queryLogs(@RequestParam(value = "page", required = false) Integer pageNum,@RequestParam(value="beginTime", required=false) String beginTime,@RequestParam(value="endTime", required=false) String endTime,@RequestParam(value="userName", required=false) String userName,ModelMap map) {

        if (pageNum == null) {
            pageNum = 1;
        }
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("firstLogin",sessionUser.isNeedModifyPassword());
        map.put("displayUserName", sessionUser.getDisplayUserName());
        int offset = 20;
        if(sessionUser.getId()==1){
            if(!Strings.isNullOrEmpty(beginTime) && !Strings.isNullOrEmpty(endTime) && !Strings.isNullOrEmpty(userName)){
                map.put("pageCount", logsInfoService.getAllLogsInfoListByCount() / offset);
                map.put("logsInfoList",logsInfoService.getLogsAllByAdminList(beginTime, endTime, userName,pageNum,offset));
            }else if(!Strings.isNullOrEmpty(beginTime) && !Strings.isNullOrEmpty(endTime)){
                map.put("pageCount", logsInfoService.getAllLogsInfoListByCount() / offset);
                map.put("logsInfoList",logsInfoService.getLogsBeginAndEndTimeByAdminList(beginTime, endTime,pageNum,offset));
            }else if(!Strings.isNullOrEmpty(beginTime)){
                map.put("pageCount", logsInfoService.getAllLogsInfoListByCount() / offset);
                map.put("logsInfoList",logsInfoService.getLogsBeginTimeByAdminList(beginTime,pageNum,offset));
            }else if(!Strings.isNullOrEmpty(endTime)){
                map.put("pageCount", logsInfoService.getAllLogsInfoListByCount() / offset);
                map.put("logsInfoList",logsInfoService.getLogsEndTimeByAdminList(endTime,pageNum,offset));
            }else if(!Strings.isNullOrEmpty(userName)){
                map.put("pageCount", logsInfoService.getAllLogsInfoListByCount() / offset);
                map.put("logsInfoList",logsInfoService.getLogsUNameByAdminList(userName,pageNum,offset));
            }else{
                map.put("pageCount", logsInfoService.getAllLogsInfoListByCount() / offset);
                map.put("logsInfoList",logsInfoService.getLogsInfoByAdminListPage(pageNum,offset));
            }
        }else {
            if(!Strings.isNullOrEmpty(beginTime) && !Strings.isNullOrEmpty(endTime) && !Strings.isNullOrEmpty(userName)){
                map.put("pageCount", logsInfoService.getLogsInfoListByCount(sessionUser.getId()) / offset);
                map.put("logsInfoList",logsInfoService.getLogsAllList(beginTime, endTime, userName, sessionUser.getId(),pageNum, offset));
            }else if(!Strings.isNullOrEmpty(beginTime) && !Strings.isNullOrEmpty(endTime)){
                map.put("pageCount", logsInfoService.getLogsInfoListByCount(sessionUser.getId()) / offset);
                map.put("logsInfoList",logsInfoService.getLogsBeginAndEndTimeList(beginTime, endTime, sessionUser.getId(),pageNum, offset));
            }else if(!Strings.isNullOrEmpty(beginTime)){
                map.put("pageCount", logsInfoService.getLogsInfoListByCount(sessionUser.getId()) / offset);
                map.put("logsInfoList",logsInfoService.getLogsBeginTimeList(beginTime, sessionUser.getId(),pageNum, offset));
            }else if(!Strings.isNullOrEmpty(endTime)){
                map.put("pageCount", logsInfoService.getLogsInfoListByCount(sessionUser.getId()) / offset);
                map.put("logsInfoList",logsInfoService.getLogsEndTimeList(endTime, sessionUser.getId(),pageNum, offset));
            }else if(!Strings.isNullOrEmpty(userName)){
                map.put("pageCount", logsInfoService.getLogsInfoListByCount(sessionUser.getId()) / offset);
                map.put("logsInfoList",logsInfoService.getLogsUNameList(userName, sessionUser.getId(),pageNum, offset));
            }else{
                map.put("pageCount", logsInfoService.getLogsInfoListByCount(sessionUser.getId()) / offset);
                map.put("logsInfoList",logsInfoService.getLogsInfoByNormalListPage(sessionUser.getId(), pageNum, offset));
            }
        }
        return "logsystem/systemLog";
    }


}
