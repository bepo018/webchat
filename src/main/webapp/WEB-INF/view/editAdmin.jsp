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

                <form id="form_register" action="" method="post" class="formStyle">
                     <div>
                        <label for="uname">用户名：</label>
                         <input type="text" id="uname" name="username" required=" "  value="${admin.username}">
                    </div>
                    <div>
                        <label for="pwd">密 &nbsp;&nbsp;码：</label>
                        <input type="password" id="pwd" name="password"  required=" " value="${admin.password}">
                    </div>
                    <div>
                        <label for="phone">手 &nbsp;&nbsp;机：</label>
                        <input type="text" id="phone" name="phone"  required=" "  value="${admin.phone}">
                    </div>
                    <div>
                        <label for="weixin">微 &nbsp;&nbsp;信：</label>
                        <input type="text" id="weixin" name="weixin"  required=" " value="${admin.weixin}">
                    </div>
                    <div>
                        <label for="qq">Q &nbsp;&nbsp;Q：</label>
                        <input type="text" id="qq" name="qq"  required=" " value="${admin.qq}">
                    </div>
                    <div>
                        <label for="level">等 &nbsp;&nbsp;级：</label>
                        <input  class="browsers" list="browsers" type="text" id="level" name="level" required=" " >
                        <datalist id="browsers">browsers
                            <c:forEach items="${levels}" var="level">
                                <option value="${level.roleCode}">${level.roleName}</option>
                            </c:forEach>
                        </datalist>
                    </div>
                    <div>
                        <label for="remarks">备 &nbsp;&nbsp;注：</label>
                        <input type="text" id="remarks" name="remarks" required=" " value="${admin.remarks}">
                    </div>
                    <div>
                        <button id="sub" type="button" onclick="submita()">提交</button>
                    </div>


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
                    window.location.reload();
                }
            })
        }
    }

</script>
</html>