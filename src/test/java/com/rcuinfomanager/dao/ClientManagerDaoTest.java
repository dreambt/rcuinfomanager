package com.rcuinfomanager.dao;

import com.rcuinfomanager.model.ClientManager;
import junit.framework.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/applicationContext.xml"})
public class ClientManagerDaoTest {

    @Autowired
    private ClientManagerDao clientManagerDao;


    @Test
    public void testQueryAll() {
        List<ClientManager> clientManagers = clientManagerDao.queryAll();
        Assert.assertNotNull(clientManagers);
    }
}
