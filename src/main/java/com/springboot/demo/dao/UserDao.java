package com.springboot.demo.dao;

import com.springboot.demo.model.UserModel;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    void addUser(UserModel userModel);
}
