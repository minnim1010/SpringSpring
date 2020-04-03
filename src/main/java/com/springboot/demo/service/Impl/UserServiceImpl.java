package com.springboot.demo.service.Impl;

import com.springboot.demo.dao.UserDao;
import com.springboot.demo.model.UserModel;
import com.springboot.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao UDAO;

    @Override
    public void addUser(UserModel userModel) {
        UDAO.addUser(userModel);
    }
}
