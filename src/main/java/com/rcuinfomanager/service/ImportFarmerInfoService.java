package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.dao.FamilyMemberInfoDao;
import com.rcuinfomanager.model.BaseInfo;
import com.rcuinfomanager.model.FamilyMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 * @author 王文庭(xorbytes@qq.com)
 */
@Service
public class ImportFarmerInfoService {

    @Autowired
    private FamilyMemberInfoDao familyMemberInfoDao;

    @Autowired
    private BaseInfoDao baseInfoDao;

    public void importFromCSV(String file) throws IOException {
        BufferedReader csvReader = new BufferedReader(new FileReader(file));
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
           // FamilyMemberInfo familyMemberInfo = new FamilyMemberInfo();
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
                    baseInfoDao.saveFamilyMember(baseInfo);
                }
            }
            row = csvReader.readLine();
        }

        csvReader.close();
    }

}
