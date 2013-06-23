package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.model.IndustryInfo;
import com.rcuinfomanager.service.IndustryInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class IndustryInfoController {

    @Autowired
    private IndustryInfoService industryInfoService;

    @RequestMapping("/industry/{fatherId}")
    public @ResponseBody
    List<IndustryInfo> getIndustries(@PathVariable Long fatherId) {
        return industryInfoService.getIndustryInfoListByFatherId(fatherId);
    }
}
