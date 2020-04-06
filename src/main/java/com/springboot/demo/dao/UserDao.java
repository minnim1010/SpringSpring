package com.springboot.demo.dao;

import com.springboot.demo.model.UserModel;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public interface UserDao {
    void addUser(UserModel userModel);
    UserModel LogIn(HashMap hm);
    void DeleteID(String name);
}
