package com.rcuinfomanager.webservice;

import com.rcuinfomanager.model.WebServiceResponseData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/1")
public class FarmerInfoWebService {


    @RequestMapping(value="/baseinfo/download/{username}/{password}", method = RequestMethod.GET)
    public @ResponseBody WebServiceResponseData downloadBaseInfo(@PathVariable String username, @PathVariable String password) {
        WebServiceResponseData webServiceResponseData = new WebServiceResponseData();
        return webServiceResponseData;
    }
}
