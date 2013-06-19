package com.rcuinfomanager.web.controller;


import com.rcuinfomanager.model.User;
import com.rcuinfomanager.service.UserService;
import com.rcuinfomanager.session.SessionUser;
import com.rcuinfomanager.session.UserSessionContext;
import com.rcuinfomanager.session.UserSessionContextHolder;
import com.rcuinfomanager.web.form.AddUserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/systemAccount")
public class SystemAccountController {

    @Autowired
    private UserService userService;

    @RequestMapping(value ="/addAccount", method = RequestMethod.GET)
    public String showAddAccountPage(ModelMap map){

        map.put("user", new AddUserForm());
        return "ps/addAccount";
    }

    @RequestMapping(value ="/addAccount", method = RequestMethod.POST)
    public String addAccount(@ModelAttribute("user") AddUserForm user, ModelMap map){

        if (!user.getPassword().equals(user.getConfirmPassword())) {
            map.put("errorMsg", "两次密码不匹配");
            return "/addAccount";
        }

        User addUser = new User();
        addUser.setUserName(user.getUserName());
        addUser.setPassword(user.getPassword());
        addUser.setDisplayUserName(user.getDisplayUserName());

        userService.addUser(addUser);

        return "redirect:/accountManager";
    }

    @RequestMapping(value ="/addStipple")
    public String addStipple(){

        return "ps/addStipple";
    }

    @RequestMapping(value ="/editAccount")
    public String editAccount(){
        UserSessionContext userSessionContext = UserSessionContextHolder.getUserSessionContext();
        SessionUser sessionUser = userSessionContext.getSessionUser();

        return "ps/editAccount";
    }
    @RequestMapping(value ="/deleteAccount")
    public String deleteAccount(){

        return "ps/systemAccountManage";
    }
}
