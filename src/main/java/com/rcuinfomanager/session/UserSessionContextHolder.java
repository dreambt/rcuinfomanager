package com.rcuinfomanager.session;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class UserSessionContextHolder {

    private static final ThreadLocal<UserSessionContext> userContextThreadLocal = new ThreadLocal<UserSessionContext>();

    /**
     * 将用户会话绑定到当前的请求线程中
     * @param userSessionContext
     */
    public static void mountUserSessionContext(UserSessionContext userSessionContext) {
        userContextThreadLocal.set(userSessionContext);
    }

    /**
     * 将用户会话从当前请求线程中解除绑定
     */
    public static void unmountUserSessionContext(){
        userContextThreadLocal.set(null);
    }

    /**
     * 获取当前线程的绑定的SessionContext
     * @return
     */
    public static UserSessionContext getUserSessionContext() {
        return userContextThreadLocal.get();
    }
}
