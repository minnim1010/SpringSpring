package com.springboot.demo.dao;

import com.springboot.demo.model.MemberModel;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface MemberDao {
    void setMember(MemberModel member);
    List<MemberModel> selectMember(String author);
    MemberModel getaMember(int dno);
    void editMember(MemberModel member);
    void deleteMember(int dno);
    int Count() throws Exception;
    List<MemberModel> ListPage(HashMap a);
}
