package com.csthink.jdbc.dao;

import com.csthink.jdbc.Utils.JDBCUtils;
import com.csthink.jdbc.bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 */
public class UserDao {

    /**
     * 用户登录
     * @param username
     * @param password
     * @return 成功返回用户Bean,失败返回null
     */
    public User login(String username, String password) {
        Connection  conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        User user = null;

        try {
            conn = JDBCUtils.getConnection();
            String sql = "SELECT `id`,`username`,`password`,`phone` FROM user WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
            }
        } catch (SQLException e) {
            System.out.println("登录失败");
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, pstmt, conn);
        }

        return user;
    }

    /**
     * 保存用户信息
     * @param user User
     * @return boolean
     */
    public boolean save(User user) {
        Connection  conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBCUtils.getConnection();
            String sql = "INSERT user(`username`,`password`,`phone`) VALUES(?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getPhone());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("用户注册失败");
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtils.release(null, pstmt, conn);
        }

        return true;
    }
}
