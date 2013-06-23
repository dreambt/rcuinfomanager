package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.dao.FamilyMemberInfoDao;
import com.rcuinfomanager.model.*;
import com.rcuinfomanager.util.Files;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
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
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 王文庭(xorbytes@qq.com)
 */
@Service
public class ImportFarmerInfoService {

    @Autowired
    private FamilyMemberInfoDao familyMemberInfoDao;

    @Autowired
    private BaseInfoDao baseInfoDao;

    private final String  templateFileName = "template2.xls";

    public void readTemplateAndExport(String recordIds, HttpServletResponse response,HttpServletRequest request) {
        List<AllColumnInfo> baseInfoList = new ArrayList<AllColumnInfo>();
        String[] recordIdList = recordIds.split(",");

        for (String recordId : recordIdList) {
            AllColumnInfo allColumnInfo = baseInfoDao.queryAllColumnByRecordId(Long.parseLong(recordId));
            if (allColumnInfo != null) {
                baseInfoList.add(allColumnInfo);
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
        if (!baseInfoList.isEmpty()) {
            readTemplateAndExport(baseInfoList, response,request);
        }
    }

    public void readTemplateAndExport(List<AllColumnInfo> baseInfoList,HttpServletResponse response,HttpServletRequest request) {
        ServletOutputStream outputStream = null;
        try {
            ClassPathResource cpr = new ClassPathResource(templateFileName);
            POIFSFileSystem fs = new POIFSFileSystem(cpr.getInputStream());
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);

            for (int i = 2; i <= baseInfoList.size()+1; i++) {
                AllColumnInfo allColumnInfo = baseInfoList.get(i-2);
                HSSFRow row = sheet.createRow(i);
                HSSFCell cell1 = row.createCell(0);
                cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell1.setCellValue(allColumnInfo.getCustomerName());
                HSSFCell cell2 = row.createCell(1);
                cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell2.setCellValue(allColumnInfo.getCerNum());
            }

            outputStream = response.getOutputStream();
            String fileName = Files.encodeFilename("数据.xls", request);
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

    public void importFromCSV(InputStream is) throws IOException {
        BufferedReader csvReader = new BufferedReader(new InputStreamReader(is,"UTF-8"));

        String row = csvReader.readLine();

        if (row == null) {
            return;
        }

        boolean isImportHouseholdFile = false;
        if (row.split(",").length == 3) {
            isImportHouseholdFile = true;
        }

        while (row != null) {
            String[] rowData = row.split(",");
            if (isImportHouseholdFile) {
                BaseInfo baseInfo = new BaseInfo();
                baseInfo.setCustomerName(rowData[0]);
                baseInfo.setCerNum(rowData[1]);
                baseInfo.setNation(rowData[2]);
                baseInfoDao.saveSimpleBaseInfo(baseInfo);
            } else {
                BaseInfo baseInfo = baseInfoDao.getBaseInfoByCerNum(rowData[1]);
                if (baseInfo != null) {
                    FamilyMember familyMember = new FamilyMember();
                    familyMember.setFamilyMemberCerNum(rowData[0]);
                    familyMember.setCerNum(rowData[1]);
                    familyMember.setFamilyMemberName(rowData[2]);
                    familyMember.setLeaderRelation(rowData[3]);
                    familyMember.setRecordId(baseInfo.getRecordId());
                    //todo save familyMember
                    baseInfoDao.saveFamilyMember(familyMember);
                }
            }
            row = csvReader.readLine();
        }

        csvReader.close();
    }

    public void importFromCSV(String file) throws IOException {
        importFromCSV(new FileInputStream(new File(file)));
    }

    public void exportBaseInfo4Household(String recordIds, BufferedWriter writer) throws IOException {
        String[] recordIdList = recordIds.split(",");

        for (String recordId : recordIdList) {
            BaseInfo baseInfo = baseInfoDao.getBaseInfoByRecordId(Long.parseLong(recordId));
            String rawData = baseInfo.getCustomerName()+ "," + baseInfo.getCerNum() + "," + baseInfo.getNation() + "\r\n";
            writer.write(rawData);
        }
    }

    public void exportBaseInfo4Member(String recordIds, BufferedWriter writer) throws IOException {
        String[] recordIdList = recordIds.split(",");

        for (String recordId : recordIdList) {
            List<FamilyMember> familyMemberList = baseInfoDao.getFamilyMember(Long.parseLong(recordId));
            for (FamilyMember familyMember : familyMemberList) {
                String rawData = familyMember.getFamilyMemberCerNum() + "," + familyMember.getCerNum() + "," + familyMember.getFamilyMemberName() + familyMember.getLeaderRelation() + "\r\n";
                writer.write(rawData);
            }
        }
    }
}
