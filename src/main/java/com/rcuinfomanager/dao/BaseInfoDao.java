package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.*;

import java.util.List;

public interface BaseInfoDao {
      //管理员获取数据列表
      List<CustomerListInfo> queryAdminByBaseInfo();
      //普通用户获取数据列表
      List<CustomerListInfo> queryNormalByBaseInfo(int userId);
      // 获取客户的基本信息
      List<CusBaseInfo> getCusBasicInfo(int recordId);
      //获取家庭收支情况
      List<IncomeExpenses> getIncomeExpenses(int recordId);
      //获取家庭资产情况
      List<FamilyAssets> getFamilyAssets(int recordId);
      //获取土地信息
      List<LandInfo> getLandInfo(int recordId);
      //获取车辆信息
      List<CarsInfo> getCarsInfo(int recordId);
      //金融资产信息
      List<FinancialAssets> getFinancialAssets(int recordId);
      //负责情况信息
      List<FamilyIncurDebts> getFamilyIncurDebts(int recordId);
      //获取家庭成员信息
      List<FamilyMember> getFamilyMember(int recordId);
}
