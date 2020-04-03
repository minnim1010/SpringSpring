package com.springboot.demo.controller;

import com.springboot.demo.model.MemberModel;
import com.springboot.demo.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MemberController {

    @Autowired MemberService memberService;

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @RequestMapping("/list")
    public String list(Model model){
        List<MemberModel> member = memberService.printMember();
        model.addAttribute("memberList", member);
        return "list";
    }

    @RequestMapping("/post")
    public String postMember(Model model){
        return "post";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public ModelAndView insert(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        MemberModel member = new MemberModel();
        member.setTitle(request.getParameter("title"));
        member.setContent(request.getParameter("content"));
        member.setAuthor(request.getParameter("author"));

        memberService.insertMember(member);
        ModelAndView result = new ModelAndView("redirect:/list");

        return result;
    }


}
