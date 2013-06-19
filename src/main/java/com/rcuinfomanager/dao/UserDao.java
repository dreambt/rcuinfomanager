package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.User;

import java.util.List;
import java.util.Map;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public interface UserDao {

    User getUserById(int id);

    User getUserByUserName(String userName);

    User getUserManager(String userName);  // 获取管理员和普通用户

    void saveUserWithOutOrganization(User user);

    void changePassword(User user);

    void deleteUser(int id);

    List<User> queryUser(Map<String, Object> paramMap);

    int countUser(Map<String, Object> paramMap);
}
