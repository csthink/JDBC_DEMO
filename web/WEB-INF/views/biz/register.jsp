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
    <title>注册页面</title>
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/my.css" rel="stylesheet">
    <%-- 日期样式 --%>
    <link rel="stylesheet" href="/packages/address/style.css">
    <link rel="stylesheet" href="/packages/jedate/skin/jedate.css">

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
            <a class="navbar-brand" href="<%= basePath%>">小不点</a>
        </div>
    </div>
</nav>

<div class="container">
    <a href="<%=basePath%>/login.do">去登录</a>
    <h4 style="color:red">${message}</h4>

    <form class="form-horizontal" action="<%=basePath%>/register.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
        <div class="form-group">
            <label for="inputUsername" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputUsername"  name="username" placeholder="请输入用户名" minlength="4" maxlength="20" autofocus required>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword" name="password" placeholder="请输入密码" required>
            </div>
        </div>
        <div class="form-group">
            <label for="inputRealName" class="col-sm-2 control-label">真实姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputRealName" name="realName" placeholder="请输入真实姓名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
                <label class="radio-inline">
                    <input type="radio" name="sex" value="m"> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="sex" value="f"> 女
                </label>
                <label class="radio-inline">
                    <input type="radio" name="sex" value="u" checked="checked"> 保密
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="inputBirthDay" class="col-sm-2 control-label">生日</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputBirthDay" name="birthday" readonly="readonly">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPhone" class="col-sm-2 control-label">手机号</label>
            <div class="col-sm-10">
                <input type="tel" class="form-control" id="inputPhone" name="phone" placeholder="请输入手机号">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">地址</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="address" name="address">
            </div>
        </div>
        <div class="form-group">
            <label for="InputFile" class="col-sm-2 control-label">头像</label>
            <div class="col-sm-10">
                <input type="file" id="InputFile" name="file">
                <p class="help-block">请上传有效的图片</p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">兴趣话题</label>
            <div class="col-sm-10">
                <label class="checkbox-inline">
                    <input type="checkbox" value="0" name="interest"> 前端
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" value="1" name="interest" checked="checked"> 后端
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" value="2" name="interest"> 架构
                </label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-default" value="注册" id="submit">
            </div>
        </div>
    </form>
</div>
<!-- /container -->

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/common.js"></script>
<%-- 省市区三级联动 --%>
<script src="<%=basePath%>/packages/address/cityJson.js"></script>
<script src="<%=basePath%>/packages/address/citySet.js"></script>
<script src="<%=basePath%>/packages/address/Popt.js"></script>
<%-- 日期插件 --%>
<script src="<%=basePath%>/packages/jedate/src/jedate.js"></script>
</body>
<script>
    function checkForm() {
        // TODO 前端JS 校验，后期补上
        // return false 阻止默认提交
        return true;
    }

    $(function () {
        // 生日插件
        jeDate("#inputBirthDay",{
            format:"YYYY-MM-DD", //日期格式
            isTime:false, //是否开启时间选择
            isClear:true, //是否显示清空
            festival:false, //是否显示节日
            zIndex:999,
            theme:{bgcolor: "#00A1CB", pnColor: "#00CCFF"},
            maxDate: currentTime()
        });

        // 省市区三级联动
        $("#address").click(function (e) {
            SelCity(this, e);
            console.log("inout", $(this).val(), new Date())
        });

        $(window).keydown(function(event) {
            if (13 == event.keyCode) {
                $("#submit").click();
            }
        });

    });
</script>
</html>