package com.csthink.jdbc.service;

import com.csthink.jdbc.bean.Message;
import com.csthink.jdbc.dao.MessageDao;

import java.util.List;

public class MessageService {
    private MessageDao messageDao;

    public MessageService() {
        messageDao = new MessageDao();
    }

    /**
     * 分页查询全部留言
     * @param page
     * @param pageSize
     * @return
     */
    public List<Message> getMessageList(int page, int pageSize) {
        return messageDao.getMessageList(page, pageSize);
    }

    /**
     * 统计留言总数
     * @return int
     */
    public int countMessages() {
        return messageDao.countMessages();
    }
}
