package com.rcuinfomanager.web.controller;


import com.rcuinfomanager.service.BaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/family")
public class BaseInfoController {

    @Autowired
    private BaseInfoService baseInfoServer;
    @Autowired
    BaseInfoService baseInfoService;

    //查看
    @RequestMapping(value = "/{id}")
    public String show(@PathVariable long id, Map map) {

        map.put("personInfoList", baseInfoService.getPersonBasicInfo(id));
        //基础概况信息
        map.put("personBasicList", baseInfoService.getCusBasicInfo(id));
        //家庭收支情况
        map.put("personIncomeExpensesList", baseInfoService.getIncomeExpenses(id));
        // 家庭资产情况
        map.put("personFamilyAssetsList", baseInfoService.getFamilyAssets(id));
        //房产
        map.put("personHousePropertyInfoList", baseInfoService.getHousePropertyInfo(id));
        //土地
        map.put("personLandInfoList", baseInfoService.getLandInfo(id));
        //车辆
        map.put("personCarsInfoList", baseInfoService.getCarsInfo(id));
        //金融资产
        map.put("personFinancialAssetsList", baseInfoService.getFinancialAssets(id));
        //家庭负债
        map.put("personFamilyIncurDebtsList", baseInfoService.getFamilyIncurDebts(id));
        //家庭成员
        map.put("personFamilyMemberList", baseInfoService.getFamilyMember(id));

        return "farmer/show";
    }

    //指派
    @RequestMapping("/appoint/{id}")
    public String appointInfo(@PathVariable long id, Map map) {
        map.put("appointPeopleList", baseInfoService.getPersonBasicInfo(id));

        return "farmer/appointInfo";
    }

    //保存指派
    @RequestMapping("/saveAppointInfo/{id}/{organizationName}/{customerName}")
    public String saveAppointInfo(@PathVariable long id, String organizationName,
                                  String customerName, Map map) {
        System.out.print(id);
        System.out.print(organizationName);
        System.out.print(customerName);


        return "/index";
    }


    //批量指派
    @RequestMapping("/batchAppoints/{ids}")
    public String batchAppointInfo(@PathVariable String ids, Map map) {
        System.out.print(ids);
        map.put("ids", ids);
        return "farmer/batchAppoint";
    }

    //保存指派对象
    @RequestMapping("/saveBatchAppointInfo/{ids}")
    public String saveBatchAppointInfo(@PathVariable String ids, Map map) {
        String[] recordIds = ids.split(",");
        for (String id : recordIds) {
            //Object k=baseInfoService.getPersonBasicInfo(Long.parseLong(id));
        }
        return "/index";
    }

    //编辑
    @RequestMapping("/edit/{id}")
    public String editInfo(@PathVariable long id, Map map) {

        map.put("personInfoList", baseInfoService.getPersonBasicInfo(id));
        //基础概况信息
        map.put("personBasicList", baseInfoService.getCusBasicInfo(id));
        //家庭收支情况
        map.put("personIncomeExpensesList", baseInfoService.getIncomeExpenses(id));
        // 家庭资产情况
        map.put("personFamilyAssetsList", baseInfoService.getFamilyAssets(id));
        //房产
        map.put("personHousePropertyInfoList", baseInfoService.getHousePropertyInfo(id));
        //土地
        map.put("personLandInfoList", baseInfoService.getLandInfo(id));
        //车辆
        map.put("personCarsInfoList", baseInfoService.getCarsInfo(id));
        //金融资产
        map.put("personFinancialAssetsList", baseInfoService.getFinancialAssets(id));
        //家庭负债
        map.put("personFamilyIncurDebtsList", baseInfoService.getFamilyIncurDebts(id));
        //家庭成员
        map.put("personFamilyMemberList", baseInfoService.getFamilyMember(id));

        return "farmer/edit";
    }

    //删除
    @RequestMapping("/delete/{id}")
    public String deleteInfo(@PathVariable long id) {

        return "farmer/main";
    }
}