package com.csthink.jdbc.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (null != request.getSession().getAttribute("user")) {
            request.getSession().setAttribute("user", null);
            request.getRequestDispatcher("/forum/list.do").forward(request, response);
        }
    }
}
