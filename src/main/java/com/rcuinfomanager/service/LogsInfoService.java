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
    //获取/查询日志 List
    public List<LogsInfo> getLogsInfoByAdminListPage(String beginTime,String endTime,String userName,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsInfoByAdminListPage(beginTime,endTime,userName,beginPageNum,engPageNum);//getLogsInfoByAdminList();
    }
    public Long getAllLogsInfoListByCount(String beginTime,String endTime,String userName,int pageNum,int offset) {
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.queryAdminByLogsInfoByCount(beginTime,endTime,userName,beginPageNum,engPageNum);
    }

    public List<LogsInfo> getLogsInfoByNormalListPage(String beginTime,String endTime,String userName,Long userId,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.queryNormalByLogsInfoByPage(beginTime,endTime,userName,userId,beginPageNum,engPageNum);
    }
    public Long getLogsInfoListByCount( String beginTime,String endTime,String userName,Long userId,int pageNum,int offset) {
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.queryNormalByLogsInfoByCount(beginTime,endTime,userName,userId,beginPageNum,engPageNum);
    }

    //查询
    //admin
   /* public List<LogsInfo> getLogsAllByAdminList(String beginTime,String endTime,String userName,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsAllByAdminList(beginTime,endTime,userName,beginPageNum,engPageNum);
    }
    public List<LogsInfo> getLogsBeginAndEndTimeByAdminList(String beginTime,String endTime,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsBeginAndEndTimeByAdminList(beginTime,endTime,beginPageNum,engPageNum);
    }
    public List<LogsInfo> getLogsBeginTimeByAdminList(String beginTime,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsBeginTimeByAdminList(beginTime,beginPageNum,engPageNum);
    }
    public List<LogsInfo> getLogsEndTimeByAdminList(String endTime,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsEndTimeByAdminList(endTime,beginPageNum,engPageNum);
    }
    public List<LogsInfo> getLogsUNameByAdminList(String userName,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsUNameByAdminList(userName,beginPageNum,engPageNum);
    }
    //Normal
    public List<LogsInfo> getLogsAllList(String beginTime,String endTime,String userName,long userId,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsAllList(beginTime,endTime,userName,userId,beginPageNum,engPageNum);
    }
    public List<LogsInfo> getLogsBeginAndEndTimeList(String beginTime,String endTime,long userId,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsBeginAndEndTimeList(beginTime,endTime,userId,beginPageNum,engPageNum);
    }
    public List<LogsInfo> getLogsBeginTimeList(String beginTime,long userId,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsBeginTimeList(beginTime,userId,beginPageNum,engPageNum);
    }
    public List<LogsInfo> getLogsEndTimeList(String endTime,long userId,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsEndTimeList(endTime,userId,beginPageNum,engPageNum);
    }
    public List<LogsInfo> getLogsUNameList(String userName,long userId,int pageNum,int offset){
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;
        return logsInfoDao.getLogsUNameList(userName,userId,beginPageNum,engPageNum);
    }*/
}
