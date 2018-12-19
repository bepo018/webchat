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
                <span>请输入邮箱收到的验证码 </span><input type="text" id="captcha">
                <input type="hidden" id="email" value="${email}">
                <p id="captcha_hint"></p>
            </div>
            <div class="activate_button">
                <button id="submit">验证</button>
                <h5>验证完成? <a href="${ctx}/user/login">返回登录</a></h5>
            </div>

        </div>
        <div class="actvate_footer">
            <p>© 2018 大发彩票修改密码. All rights reserved | Design by <a href="http://chatcai.com">chatcai.com</a></p>
        </div>
    </div>
    <div class="alert_page hide">
        <div>
            <label>新密码：</label>
            <input type="password" id="password">
        </div>
        <div>
            <label>确认密码：</label>
            <input type="password" id="repwd">
        </div>
        <p id="password_hint"></p>
        <div>
            <button id="updatePwd">确认</button>
            <button>取消</button>
        </div>
    </div>
</body>
<script src="${ctx}/static/source/js/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#submit").click(function(){
            var captcha = $("#captcha").val();
            var email = $("#email").val();
            $("#captcha_hint").html("").css('color', 'green');
            $.ajax({
                "url": "${ctx}/checkCaptcha",
                "data": {"captcha" : captcha,"email" : email},
                "type": "POST",
                "dataType": "json",
                "success": function (result) {
                    if (result.code == 1) {
                         $('.alert_page').removeClass('hide').addClass('show');
                    } else {
                        $("#captcha_hint").html("验证码错误").css('color', 'red');
                    }
                },
            });
        });

        $("#updatePwd").click(function () {
            var password = $("#password").val();
            var repwd = $("#repwd").val();
            var email = $("#email").val();
            $("#password_hint").html("").css('color', 'green');
            if (password == repwd) {
                $.ajax({
                    "url": "${ctx}/updatePassword",
                    "data": {"password" : password,"email" : email},
                    "type": "POST",
                    "dataType": "json",
                    "success": function (result) {
                        if (result.code == 1) {
                            alert("修改成功，重新登陆？")
                            window.location.href = "${ctx}/user/login"
                        } else {
                            $("#password_hint").html(result.message).css('color', 'red');
                        }
                    },
                });
            }else {
                $("#password_hint").html("两次密码不一致").css('color', 'red')
            }
        });
    })

</script>
</html>