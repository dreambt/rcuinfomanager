package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.FamilyMemberInfoDao;
import com.rcuinfomanager.model.FamilyMemberInfo;
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
            FamilyMemberInfo familyMemberInfo = new FamilyMemberInfo();
            if (isImportHouseholdFile) {
                familyMemberInfo.setFamilyMemberName(rowData[0]);
                familyMemberInfo.setCerNum(rowData[1]);
                familyMemberInfo.setLeaderRelation(rowData[2]);
            } else {
                familyMemberInfo.setFamilyMemberCerNum(rowData[0]);
                familyMemberInfo.setCerNum(rowData[1]);
                familyMemberInfo.setFamilyMemberName(rowData[2]);
                familyMemberInfo.setLeaderRelation(rowData[3]);
            }
            familyMemberInfoDao.saveMember(familyMemberInfo);
            row = csvReader.readLine();
        }

        csvReader.close();
    }

}
