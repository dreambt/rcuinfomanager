package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.LocationInfoDao;
import com.rcuinfomanager.model.LocationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LocationInfoService {

    @Autowired
    private LocationInfoDao locationInfoDao;

    public void saveLocationInfo(LocationInfo locationInfo) {
        locationInfoDao.saveLocationInfo(locationInfo);
    }
}
