package com.rcuinfomanager.web.controller;


import com.rcuinfomanager.model.OrganizationInfo;
import com.rcuinfomanager.model.User;
import com.rcuinfomanager.service.OrganizationInfoService;
import com.rcuinfomanager.service.UserService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import com.rcuinfomanager.web.form.AddUserForm;
import com.rcuinfomanager.web.response.AjaxResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
@RequestMapping("/systemAccount")
public class SystemAccountController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrganizationInfoService organizationInfoService;

    @RequestMapping(value ="/addAccount", method = RequestMethod.GET)
    public String showAddAccountPage(ModelMap map){

        map.put("user", new AddUserForm());
        return "ps/addAccount";
    }

    @RequestMapping(value ="/addAccount", method = RequestMethod.POST)
    public @ResponseBody
    AjaxResponseData addAccount(HttpServletRequest request, HttpServletResponse response){

        String displayUserName = request.getParameter("displayUserName");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String organizationId = request.getParameter("organizationId");

        if (!password.equals(confirmPassword)) {
            return new AjaxResponseData("两次密码不匹配");
        }

        User addUser = new User();
        addUser.setUserName(userName);
        addUser.setPassword(password);
        addUser.setDisplayUserName(displayUserName);
        addUser.setOrganizationId(Long.parseLong(organizationId));

        userService.addUser(addUser);

        return new AjaxResponseData();
    }

    @RequestMapping(value ="/addStipple", method = RequestMethod.POST)
    public String addStipple(@ModelAttribute("organizationInfo") OrganizationInfo organizationInfo, ModelMap map){
        organizationInfoService.saveOrganizationInfo(organizationInfo);

        return "redirect:/accountManager";
    }

    @RequestMapping(value ="/editAccount")
    public @ResponseBody
    AjaxResponseData editAccount(HttpServletRequest request, HttpServletResponse response){
        String displayUserName = request.getParameter("displayUserName");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String userId = request.getParameter("userId");
        String organizationId = request.getParameter("organizationId");

        User user = userService.getUserById(Long.parseLong(userId));
        user.setDisplayUserName(displayUserName);
        user.setPassword(password);
        user.setOrganizationId(Long.parseLong(organizationId));

        userService.update(user);

        return new AjaxResponseData();
    }

    @RequestMapping(value ="/deleteAccount/{id}", method = RequestMethod.GET)
    public String deleteAccount(@PathVariable long id){

        userService.deleteAccount(id);

        return "redirect:/accountManager";
    }

    @RequestMapping(value = "/user/{id}" ,method = RequestMethod.GET)
    public @ResponseBody User getUser(@PathVariable long id) {

        return userService.getUserById(id);
    }
}
