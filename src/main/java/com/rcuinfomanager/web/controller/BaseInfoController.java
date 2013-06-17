package com.rcuinfomanager.web.controller;


import com.rcuinfomanager.model.LogsInfo;
import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.service.ImportFarmerInfoService;
import com.rcuinfomanager.service.LogsInfoService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Map;

@Controller
@RequestMapping("/family")
public class BaseInfoController {

    @Autowired
    BaseInfoService baseInfoService;
    @Autowired
    LogsInfoService logsInfoService;

    //查看
    @RequestMapping(value ="/{id}")
    public String show(@PathVariable long id,Map map){
        map.put("recordId",id);
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        map.put("userNameByAdmin", sessionUser.getUserName());
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate, sessionUser.getId(), "查看"));
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("personInfoList", baseInfoService.getPersonBasicInfo(id));
        //基础概况信息
        map.put("personBasicList",baseInfoService.getCusBasicInfo(id));
        //家庭收支情况
        map.put("personIncomeExpensesList",baseInfoService.getIncomeExpenses(id));
        // 家庭资产情况
        map.put("personFamilyAssets",baseInfoService.getFamilyAssets(id));
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
        //二
        map.put("financeService",baseInfoService.getFinanceService());
        //三
        map.put("villageManagerEvaList",baseInfoService.getVillageManagerEvaList());
        //四
        map.put("customerManagerEvaList",baseInfoService.getCustomerManagerEvaList());


        return "farmer/show";
    }

    //指派
    @RequestMapping("/appoint/{id}")
    public String appointInfoList(@PathVariable long id,Map map){
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate,sessionUser.getId(),"指派"));
        map.put("appointList",baseInfoService.getAppointInfoList(id));
        //获取userName
        map.put("userNameList",baseInfoService.getUserNameList());

        return "farmer/appointInfo";
    }

    //保存指派
    @RequestMapping("/saveAppoint/{id}/{uid}")
    public String saveAppoint(@PathVariable long id,@PathVariable long uid,Map map){
        baseInfoService.saveAppointInfo(id,uid);
        boolean success=true;
        map.put("success",success);
        map.put("isUserName","指派成功！");
     return "farmer/appointInfo";
    }

    //批量指派
    @RequestMapping("/batchAppoints/{recordIds}")
    public String batchAppoints(@PathVariable String recordIds,Map map){
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate,sessionUser.getId(),"指派"));
        map.put("recordIds",recordIds);
        map.put("userNameList",baseInfoService.getUserNameList());
        return "farmer/batchAppoint";
    }
    //保存批量指派
    @RequestMapping("/saveBatchAppoint/{recordIds}/{uid}")
    public String saveBatchAppoint(@PathVariable String recordIds,@PathVariable long uid,Map map){
        String[] ids=recordIds.split(",");
        for (String id: ids){
           baseInfoService.saveAppointInfo(Long.parseLong(id),uid);
        }
        boolean success=true;
        map.put("success",success);
        map.put("isUserName","指派成功！");
        return "farmer/batchAppoint";
    }

    //批量验收
    @RequestMapping("/batchChecks/{recordIds}")
    public String batchChecks(@PathVariable String recordIds,Map map){
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate,sessionUser.getId(),"验收"));
        map.put("recordIds",recordIds);

        return "farmer/checkInfo";
    }
    //保存批量验收
    @RequestMapping("/saveBatchChecks/{recordIds}/{state}")
    public String saveBatchChecks(@PathVariable String recordIds,@PathVariable String state,Map map){
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        String[] ids=recordIds.split(",");
        for (String id: ids){
           baseInfoService.saveChecksInfo(Long.parseLong(id),Integer.parseInt(state));
        }
        boolean success=true;
        map.put("success",success);
        map.put("isCheck","验收成功！");
        return "farmer/checkInfo";
    }

    //编辑
    @RequestMapping("/edit/{id}")
    public String editInfo(@PathVariable long id,Map map){
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate,sessionUser.getId(),"编辑"));
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("personInfoList", baseInfoService.getPersonBasicInfo(id));
        //基础概况信息
        map.put("personBasicList",baseInfoService.getCusBasicInfo(id));
        //家庭收支情况
        map.put("personIncomeExpensesList",baseInfoService.getIncomeExpenses(id));
        // 家庭资产情况
        map.put("personFamilyAssets",baseInfoService.getFamilyAssets(id));
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
        //二
        map.put("financeServicesLists",baseInfoService.getFinanceService());
        //三
        map.put("villageManagerEvaList",baseInfoService.getVillageManagerEvaList());
        //四
        map.put("customerManagerEvaList",baseInfoService.getCustomerManagerEvaList());

        return "farmer/edit";
    }

   //删除
    @RequestMapping("/delete/{id}")
    public String deleteInfo(@PathVariable long id,Map map){
        int result=0;//baseInfoServer.deleteInfo(id);
        if(result!=0){
            map.put("delSuccess","删除成功！");
        }else{
            map.put("delSuccess","删除失败！");
        }
        return "farmer/main";
    }
    //导入基础数据页面
    @RequestMapping("/importBasicData")
    public String importBasicData(Map map){
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate,sessionUser.getId(),"导入基础数据"));

        return "farmer/importBasicData";
    }
    //保存导入基础数据
    @RequestMapping("/saveImportBasicData")
    public String saveImportBasicData(@RequestParam(value="file", required=true)String file,Map map){
         try {
            ImportFarmerInfoService importFarmerInfoService = new ImportFarmerInfoService();
            importFarmerInfoService.importFromCSV(file);
            boolean success=true;
            map.put("success",success);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "farmer/importBasicData";
    }


    //导出基础数据页面
    @RequestMapping("/exportBasicData/{recordIds}")
    public String exportBasicData(@PathVariable String recordIds,Map map){
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate,sessionUser.getId(),"导出基础数据"));
        map.put("recordIds",recordIds);

        return "farmer/exportBasicData";
    }
    //保存导出基础数据
    @RequestMapping("/saveExportBasicData")
    public String saveExportBasicData(@RequestParam(value="file", required=true)String file,
                                      @RequestParam(value="recordIds", required=true)String recordIds,Map map){
        try {
            ImportFarmerInfoService importFarmerInfoService = new ImportFarmerInfoService();
            String[] ids=recordIds.split(",");
            for (String id: ids){

                importFarmerInfoService.importFromCSV(file);
            }
            boolean success=true;
            map.put("success",success);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "farmer/exportBasicData";
    }

}

