package com.springboot.demo.controller;

import com.springboot.demo.model.UserModel;
import com.springboot.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

@Controller
public class UserController {

    @Autowired UserService userService;

    @RequestMapping(value="/signup")
    public String SignIn(){
        return "signup";
    }

    @RequestMapping(value="/addUser", method= RequestMethod.POST)
    public ModelAndView LoginForm(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        UserModel user = new UserModel();
        user.setEmail(request.getParameter("email"));
        user.setPwd(request.getParameter("pwd"));
        user.setName(request.getParameter("name"));
        userService.addUser(user);

        ModelAndView mv = new ModelAndView("redirect:/list");
        return mv;
    }

    @RequestMapping(value="/signin")
    public String SignUp() { return "signin"; }

    @RequestMapping(value="/login")
    public String LogIn(){
        return "login";
    }

    @RequestMapping(value="/signout")
    public String SignOut(){
        return "signin";
    }
}
