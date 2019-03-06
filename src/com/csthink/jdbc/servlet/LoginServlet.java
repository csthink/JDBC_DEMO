package com.csthink.jdbc.servlet;

import com.csthink.jdbc.bean.User;
import com.csthink.jdbc.service.LoginService;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class LoginServlet extends HttpServlet {

    private LoginService loginService;

    @Override
    public void init() throws ServletException {
        super.init();
        loginService = new LoginService();
    }

    @Override
    // 渲染登录页面
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (null != request.getSession().getAttribute("user")) {
            // 用户已登录
            response.sendRedirect("/forum/list.do");
        } else {
            // 用户未登录
            request.getRequestDispatcher("/WEB-INF/views/biz/login.jsp").forward(request, response);
        }
    }

    @Override
    // 处理登录逻辑
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String verifyCode = request.getParameter("verifyCode");

        JSONObject jsonObject = new JSONObject();
        response.setContentType("text/html;charset=utf-8");

        // 校验验证码是否正确
        String verifyCodeStored = (String) request.getSession().getAttribute("verifyCode");
        if (!verifyCodeStored.equalsIgnoreCase(verifyCode)) {
            jsonObject.put("flag", false);
            jsonObject.put("msg", "验证码错误");
        } else {
            User user = loginService.login(username, password);
            if (null == user) {
                //jsonObject = new JSONObject("{flag: false, msg: 用户名或密码错误}");
                jsonObject.put("flag", false);
                jsonObject.put("msg", "用户名或密码错误");
            } else {
                // 判断复选框是否勾选
                if ("true".equals(remember)) {
                    Cookie cookie = new Cookie("username", username);
                    cookie.setPath("/"); // 设置有效路径
                    cookie.setMaxAge(60 * 60 * 24 * 15);// 设置有效时间 15d
                    response.addCookie(cookie); // 将cookie回写到浏览器：
                }

                request.getSession().setAttribute("user", user);
                //jsonObject = new JSONObject("{flag: true}");
                jsonObject.put("flag", true);
            }
        }

        response.getOutputStream().write(jsonObject.toString().getBytes(StandardCharsets.UTF_8));
    }

    @Override
    public void destroy() {
        super.destroy();
        loginService = null;
    }
}
