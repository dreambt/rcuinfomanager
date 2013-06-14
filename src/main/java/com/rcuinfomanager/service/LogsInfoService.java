package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.LogsInfoDao;
import com.rcuinfomanager.model.LogsInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LogsInfoService {

    @Autowired
    private LogsInfoDao logsInfoDao;

    //保存日志
    public void saveLogsInfo(LogsInfo logs){
        logsInfoDao.saveLogsInfo(logs);
    }
    //获取日志 List
    public List<LogsInfo> getLogsInfoList(long userId){
        return logsInfoDao.getLogsInfoList(userId);
    }

    //查询
    public List<LogsInfo> getLogsAllList(String beginTime,String endTime,String userName,long userId){
        return logsInfoDao.getLogsAllList(beginTime,endTime,userName,userId);
    }
    public List<LogsInfo> getLogsBeginAndEndTimeList(String beginTime,String endTime,long userId){
        return logsInfoDao.getLogsBeginAndEndTimeList(beginTime,endTime,userId);
    }
    public List<LogsInfo> getLogsBeginTimeList(String beginTime,long userId){
        return logsInfoDao.getLogsBeginTimeList(beginTime,userId);
    }
    public List<LogsInfo> getLogsEndTimeList(String endTime,long userId){
        return logsInfoDao.getLogsEndTimeList(endTime,userId);
    }
    public List<LogsInfo> getLogsUNameList(String userName,long userId){
        return logsInfoDao.getLogsUNameList(userName,userId);
    }
}
