package com.rcuinfomanager.web.controller;


import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.service.ImportFarmerInfoService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/family")
public class BaseInfoController {

    @Autowired
    private BaseInfoService baseInfoServer;
    @Autowired
    BaseInfoService baseInfoService;
    //查看
    @RequestMapping(value ="/{id}")
    public String show(@PathVariable long id,Map map){

        map.put("personInfoList", baseInfoService.getPersonBasicInfo(id));
        //基础概况信息
        map.put("personBasicList",baseInfoService.getCusBasicInfo(id));
        //家庭收支情况
        map.put("personIncomeExpensesList",baseInfoService.getIncomeExpenses(id));
        // 家庭资产情况
        map.put("personFamilyAssetsList",baseInfoService.getFamilyAssets(id));
        //房产
        map.put("personHousePropertyInfoList",baseInfoService.getHousePropertyInfo(id));
        //土地
        map.put("personLandInfoList",baseInfoService.getLandInfo(id));
        //车辆
        map.put("personCarsInfoList",baseInfoService.getCarsInfo(id));
        //金融资产
        map.put("personFinancialAssetsList",baseInfoService.getFinancialAssets(id));
        //家庭负债
        map.put("personFamilyIncurDebtsList",baseInfoService.getFamilyIncurDebts(id));
        //家庭成员
        map.put("personFamilyMemberList",baseInfoService.getFamilyMember(id));

        return "farmer/show";
    }

    //指派
    @RequestMapping("/appoint/{id}")
    public String appointInfo(@PathVariable long id,Map map){
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        /*if(sessionUser.getId()==1){
            map.put("orgNameInfo",baseInfoService.getAdminOrganizationName());
        }else{
            map.put("orgNameInfo",baseInfoService.getUserOrganizationName(Long.valueOf(sessionUser.getId())));
        }*/

        return "farmer/appointInfo";
    }

    //编辑
    @RequestMapping("/edit/{id}")
    public String editInfo(@PathVariable long id,Map map){

        map.put("personInfoList", baseInfoService.getPersonBasicInfo(id));
        //基础概况信息
        map.put("personBasicList",baseInfoService.getCusBasicInfo(id));
        //家庭收支情况
        map.put("personIncomeExpensesList",baseInfoService.getIncomeExpenses(id));
        // 家庭资产情况
        map.put("personFamilyAssetsList",baseInfoService.getFamilyAssets(id));
        //房产
        map.put("personHousePropertyInfoList",baseInfoService.getHousePropertyInfo(id));
        //土地
        map.put("personLandInfoList",baseInfoService.getLandInfo(id));
        //车辆
        map.put("personCarsInfoList",baseInfoService.getCarsInfo(id));
        //金融资产
        map.put("personFinancialAssetsList",baseInfoService.getFinancialAssets(id));
        //家庭负债
        map.put("personFamilyIncurDebtsList",baseInfoService.getFamilyIncurDebts(id));
        //家庭成员
        map.put("personFamilyMemberList",baseInfoService.getFamilyMember(id));

        return "farmer/edit";
    }

   /* //删除
    @RequestMapping("/delete/{id}")
    public String deleteInfo(@PathVariable long id,Map map){
        int result=baseInfoServer.deleteInfo(id);
        if(result!=0){
            map.put("delSuccess","删除成功！");
        }else{
            map.put("delSuccess","删除失败！");
        }
        return "farmer/main";
    }*/

   /*//批量指派
    @RequestMapping("/{id}")
    public String batchAppointInfo(@PathVariable long id,Map map){

        return "appointInfo";
    }*/


    //导入基础数据页面
    @RequestMapping("/importBasicData")
    public String importBasicData(){

        return "farmer/importBasicData";
    }

    @RequestMapping("/saveImportBasicData/{file}")
    public String saveImportBasicData(@PathVariable String file, Map map){
        ImportFarmerInfoService importFarmerInfoService = new ImportFarmerInfoService();
        try {

            importFarmerInfoService.importFromCSV(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "farmer/importBasicData";
    }
}

