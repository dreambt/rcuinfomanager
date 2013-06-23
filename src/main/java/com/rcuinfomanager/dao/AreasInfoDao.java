package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.AreasInfo;

import java.util.List;

public interface AreasInfoDao {

    // 城乡
    List<AreasInfo> getAreasInfoByFatherId(long id);
}
