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
    public List<SystemAccount> getSystemAccountByPage(int pageNum, int offset){
        int beginPageNum = (pageNum -1) * offset;
        int endPageNum = pageNum * offset;
        return systemAccountDao.getSystemAccountByPage(beginPageNum, endPageNum);
    }

    public Long getSystemAccountByCount(){
        return systemAccountDao.getSystemAccountByCount();
    }
    //Normal
    public List<SystemAccount> getSystemAccountByCommonList(long userId){
        return systemAccountDao.getSystemAccountByCommonList(userId);
    }
}
