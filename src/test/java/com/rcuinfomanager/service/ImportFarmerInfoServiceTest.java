package com.rcuinfomanager.service;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;

/**
 * @author 王文庭(xorbytes@qq.com)
 *         功能说明:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/applicationContext.xml"})
public class ImportFarmerInfoServiceTest {

    @Autowired
    private ImportFarmerInfoService importFarmerInfoService;

    @Test
    public void TestImport() throws IOException {
       importFarmerInfoService.importFromCSV("D:\\MyProjects\\RCUInfoManager\\server\\src\\test\\resources\\1.csv");
    }
}
