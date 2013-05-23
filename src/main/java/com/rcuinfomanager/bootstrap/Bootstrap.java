package com.rcuinfomanager.bootstrap;

import com.rcuinfomanager.util.EasyApplicationContextUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
public class Bootstrap implements ApplicationContextAware {


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        EasyApplicationContextUtils.setApplicationContext(applicationContext);
    }
}
