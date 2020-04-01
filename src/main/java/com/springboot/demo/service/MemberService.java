package com.springboot.demo.service;

import com.springboot.demo.model.MemberModel;

import java.util.List;

public interface MemberService {
    List<MemberModel> printMember();
    void insertMember(MemberModel memberModel);
}
