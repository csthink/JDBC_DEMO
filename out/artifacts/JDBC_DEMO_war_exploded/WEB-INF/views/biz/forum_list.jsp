<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>message 页面</title>
</head>
<body>
<p>总共记录: ${total}</p>
<p>当前页码: ${page}</p>
<p>最后一页: ${lastPage}</p>

<c:forEach items="${messages}" var="message">
    作者: ${message.username} 发布于: <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${message.create_time}"/>
    <br>
    标题: ${message.title}
    <br>
    内容: ${message.content}
    <hr>
</c:forEach>
</body>
</html>
