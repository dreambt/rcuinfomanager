package com.rcuinfomanager.webservice;

import com.google.common.base.Strings;
import com.rcuinfomanager.dao.UserDao;
import com.rcuinfomanager.model.User;
import com.rcuinfomanager.webservice.model.AuthResponseData;
import com.security.mdfive.MDFive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/1")
public class AuthWebService {

    @Autowired
    private UserDao userDao;

    @RequestMapping(value="/account/{username}/{password}/{deviceID}", method = RequestMethod.GET)
    public @ResponseBody AuthResponseData login(@PathVariable String username, @PathVariable String password, @PathVariable String deviceID) {

        if (Strings.isNullOrEmpty(username) || Strings.isNullOrEmpty(password)) {
            return new AuthResponseData(1);
        }

        User user = userDao.getUserByUserName(username);
        //用户名不存在
        if (user == null) {
            return new AuthResponseData(1);
        }

        String pwdMD5 = MDFive.getEncryptPwd(user.getPassword());

        if (!password.equals(pwdMD5)) {
            return new AuthResponseData(1);
        }

        if (Strings.isNullOrEmpty(user.getLastLoginTime())) {
            return new AuthResponseData(3);
        }

        //todo check是否有授权

        return new AuthResponseData(0);
    }

    @RequestMapping(value="/account/{username}/{oldPassword}/{newPassword}", method = RequestMethod.POST)
    public @ResponseBody AuthResponseData changePassword(@PathVariable String username, @PathVariable String oldPassword, @PathVariable String newPassword) {

        if (Strings.isNullOrEmpty(username) || Strings.isNullOrEmpty(oldPassword) || Strings.isNullOrEmpty(oldPassword)) {
            return new AuthResponseData(1);
        }

        User user = userDao.getUserByUserName(username);
        //用户名不存在
        String pwdMD5 = MDFive.getEncryptPwd(user.getPassword());
        if (user == null || !oldPassword.equals(pwdMD5)) {
            return new AuthResponseData(1);
        }

        user.setPassword(newPassword);

        userDao.updateUser(user);

        return new AuthResponseData(0);
    }


}
