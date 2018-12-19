<!--
Author: xmoban.cn
Author URL: http://www.xmoban.cn
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>大发彩票修改密码</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="大发彩票修改密码"/>
    <link rel="shortcut icon" href="${ctx}/static/images/ctx.ico" type="image/x-icon" />
    <link href="${ctx}/static/source/css/login_style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
    <div class="activate_style">
        <div>
            <div>
                <span>请输入注册时的邮箱账号：</span><input type="text" id="email">
                <p id="email_hint"></p>
            </div>
            <div class="activate_button">
                <button id="submit">下一步</button>
                <h5>忘记邮箱? <a href="${ctx}/register">重新注册账号</a></h5>
            </div>

        </div>
        <div class="actvate_footer">
            <p>© 2018 大发彩票修改密码. All rights reserved | Design by <a href="http://chatcai.com">chatcai.com</a></p>
        </div>
    </div>
</body>
<script src="${ctx}/static/source/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#submit").click(function () {
            var email = $("#email").val();
            if (/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)) {
                $.ajax({
                    "url": "${ctx}/check_email",
                    "data": "email=" + email,
                    "type": "GET",
                    "dataType": "json",
                    "success": function (obj) {
                        if (obj.code == 0) {
                            window.location.href = "${ctx}/reset?email="+email;
                        } else {
                            $("#email_hint").html("邮箱不存在，请重新输入").css('color', 'red');
                        }
                    },
                });
            }else {
                $("#email_hint").html("邮箱格式不正确").css('color', 'red');
            }
        });
    })
</script>
</html>