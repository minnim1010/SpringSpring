package com.springboot.demo.service.Impl;

import com.springboot.demo.dao.MemberDao;
import com.springboot.demo.model.MemberModel;
import com.springboot.demo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired private MemberDao Mdao;

    @Override
    public List<MemberModel> printMember() {
        List<MemberModel> member = Mdao.getMember();
        return member;
    }

    @Override
    public void insertMember(MemberModel memberModel) {
        Mdao.setMember(memberModel);
    }
}
