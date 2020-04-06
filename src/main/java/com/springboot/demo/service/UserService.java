package com.springboot.demo.service;
import com.springboot.demo.model.UserModel;

import java.util.HashMap;


public interface UserService {
    void addUser(UserModel userModel);
    UserModel LogIn(HashMap hm);
    void DeleteID(String name);
}
