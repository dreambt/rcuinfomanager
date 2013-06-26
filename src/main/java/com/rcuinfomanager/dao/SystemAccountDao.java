package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.SystemAccount;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SystemAccountDao {
    //admin
    public List<SystemAccount> getSystemAccountByPage(@Param("beginPageNum") int beginPageNum, @Param("endPageNum")int endPageNum);

    public Long getSystemAccountByCount();
    //Normal
    public List<SystemAccount> getSystemAccountByCommonList(long userId);

}
