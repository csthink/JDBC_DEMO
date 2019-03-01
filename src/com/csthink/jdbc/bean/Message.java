package com.csthink.jdbc.bean;

import java.util.Date;

public class Message {

    private int id;

    private int uid;

    private String username;

    private String title;

    private String content;

    private Date create_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public Message(int id, int uid, String username, String title, String content, Date create_time) {
        this.id = id;
        this.uid = uid;
        this.username = username;
        this.title = title;
        this.content = content;
        this.create_time = create_time;
    }
    
    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", uid=" + uid +
                ", username='" + username + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", create_time=" + create_time +
                '}';
    }
}
