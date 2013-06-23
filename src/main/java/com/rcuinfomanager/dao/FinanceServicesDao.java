package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.FinanceServices;
import com.rcuinfomanager.model.FinancialAssets;
import com.rcuinfomanager.webservice.model.AllColumnInfo;

public interface FinanceServicesDao {

    FinanceServices getFinanceServicesList(long id);

    void updateFinanceServices(AllColumnInfo allColumnInfo);

    //金融资产信息
    FinancialAssets getFinancialAssets(Long recordId);

    void saveFinanceServices(AllColumnInfo allColumnInfo);
}
