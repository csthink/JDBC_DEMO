package com.csthink.jdbc.dao;

import com.csthink.jdbc.Utils.JDBCUtils;
import com.csthink.jdbc.bean.Message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDao {

    /**
     * 分页查询全部留言
     * @param page int 当前页码
     * @param pageSize int 每页显示记录数
     * @return List<Message>
     */
    public List<Message> getMessageList(int page, int pageSize) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Message> messageList = new ArrayList<>();

        try {
            // 获取连接
            conn = JDBCUtils.getConnection();
            // 查询message表
            String sql = "SELECT * FROM message ORDER BY `create_time` DESC LIMIT ?,?";
            // 创建执行SQL的pstmt对象
            pstmt = conn.prepareStatement(sql);
            // 绑定参数
            pstmt.setInt(1, (page - 1) * pageSize);
            pstmt.setInt(2, pageSize);
            // 执行查询
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Message msg = new Message(rs.getInt("id"),
                        rs.getInt("uid"),
                        rs.getString("username"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getTimestamp("create_time")
                );
                messageList.add(msg);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, pstmt, conn);
        }

        return messageList;
    }

    /**
     * 统计留言总数
     * @return int
     */
    public int countMessages() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int total = 0;

        try {
            conn = JDBCUtils.getConnection();
            String sql = "SELECT COUNT(*) AS total FROM message";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(rs, pstmt, conn);
        }

        return total;
    }
}
