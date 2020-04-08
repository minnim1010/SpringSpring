package com.springboot.demo.service.Impl;

import com.springboot.demo.dao.MemberDao;
import com.springboot.demo.dao.UserDao;
import com.springboot.demo.model.MemberModel;
import com.springboot.demo.model.SearchPostsModel;
import com.springboot.demo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired private MemberDao Mdao;

    @Override
    public void insertMember(MemberModel memberModel) {
        Mdao.setMember(memberModel);
    }

    @Override
    public MemberModel getMember(int bno) {
        MemberModel member = Mdao.getaMember(bno);
        return member;
    }

    @Override
    public List<MemberModel> SearchMember(SearchPostsModel spmodel, int Start, int Num) {

        spmodel.setRowStart(Start);
        spmodel.setRowNumber(Num);
//        System.out.println("SearchMember!!!!");
//        System.out.println(spmodel.getKeyword());
//        System.out.println(spmodel.getSearchType());
        return Mdao.SearchMember(spmodel);
    }

    @Override
    public int CountSearch(SearchPostsModel spmodel) {
//        System.out.println("CountSearch!!!!");
//        System.out.println(spmodel.getRowStart());
//        System.out.println(spmodel.getRowNumber());
        return Mdao.CountSearch(spmodel);
    }

    @Override
    public void editMember(MemberModel memberModel) {
        Mdao.editMember(memberModel);
    }

    @Override
    public void deleteMember(int dno) {
        Mdao.deleteMember(dno);
    }

    @Override
    public int count() throws Exception{
        return Mdao.Count();
    }

    @Override
    public List<MemberModel> ListPage(int displayNum, int postNum) {
        HashMap data = new HashMap();
        data.put("displayNum", displayNum);
        data.put("postNum", postNum);
        return Mdao.ListPage(data);
    }
}
