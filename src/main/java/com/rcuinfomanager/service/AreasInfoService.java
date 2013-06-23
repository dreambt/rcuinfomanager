package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.AreasInfoDao;
import com.rcuinfomanager.model.AreasInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreasInfoService {

    @Autowired
    private AreasInfoDao areasInfoDao;

    public List<AreasInfo> getAreasInfoByFatherId(long id){
        return areasInfoDao.getAreasInfoByFatherId(id);
    }
}
