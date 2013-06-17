package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.dao.FamilyMemberInfoDao;
import com.rcuinfomanager.model.BaseInfo;
import com.rcuinfomanager.model.FamilyMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
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
