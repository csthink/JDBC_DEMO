package com.csthink.jdbc.servlet;

import com.csthink.jdbc.bean.Message;
import com.csthink.jdbc.service.MessageService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

public class ForumListServlet extends HttpServlet {

    private MessageService messageService;

    @Override
    public void init() throws ServletException {
        super.init();
        messageService = new MessageService();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageStr = request.getParameter("page"); // 获取当前页码
        int total = messageService.countMessages(); // 获取留言总数
        int pageSize = 5; // 每页显示条数
        int lastPage = (total % pageSize == 0) ? (total / pageSize) : (total / pageSize + 1); // 计算出最后一页的页码
        int page = 1;
        if (null != pageStr && !Objects.equals("", pageStr.trim())) {
            try {
                page = Integer.parseInt(pageStr);
                page = page > lastPage ? lastPage : ((page <= 0) ? 1 : page);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        List<Message> messages = messageService.getMessageList(page, pageSize); // 分页获取全部留言

        request.setAttribute("page", page);
        request.setAttribute("lastPage", lastPage);
        request.setAttribute("total", total);
        request.setAttribute("messages", messages);

        request.getRequestDispatcher("/WEB-INF/views/biz/forum_list.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        super.destroy();
        messageService = null;
    }
}
