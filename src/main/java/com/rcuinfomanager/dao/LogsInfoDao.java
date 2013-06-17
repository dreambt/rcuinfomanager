package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.LogsInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogsInfoDao {
    //保存日志
    void saveLogsInfo(LogsInfo logs);
    //获取日志
    //admin
    List<LogsInfo> getLogsInfoByAdminListPage(@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    Long queryAdminByLogsInfoByCount();
    //Normal
    List<LogsInfo> queryNormalByLogsInfoByPage(@Param("userId") Long userId,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);//getLogsInfoByNormalList(long userId);
    Long queryNormalByLogsInfoByCount(@Param("userId")Long userId);
    //查询
    //Admin
    List<LogsInfo> getLogsAllByAdminList(@Param("beginTime") String beginTime,@Param("endTime")String endTime,@Param("userName")String userName);
    List<LogsInfo> getLogsBeginAndEndTimeByAdminList(@Param("beginTime")String beginTime,@Param("endTime")String endTime);
    List<LogsInfo> getLogsBeginTimeByAdminList(@Param("beginTime")String beginTime);
    List<LogsInfo> getLogsEndTimeByAdminList(@Param("endTime")String endTime);
    List<LogsInfo> getLogsUNameByAdminList(@Param("userName")String userName);
    //Normal
    List<LogsInfo> getLogsAllList(@Param("beginTime") String beginTime,@Param("endTime")String endTime,@Param("userName")String userName,@Param("userId")long userId);
    List<LogsInfo> getLogsBeginAndEndTimeList(@Param("beginTime")String beginTime,@Param("endTime")String endTime,@Param("userId")long userId);
    List<LogsInfo> getLogsBeginTimeList(@Param("beginTime")String beginTime,@Param("userId")long userId);
    List<LogsInfo> getLogsEndTimeList(@Param("endTime")String endTime,@Param("userId")long userId);
    List<LogsInfo> getLogsUNameList(@Param("userName")String userName,@Param("userId")long userId);

}
