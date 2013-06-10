package com.rcuinfomanager.webservice;

import com.rcuinfomanager.model.LogonUser;
import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.service.UserService;
import com.rcuinfomanager.util.JsonParser;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import com.rcuinfomanager.webservice.model.WebServiceResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/api/1")
public class FarmerInfoWebService {

    @Autowired
    private BaseInfoService baseInfoService;

    @Autowired
    private UserService userService;


    @RequestMapping(value="/baseinfo/download/{username}/{password}", method = RequestMethod.GET)
    public @ResponseBody WebServiceResponseData downloadBaseInfo(@PathVariable String username, @PathVariable String password) {

        UserService.LogonResult logonResult = userService.logon(new LogonUser(username, password));

        WebServiceResponseData webServiceResponseData = new WebServiceResponseData();

        if (logonResult.isSuccessful()) {//认证ok
            List<AllColumnInfo> data = baseInfoService.queryAllColumnInfoList(1);

            String rawData = JsonParser.toJSON(data);
            webServiceResponseData.setData(rawData);
        }


        return webServiceResponseData;
    }
}
