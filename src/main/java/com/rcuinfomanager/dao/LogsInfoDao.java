package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.LogsInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogsInfoDao {
    //保存日志
    void saveLogsInfo(LogsInfo logs);
    //获取日志
    //admin
    List<LogsInfo> getLogsInfoByAdminListPage(@Param("beginTime")String beginTime,@Param("endTime")String endTime,@Param("userName")String userName,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    long queryAdminByLogsInfoByCount(@Param("beginTime")String beginTime,@Param("endTime")String endTime,@Param("userName")String userName,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    //Normal
    List<LogsInfo> queryNormalByLogsInfoByPage(@Param("beginTime")String beginTime,@Param("endTime")String endTime,@Param("userName")String userName,@Param("userId") Long userId,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);//getLogsInfoByNormalList(long userId);
    long queryNormalByLogsInfoByCount(@Param("beginTime")String beginTime,@Param("endTime")String endTime,@Param("userName")String userName,@Param("userId") Long userId,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);






    //查询
    //Admin
    /*List<LogsInfo> getLogsAllByAdminList(@Param("beginTime") String beginTime,@Param("endTime")String endTime,@Param("userName")String userName,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    List<LogsInfo> getLogsBeginAndEndTimeByAdminList(@Param("beginTime")String beginTime,@Param("endTime")String endTime,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    List<LogsInfo> getLogsBeginTimeByAdminList(@Param("beginTime")String beginTime,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    List<LogsInfo> getLogsEndTimeByAdminList(@Param("endTime")String endTime,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    List<LogsInfo> getLogsUNameByAdminList(@Param("userName")String userName,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    //Normal
    List<LogsInfo> getLogsAllList(@Param("beginTime") String beginTime,@Param("endTime")String endTime,@Param("userName")String userName,@Param("userId")long userId,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    List<LogsInfo> getLogsBeginAndEndTimeList(@Param("beginTime")String beginTime,@Param("endTime")String endTime,@Param("userId")long userId,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    List<LogsInfo> getLogsBeginTimeList(@Param("beginTime")String beginTime,@Param("userId")long userId,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    List<LogsInfo> getLogsEndTimeList(@Param("endTime")String endTime,@Param("userId")long userId,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
    List<LogsInfo> getLogsUNameList(@Param("userName")String userName,@Param("userId")long userId,@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);
*/
}
