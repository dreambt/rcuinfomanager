package com.rcuinfomanager.web.controller;


import com.rcuinfomanager.model.CusBaseInfo;
import com.rcuinfomanager.model.FinanceServices;
import com.rcuinfomanager.model.HouseInfo;
import com.rcuinfomanager.model.LogsInfo;
import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.service.ExportInfo2VillagerCommittee4Estimation;
import com.rcuinfomanager.service.ImportFarmerInfoService;
import com.rcuinfomanager.service.LogsInfoService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import com.rcuinfomanager.util.Files;
import com.rcuinfomanager.util.ImageUtils;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/family")
public class BaseInfoController {

    @Autowired
    BaseInfoService baseInfoService;
    @Autowired
    LogsInfoService logsInfoService;
    @Autowired
    ImportFarmerInfoService importFarmerInfoService;

    @Autowired
    ExportInfo2VillagerCommittee4Estimation exportInfo2VillagerCommittee4Estimation;

    private  /*@Value("${images.store.dir}")*/ String imgStoreDir = "d:/tmp";

    //查看
    @RequestMapping(value = "/{id}")
    public String show(@PathVariable long id, Map map) {
        map.put("recordId", id);
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

        CusBaseInfo cusBasicInfo = baseInfoService.getCusBasicInfo(id);
        map.put("personBasicList", cusBasicInfo);

        //家庭收支情况
        map.put("personIncomeExpensesList", baseInfoService.getIncomeExpenses(id));
        // 家庭资产情况
        map.put("personFamilyAssets", baseInfoService.getFamilyAssets(id));
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
        //二
        map.put("financeService", baseInfoService.getFinanceService(id));
        //三
        map.put("villageManagerEvaList", baseInfoService.getVillageManagerEvaList(id));
        //四
        map.put("customerManagerEvaList", baseInfoService.getCustomerManagerEvaList(id));
        if (cusBasicInfo != null) {
            map.put("imgList", ImageUtils.getFileNames(cusBasicInfo.getCerNum(),imgStoreDir));
        } else {
            map.put("imgList", null);
        }

        return "farmer/show";
    }

