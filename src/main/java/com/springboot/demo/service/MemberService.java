package com.springboot.demo.service;

import com.springboot.demo.model.MemberModel;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;

public interface MemberService {
    void insertMember(MemberModel memberModel);
    List<MemberModel> selectMember(String author);
    MemberModel getMember(int bno);
    void editMember(MemberModel memberModel);
    void deleteMember(int dno);
    int count() throws Exception;
    List<MemberModel> ListPage(int displayNum, int postNum);
}
