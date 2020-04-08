package com.springboot.demo.service;

import com.springboot.demo.model.MemberModel;
import com.springboot.demo.model.SearchPostsModel;

import java.util.List;

public interface MemberService {
    void insertMember(MemberModel memberModel);
    List<MemberModel> SearchMember(SearchPostsModel spmodel, int Start, int Num);
    int CountSearch(SearchPostsModel spmodel);
    MemberModel getMember(int bno);
    void editMember(MemberModel memberModel);
    void deleteMember(int dno);
    int count() throws Exception;
    List<MemberModel> ListPage(int displayNum, int postNum);
}
