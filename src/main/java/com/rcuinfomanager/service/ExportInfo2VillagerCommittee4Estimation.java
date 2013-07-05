package com.rcuinfomanager.service;

import com.google.common.base.Strings;
import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.dao.VillageManagerEvaDao;
import com.rcuinfomanager.model.BaseInfo;
import com.rcuinfomanager.model.VillageManagerEva;
import com.rcuinfomanager.util.Files;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class ExportInfo2VillagerCommittee4Estimation {

    private final static String templateFileName = "template.xls";

    @Autowired
    private BaseInfoDao baseInfoDao;
    @Autowired
    private VillageManagerEvaDao villageManagerEvaDao;

    public void readTemplateAndExport(String recordIds, HttpServletResponse response,HttpServletRequest request) {
        List<BaseInfo> baseInfoList = new ArrayList<BaseInfo>();
        String[] recordIdList = recordIds.split(",");

        for (String recordId : recordIdList) {
            BaseInfo baseInfo = baseInfoDao.getBaseInfoByRecordId(Long.parseLong(recordId));
            if (baseInfo != null) {
                baseInfoList.add(baseInfo);
            }
        }
        if (!baseInfoList.isEmpty()) {
            readTemplateAndExport(baseInfoList, response,request);
        }
    }

    public void readTemplateAndExport(List<BaseInfo> baseInfoList,HttpServletResponse response,HttpServletRequest request) {
        ServletOutputStream outputStream = null;
        try {
            ClassPathResource cpr = new ClassPathResource(templateFileName);
            POIFSFileSystem fs = new POIFSFileSystem(cpr.getInputStream());
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);

            for (int i = 1; i <= baseInfoList.size(); i++) {
                BaseInfo baseInfo = baseInfoList.get(i-1);
                HSSFRow row = sheet.getRow(i);
                if (row == null) {
                   row = sheet.createRow(i);
                }
                HSSFCell cell1 = row.createCell(0);
                cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell1.setCellValue(baseInfo.getCustomerName());
                HSSFCell cell2 = row.createCell(1);
                cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell2.setCellValue(baseInfo.getCerNum());
                HSSFCell cell3 = row.createCell(2);
                cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell3.setCellValue(baseInfo.getAddress());
                HSSFCell cell4 = row.createCell(3);
                cell4.setCellValue(baseInfo.getSubmitTime());
            }

            outputStream = response.getOutputStream();
            String fileName = Files.encodeFilename("村委会评价表.xls",request);
            response.setContentType("application/vnd.ms-excel");
            response.addHeader("content-disposition",
                    "attachment;filename=" + fileName);
            wb.write(outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    //just ignored.
                }
            }
        }
    }

    public void readExport(InputStream is) {
        ServletOutputStream outputStream = null;
        try {
            POIFSFileSystem fs = new POIFSFileSystem(is);
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);

            Iterator rows = sheet.rowIterator();
            while (rows.hasNext()) {
                HSSFRow row = (HSSFRow) rows.next();
                if (row.getRowNum() == 0) {
                    continue;
                }
                HSSFCell customerNameCell = row.getCell(0);
                HSSFCell cerNumCell = row.getCell(1);
                String customerName = customerNameCell.getStringCellValue();
                String cerNum = cerNumCell.getStringCellValue();
                if (Strings.isNullOrEmpty(customerName) || Strings.isNullOrEmpty(cerNum)) {
                    break;
                }
                BaseInfo baseInfo = baseInfoDao.getBaseInfoByCustomerAndCerNum(customerName, cerNum);
                if (baseInfo != null) {
                    VillageManagerEva villageManagerEva = new VillageManagerEva();
                    HSSFCell cell = row.getCell(4);
                    String evaValue = cell.getStringCellValue();
                    if ("较好（建议3（含）-5万）".equals(evaValue)) {
                        villageManagerEva.setRecordId(baseInfo.getRecordId());
                        villageManagerEva.setTruth("基本准确");
                        villageManagerEva.setLocalLivingTime("6年（含）以上");
                        villageManagerEva.setOperatingCapacity("经验丰富、技术水平较高、能力较强");
                        villageManagerEva.setProjectPotential("一般");
                        villageManagerEva.setOperationalRisks("较低");
                        villageManagerEva.setDevelopmentProspects("较好");
                        villageManagerEva.setOperatingStability("中等");
                        villageManagerEva.setCapitaNetIncomeLevel("中高收入");
                        villageManagerEva.setDisposableIncomeLevel("中等偏");
                        villageManagerEva.setFamilyPropertyLevel("富裕");
                        villageManagerEva.setPayTaxes("正常缴纳");
                        villageManagerEva.setRespectSitu("较好");
                        villageManagerEva.setNeighborhood("较好");
                        villageManagerEva.setPublicWelfareLevel("较高");
                        villageManagerEva.setCreditworthiness("较好");
                        villageManagerEva.setConduct("良好");
                        villageManagerEva.setPraised("不清楚");
                        villageManagerEva.setImportantObject("一般");
                    }  else if ("一般（建议3万以下）".equals(evaValue)) {
                        villageManagerEva.setRecordId(baseInfo.getRecordId());
                        villageManagerEva.setTruth("基本准确");
                        villageManagerEva.setLocalLivingTime("6年（含）以上");
                        villageManagerEva.setOperatingCapacity("经验丰富、技术水平较高、能力较强");
                        villageManagerEva.setProjectPotential("一般");
                        villageManagerEva.setOperationalRisks("一般");
                        villageManagerEva.setDevelopmentProspects("一般");
                        villageManagerEva.setOperatingStability("一般");
                        villageManagerEva.setCapitaNetIncomeLevel("中等收入");
                        villageManagerEva.setDisposableIncomeLevel("中等收入");
                        villageManagerEva.setFamilyPropertyLevel("殷实");
                        villageManagerEva.setPayTaxes("正常缴纳");
                        villageManagerEva.setRespectSitu("较好");
                        villageManagerEva.setNeighborhood("较好");
                        villageManagerEva.setPublicWelfareLevel("一般");
                        villageManagerEva.setCreditworthiness("较好");
                        villageManagerEva.setConduct("良好");
                        villageManagerEva.setPraised("不清楚");
                        villageManagerEva.setImportantObject("一般");
                    }  else if ("好（建议5（含）-10万）".equals(evaValue)) {
                        villageManagerEva.setRecordId(baseInfo.getRecordId());
                        villageManagerEva.setTruth("基本准确");
                        villageManagerEva.setLocalLivingTime("6年（含）以上");
                        villageManagerEva.setOperatingCapacity("经验丰富、技术水平较高、能力较强");
                        villageManagerEva.setProjectPotential("良好");
                        villageManagerEva.setOperationalRisks("较低");
                        villageManagerEva.setDevelopmentProspects("较好");
                        villageManagerEva.setOperatingStability("中等");
                        villageManagerEva.setCapitaNetIncomeLevel("中高收入");
                        villageManagerEva.setDisposableIncomeLevel("高收入");
                        villageManagerEva.setFamilyPropertyLevel("富裕");
                        villageManagerEva.setPayTaxes("正常缴纳");
                        villageManagerEva.setRespectSitu("较好");
                        villageManagerEva.setNeighborhood("较好");
                        villageManagerEva.setPublicWelfareLevel("较高");
                        villageManagerEva.setCreditworthiness("较好");
                        villageManagerEva.setConduct("良好");
                        villageManagerEva.setPraised("不清楚");
                        villageManagerEva.setImportantObject("一般");
                    } else if ("很好（建议10万以上）".equals(evaValue)) {
                        villageManagerEva.setRecordId(baseInfo.getRecordId());
                        villageManagerEva.setTruth("基本准确");
                        villageManagerEva.setLocalLivingTime("6年（含）以上");
                        villageManagerEva.setOperatingCapacity("经验丰富、技术水平较高、能力较强");
                        villageManagerEva.setProjectPotential("优秀");
                        villageManagerEva.setOperationalRisks("很低");
                        villageManagerEva.setDevelopmentProspects("很好");
                        villageManagerEva.setOperatingStability("强");
                        villageManagerEva.setCapitaNetIncomeLevel("高收入");
                        villageManagerEva.setDisposableIncomeLevel("最高收入");
                        villageManagerEva.setFamilyPropertyLevel("富足");
                        villageManagerEva.setPayTaxes("正常缴纳");
                        villageManagerEva.setRespectSitu("好");
                        villageManagerEva.setNeighborhood("好");
                        villageManagerEva.setPublicWelfareLevel("较高");
                        villageManagerEva.setCreditworthiness("较好");
                        villageManagerEva.setConduct("优秀");
                        villageManagerEva.setPraised("不清楚");
                        villageManagerEva.setImportantObject("一般");
                    }
                    villageManagerEvaDao.saveVillageManagerEva(villageManagerEva);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    //just ignored.
                }
            }
        }
    }
}
