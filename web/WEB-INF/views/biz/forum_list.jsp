<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.csthink.jdbc.bean.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>message 页面</title>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%= basePath %>">小不点</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <%
//                    if (null != request.getSession().getAttribute("user")) {
                    if (null != session.getAttribute("user")) {
                        User user = (User)session.getAttribute("user");
                %>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false"><%=user.getUsername() %> <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath%>">我的信息</a></li>
                            <li><a href="#">我的留言</a></li>
                            <li><a href="<%=basePath%>/logout.do">退出</a></li>
                        </ul>
                    </li>
                <%
                    } else {
                %>
                    <li><a href="<%=basePath%>/register.do">注册</a></li>
                    <li class="active"><a href="<%=basePath%>/login.do">登录 <span class="sr-only">(current)</span></a></li>
                <%
                    }
                %>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">
    <div class="page-header text-center">
        <h3 class="lead">
            <span class="label label-default">使用JDBC实现留言板的Demo</span>
            <small>当前留言总数: <span class="badge">${total}</span</small>
        </h3>
    </div>

    <div class="jumbotron">
        <c:forEach items="${messages}" var="message">
            <div class="row">
                <div class="col-md-12">
                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            <h5>${message.title}</h5>
                            <p class="list-group-item-text well well-lg">${message.content}</p>
                            <blockquote class="blockquote-reverse">
                                <p class="list-group-item-heading">
                                    <small>
                                            <span class="glyphicon glyphicon-user" aria-hidden="true">${message.username}</span> 发布于:
                                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${message.create_time}"/>
                                    </small>
                                </p>
                            </blockquote>
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <%
        if (null != request.getSession().getAttribute("user")) {
    %>
    <div>
        <a class="btn btn-default btn-lg btn-success" href="#" role="button">我有话说</a>
    </div>
    <%
        }
    %>

    <%--分页组件--%>
    <nav aria-label="Page navigation" class="pull-right">
        <ul class="pagination pagination-lg">
            <c:if test="${page != 1}">
                <li>
                    <a href="<%= basePath %>forum/list.do?page=${page - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>


            <c:forEach items="${pageList}" var="pageStr">
                <c:choose>
                    <c:when test="${pageStr == page}">
                        <li class="active"><a href="<%= basePath %>forum/list.do?page=${page}">${pageStr}</a>
                    </c:when>
                    <c:otherwise>
                        <li><a href="<%= basePath %>forum/list.do?page=${pageStr}">${pageStr}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${page != lastPage}">
                <li>
                    <a href="<%= basePath %>forum/list.do?page=${page + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
<!-- /container -->

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>