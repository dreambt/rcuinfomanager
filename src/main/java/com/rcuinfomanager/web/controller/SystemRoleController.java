package com.rcuinfomanager.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/systemRole")
public class SystemRoleController {

    @RequestMapping(value ="/addSystemRole")
    public String addSystemRole(){

        return "ps/addSystemRole";
    }

    @RequestMapping(value ="/editSystemRole")
    public String editSystemRole(){

        return "ps/editSystemRole";
    }

    @RequestMapping(value ="/deleteSystemRole")
    public String deleteSystemRole(){

        return "ps/systemRoleManager";
    }
}
