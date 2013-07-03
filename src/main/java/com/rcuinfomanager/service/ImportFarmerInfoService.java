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

    private final String templateFileName = "template2.xls";

    public void readTemplateAndExport(String recordIds, HttpServletResponse response, HttpServletRequest request) throws IOException {
        List<AllColumnInfo> baseInfoList = new ArrayList<AllColumnInfo>();
        String[] recordIdList = recordIds.split(",");

        ClassPathResource cpr = new ClassPathResource(templateFileName);
        POIFSFileSystem fs = new POIFSFileSystem(cpr.getInputStream());
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFSheet sheet = wb.getSheetAt(0);
        int rowIdx = 2;
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
            dbRecord2ExcelStream(sheet,allColumnInfo,rowIdx);
            rowIdx++;
        }

        ServletOutputStream outputStream = response.getOutputStream();
        String fileName = Files.encodeFilename("数据.xls", request);
        response.setContentType("application/vnd.ms-excel");
        response.addHeader("content-disposition",
                "attachment;filename=" + fileName);
        wb.write(outputStream);
        outputStream.close();
    }

    private void dbRecord2ExcelStream(HSSFSheet sheet,AllColumnInfo allColumnInfo, int rowIdx) throws IOException {
        HSSFRow row = sheet.createRow(rowIdx);
        HSSFCell customerNameCell = row.createCell(0);
        customerNameCell.setCellValue(allColumnInfo.getCustomerName());
        HSSFCell cerNumCell = row.createCell(1);
        cerNumCell.setCellValue(allColumnInfo.getCerNum());
        HSSFCell genderCell = row.createCell(2);
        if (allColumnInfo.getGender() == 0) {
            genderCell.setCellValue("女");
        } else {
            genderCell.setCellValue("男");
        }
        HSSFCell isFarmerCell = row.createCell(3);
        isFarmerCell.setCellValue(allColumnInfo.getIsFarmer());
        HSSFCell cerTypeCell = row.createCell(4);
        cerTypeCell.setCellValue(allColumnInfo.getCerType());
        HSSFCell cerValidityCell = row.createCell(5);
        cerValidityCell.setCellValue(allColumnInfo.getCerValidityFrom() + "-" + allColumnInfo.getCerValidityTo());
        HSSFCell customerTypeCell = row.createCell(6);
        customerTypeCell.setCellValue(allColumnInfo.getCustType());
        HSSFCell customerBirthdayCell = row.createCell(7);
        customerBirthdayCell.setCellValue(allColumnInfo.getBirthday());
        HSSFCell nationalityCell = row.createCell(8);
        nationalityCell.setCellValue(allColumnInfo.getNationality());
        HSSFCell isHavePassportCell = row.createCell(9);
        isHavePassportCell.setCellValue(allColumnInfo.getIsHavePassport());
        HSSFCell nationCell = row.createCell(10);
        nationCell.setCellValue(allColumnInfo.getNation());
        HSSFCell poliLaspectCell = row.createCell(11);
        poliLaspectCell.setCellValue(allColumnInfo.getPoliLaspect());
        HSSFCell addressCell = row.createCell(12);
        addressCell.setCellValue(allColumnInfo.getAddress());
        HSSFCell postcodeCell = row.createCell(13);
        postcodeCell.setCellValue(allColumnInfo.getPostcode());
        HSSFCell telephoneCell = row.createCell(14);
        telephoneCell.setCellValue(allColumnInfo.getTelephone());
        HSSFCell mbPhoneNumCell = row.createCell(15);
        mbPhoneNumCell.setCellValue(allColumnInfo.getMbPhoneNum());
        HSSFCell areaCodeCell = row.createCell(16);
        areaCodeCell.setCellValue(allColumnInfo.getAreaCode());
        HSSFCell areaNameCell = row.createCell(17);
        areaNameCell.setCellValue(allColumnInfo.getAreaName());
        HSSFCell highestEduCell = row.createCell(18);
        highestEduCell.setCellValue(allColumnInfo.getHighestEdu());
        HSSFCell healthCell = row.createCell(19);
        healthCell.setCellValue(allColumnInfo.getHealth());
        HSSFCell highestDegreeCell = row.createCell(20);
        highestDegreeCell.setCellValue(allColumnInfo.getHighestDegree());
        HSSFCell bankRelationCell = row.createCell(21);
        bankRelationCell.setCellValue(allColumnInfo.getBankRelation());
        HSSFCell liveConditionCell = row.createCell(22);
        liveConditionCell.setCellValue(allColumnInfo.getLiveCondition());
        HSSFCell maritalStatusCell = row.createCell(23);
        maritalStatusCell.setCellValue(allColumnInfo.getMaritalStatus());
        HSSFCell socialSecurityCell = row.createCell(24);
        socialSecurityCell.setCellValue(allColumnInfo.getSocialSecurity());
        HSSFCell bankPartnership = row.createCell(25);
        bankPartnership.setCellValue(allColumnInfo.getBankPartnership());
        HSSFCell professionCell = row.createCell(26);
        professionCell.setCellValue(allColumnInfo.getProfession());
        HSSFCell businessProjCell = row.createCell(27);
        businessProjCell.setCellValue(allColumnInfo.getBusinessProj());
        HSSFCell businessYearCell = row.createCell(28);
        businessYearCell.setCellValue(allColumnInfo.getBusinessYear());
        HSSFCell businessSiteCell = row.createCell(29);
        businessSiteCell.setCellValue(allColumnInfo.getBusinessSite());
        HSSFCell industryCell = row.createCell(30);
        industryCell.setCellValue(allColumnInfo.getIndustry());
        HSSFCell businessPropCell = row.createCell(31);
        businessPropCell.setCellValue(allColumnInfo.getBusinessProp());
        HSSFCell moneySituCell = row.createCell(32);
        moneySituCell.setCellValue(allColumnInfo.getMoneySitu());
        HSSFCell inputMoneyCell = row.createCell(33);
        inputMoneyCell.setCellValue(allColumnInfo.getInputMoney());
        HSSFCell ownMoneyCell = row.createCell(33);
        ownMoneyCell.setCellValue(allColumnInfo.getOwnMoney());
        HSSFCell yearIncomeCell = row.createCell(34);
        yearIncomeCell.setCellValue(allColumnInfo.getYearIncome());
        HSSFCell annualWageIncomeCell = row.createCell(35);
        annualWageIncomeCell.setCellValue(allColumnInfo.getAnnualWageIncome());
        HSSFCell workSituCell = row.createCell(36);
        workSituCell.setCellValue(allColumnInfo.getWorkSitu());
        HSSFCell unitPropCell = row.createCell(37);
        unitPropCell.setCellValue(allColumnInfo.getUnitProp());
        HSSFCell unitIndustryNameCell = row.createCell(38);
        unitIndustryNameCell.setCellValue(allColumnInfo.getUnitIndustryName());
        HSSFCell departmentCell = row.createCell(39);
        departmentCell.setCellValue(allColumnInfo.getDepartment());
        HSSFCell unitTypeCell = row.createCell(40);
        unitTypeCell.setCellValue(allColumnInfo.getUnitType());
        HSSFCell dutiesCell = row.createCell(41);
        dutiesCell.setCellValue(allColumnInfo.getDuties());
        HSSFCell annualWageIncome = row.createCell(42);
        annualWageIncome.setCellValue(allColumnInfo.getAnnualWageIncome());
        HSSFCell workYearsCell = row.createCell(43);
        workYearsCell.setCellValue(allColumnInfo.getWorkYears());
        HSSFCell workTitleCell = row.createCell(44);
        workTitleCell.setCellValue(allColumnInfo.getWorkTitle());
        HSSFCell fmAllIncomeCell = row.createCell(45);
        fmAllIncomeCell.setCellValue(allColumnInfo.getFmAllIncome());
        HSSFCell fmExpensesCell = row.createCell(46);
        fmExpensesCell.setCellValue(allColumnInfo.getFmExpenses());
        HSSFCell fmIncomeSrcCell = row.createCell(47);
        fmIncomeSrcCell.setCellValue(allColumnInfo.getFmIncomeSrc());
        HSSFCell fmPerIncomeCell = row.createCell(48);
        fmPerIncomeCell.setCellValue(allColumnInfo.getFmPerIncome());
        HSSFCell fmOtherMemberInCell = row.createCell(49);
        fmOtherMemberInCell.setCellValue(allColumnInfo.getFmOtherMemberIn());
        HSSFCell fmExpensesProjCell = row.createCell(50);
        fmExpensesProjCell.setCellValue(allColumnInfo.getFmExpensesProj());
        HSSFCell fmInOutRatioCell = row.createCell(51);
        fmInOutRatioCell.setCellValue(allColumnInfo.getFmInOutRatio());
        HSSFCell fmAllAssetsCell = row.createCell(52);
        fmAllAssetsCell.setCellValue(allColumnInfo.getFmAllAssets());
        HSSFCell mainAssetsCell = row.createCell(53);
        mainAssetsCell.setCellValue(allColumnInfo.getMainAssets());
        int maxMergeRow = 0;
        List<HouseInfo> houseInfos = allColumnInfo.getHouseInfos();
        int currentRowIdx = rowIdx;
        if (houseInfos!= null) {
            for (int i = 0; i < houseInfos.size(); i++) {
                if (i > 0) {
                    row = sheet.createRow(++currentRowIdx);
                    maxMergeRow = maxMergeRow + 1;
                }
                HSSFCell natureCell = row.createCell(54);
                HouseInfo houseInfo = houseInfos.get(i);
                natureCell.setCellValue(houseInfo.getNature());
                HSSFCell purposeCell = row.createCell(55);
                purposeCell.setCellValue(houseInfo.getPurpose());
                HSSFCell siteCell = row.createCell(56);
                siteCell.setCellValue(houseInfo.getSite());
                HSSFCell structureCell = row.createCell(57);
                structureCell.setCellValue(houseInfo.getStructure());
                HSSFCell floorNumCell = row.createCell(58);
                floorNumCell.setCellValue(houseInfo.getFloorNum());
                HSSFCell usedSituCell = row.createCell(59);
                usedSituCell.setCellValue(houseInfo.getUsedSitu());
                HSSFCell houseAreaCell = row.createCell(60);
                houseAreaCell.setCellValue(houseInfo.getHouseArea());
                HSSFCell houseWorthCell = row.createCell(61);
                houseWorthCell.setCellValue(houseInfo.getHouseWorth());
                HSSFCell installmentCell = row.createCell(62);
                if (houseInfo.getInstallment() == 0) {
                    installmentCell.setCellValue("否");
                } else {
                    installmentCell.setCellValue("是");
                }
                HSSFCell hasCredentialsCell = row.createCell(63);
                hasCredentialsCell.setCellValue(houseInfo.getHasCredentials());
                HSSFCell noteCell = row.createCell(64);
                noteCell.setCellValue(houseInfo.getNote1());
            }
        }

        List<LandInfo> landInfos = allColumnInfo.getLandInfos();
        currentRowIdx = rowIdx;
        row = sheet.getRow(rowIdx);
        if (landInfos != null) {
            for(int i = 0; i < landInfos.size(); i++) {
                if (i > 0) {
                    if (i > maxMergeRow) {
                        maxMergeRow = maxMergeRow + 1;
                        row = sheet.createRow(++currentRowIdx);
                    } else {
                        row = sheet.getRow(++currentRowIdx);
                    }
                }
                LandInfo landInfo = landInfos.get(i);
                HSSFCell areaCell = row.createCell(65);
                areaCell.setCellValue(landInfo.getArea());
                HSSFCell worthCell = row.createCell(66);
                worthCell.setCellValue(landInfo.getWorth());
                HSSFCell propertyCell = row.createCell(67);
                propertyCell.setCellValue(landInfo.getProperty());
                HSSFCell typeCell = row.createCell(68);
                typeCell.setCellValue(landInfo.getType());
                HSSFCell usedSituCell = row.createCell(69);
                usedSituCell.setCellValue(landInfo.getUsedSitu());
                HSSFCell moneyClearCell = row.createCell(70);
                moneyClearCell.setCellValue(landInfo.getMoneyClear());
            }
        }
    }

    public void importFromCSV(InputStream is) throws IOException {
        BufferedReader csvReader = new BufferedReader(new InputStreamReader(is, "UTF-8"));

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
                String customerName = rowData[0];
                String cerNum = rowData[1];
                String nation = rowData[2];
                BaseInfo baseInfo = baseInfoDao.getBaseInfoByCustomerAndCerNum(customerName, cerNum);
                if (baseInfo == null) {
                    baseInfo = new BaseInfo();
                    baseInfo.setCustomerName(customerName);
                    baseInfo.setCerNum(cerNum);
                    baseInfo.setNation(nation);
                    baseInfoDao.saveSimpleBaseInfo(baseInfo);
                }
            } else {
                BaseInfo baseInfo = baseInfoDao.getBaseInfoByCerNum(rowData[1]);
                if (baseInfo != null) {
                    String familyMemberCerNum = rowData[0];
                    String cerNum = rowData[1];
                    String familyMemberName = rowData[2];
                    String leaderRelation = rowData[3];
                    FamilyMember familyMember = baseInfoDao.getFamilyMemberByMemberNameAndMemberCerNumAndCerNum(familyMemberName, familyMemberCerNum, cerNum);
                    if (familyMember == null) {
                        familyMember = new FamilyMember();
                        familyMember.setFamilyMemberCerNum(familyMemberCerNum);
                        familyMember.setCerNum(cerNum);
                        familyMember.setFamilyMemberName(familyMemberName);
                        familyMember.setLeaderRelation(leaderRelation);
                        familyMember.setRecordId(baseInfo.getRecordId());
                        baseInfoDao.saveFamilyMember(familyMember);
                    }
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
            String rawData = baseInfo.getCustomerName() + "," + baseInfo.getCerNum() + "," + baseInfo.getNation() + "\r\n";
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
