package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.SystemAccountDao;
import com.rcuinfomanager.model.SystemAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemAccountService {

    @Autowired
    private SystemAccountDao systemAccountDao;

    //admin
    public List<SystemAccount> getSystemAccountByAdminList(){
        return systemAccountDao.getSystemAccountByAdminList();
    }
    //Normal
    public List<SystemAccount> getSystemAccountByCommonList(long userId){
        return systemAccountDao.getSystemAccountByCommonList(userId);
    }
}
