package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.OrganizationInfoDao;
import com.rcuinfomanager.model.OrganizationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrganizationInfoService {

    @Autowired
    private OrganizationInfoDao organizationInfoDao;


    public List<OrganizationInfo> getAllOrganizations() {
        return organizationInfoDao.queryAllOrganizationInfo();
    }

    public void saveOrganizationInfo(OrganizationInfo organizationInfo) {
        organizationInfoDao.saveOrganizationInfo(organizationInfo);
    }
}
