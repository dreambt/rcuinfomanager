package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.*;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import com.rcuinfomanager.webservice.model.SubmitItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseInfoDao {
    //改状态
    void updateStatus(@Param("status")int status,@Param("recordId")Long recordId);
    //管理员获取数据列表
    List<CustomerListInfo> queryAdminByBaseInfoByPage(@Param("organizationName")String organizationName,@Param("areaId")String areaId,@Param("areaName")String areaName,@Param("displayUserName")String displayUserName,@Param("beginPageNum") int beginPageNum, @Param("offset") int offset);

    Long queryAdminByBaseInfoByCount(@Param("organizationName")String organizationName,@Param("areaId")String areaId,@Param("areaName")String areaName,@Param("displayUserName")String displayUserName,@Param("beginPageNum") int beginPageNum, @Param("offset") int offset);

    //普通用户获取数据列表
    List<CustomerListInfo> queryNormalByBaseInfoByPage(@Param("organizationName")String organizationName,@Param("areaId")String areaId,@Param("areaName")String areaName,@Param("displayUserName")String displayUserName,@Param("userId") Long userId, @Param("beginPageNum") int beginPageNum, @Param("offset") int offset);

    Long queryNormalByBaseInfoByCount(@Param("organizationName")String organizationName,@Param("areaId")String areaId,@Param("areaName")String areaName,@Param("displayUserName")String displayUserName,@Param("userId")Long userId,@Param("beginPageNum") int beginPageNum, @Param("offset") int offset);

    //显示客户个人信息
    List<CustomerListInfo> getPersonBasicInfo(Long recordId);

    // 获取客户的基本信息
    CusBaseInfo getCusBasicInfo(Long recordId);

    //获取家庭收支情况
    IncomeExpenses getIncomeExpenses(Long recordId);

    //房产
    List<HouseInfo> getHousePropertyInfo(Long recordId);
    //获取土地信息
    List<LandInfo> getLandInfo(Long recordId);

    //获取车辆信息
    List<CarsInfo> getCarsInfo(Long recordId);

    //获取家庭资产情况
    FamilyAssets getFamilyAssets(long recordId);

    //负责情况信息
    FamilyIncurDebts getFamilyIncurDebts(Long recordId);

    //获取家庭成员信息
    List<FamilyMember> getFamilyMember(Long recordId);

    //获取网点
    //admin
    List<CustomerListInfo> getNetWorkByAdmin();
    //normal
    List<CustomerListInfo> getNetWorkByNormal(long userId);

    //删除客户信息
    /*int getDeleteCusBasicInfo(int recordId);*/

    //指派用户信息
    List<AllColumnInfo> queryAppointInfoByUserId(long userId);
    //指派
    AppointInfo getAppointInfoList(long id);
    //保存指派
    void saveAppointInfo(@Param("id")long id,@Param("userId")long userId);
    //获取userName
    List<User> getUserNameList();
    //保存验收
    void saveChecksInfo(@Param("id")long id,@Param("state")int state);

    BaseInfo getBaseInfoByCustomerAndCerNum(@Param("customerName") String customerName, @Param("cerNum") String cerNum);

    void updateBaseInfoById(AllColumnInfo allColumnInfo);

    void updateIncomeexpenses(AllColumnInfo allColumnInfo);

    void saveSimpleBaseInfo(BaseInfo baseInfo);

    BaseInfo getBaseInfoByCerNum(String cerNum);


    void updateFamilyincurdebts(AllColumnInfo allColumnInfo);


    void updateFamilyassets(AllColumnInfo allColumnInfo);

    void updateCustomermanagereva(AllColumnInfo allColumnInfo);

    void updateHousePropertyInfo(HouseInfo houseInfo);

    void updateLandInfo(LandInfo landInfo);

    void updateCarsInfo(CarsInfo carsInfo);

    void updateFamilyMembers(FamilyMember familyMember);


    void deleteCarsinfoByAssetsId(long assetsId);

    void deleteHouseInfoByAssetsId(long assetsId);

    void deleteLandInfoByAssetsId(long assetsId);

    void deleteFamilyMemberInfoByRecordId(long id);

    void deleteBaseInfoByRecordId(Long recordId);
    void deleteIncomeExpensesByRecordId(Long id);
    void deleteFamilyAssetsByAssetsId(Long recordId);
    void deleteFinancialAssetsByAssetsId(Long id);
    void deleteFamilyIncurDebtsByRecordId(Long id);
    void deleteFinanceServicesByRecordId(Long recordId);
    void deleteVillageManagerEvaByRecordId(Long recordId);
    void deleteCustomerManagerEvaByRecordId(Long recordId);

    void saveCarsinfo(CarsInfo carsInfo);

    void saveLandInfo(LandInfo landInfo);

    void saveHouseInfo(HouseInfo houseInfo);

    void updateHouseInfo(HouseInfo houseInfo);

    void saveFamilyMember(FamilyMember familyMember);

    void saveBaseInfoFromClient(AllColumnInfo allColumnInfo);

    void saveFamilyassets(FamilyAssets familyAssets);

    Integer getStatusByCerNum(String cerNum);

    //四
    CustomerManagerEva getCustomerManagerEvaList(long id);

    BaseInfo getBaseInfoByRecordId(long recordId);

    List<Long> getAllHouseholdInfos();

    void updateAppointStatus(long recordId);

    List<SubmitItem> querySubmitList(String userName);

    AllColumnInfo queryAllColumnByRecordId(long recordId);

    void saveCustomerManagerEva(AllColumnInfo allColumnInfo);

    FamilyMember getFamilyMemberByMemberNameAndMemberCerNumAndCerNum(@Param("familyMemberName")String familyMemberName, @Param("familyMemberCerNum")String familyMemberCerNum, @Param("cerNum")String cerNum);

    void saveIncomeexpenses(AllColumnInfo allColumnInfo);

    void saveFamilyincurdebts(AllColumnInfo allColumnInfo);
}
