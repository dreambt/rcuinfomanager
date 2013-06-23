package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.FinanceServicesDao;
import com.rcuinfomanager.model.FinanceServices;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FinanceServicesService {

    @Autowired
    private FinanceServicesDao financeServicesDao;

    public FinanceServices getFinanceServicesList(long id) {
       return financeServicesDao.getFinanceServicesList(id);
    }

    public void updateFinanceServices(AllColumnInfo allColumnInfo) {
        financeServicesDao.updateFinanceServices(allColumnInfo);
    }

    public void saveFinanceServices(AllColumnInfo allColumnInfo){
        financeServicesDao.saveFinanceServices(allColumnInfo);
    }

}
