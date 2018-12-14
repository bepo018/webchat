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
    <link href="${ctx}/static/source/css/login_style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="background: #eee;">
<div class="main">
    <div class="admin_top_forms" >
        <div class="agile-info_w3ls hvr-buzz-out" style="width: 49%;">
            <div class="agile-info_w3ls_grid">
                <c:if test="${admin == null}">
                    <h3>注册</h3>
                </c:if>
                <c:if test="${admin != null}">
                    <h3>修改</h3>
                </c:if>

                <form id="form_register" action="" method="post">
                    <span>用户名：</span><input type="text" id="uname" name="username" required=" "  value="${admin.username}">
                    <span>密码：</span><input type="password" id="pwd" name="password"  required=" " value="${admin.password}">
                    <span>手机：</span><input type="text" id="phone" name="phone"  required=" " style="margin: 1.5em 0;" value="${admin.phone}">
                    <span>微信：</span><input type="text" id="weixin" name="weixin"  required=" " value="${admin.weixin}">
                    <span>QQ：</span><input type="text" id="qq" name="qq"  required=" " value="${admin.qq}">
                    <span>等级：</span><input  class="browsers" list="browsers" type="text" id="level" name="level"  required=" " >
                    <datalist id="browsers">browsers
                        <option value="3">普通管理员</option>
                        <option value="4">高级管理员</option>
                    </datalist>

                    <span>备注：</span><input type="text" id="remarks" name="remarks" required=" " value="${admin.remarks}">
                    <button id="sub" type="button" onclick="submita()">提交</button>
                </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
<script src="${ctx}/static/source/js/jquery.min.js"></script>
<script type="text/javascript">
    function submita() {
        if(${admin == null}){
            var data = $("#form_register").serialize();
            $.ajax({
                "url":"${ctx}/admin/registerAdmin",

                "data":data,
                "type":"POST",
                "dataType":"JSON",
                "success":function (obj) {
                    alert(obj.message);
                    window.location.reload();
                }
            })
        }else{
            var data = $("#form_register").serialize();
            $.ajax({
                "url":"${ctx}/admin/editAdmin",
                "data":data,
                "type":"POST",
                "dataType":"JSON",
                "success":function (obj) {
                    alert(obj.message);
                }
            })
        }

    }

</script>
</html>