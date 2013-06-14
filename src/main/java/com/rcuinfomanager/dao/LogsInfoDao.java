package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.LogsInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogsInfoDao {
    //保存日志
    void saveLogsInfo(LogsInfo logs);
    //获取日志
    List<LogsInfo> getLogsInfoList(long userId);
    //查询
    List<LogsInfo> getLogsAllList(@Param("beginTime") String beginTime,@Param("endTime") String endTime,@Param("userName") String userName,@Param("userId")long userId);
    List<LogsInfo> getLogsBeginAndEndTimeList(@Param("beginTime") String beginTime,@Param("endTime") String endTime,@Param("userId")long userId);
    List<LogsInfo> getLogsBeginTimeList(String beginTime, long userId);
    List<LogsInfo> getLogsEndTimeList(String endTime, long userId);
    List<LogsInfo> getLogsUNameList(String userName, long userId);

}