    //指派
    @RequestMapping("/appoint/{id}")
    public String appointInfoList(@PathVariable long id, Map map) {
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate, sessionUser.getId(), "指派"));
        map.put("appointList", baseInfoService.getAppointInfoList(id));
        //获取userName
        map.put("userNameList", baseInfoService.getUserNameList());

        return "farmer/appointInfo";
    }

    //保存指派
    @RequestMapping("/saveAppoint/{id}/{uid}")
    public String saveAppoint(@PathVariable long id, @PathVariable long uid, Map map) {
        baseInfoService.saveAppointInfo(id, uid);
        boolean success = true;
        map.put("success", success);
        map.put("isUserName", "指派成功！");
        return "farmer/appointInfo";
    }

    //批量指派
    @RequestMapping("/batchAppoints/{recordIds}")
    public String batchAppoints(@PathVariable String recordIds, Map map) {
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate, sessionUser.getId(), "指派"));
        map.put("recordIds", recordIds);
        map.put("userNameList", baseInfoService.getUserNameList());
        return "farmer/batchAppoint";
    }

    //保存批量指派
    @RequestMapping("/saveBatchAppoint/{recordIds}/{uid}")
    public String saveBatchAppoint(@PathVariable String recordIds, @PathVariable long uid, Map map) {
        String[] ids = recordIds.split(",");
        for (String id : ids) {
            baseInfoService.saveAppointInfo(Long.parseLong(id), uid);
        }
        boolean success = true;
        map.put("success", success);
        map.put("isUserName", "指派成功！");
        return "farmer/batchAppoint";
    }

    //批量验收
    @RequestMapping("/batchChecks/{recordIds}")
    public String batchChecks(@PathVariable String recordIds, Map map) {
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate, sessionUser.getId(), "验收"));
        map.put("recordIds", recordIds);

        return "farmer/checkInfo";
    }

    //保存批量验收
    @RequestMapping("/saveBatchChecks/{recordIds}/{state}")
    public String saveBatchChecks(@PathVariable String recordIds, @PathVariable String state, Map map) {
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        String[] ids = recordIds.split(",");
        for (String id : ids) {
            baseInfoService.saveChecksInfo(Long.parseLong(id), Integer.parseInt(state));
        }
        boolean success = true;
        map.put("success", success);
        map.put("isCheck", "验收成功！");
        return "farmer/checkInfo";
    }

    //编辑
    @RequestMapping("/edit/{id}")
    public String editInfo(@PathVariable long id, Map map) {
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate, sessionUser.getId(), "编辑"));
        map.put("displayUserName", sessionUser.getDisplayUserName());
        map.put("personInfoList", baseInfoService.getPersonBasicInfo(id));
        //基础概况信息
        map.put("personBasicList", baseInfoService.getCusBasicInfo(id));
        //家庭收支情况
        map.put("personIncomeExpensesList", baseInfoService.getIncomeExpenses(id));
        // 家庭资产情况
        map.put("personFamilyAssets", baseInfoService.getFamilyAssets(id));
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
        //二
        map.put("financeServicesLists", baseInfoService.getFinanceService(id));
        //三
        map.put("villageManagerEvaList", baseInfoService.getVillageManagerEvaList(id));
        //四
        map.put("customerManagerEvaList", baseInfoService.getCustomerManagerEvaList(id));

        FinanceServices financeServices=baseInfoService.getFinanceService(id);
        String[] usedPro=financeServices.getUsedProduct().split(",");
        map.put("usedProducts",usedPro);
        map.put("recordId",id);
        return "farmer/edit";
    }

    //保存编辑
    @RequestMapping(value = "/saveEditInfo",method = RequestMethod.POST)
    public String saveEditInfo(@ModelAttribute("allColumnInfo")AllColumnInfo allColumnInfo,Map map){


        System.out.print(allColumnInfo);
        //map.put("editSuccess","编辑成功！");
        return "redirect:/family/edit/"+allColumnInfo.getRecordId();
    }

    /*@RequestMapping(value = "/saveEditInfo", method = RequestMethod.POST)
    public String saveEditInfo(HttpServletRequest request, HttpServletResponse response,Map map){


        *//*System.out.print(allColumnInfo);*//*
        map.put("editSuccess","编辑成功！");
        return "farmer/edit";
    }*/

    //删除
    @RequestMapping("/delete/{id}")
    public String deleteInfo(@PathVariable long id, Map map) {
        int result = 0;//baseInfoServer.deleteInfo(id);
        if (result != 0) {
            map.put("delSuccess", "删除成功！");
        } else {
            map.put("delSuccess", "删除失败！");
        }
        return "farmer/main";
    }

    //导入基础数据页面
    @RequestMapping("/importBasicData")
    public String importBasicData(Map map) {
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate, sessionUser.getId(), "导入基础数据"));

        return "farmer/importBasicData";
    }

    //保存导入基础数据
    @RequestMapping("/saveImportBasicData")
    public String saveImportBasicData(HttpServletRequest request, HttpServletResponse response, Map map) {
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> fileItems = new ServletFileUpload(new DiskFileItemFactory(1024 * 1024, new File("c:/tmp"))).
                        parseRequest(request);
                for (FileItem item : fileItems) {
                    if (!item.isFormField()) {
                        importFarmerInfoService.importFromCSV(item.getInputStream());
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }


        }
        map.put("success", true);
        return "farmer/importBasicData";
    }


    //导出基础数据页面
    @RequestMapping("/exportBasicData4Household/{recordIds}")
    public void exportBasicData4household(HttpServletRequest request, HttpServletResponse response, @PathVariable String recordIds) {
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate, sessionUser.getId(), "导出户主数据"));

        if ("All".equalsIgnoreCase(recordIds)) {
            List<Long> allHouseholdInfos = baseInfoService.getAllHouseholdInfos();
            if (allHouseholdInfos != null && !allHouseholdInfos.isEmpty()) {
                StringBuffer buffer = new StringBuffer();
                for (int i = 0; i < allHouseholdInfos.size(); i++) {
                    if (i != 0) {
                        buffer.append(",");
                    }
                    buffer.append(allHouseholdInfos.get(i));
                }
                recordIds = buffer.toString();
            }
        }

        BufferedWriter writer = null;
        try {
            String fileName = Files.encodeFilename("户主.csv", request);
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            writer = new BufferedWriter(response.getWriter());
            importFarmerInfoService.exportBaseInfo4Household(recordIds, writer);
        } catch (IOException e) {
           e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @RequestMapping("/exportBasicData4Members/{recordIds}")
    public void exportBasicData4Members(HttpServletRequest request, HttpServletResponse response, @PathVariable String recordIds) {
        //记录日志
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();
        SimpleDateFormat dateFm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //格式化当前系统日期
        String logsDate = dateFm.format(new java.util.Date());
        logsInfoService.saveLogsInfo(new LogsInfo(logsDate, sessionUser.getId(), "导出家庭成员数据"));

        if ("All".equalsIgnoreCase(recordIds)) {
            List<Long> allHouseholdInfos = baseInfoService.getAllHouseholdInfos();
            if (allHouseholdInfos != null && !allHouseholdInfos.isEmpty()) {
                StringBuffer buffer = new StringBuffer();
                for (int i = 0; i < allHouseholdInfos.size(); i++) {
                    if (i != 0) {
                        buffer.append(",");
                    }
                    buffer.append(allHouseholdInfos.get(i));
                }
                recordIds = buffer.toString();
            }
        }

        BufferedWriter writer = null;
        try {
            String fileName = Files.encodeFilename("家庭成员.csv", request);
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            writer = new BufferedWriter(response.getWriter());
            importFarmerInfoService.exportBaseInfo4Member(recordIds, writer);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //导出基础数据
    @RequestMapping("/exportVillagerEstimation/{recordIds}")
    public String saveExportBasicData(HttpServletRequest request, HttpServletResponse response,@PathVariable String recordIds) {
        if ("All".equalsIgnoreCase(recordIds)) {
            List<Long> allHouseholdInfos = baseInfoService.getAllHouseholdInfos();
            if (allHouseholdInfos != null && !allHouseholdInfos.isEmpty()) {
                StringBuffer buffer = new StringBuffer();
                for (int i = 0; i < allHouseholdInfos.size(); i++) {
                    if (i != 0) {
                        buffer.append(",");
                    }
                    buffer.append(allHouseholdInfos.get(i));
                }
                recordIds = buffer.toString();
            }
        }
        exportInfo2VillagerCommittee4Estimation.readTemplateAndExport(recordIds, response,request);
        return "farmer/exportBasicData";
    }

    //增加房产
    @RequestMapping(value = "/addHouse/{assetsId}", method = RequestMethod.GET)
    public String addHouse(@PathVariable long assetsId,Map map){
        map.put("assetsId", assetsId);
        map.put("houseInfo", new HouseInfo());
        return "farmer/addHouseProperty";
    }
    //保存房产
    @RequestMapping(value = "/saveHouse", method = RequestMethod.POST)
    public String saveHouse(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("houseInfo")HouseInfo houseInfo,Map map){

        baseInfoService.saveHouseInfo(houseInfo);
        map.put("houseSuccess","true");
        return "farmer/addHouseProperty";
    }
    //增加土地
    @RequestMapping(value = "/addLand/{id}")
    public String addLand(@PathVariable long id){

        return "";
    }
    //增加车辆
    @RequestMapping(value = "/addCar/{}")
     public String addCar(@PathVariable long id){

         return "";
     }


}

