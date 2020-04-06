package com.springboot.demo.controller;

import com.springboot.demo.model.UserModel;
import com.springboot.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@Controller
public class UserController {

    @Autowired UserService userService;

    @RequestMapping(value="/signup")
    public String SignUp(){
        return "signup";
    }

    @RequestMapping(value="/addUser", method = RequestMethod.POST)
    public ModelAndView Register(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        UserModel user = new UserModel();
        user.setEmail(request.getParameter("email"));
        user.setPwd(request.getParameter("pwd"));
        user.setName(request.getParameter("name"));
        userService.addUser(user);

        ModelAndView mv = new ModelAndView("redirect:/signin");
        return mv;
    }

    @RequestMapping(value="/signin")
    public String SignIn() {
        return "signin";
    }

    @RequestMapping(value="/login", method = RequestMethod.POST)
    public String LogIn(HttpServletRequest request, RedirectAttributes ra){
        HashMap FORLOGIN = new HashMap();
        FORLOGIN.put("name", request.getParameter("name"));
        FORLOGIN.put("pwd", request.getParameter("pwd"));

        HttpSession session = request.getSession();
        UserModel LogIn_INFO = userService.LogIn(FORLOGIN);


        if(LogIn_INFO == null) {
            session.setAttribute("USER", null);
            ra.addFlashAttribute("loginsuccess", false);
            return "redirect:/signin";
        }
        session.setAttribute("USER", LogIn_INFO);
        return "redirect:/";
    }

    @RequestMapping(value="/signout")
    public String SignOut(HttpSession session){
        session.invalidate();
        return "redirect:/list?num=1";
    }

    @RequestMapping(value="/deleteaccount")
    public String DeleteAccount(HttpSession session){
        UserModel user = (UserModel)session.getAttribute("USER");
        userService.DeleteID(user.getName());
        session.invalidate();

        return "redirect:/";
    }
}
