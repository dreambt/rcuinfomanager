package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseInfoService {
    @Autowired
    private BaseInfoDao baseInfoDao;
    //admin
    public List<CustomerListInfo> getAllFamilyInfoList(){
        return baseInfoDao.queryAdminByBaseInfo();
    }
    //Normal
    public List<CustomerListInfo> getFamilyInfoList(int userId){
        return baseInfoDao.queryNormalByBaseInfo(userId);
    }

    //显示客户个人信息
    public List<CustomerListInfo> getPersonBasicInfo(Long recordId){
        return baseInfoDao.getPersonBasicInfo(recordId);
    }

    // 获取客户的基本信息
    public List<CusBaseInfo> getCusBasicInfo(Long recordId){
        return baseInfoDao.getCusBasicInfo(recordId);
    }

    //获取家庭收支情况
    public List<IncomeExpenses> getIncomeExpenses(Long recordId){
        return baseInfoDao.getIncomeExpenses(recordId);
    }

    //获取家庭资产情况
    public List<FamilyAssets> getFamilyAssets(Long recordId){
        return baseInfoDao.getFamilyAssets(recordId);
    }

    //房产
    public List<HousePropertyInfo> getHousePropertyInfo(Long recordId){
        return baseInfoDao.getHousePropertyInfo(recordId);
    }

    //土地
    public List<LandInfo> getLandInfo(Long recordId){
        return baseInfoDao.getLandInfo(recordId);
    }

    //车辆
    public List<CarsInfo> getCarsInfo(Long recordId){
        return baseInfoDao.getCarsInfo(recordId);
    }

    //金融资产信息
    public List<FinancialAssets> getFinancialAssets(Long recordId){
        return baseInfoDao.getFinancialAssets(recordId);
    }

    //负责情况信息
    public List<FamilyIncurDebts> getFamilyIncurDebts(Long recordId){
        return baseInfoDao.getFamilyIncurDebts(recordId);
    }

    //获取家庭成员信息
    public List<FamilyMember> getFamilyMember(Long recordId){
        return baseInfoDao.getFamilyMember(recordId);
    }




    /*//选择网点
    public List<CustomerListInfo> getAdminOrganizationName(){
        return baseInfoDao.getAdminOrganizationName();
    }
    public List<CustomerListInfo> getUserOrganizationName(Long id){
        return baseInfoDao.getUserOrganizationName(id);
    }

    //删除
    public int deleteInfo(Long id){
        return baseInfoDao.deleteInfo(id);
    }


    public List<AllColumnInfo> queryAllColumnInfoList(long userId) {
        return baseInfoDao.queryAppointInfoByUserId(userId);
    }*/



}
