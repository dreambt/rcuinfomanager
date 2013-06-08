package com.rcuinfomanager.webservice;

import com.rcuinfomanager.dao.BaseInfoDao;
import com.rcuinfomanager.model.AllColumnInfo;
import com.rcuinfomanager.model.BaseInfo;
import com.rcuinfomanager.model.WebServiceResponseData;
import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.util.JsonParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/api/1")
public class FarmerInfoWebService {

    @Autowired
    private BaseInfoService baseInfoService;


    @RequestMapping(value="/baseinfo/download/{username}/{password}", method = RequestMethod.GET)
    public @ResponseBody WebServiceResponseData downloadBaseInfo(@PathVariable String username, @PathVariable String password) {
        //todo 认证

        WebServiceResponseData webServiceResponseData = new WebServiceResponseData();
        List<AllColumnInfo> data = baseInfoService.queryAllColumnInfoList(1);

        String rawData = JsonParser.toJSON(data);
        webServiceResponseData.setData(rawData);

        return webServiceResponseData;
    }
}
