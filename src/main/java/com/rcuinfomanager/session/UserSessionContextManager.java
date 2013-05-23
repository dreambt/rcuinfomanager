package com.rcuinfomanager.session;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;

import java.util.concurrent.TimeUnit;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class UserSessionContextManager {

    private Cache<String, UserSessionContext> cache;

    private static UserSessionContextManager instance;

    private UserSessionContextManager() {
        //User expired that not access in 1 hours.
        cache = CacheBuilder.newBuilder().expireAfterAccess(1, TimeUnit.HOURS).build();
    }

    public void setCache(Cache<String, UserSessionContext> cache) {
        this.cache = cache;
    }

    public static UserSessionContextManager getInstance() {
        if (instance == null) {
            instance = new UserSessionContextManager();
        }
        return instance;
    }

    /**
     * 获取用户上下文。
     *
     * @param sessionId
     * @return
     */
    public UserSessionContext getUserSessionContext(String sessionId) {
        return cache.getIfPresent(sessionId);
    }

    /**
     * 将<code>UserContext</code>放到缓存区
     *
     * @param userSessionContext
     */
    public void putIntoCache(UserSessionContext userSessionContext) {
        cache.put(userSessionContext.getSessionUser().getSessionId(), userSessionContext);
    }

    /**
     * 从缓存中删除用户上下文
     *
     * @param sessionId
     */
    public void removeUserSessionContext(String sessionId) {
        cache.invalidate(sessionId);
    }

    /**
     * 同步用户访问系统时间
     *
     * @param sessionId
     */
    public void accessIt(String sessionId) {
        getUserSessionContext(sessionId);
    }
}
