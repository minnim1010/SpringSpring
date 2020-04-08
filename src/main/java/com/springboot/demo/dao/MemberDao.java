package com.springboot.demo.dao;

import com.springboot.demo.model.MemberModel;
import com.springboot.demo.model.SearchPostsModel;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface MemberDao {
    void setMember(MemberModel member);
    List<MemberModel> SearchMember(SearchPostsModel spmodel);
    MemberModel getaMember(int dno);
    void editMember(MemberModel member);
    void deleteMember(int dno);
    int Count() throws Exception;
    List<MemberModel> ListPage(HashMap a);
    int CountSearch(SearchPostsModel spmodel);
}
