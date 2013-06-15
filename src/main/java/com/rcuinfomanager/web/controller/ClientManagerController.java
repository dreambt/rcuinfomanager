package com.rcuinfomanager.web.controller;

import com.rcuinfomanager.service.ClientManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping("/client")
public class ClientManagerController {
    @Autowired
    private ClientManagerService clientManagerService;

    @RequestMapping(value ="/saveClient")
    public String saveClient(@RequestParam(value="appVerName", required=true) String appVerName,
        @RequestParam(value="descb", required=true) String descb,@RequestParam(value="url", required=true) String url,
        @RequestParam(value="isCoerce", required=true) int isCoerce) {

        clientManagerService.saveClientInfo(appVerName,descb,url,isCoerce,new Date().toString());

        return "device/clientVersion";

    }
}
