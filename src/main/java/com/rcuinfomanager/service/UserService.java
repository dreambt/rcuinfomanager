package com.rcuinfomanager.service;

import com.rcuinfomanager.dao.UserDao;
import com.rcuinfomanager.model.LogonUser;
import com.rcuinfomanager.model.User;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import com.rcuinfomanager.session.UserSessionContextManager;
import com.rcuinfomanager.util.CodeGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 根据会员名取得会员对象
     *
     * @param userName
     * @return
     */
    public User getUserByUserName(String userName) {
        return userDao.getUserByUserName(userName);
    }

    /**
     * 用户登录
     *
     * @param logonUser
     * @return 返回用户登录的结果，参见{@link LogonResult}
     */
    public LogonResult logon(LogonUser logonUser) {
        Assert.notNull(logonUser, "登录用户不能为空");
        Assert.notNull(logonUser.getUserName(), "用户名不能为空");
        Assert.notNull(logonUser.getPassword(), "密码不能为空");

        User user = userDao.getUserByUserName(logonUser.getUserName());
        //用户名不存在
        if (user == null) {
            return LogonResult.ERROR_USER;
        }

        //密码错误
        if (!checkUserValid(logonUser.getUserName().toUpperCase(), logonUser.getPassword())) {
            return LogonResult.ERROR_PASSWORD;
        }

        //创建用户会话
        buildUserSession(user);
        return LogonResult.SUCCESS;
    }

    /**
     * 验证用户的合法性
     *
     * @param userName
     * @param pwd
     * @return
     */
    public boolean checkUserValid(String userName, String pwd) {
        User user = userDao.getUserByUserName(userName);
        return user != null && pwd.equalsIgnoreCase(user.getPassword());
    }

    /**
     * 为用户创建会话
     *
     * @param user
     */
    public void buildUserSession(User user) {
        UserSessionContext userSessionContext = new UserSessionContext();

        //生成一个sessionId
        String sessionId = CodeGenerator.getUUID();

        SessionUser sessionUser = new SessionUser();
        sessionUser.setId(user.getUserId());
        sessionUser.setUserName(user.getUserName());
        sessionUser.setDisplayUserName(user.getDisplayUserName());
        sessionUser.setSessionId(sessionId);
        sessionUser.setLastLoginTime(user.getLastLoginTime());

        userSessionContext.setSessionUser(sessionUser);
        //将用户会话上下放到缓存中
        UserSessionContextManager.getInstance().putIntoCache(userSessionContext);

        //将用户会话绑定到线程中
        UserSessionContextHolder.mountUserSessionContext(userSessionContext);

        //todo 创建用户登录日志
    }

    /**
     *  判断首次登录最后时间是否为空
     * @return
     */
    public boolean isLastLoginTime(String userName){
        User lastLoginTime = userDao.getUserByUserName(userName);
        if(lastLoginTime.getLastLoginTime() != null){
            return false;
        }else {
            return true;
        }
    }

    /**
     * 获取管理员和普通用户
     * @param uname
     * @return
     */
    public User getUserByUserManager(String uname){
        return userDao.getUserManager(uname);
    }

    public static class LogonResult {
        /**
         * 登录结果代码
         */
        private int resultCode = -1;

        /**
         * 构造登录结果对象
         *
         * @param resultCode
         */
        private LogonResult(int resultCode) {
            this.resultCode = resultCode;
        }

        /**
         * 获取登录的结果代码
         *
         * @return
         */
        public int getResultCode() {
            return resultCode;
        }

        /**
         * 是否登录正确
         *
         * @return
         */
        public boolean isSuccessful() {
            return this.resultCode == LogonResultType.SUCCESS;
        }


        /**
         * 是否用户名或密码错误
         *
         * @return
         */
        public boolean isErrorPassword() {
            return this.resultCode == LogonResultType.ERROR_PASSWORD;
        }

        /**
         * 是否是错误的用户
         *
         * @return
         */
        public boolean isErrorUser() {
            return this.resultCode == LogonResultType.ERROR_USER;
        }

        /**
         * 正确登录
         */
        public static final LogonResult SUCCESS = new LogonResult(LogonResultType.SUCCESS);

        /**
         * 用户或密码错误
         */
        public static final LogonResult ERROR_PASSWORD = new LogonResult(LogonResultType.ERROR_PASSWORD);

        /**
         * 非法用户
         */
        public static final LogonResult ERROR_USER = new LogonResult(LogonResultType.ERROR_USER);

        /**
         * 登录结果类型
         */
        public static class LogonResultType {

            //正确登录
            public static final int SUCCESS = 1;

            //用户或密码错误
            public static final int ERROR_PASSWORD = 2;

            //非法用户
            public static final int ERROR_USER = 3;

        }

    }
}
