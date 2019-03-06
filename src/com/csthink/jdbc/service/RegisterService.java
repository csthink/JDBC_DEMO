package com.csthink.jdbc.service;

import com.csthink.jdbc.bean.User;
import com.csthink.jdbc.dao.UserDao;

public class RegisterService {

    private UserDao userDao;

    public RegisterService() {
        userDao = new UserDao();
    }

    /**
     * 保存用户信息
     * @param user User
     * @return boolean
     */
    public boolean save(User user) {
        return userDao.save(user);
    }
}
