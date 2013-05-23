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
    BaseInfoService baseInfoService;
    //查看
    @RequestMapping(value ="/{id}")
    public String queryPersonBasicInfo(@PathVariable int id,Map map){
        map.put("personBasicList",baseInfoService.getCusBasicInfo(id));
        map.put("personBasicList",baseInfoService.getIncomeExpenses(id));
        map.put("personBasicList",baseInfoService.getFamilyAssets(id));
        map.put("personBasicList",baseInfoService.getLandInfo(id));
        map.put("personBasicList",baseInfoService.getCarsInfo(id));
        map.put("personBasicList",baseInfoService.getFinancialAssets(id));
        /*map.put("personBasicList",baseInfoService.getFamilyIncurDebts(id));*/
        map.put("personBasicList",baseInfoService.getFamilyMember(id));
        return "queryPersonBasicInfo";
    }

    //指派
    @RequestMapping("/appoint/{id}")
    public String appointInfo(@PathVariable int id,Map map){

        return "appointInfo";
    }

    //批量指派
    @RequestMapping("/batchAppoint/{ids}")
    public String batchAppointInfo(@PathVariable int ids,Map map){

        return "appointInfo";
    }

    //编辑
    @RequestMapping("/edit/{id}")
    public String editInfo(@PathVariable int id,Map map){

        return "editePersonBasicInfo";
    }

    //删除
    @RequestMapping("/delete/{id}")
    public String deleteInfo(@PathVariable int id){

        return "queryPersonBasicInfo";
    }
}

