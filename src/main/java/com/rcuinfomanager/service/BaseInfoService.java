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

    // 获取客户的基本信息
    public List<CusBaseInfo> getCusBasicInfo(int recordId){
        return baseInfoDao.getCusBasicInfo(recordId);
    }

    //获取家庭收支情况
    public List<IncomeExpenses> getIncomeExpenses(int recordId){
        return baseInfoDao.getIncomeExpenses(recordId);
    }

    //获取家庭资产情况
    public List<FamilyAssets> getFamilyAssets(int recordId){
        return baseInfoDao.getFamilyAssets(recordId);
    }

    //获取土地信息
    public List<LandInfo> getLandInfo(int recordId){
        return baseInfoDao.getLandInfo(recordId);
    }

    //获取车辆信息
    public List<CarsInfo> getCarsInfo(int recordId){
        return baseInfoDao.getCarsInfo(recordId);
    }

    //金融资产信息
    public List<FinancialAssets> getFinancialAssets(int recordId){
        return baseInfoDao.getFinancialAssets(recordId);
    }

    //负责情况信息
    public List<FamilyIncurDebts> getFamilyIncurDebts(int recordId){
        return baseInfoDao.getFamilyIncurDebts(recordId);
    }

    //获取家庭成员信息
    public List<FamilyMember> getFamilyMember(int recordId){
        return baseInfoDao.getFamilyMember(recordId);
    }



}
