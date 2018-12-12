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
<title>大发彩票登录</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Collective Forms Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script src="${ctx}/static/source/js/jquery.min.js"></script>
	<link href="${ctx}/static/source/css/login_style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- //for-mobile-apps -->
</head>
<body>
	<div class="main">
		<h1>大发彩票登录</h1>
		<div class="wthree_top_forms">
			<div class="agile-info_w3ls agile-info_w3ls_sub hvr-buzz-out">
				
				<div class="agile-info_w3ls_grid second">
                    <h3>登录</h3>
					<form  action="${ctx}/user/login" method="POST" id="form_login">
						<input type="text" id="uname" name="userid" placeholder="用户名" required=" ">
						<p style="color: red;font-size: 25px;">${error}</p>
						<input type="password" id="password" name="password" placeholder="密码" required=" ">
						<span id="showResult"></span>
						<input type="submit" id="sub"  value="登录"/>
					</form>
					<h5>还没注册? <a href="${ctx}/register">注册</a></h5>
				</div>
			</div>
			<div class="clear"> </div>
		</div>
		<div class="agileits_copyright">
            <p>© 2018 大发彩票注册. All rights reserved | Design by <a href="http://www.chatcai.com">chatcai.com</a></p>
		</div>
	</div>
</body>
</html>