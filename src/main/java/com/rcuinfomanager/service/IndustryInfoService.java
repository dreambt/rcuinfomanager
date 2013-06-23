package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.IndustryInfoDao;
import com.rcuinfomanager.model.IndustryInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndustryInfoService {

    @Autowired
    private IndustryInfoDao industryInfoDao;

    public List<IndustryInfo> getIndustryInfoListByFatherId(long fatherId) {
        if (fatherId == -1) {
            return industryInfoDao.getAllTopIndustryInfoList();
        }
        return industryInfoDao.getIndustryInfoListByFatherId(fatherId);
    }
}
