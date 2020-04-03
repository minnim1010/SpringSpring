package com.springboot.demo.dao;

import com.springboot.demo.model.MemberModel;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberDao {
    List<MemberModel> getMember();
    void setMember(MemberModel member);
}
