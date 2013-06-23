package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.model.AreasInfo;
import com.rcuinfomanager.service.AreasInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AreasInfoController {

    @Autowired
    private AreasInfoService areasInfoService;

    @RequestMapping("/area/{id}")
    public @ResponseBody
    List<AreasInfo> getAreaInfo(@PathVariable long id) {
        List<AreasInfo> areasInfoList = areasInfoService.getAreasInfoByFatherId(id);

        return areasInfoList;
    }
}
