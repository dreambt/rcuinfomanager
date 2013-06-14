package com.rcuinfomanager.webservice;

import com.rcuinfomanager.util.JsonParser;
import com.rcuinfomanager.webservice.model.AllColumnInfo;
import com.rcuinfomanager.webservice.model.WebServiceResponseData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
@RequestMapping("/api/1")
public class FarmerInfoWebService {


    @RequestMapping(value = "/baseinfo/download/{username}/{password}", method = RequestMethod.GET)
    public
    @ResponseBody WebServiceResponseData downloadBaseInfo(@PathVariable String username, @PathVariable String password) {
        WebServiceResponseData webServiceResponseData = new WebServiceResponseData();
        ArrayList<AllColumnInfo> data = new ArrayList<AllColumnInfo>();
        AllColumnInfo allColumnInfo = new AllColumnInfo();
        allColumnInfo.setAddress("test");
        data.add(allColumnInfo);

        String rawData = JsonParser.toJSON(data);
        webServiceResponseData.setData(rawData);

        return webServiceResponseData;
    }
}
