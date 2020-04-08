package com.springboot.demo.controller;

import com.springboot.demo.model.MemberModel;
import com.springboot.demo.model.SearchPostsModel;
import com.springboot.demo.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {

    @Autowired MemberService memberService;

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
    private static final int postNum = 10;
    private static final int MAXPageNum = 10;

    @RequestMapping("/")
    public String list(HttpSession session, Model model){
        Object User = session.getAttribute("USER");
        model.addAttribute("USER", User);

        return "home";
    }

    @RequestMapping(value = "/view", method=RequestMethod.GET)
    public String View(HttpServletRequest request, @RequestParam("bno") int bno, Model model) throws Exception{

        MemberModel member = memberService.getMember(bno);

        model.addAttribute("member", member);
        model.addAttribute("BeforePage", request.getHeader("REFERER"));
        return "view";
    }

    @RequestMapping("/post")
    public String postMember(HttpSession session, Model model){

        Object login = session.getAttribute("USER");
        model.addAttribute("login", login != null);

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
        ModelAndView result = new ModelAndView("redirect:/list?num=1");

        return result;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String Edit(@RequestParam("bno") int bno, Model model){
        MemberModel member = memberService.getMember(bno);
        model.addAttribute("member", member);
        return "edit";
    }

    @RequestMapping(value="/editposts", method=RequestMethod.POST)
    public String EditPosts(@RequestParam("bno") int bno, HttpServletRequest request, Model model) throws UnsupportedEncodingException{
        request.setCharacterEncoding("UTF-8");
        MemberModel member = new MemberModel();
        member.setBno(bno);
        member.setTitle(request.getParameter("title"));
        member.setContent(request.getParameter("content"));
        member.setAuthor(request.getParameter("author"));
        memberService.editMember(member);

        return "redirect:/view?bno="+member.getBno();
    }

    @RequestMapping("/delete")
    public String Delete(@RequestParam("bno") int bno, Model model){
        memberService.deleteMember(bno);
        return "redirect:/list?num=1";
    }

    @RequestMapping(value = "/list", method=RequestMethod.GET)
    public String ListPage(@RequestParam(value="num", defaultValue = "1") int num, Model model) throws Exception{
        int count = memberService.count();

        int PageNum = (int)Math.ceil((double)count/postNum);
        int StartPageNum = ((int)((num-1)/MAXPageNum))*MAXPageNum+1;
        int EndPageNum = PageNum-StartPageNum < MAXPageNum ? PageNum: StartPageNum+MAXPageNum-1;

        List<MemberModel> member = memberService.ListPage((num-1)*postNum, postNum);
        model.addAttribute("memberList", member);
        model.addAttribute("StartPageNum", StartPageNum);
        model.addAttribute("EndPageNum", EndPageNum);
        model.addAttribute("prev", StartPageNum == 1 ? false : true);
        model.addAttribute("next", EndPageNum == PageNum ? false : true);
        model.addAttribute("spmodel", new SearchPostsModel());

        return "list";
    }

    @RequestMapping("/searchpost")
    public String Search(@RequestParam(value="num", defaultValue = "1") int num, SearchPostsModel spmodel, Model model) throws Exception{

        int count = memberService.CountSearch(spmodel);
        int PageNum = (int)Math.ceil((double)count/postNum);
        int StartPageNum = ((int)((num-1)/MAXPageNum))*MAXPageNum+1;
        int EndPageNum = PageNum-StartPageNum < MAXPageNum ? PageNum: StartPageNum+MAXPageNum-1;
        List<MemberModel> member = memberService.SearchMember(spmodel, (num-1)*postNum, postNum);

        model.addAttribute("memberList", member);
        model.addAttribute("StartPageNum", StartPageNum);
        model.addAttribute("EndPageNum", EndPageNum);
        model.addAttribute("SearchType", spmodel.getSearchType());
        model.addAttribute("Keyword", spmodel.getKeyword());
        model.addAttribute("prev", StartPageNum == 1 ? false : true);
        model.addAttribute("next", EndPageNum == PageNum ? false : true);

        return "searchpost";
    }

}
