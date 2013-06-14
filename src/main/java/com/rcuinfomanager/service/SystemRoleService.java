package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.SystemRoleDao;
import com.rcuinfomanager.model.SystemRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemRoleService {
    @Autowired
    private SystemRoleDao systemRoleDao;

    //admin
    public List<SystemRole> getSystemRoleByAdminList(){
        return systemRoleDao.getSystemRoleByAdminList();
    }
    //Normal
    public List<SystemRole> getSystemRoleByCommonList(long userId){
        return systemRoleDao.getSystemRoleByCommonList(userId);
    }


}
