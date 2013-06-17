package com.rcuinfomanager.webservice;

import com.rcuinfomanager.dao.UserDao;
import com.rcuinfomanager.model.User;
import com.rcuinfomanager.service.BaseInfoService;
import com.rcuinfomanager.util.JsonParser;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import com.rcuinfomanager.webservice.model.UploadData;
import com.rcuinfomanager.webservice.model.WebResponseData;
import com.rcuinfomanager.webservice.model.WebServiceResponseData;
import com.security.mdfive.MDFive;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/api/1")
public class FarmerInfoWebService {

    @Autowired
    private BaseInfoService baseInfoService;

    @Autowired
    private UserDao userDao;


    @RequestMapping(value = "/baseinfo/download/{username}/{password}", method = RequestMethod.GET)
    public
    @ResponseBody
    WebServiceResponseData downloadBaseInfo(@PathVariable String username, @PathVariable String password) {

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

    @RequestMapping(value = "/baseinfo/uploadData/{username}/{password}", method = RequestMethod.POST)
    public
    @ResponseBody
    WebResponseData uploadBaseInfo(@RequestParam("data") String rawData, @PathVariable String username, @PathVariable String password) {

        WebResponseData webResponseData = new WebResponseData(1);

        User user = userDao.getUserByUserName(username);
        if (user != null) {
            String pwdMD5 = MDFive.getEncryptPwd(user.getPassword());
            if (pwdMD5.equals(password)) {
                try {
                    ObjectMapper mapper = new ObjectMapper();
                    UploadData uploadData = mapper.readValue(rawData, UploadData.class);
                    if (uploadData != null) {
                        AllColumnInfo allColumnInfo = uploadData.getAllColumnInfo();
                        //检查这条记录是否已验收, 如果已验收，不处理，返回status=2
                        if (baseInfoService.isAccepted(allColumnInfo.getCerNum())) {
                            webResponseData.setStatus(2);
                        } else {
                            baseInfoService.saveFarmerInfoFromDownload(allColumnInfo);
                            webResponseData.setStatus(0);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return webResponseData;
    }
}
