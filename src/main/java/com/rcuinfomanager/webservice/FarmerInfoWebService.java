package com.rcuinfomanager.webservice;

import com.rcuinfomanager.dao.UserDao;
import com.rcuinfomanager.model.User;
import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.util.JsonParser;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import com.rcuinfomanager.webservice.model.WebServiceResponseData;
import com.security.mdfive.MDFive;
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
    private UserDao userDao;


    @RequestMapping(value="/baseinfo/download/{username}/{password}", method = RequestMethod.GET)
    public @ResponseBody WebServiceResponseData downloadBaseInfo(@PathVariable String username, @PathVariable String password) {

        WebServiceResponseData webServiceResponseData = new WebServiceResponseData();
        webServiceResponseData.setStatus(1);

        User user = userDao.getUserByUserName(username);
        if (user != null) {
            String pwdMD5 = MDFive.getEncryptPwd(user.getPassword());
            if (pwdMD5.equals(password)) {
                List<AllColumnInfo> data = baseInfoService.queryAllColumnInfoList(user.getUserId());
                if (data != null && !data.isEmpty()) {
                    webServiceResponseData.setStatus(0);
                    String rawData = JsonParser.toJSON(data);
                    webServiceResponseData.setData(rawData);
                }
            }
        }

        return webServiceResponseData;
    }
}
