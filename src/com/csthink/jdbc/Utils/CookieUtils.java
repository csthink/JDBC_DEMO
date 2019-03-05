package com.csthink.jdbc.Utils;

import javax.servlet.http.Cookie;

/**
 * Cookie 工具类
 */
public class CookieUtils {

    /**
     * 获取指定名称的cookie
     *
     * @param cookies Cookie[]
     * @param name    要获取的cookie名称
     * @return Cookie 或者 null
     */
    public static Cookie findCookie(Cookie[] cookies, String name) {
        // 客户端没有携带Cookie:
        if (null == cookies) {
            return null;
        }

        for (Cookie cookie : cookies) {
            if (name.equals(cookie.getName())) {
                return cookie;
            }
        }

        return null;
    }
}
