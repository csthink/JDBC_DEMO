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
            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setBirthday(rs.getDate("birthday"));
                user.setPhone(rs.getString("phone"));
                user.setRealname(rs.getString("real_name"));
            }
        } catch (SQLException e) {
            System.out.println("登录失败");
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, pstmt, conn);
        }

        return user;
    }
}
