package com.csthink.jdbc.Utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 数据库管理类
 */
public class JDBCUtils {

    private static final ComboPooledDataSource dataSource = new ComboPooledDataSource();

    /**
     * 获取数据库连接
     * @return Connection
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        // 注意 c3p0 连接池需要将 c3p0-config.xml 文件放置到 src 目录，且包含必须的数据库连接配置
        return dataSource.getConnection();
    }

    public static void release(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (null != rs) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != stmt) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (null != conn) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
