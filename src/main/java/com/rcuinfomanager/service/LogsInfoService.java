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
    public List<LogsInfo> getLogsInfoByAdminListPage(int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsInfoByAdminListPage(beginPageNum,engPageNum);//getLogsInfoByAdminList();
    }
    public Long getAllLogsInfoListByCount() {
        return logsInfoDao.queryAdminByLogsInfoByCount();
    }

    public List<LogsInfo> getLogsInfoByNormalListPage(long userId,int pageNum, int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.queryNormalByLogsInfoByPage(userId,beginPageNum,engPageNum);//getLogsInfoByNormalList(userId,beginPageNum,engPageNum);
    }
    public Long getLogsInfoListByCount(Long userId) {
        return logsInfoDao.queryNormalByLogsInfoByCount(userId);
    }

    //查询
    //admin
    public List<LogsInfo> getLogsAllByAdminList(String beginTime,String endTime,String userName){
        return logsInfoDao.getLogsAllByAdminList(beginTime,endTime,userName);
    }
    public List<LogsInfo> getLogsBeginAndEndTimeByAdminList(String beginTime,String endTime){
        return logsInfoDao.getLogsBeginAndEndTimeByAdminList(beginTime,endTime);
    }
    public List<LogsInfo> getLogsBeginTimeByAdminList(String beginTime){
        return logsInfoDao.getLogsBeginTimeByAdminList(beginTime);
    }
    public List<LogsInfo> getLogsEndTimeByAdminList(String endTime){
        return logsInfoDao.getLogsEndTimeByAdminList(endTime);
    }
    public List<LogsInfo> getLogsUNameByAdminList(String userName){
        return logsInfoDao.getLogsUNameByAdminList(userName);
    }
    //Normal
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
