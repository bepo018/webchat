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
    <title>大发彩票注册</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="大发彩票注册"/>
    <link rel="shortcut icon" href="${ctx}/static/images/ctx.ico" type="image/x-icon" />
    <link href="${ctx}/static/source/css/login_style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>
<div class="main">
    <h1>大发彩票注册</h1>
    <div class="wthree_top_forms">
        <div class="agile-info_w3ls hvr-buzz-out">
            <div class="agile-info_w3ls_grid">
                <h3>注册</h3>
                <form id="form_register" action="" method="post">
                    <input type="text" id="uname" name="uname" placeholder="用户名" required=" ">
                    <span> * </span>
                    <p id="username_hint"></p>
                    <input type="text" id="email" name="email" placeholder="邮箱" required=" " >
                    <span> * </span>
                    <p id="email_hint" style="font-size: 7px;color: #aaa;"> &nbsp;&nbsp;&nbsp;↑ 用于激活账号</p>
                    <input type="password" id="pwd" name="password" placeholder="密码" required=" ">
                    <span> * </span>
                    <p id="pwd_hint"></p>
                    <input type="password" id="affirm_pwd" placeholder="确认密码" required=" ">
                    <span> * </span>
                    <p id="affirm_pwd_hint"></p>
                    <input type="text" id="phone" name="phone" placeholder="手机" required=" " style="margin: 1.5em 0;">
                    <span> * </span>
                    <p id="phone_hint"></p>
                    <input type="text" id="weixin" name="weixin" placeholder="微信" required=" ">
                    <span> * </span>
                    <p id="weixin_hint"></p>
                    <input type="text" id="invitation" name="invitation" placeholder="邀请码" required=" ">
                    <span class="xt">选 填</span>
                    <p id="invitation_hint"></p>
                    <input type="text" id="qq" name="qq" placeholder="QQ" required=" ">
                    <span class="xt">选 填</span>
                    <p id="qq_hint"></p>

                    <button id="sub" type="button" onclick="submita()">注册</button>
                </form>
                <h5>已注册? <a href="${ctx}/user/login">登录</a></h5>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="agileits_copyright">
        <p>© 2018 大发彩票注册. All rights reserved | Design by <a href="http://chatcai.com">chatcai.com</a></p>
    </div>
</div>
</body>
<script src="${ctx}/static/source/js/jquery.min.js"></script>
<script type="text/javascript">
    /**发起异步GET请求，询问服务器用户名是否已经存在**/
    $("#uname").blur(function () {
        var uname = $("#uname").val();
        if (/^[a-zA-Z0-9_-]{4,16}$/.test(uname)) {
            $.ajax({
                "url": "${ctx}/check_username",
                "data": "username=" + $("#uname").val(),
                "type": "GET",
                "dataType": "json",
                "success": function (obj) {
                    if (obj.code == 1) {
                        $("#username_hint").html("").css('color', 'green');
                    } else {
                        $("#username_hint").html(obj.message).css('color', 'red');
                    }
                },
            });
        } else {
            $("#username_hint").html("请输入4到16位（字母，数字，下划线，减号）").css('color', 'red');
        }
    })

    /**发起异步GET请求，询问服务器邮箱是否已经存在**/
    $("#email").blur(function () {
        var email = $("#email").val();
        if (/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email)) {
            $.ajax({
                "url": "${ctx}/check_email",
                "data": "email=" + email,
                "type": "GET",
                "dataType": "json",
                "success": function (obj) {
                    if (obj.code == 1) {
                        $("#email_hint").html(" &nbsp;&nbsp;&nbsp;↑ 用于激活账号").css('color', '#aaa').css('font-size','7px');
                    } else {
                        $("#email_hint").html(obj.message).css('color', 'red');
                    }
                },
            });
        } else {
            $("#email_hint").html("邮箱格式不正确").css('color', 'red');
        }
    })

    $("#phone").blur(function () {
        var phone = $("#phone").val();
        if (/^1[34578]\d{9}$/.test(phone)) {
            $("#phone_hint").html("").css('color', 'green');
        } else {
            $("#phone_hint").html("手机号码有误，请重填").css('color', 'red');
        }
    })
    $("#qq").blur(function () {
        var qq = $("#qq").val();
        if (qq.length >= 4) {
            if (/^[1-9]\d{4,12}$/.test(qq)) {
                $("#qq_hint").html("").css('color', 'green');
            } else {
                $("#qq_hint").html("qq号码有误，请重填").css('color', 'red');
            }
        }

    })
    $("#weixin").blur(function () {
        var weixin = $("#weixin").val();
        if (/^[a-zA-Z0-9_-]{4,16}$/.test(weixin)) {
            $("#weixin_hint").html("").css('color', 'green');
        } else {
            $("#weixin_hint").html("请输入4到16位（字母，数字，下划线，减号）").css('color', 'red');
        }

    })

    $("#pwd").blur(function () {
        var pwdVal = $("#pwd").val();
        if (!/^(\w){6,20}$/.test(pwdVal)) {
            $("#pwd_hint").html("请输入6-20个字母、数字、下划线!").css('color', 'red')
        } else {
            $("#pwd_hint").html("").css('color', 'green')
        }
    })

    $("#affirm_pwd").blur(function () {
        var pwdVal = $("#pwd").val();
        var affPwdVal = $("#affirm_pwd").val();
        if (pwdVal != affPwdVal) {
            $("#affirm_pwd_hint").html("两次密码不一致").css('color', 'red')
        } else {
            $("#affirm_pwd_hint").css('color', 'green')
        }
    })

    function submita() {
        var data = $("#form_register").serialize();
        var count = 0;
        $('#form_register p').each(function () {
            if ($(this).css("color") == "rgb(128, 0, 0)") {
                count++;
                console.log(count)
            }
        });
        if (count > 0) {
            alert("请检查输入正确后提交！")
            return false;
        } else {
            $.ajax({
                url: "${ctx}/form_register",
                data: data,
                type: "POST",
                async: false,
                dataType: "json",
                success: function (obj) {
                    if (obj.code == 1) {
                        alert("恭喜您注册成功！确定将转到激活页面")
                        window.location.href = "${ctx}/activate";
                    } else {
                        alert(obj.message);
                    }
                },
            });
        }
    }

    /**发起异步GET请求，询问服务器邀请码是否已经存在**/
    $("#invitation").blur(function () {
        $("#invitation_hint").html("");
        var invitation = $("#invitation").val();
        if (invitation) {
            $.ajax({
                "url": "${ctx}/check_invitation",
                "data": {"invitation" : invitation},
                "type": "GET",
                "dataType": "json",
                "success": function (result) {
                    if (result.code == 1) {
                        $("#invitation_hint").html("").css('color', 'green');
                    } else {
                        $("#invitation_hint").html(result.message).css('color', 'red');
                    }
                },
            });
        }else {
            $("#invitation_hint").html("").css('color', 'green');
        }
    })
</script>
</html>