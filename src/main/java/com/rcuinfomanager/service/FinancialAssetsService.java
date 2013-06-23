package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.FinanceServicesDao;
import com.rcuinfomanager.model.FinanceServices;
import com.rcuinfomanager.model.FinancialAssets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FinancialAssetsService {

    @Autowired
    private FinanceServicesDao financeServicesDao;

    public FinanceServices getFinanceServicesList(long id) {
       return financeServicesDao.getFinanceServicesList(id);
    }

    public FinancialAssets getFinancialAssets(Long recordId) {
        return financeServicesDao.getFinancialAssets(recordId);
    }

}
