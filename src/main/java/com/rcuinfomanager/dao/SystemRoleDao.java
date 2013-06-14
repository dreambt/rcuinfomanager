package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.SystemRole;

import java.util.List;

public interface SystemRoleDao {
    //admin List
    List<SystemRole> getSystemRoleByAdminList();
    //Normal List
    List<SystemRole> getSystemRoleByCommonList(long userId);
}
