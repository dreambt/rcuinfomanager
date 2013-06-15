package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.*;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseInfoDao {
    //管理员获取数据列表
    List<CustomerListInfo> queryAdminByBaseInfoByPage(@Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);

    int queryAdminByBaseInfoByCount();

    //普通用户获取数据列表
    List<CustomerListInfo> queryNormalByBaseInfoByPage(@Param("userId") int userId, @Param("beginPageNum") int beginPageNum, @Param("endPageNum") int endPageNum);

    int queryNormalByBaseInfoByCount(@Param("userId")int userId);

    //显示客户个人信息
    List<CustomerListInfo> getPersonBasicInfo(Long recordId);

    // 获取客户的基本信息
    List<CusBaseInfo> getCusBasicInfo(Long recordId);

    //获取家庭收支情况
    List<IncomeExpenses> getIncomeExpenses(Long recordId);

    //房产
    List<HouseInfo> getHousePropertyInfo(Long recordId);
    //获取土地信息
    List<LandInfo> getLandInfo(Long recordId);

    //获取车辆信息
    List<CarsInfo> getCarsInfo(Long recordId);

    //金融资产信息
    List<FinancialAssets> getFinancialAssets(Long recordId);

    //获取家庭资产情况
    List<FamilyAssets> getFamilyAssets(Long recordId);

    //负责情况信息
    List<FamilyIncurDebts> getFamilyIncurDebts(Long recordId);


    //获取家庭成员信息
    List<FamilyMember> getFamilyMember(Long recordId);

    //删除客户信息
    int getDeleteCusBasicInfo(int recordId);
    //指派用户信息
    List<AllColumnInfo> queryAppointInfoByUserId(long userId);

    BaseInfo getBaseInfoByCustomerAndCerNum(@Param("customerName") String customerName, @Param("cerNum") String cerNum);

    void updateBaseInfoById(AllColumnInfo allColumnInfo);

    void updateIncomeexpenses(AllColumnInfo allColumnInfo);
}
