package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.FinancialAssets;
import com.rcuinfomanager.webservice.model.AllColumnInfo;

import java.util.List;

public interface FinancialAssetsDao {

    public void updateFinancialAssets(AllColumnInfo allColumnInfo);

    //金融资产信息
    List<FinancialAssets> getFinancialAssets(Long recordId);

    void saveFinancialAssets(AllColumnInfo allColumnInfo);
}
