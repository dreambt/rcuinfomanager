package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.model.*;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseInfoService {
    @Autowired
    private BaseInfoDao baseInfoDao;

    //admin
    public List<CustomerListInfo> getAllFamilyInfoListByPage(int pageNum, int offset) {
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;

        return baseInfoDao.queryAdminByBaseInfoByPage(beginPageNum, engPageNum);
    }

    public int getAllFamilyInfoListByCount() {
        return baseInfoDao.queryAdminByBaseInfoByCount();
    }

    //Normal
    public List<CustomerListInfo> getFamilyInfoListByPage(int userId, int pageNum, int offset) {
        int beginPageNum = (pageNum -1) * offset;
        int engPageNum = pageNum * offset;

        return baseInfoDao.queryNormalByBaseInfoByPage(userId, beginPageNum, engPageNum);
    }

    public int getFamilyInfoListByCount(int userId) {
        return baseInfoDao.queryNormalByBaseInfoByCount(userId);
    }

    //显示客户个人信息
    public List<CustomerListInfo> getPersonBasicInfo(Long recordId) {
        return baseInfoDao.getPersonBasicInfo(recordId);
    }

    // 获取客户的基本信息
    public List<CusBaseInfo> getCusBasicInfo(Long recordId) {
        return baseInfoDao.getCusBasicInfo(recordId);
    }

    //获取家庭收支情况
    public List<IncomeExpenses> getIncomeExpenses(Long recordId) {
        return baseInfoDao.getIncomeExpenses(recordId);
    }

    //获取家庭资产情况
    public FamilyAssets getFamilyAssets(Long recordId) {
        return baseInfoDao.getFamilyAssets(recordId);
    }

    //房产
    public List<HouseInfo> getHousePropertyInfo(Long recordId){
        return baseInfoDao.getHousePropertyInfo(recordId);
    }

    //土地
    public List<LandInfo> getLandInfo(Long recordId) {
        return baseInfoDao.getLandInfo(recordId);
    }

    //车辆
    public List<CarsInfo> getCarsInfo(Long recordId) {
        return baseInfoDao.getCarsInfo(recordId);
    }

    //金融资产信息
    public List<FinancialAssets> getFinancialAssets(Long recordId) {
        return baseInfoDao.getFinancialAssets(recordId);
    }

    //负责情况信息
    public List<FamilyIncurDebts> getFamilyIncurDebts(Long recordId) {
        return baseInfoDao.getFamilyIncurDebts(recordId);
    }

    //获取家庭成员信息
    public List<FamilyMember> getFamilyMember(Long recordId) {
        return baseInfoDao.getFamilyMember(recordId);
    }

    //网点（查询）
    public List<CustomerListInfo> getNetWorkByAdmin(){
        return baseInfoDao.getNetWorkByAdmin();
    }
    public List<CustomerListInfo> getNetWorkByNormal(long uid){
        return baseInfoDao.getNetWorkByNormal(uid);
    }

    //指派
    public List<AppointInfo> getAppointInfoList(long id){
        return baseInfoDao.getAppointInfoList(id);
    }
    //保存指派
    public void saveAppointInfo(long id,long userId){
        baseInfoDao.saveAppointInfo(id,userId);
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


    public List<AllColumnInfo> queryAllColumnInfoList(long userId) {
        List<AllColumnInfo> allColumnInfos = baseInfoDao.queryAppointInfoByUserId(userId);

        if (allColumnInfos != null && !allColumnInfos.isEmpty()) {
            for (AllColumnInfo allColumnInfo : allColumnInfos) {
                List<HouseInfo> houseInfoList = baseInfoDao.getHousePropertyInfo(allColumnInfo.getRecordId());
                allColumnInfo.setHouseInfos(houseInfoList);
                List<CarsInfo> carsInfoList = baseInfoDao.getCarsInfo(allColumnInfo.getRecordId());
                allColumnInfo.setCarInfos(carsInfoList);
                List<LandInfo> landInfoList = baseInfoDao.getLandInfo(allColumnInfo.getRecordId());
                allColumnInfo.setLandInfos(landInfoList);
                List<FamilyMember> familyMemberList = baseInfoDao.getFamilyMember(allColumnInfo.getRecordId());
                allColumnInfo.setFamilyMembers(familyMemberList);
            }
        }

        return baseInfoDao.queryAppointInfoByUserId(userId);
    }

    public void saveFarmerInfoFromDownload(AllColumnInfo allColumnInfo) {
        BaseInfo baseInfo = baseInfoDao.getBaseInfoByCustomerAndCerNum(allColumnInfo.getCustomerName(), allColumnInfo.getCerNum());
        if (baseInfo != null) {
            allColumnInfo.setRecordId(baseInfo.getRecordId());
            baseInfoDao.updateBaseInfoById(allColumnInfo);
            baseInfoDao.updateIncomeexpenses(allColumnInfo);
        }

    }
}
