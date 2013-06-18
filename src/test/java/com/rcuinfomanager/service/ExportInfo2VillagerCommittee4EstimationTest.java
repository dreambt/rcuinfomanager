package com.rcuinfomanager.service;

import com.rcuinfomanager.model.BaseInfo;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ExportInfo2VillagerCommittee4EstimationTest {

    @Test
    public void readTemplateAndExportTest() throws IOException {
        BaseInfo baseInfo = new BaseInfo();
        baseInfo.setCustomerName("杨木枝");
        baseInfo.setAddress("小岞镇新桥村09组1号");
        baseInfo.setCerNum("350521195611012000");
        BaseInfo baseInfo1 = new BaseInfo();
        baseInfo1.setCustomerName("杨伟强");
        baseInfo1.setAddress("小岞镇新桥村09组2号");
        baseInfo1.setCerNum("350521197811212000");
        List<BaseInfo> baseInfoList = new ArrayList<BaseInfo>();
        baseInfoList.add(baseInfo);
        baseInfoList.add(baseInfo1);
        ExportInfo2VillagerCommittee4Estimation exportInfo2VillagerCommittee4Estimation = new ExportInfo2VillagerCommittee4Estimation();
        MockHttpServletResponse mockHttpServletResponse = new MockHttpServletResponse();
       // exportInfo2VillagerCommittee4Estimation.readTemplateAndExport(baseInfoList,mockHttpServletResponse);

    }
}
