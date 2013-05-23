package com.rcuinfomanager.session;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.junit.Assert;
import org.testng.annotations.Test;

import java.util.concurrent.TimeUnit;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class UserSessionTimeoutTest {

    @Test
    public void sessionTimeoutTest() throws InterruptedException {
        Cache<String, UserSessionContext> cache = CacheBuilder.newBuilder().expireAfterAccess(1, TimeUnit.SECONDS).build();

        UserSessionContextManager sessionContextManager = UserSessionContextManager.getInstance();
        sessionContextManager.setCache(cache);
        UserSessionContext userSessionContext01 = new UserSessionContext();
        SessionUser sessionUser01 = new SessionUser();
        sessionUser01.setSessionId("001");
        sessionUser01.setUserName("001");
        userSessionContext01.setSessionUser(sessionUser01);
        sessionContextManager.putIntoCache(userSessionContext01);

        UserSessionContext userSessionContext02 = new UserSessionContext();
        SessionUser sessionUser02 = new SessionUser();
        sessionUser02.setSessionId("001");
        sessionUser02.setUserName("001");
        userSessionContext02.setSessionUser(sessionUser02);
        sessionContextManager.putIntoCache(userSessionContext02);

        sessionContextManager.accessIt("001");
        Thread.sleep(500);

        sessionContextManager.accessIt("001");
        Thread.sleep(500);

        sessionContextManager.accessIt("001");
        Thread.sleep(500);

        Assert.assertNotNull(sessionContextManager.getUserSessionContext("001"));
        Assert.assertNull(sessionContextManager.getUserSessionContext("002"));

    }
}
