package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.dao.FinanceServicesDao;
import com.rcuinfomanager.dao.FinancialAssetsDao;
import com.rcuinfomanager.dao.UserDao;
import com.rcuinfomanager.model.*;
import com.rcuinfomanager.util.DateUtils;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import com.rcuinfomanager.webservice.model.SubmitItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BaseInfoService {
    @Autowired
    private BaseInfoDao baseInfoDao;
    @Autowired
    private FinanceServicesDao financeServicesDao;
    @Autowired
    private FinancialAssetsDao financialAssetsDao;
    @Autowired
    private UserDao userDao;

    public void updateStatus(int status,Long id){
        baseInfoDao.updateStatus(status,id);
    }

    //admin
    public List<CustomerListInfo> getAllFamilyInfoListByPage(String organizationName,String areaId,String areaName,String displayUserName,int pageNum, int offset) {
        int beginPageNum = (pageNum -1) * offset;
        return baseInfoDao.queryAdminByBaseInfoByPage(organizationName,areaId,areaName,displayUserName,beginPageNum, offset);
    }

    public Long getAllFamilyInfoListByCount(String organizationName,String areaId,String areaName,String displayUserName,int pageNum, int offset) {
        int beginPageNum = (pageNum -1) * offset;
        return baseInfoDao.queryAdminByBaseInfoByCount(organizationName,areaId,areaName,displayUserName,beginPageNum, offset);
    }

    //Normal
    public List<CustomerListInfo> getFamilyInfoListByPage(String organizationName,String areaId,String areaName,String displayUserName,Long userId, int pageNum, int offset) {
        int beginPageNum = (pageNum -1) * offset;
        return baseInfoDao.queryNormalByBaseInfoByPage(organizationName,areaId,areaName,displayUserName,userId, beginPageNum, offset);
    }

    public Long getFamilyInfoListByCount(String organizationName,String areaId,String areaName,String displayUserName,Long userId,int pageNum, int offset) {
        int beginPageNum = (pageNum -1) * offset;
        return baseInfoDao.queryNormalByBaseInfoByCount(organizationName,areaId,areaName,displayUserName,userId,beginPageNum, offset);
    }
   /*end*/
    //显示客户个人信息
    public List<CustomerListInfo> getPersonBasicInfo(Long recordId) {
        return baseInfoDao.getPersonBasicInfo(recordId);
    }

    // 获取客户的基本信息
    public CusBaseInfo getCusBasicInfo(Long recordId) {
        return baseInfoDao.getCusBasicInfo(recordId);
    }

    //获取家庭收支情况
    public IncomeExpenses getIncomeExpenses(Long recordId) {
        return baseInfoDao.getIncomeExpenses(recordId);
    }

    //获取家庭资产情况
    public FamilyAssets getFamilyAssets(Long recordId) {
        return baseInfoDao.getFamilyAssets(recordId);
    }

    //保存编辑
    public void updateBaseInfoById(AllColumnInfo allColumnInfo){
        baseInfoDao.updateBaseInfoById(allColumnInfo);
    }
    public void updateIncomeexpenses(AllColumnInfo allColumnInfo){
        IncomeExpenses incomeExpenses = baseInfoDao.getIncomeExpenses(allColumnInfo.getRecordId());
        if (incomeExpenses == null) {
            baseInfoDao.saveIncomeexpenses(allColumnInfo);
        } else {
            baseInfoDao.updateIncomeexpenses(allColumnInfo);
        }
    }
    public void updateFamilyassets(AllColumnInfo allColumnInfo){
        FamilyAssets familyAssets = baseInfoDao.getFamilyAssets(allColumnInfo.getRecordId());
        if (familyAssets == null) {
            familyAssets = new FamilyAssets();
            familyAssets.setRecordId(allColumnInfo.getRecordId());
            familyAssets.setMainAssets(allColumnInfo.getMainAssets());
            familyAssets.setFmAllAssets(allColumnInfo.getFmAllAssets());
            baseInfoDao.saveFamilyassets(familyAssets);
            allColumnInfo.setAssetsId(familyAssets.getAssetsId());
        } else {
            allColumnInfo.setAssetsId(familyAssets.getAssetsId());
            baseInfoDao.updateFamilyassets(allColumnInfo);
        }
    }
    public void updateFamilyincurdebts(AllColumnInfo allColumnInfo){
        FamilyIncurDebts familyIncurDebts = baseInfoDao.getFamilyIncurDebts(allColumnInfo.getRecordId());
        if (familyIncurDebts == null) {
            baseInfoDao.saveFamilyincurdebts(allColumnInfo);
        } else {
            baseInfoDao.updateFamilyincurdebts(allColumnInfo);
        }
    }
    public void updateFinancialassets(AllColumnInfo allColumnInfo){
        List<FinancialAssets> financialAssets = financialAssetsDao.getFinancialAssets(allColumnInfo.getRecordId());
        if (financialAssets == null) {
            financialAssetsDao.saveFinancialAssets(allColumnInfo);
        } else {
            financialAssetsDao.updateFinancialAssets(allColumnInfo);
        }
    }
    public void updateFinanceservices(AllColumnInfo allColumnInfo){
        FinanceServices financeServices = financeServicesDao.getFinanceServicesList(allColumnInfo.getRecordId());
        if (financeServices == null) {
            financeServicesDao.saveFinanceServices(allColumnInfo);
        } else {
            financeServicesDao.updateFinanceServices(allColumnInfo);
        }
    }
    public void updateCustomermanagereva(AllColumnInfo allColumnInfo){
        CustomerManagerEva customerManagerEva = baseInfoDao.getCustomerManagerEvaList(allColumnInfo.getRecordId());
        if (customerManagerEva == null) {
            baseInfoDao.saveCustomerManagerEva(allColumnInfo);
        } else {
            baseInfoDao.updateCustomermanagereva(allColumnInfo);
        }

    }

    public void updateHousePropertyInfo(HouseInfo houseInfo){
        baseInfoDao.updateHousePropertyInfo(houseInfo);
    }

    public void updateLandInfo(LandInfo landInfo){
        baseInfoDao.updateLandInfo(landInfo);
    }

    public void updateCarsInfo(CarsInfo carsInfo){
        baseInfoDao.updateCarsInfo(carsInfo);
    }

    public void updateFamilyMembers(FamilyMember familyMember){
        baseInfoDao.updateFamilyMembers(familyMember);
    }

    //房产
    public List<HouseInfo> getHousePropertyInfo(Long recordId){
        return baseInfoDao.getHousePropertyInfo(recordId);
    }
    //保存房产
    public void saveHouseInfo(HouseInfo houseInfo){
        baseInfoDao.saveHouseInfo(houseInfo);
    }

    public void updateHouseInfo(HouseInfo houseInfo) {
        baseInfoDao.updateHouseInfo(houseInfo);
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
        return financialAssetsDao.getFinancialAssets(recordId);
    }

    //负责情况信息
    public FamilyIncurDebts getFamilyIncurDebts(Long recordId) {
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
    public AppointInfo getAppointInfoList(long id){
        return baseInfoDao.getAppointInfoList(id);
    }
    //保存指派
    public void saveAppointInfo(long id,long userId){
        baseInfoDao.saveAppointInfo(id,userId);
    }
    //获取UserName
    public List<User> getUserNameList(){
        return baseInfoDao.getUserNameList();
    }
    //保存验收
    public void saveChecksInfo(long id,int state){
        BaseInfo baseInfo = baseInfoDao.getBaseInfoByRecordId(id);
        if (baseInfo.getState() == 1) {
            baseInfoDao.saveChecksInfo(id, state);
        }
    }


    public List<AllColumnInfo> queryAllColumnInfoListAndUpdateAppointStatus(long userId) {
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
                baseInfoDao.updateAppointStatus(allColumnInfo.getRecordId());
            }
        }

        return allColumnInfos;
    }

    public void saveFarmerInfoFromDownload(AllColumnInfo allColumnInfo) {
        BaseInfo baseInfo = baseInfoDao.getBaseInfoByCustomerAndCerNum(allColumnInfo.getCustomerName(), allColumnInfo.getCerNum());
        FamilyAssets familyAssets = null;
        allColumnInfo.setSubmitTime(DateUtils.getDateCurrStrOfStoreFormat());
        if (baseInfo != null) {
            allColumnInfo.setRecordId(baseInfo.getRecordId());
            baseInfoDao.updateBaseInfoById(allColumnInfo);
            baseInfoDao.updateIncomeexpenses(allColumnInfo);
            baseInfoDao.updateFamilyincurdebts(allColumnInfo);
            financialAssetsDao.updateFinancialAssets(allColumnInfo);
            financeServicesDao.updateFinanceServices(allColumnInfo);
            baseInfoDao.updateCustomermanagereva(allColumnInfo);
            familyAssets = baseInfoDao.getFamilyAssets(baseInfo.getRecordId());
            if (familyAssets != null) {
                allColumnInfo.setAssetsId(familyAssets.getAssetsId());
                baseInfoDao.updateFamilyassets(allColumnInfo);
                baseInfoDao.deleteCarsinfoByAssetsId(familyAssets.getAssetsId());
                baseInfoDao.deleteHouseInfoByAssetsId(familyAssets.getAssetsId());
                baseInfoDao.deleteLandInfoByAssetsId(familyAssets.getAssetsId());
                baseInfoDao.deleteFamilyMemberInfoByRecordId(baseInfo.getRecordId());
            }
        } else {
            //save new base info.
            baseInfoDao.saveBaseInfoFromClient(allColumnInfo);
            baseInfoDao.saveIncomeexpenses(allColumnInfo);
            baseInfoDao.saveFamilyincurdebts(allColumnInfo);
            baseInfoDao.saveCustomerManagerEva(allColumnInfo);
        }

        List<FamilyMember> familyMembers = allColumnInfo.getFamilyMembers();
        if (familyMembers != null && !familyMembers.isEmpty()) {
            for (FamilyMember familyMember : familyMembers) {
                familyMember.setRecordId(allColumnInfo.getRecordId());
                baseInfoDao.saveFamilyMember(familyMember);
            }
        }

        if (familyAssets == null) {
            familyAssets = new FamilyAssets();
            familyAssets.setRecordId(allColumnInfo.getRecordId());
            familyAssets.setFmAllAssets(allColumnInfo.getFmAllAssets());
            familyAssets.setMainAssets(allColumnInfo.getMainAssets());
            baseInfoDao.saveFamilyassets(familyAssets);
            allColumnInfo.setAssetsId(familyAssets.getAssetsId());
            financialAssetsDao.saveFinancialAssets(allColumnInfo);
            financeServicesDao.saveFinanceServices(allColumnInfo);
        }

        List<CarsInfo> carInfos = allColumnInfo.getCarInfos();
        if (carInfos != null && !carInfos.isEmpty()) {
            for (CarsInfo carsInfo : carInfos) {
                carsInfo.setAssetsId(familyAssets.getAssetsId());
                baseInfoDao.saveCarsinfo(carsInfo);
            }
        }

        List<LandInfo> landInfos = allColumnInfo.getLandInfos();
        if (landInfos != null && !landInfos.isEmpty()) {
            for (LandInfo landInfo : landInfos) {
                landInfo.setAssetsId(familyAssets.getAssetsId());
                baseInfoDao.saveLandInfo(landInfo);
            }
        }

        List<HouseInfo> houseInfos = allColumnInfo.getHouseInfos();
        if (houseInfos != null && !houseInfos.isEmpty()) {
            for (HouseInfo houseInfo : houseInfos) {
                houseInfo.setAssetsId(familyAssets.getAssetsId());
                baseInfoDao.saveHouseInfo(houseInfo);
            }
        }

    }

    public boolean isAccepted(String cerNum) {
        Integer status = baseInfoDao.getStatusByCerNum(cerNum);
        if (status != null && (status == 3 || status == 4)) {
            return true;
        }

        return false;
    }

    //二
    public FinanceServices getFinanceService(long id){
        return financeServicesDao.getFinanceServicesList(id);
    }
    //四
    public CustomerManagerEva getCustomerManagerEvaList(long id){
        return baseInfoDao.getCustomerManagerEvaList(id);
    }

    public List<Long> getAllHouseholdInfos() {
        return baseInfoDao.getAllHouseholdInfos();
    }

    public List<SubmitItem> querySubmitList(String userName) {
        return baseInfoDao.querySubmitList(userName);
    }
    //保存土地
    public void saveLandInfo(LandInfo landInfo){
        baseInfoDao.saveLandInfo(landInfo);
    }
    //保存车辆
    public void saveCarsinfo(CarsInfo carsInfo){
        baseInfoDao.saveCarsinfo(carsInfo);
    }

    //删除
    public void deleteHouseInfoByAssetsId(long assetsId){
        baseInfoDao.deleteHouseInfoByAssetsId(assetsId);
    }
    public void deleteLandInfoByAssetsId(long assetsId){
        baseInfoDao.deleteLandInfoByAssetsId(assetsId);
    }
    public void deleteCarsinfoByAssetsId(long assetsId){
        baseInfoDao.deleteCarsinfoByAssetsId(assetsId);
    }

    public void deleteBaseInfoByRecordId(Long recordId){
        baseInfoDao.deleteBaseInfoByRecordId(recordId);
    }
    public void deleteIncomeExpensesByRecordId(Long id){
        baseInfoDao.deleteIncomeExpensesByRecordId(id);
    }
    public void deleteFamilyAssetsByAssetsId(Long assetsId){
        baseInfoDao.deleteFamilyAssetsByAssetsId(assetsId);
    }
    public void deleteFinancialAssetsByAssetsId(Long id){
        baseInfoDao.deleteFinancialAssetsByAssetsId(id);
    }
    public void deleteFamilyIncurDebtsByRecordId(Long id){
        baseInfoDao.deleteFamilyIncurDebtsByRecordId(id);
    }
    public void deleteFamilyMemberInfoByRecordId(Long id){
        baseInfoDao.deleteFamilyMemberInfoByRecordId(id);
    }
    public void deleteFinanceServicesByRecordId(Long recordId){
        baseInfoDao.deleteFinanceServicesByRecordId(recordId);
    }
    public void deleteVillageManagerEvaByRecordId(Long recordId){
        baseInfoDao.deleteVillageManagerEvaByRecordId(recordId);
    }
    public void deleteCustomerManagerEvaByRecordId(Long recordId){
        baseInfoDao.deleteCustomerManagerEvaByRecordId(recordId);
    }

}
