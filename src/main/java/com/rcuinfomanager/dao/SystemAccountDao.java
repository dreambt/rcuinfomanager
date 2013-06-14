package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.SystemAccount;

import java.util.List;

public interface SystemAccountDao {
    //admin
    public List<SystemAccount> getSystemAccountByAdminList();
    //Normal
    public List<SystemAccount> getSystemAccountByCommonList(long userId);

}
