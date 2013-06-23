package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.IndustryInfo;

import java.util.List;

public interface IndustryInfoDao {

    public List<IndustryInfo> getIndustryInfoListByFatherId(Long fatherId);

    public List<IndustryInfo> getAllTopIndustryInfoList();
}
