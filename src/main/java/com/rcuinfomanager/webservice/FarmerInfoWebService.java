package com.rcuinfomanager.webservice;

import com.rcuinfomanager.dao.UserDao;
import com.rcuinfomanager.model.User;
import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.util.JsonParser;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import com.rcuinfomanager.webservice.model.WebResponseData;
import com.rcuinfomanager.webservice.model.WebServiceResponseData;
import com.security.mdfive.MDFive;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
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

    @RequestMapping(value="/baseinfo/uploadData", method = RequestMethod.POST)
    public @ResponseBody WebResponseData uploadBaseInfo(@RequestParam("data") String rawData) {

        WebResponseData webResponseData = new WebResponseData(1);
        try {
            ObjectMapper mapper = new ObjectMapper();
            List<AllColumnInfo> allColumnInfoList = mapper.readValue(rawData, new TypeReference<List<AllColumnInfo>>() {});
            if (allColumnInfoList != null && !allColumnInfoList.isEmpty()) {
                //save it to db
                for (AllColumnInfo allColumnInfo : allColumnInfoList) {
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return webResponseData;
    }
}
