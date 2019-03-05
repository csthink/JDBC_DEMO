<%@ page import="com.csthink.jdbc.Utils.CookieUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录页面</title>

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
    </div>
</nav>

<div class="container">
    <a href="<%=basePath%>/register.do">去注册</a>

    <form class="form-horizontal" action="<%=basePath%>/login.do" method="post">
        <div class="form-group">
            <label for="inputUsername" class="col-sm-2 control-label">用户名</label>
            <%
                String username = "";
                // 获得从客户端携带过来的所有的Cookie
                Cookie[] cookies = request.getCookies();
                Cookie cookie = CookieUtils.findCookie(cookies, "username");
                // 记住用户名功能中保存的username
                if (null != cookie) {
                    username = cookie.getValue();
                }

                // 新注册用户需要从session中获取
                if (null != session.getAttribute("username")) {
                    username = (String)session.getAttribute("username");
                }
            %>
            <div class="col-sm-10">
                <span class="tip" style="color: red;"></span>
                <input type="text" class="form-control" id="inputUsername"  name="username" placeholder="请输入用户名" autofocus required value="<%=username%>">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword" name="password" placeholder="请输入密码" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="remember" value="true"> 记住我
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="button" class="btn btn-default" id="submit" value="登录">
            </div>
        </div>
    </form>
</div>
<!-- /container -->

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("#submit").click(function () {
            $.post(
                "<%=basePath%>/login.do",
                {
                    username: $("input[name=username]").val(),
                    password: $("input[name=password]").val(),
                    remember: $("input[name=remember]").val()
                },
                function (result) {
                    var flag = result.flag;
                    if (flag === true) {
                        window.location.href = "<%=basePath%>/forum/list.do";
                    } else {
                        $(".tip").text(result.msg);
                    }
                }, "json");
        });
    });
</script>
</body>
</html>