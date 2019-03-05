package com.csthink.jdbc.service;

import com.csthink.jdbc.bean.User;
import com.csthink.jdbc.dao.UserDao;

public class LoginService {

    private UserDao userDao;

    public LoginService() {
        userDao = new UserDao();
    }

    /**
     * 用户登录
     * @param username
     * @param password
     * @return 成功返回用户Bean,失败返回null
     */
    public User login(String username, String password) {
        return userDao.login(username, password);
    }
}
