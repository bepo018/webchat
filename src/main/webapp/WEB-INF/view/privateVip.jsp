<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
    <title>大发彩票后台管理</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="大发彩票后台管理">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="大发彩票后台管理">
    <link rel="shortcut icon" href="img/favicon.png">

    <!-- Bootstrap CSS -->
    <link href="${ctx}/static/ht/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="${ctx}/static/ht/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="${ctx}/static/ht/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="${ctx}/static/ht/css/font-awesome.min.css" rel="stylesheet" />
    <!-- owl carousel -->
    <link rel="stylesheet" href="${ctx}/static/ht/css/owl.carousel.css" type="text/css">
    <link href="${ctx}/static/ht/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <!-- Custom styles -->
    <link rel="stylesheet" href="${ctx}/static/ht/css/fullcalendar.css">
    <link href="${ctx}/static/ht/css/widgets.css" rel="stylesheet">
    <link href="${ctx}/static/ht/css/style.css" rel="stylesheet">
    <link href="${ctx}/static/ht/css/style-responsive.css" rel="stylesheet" />
    <link href="${ctx}/static/ht/css/xcharts.min.css" rel=" stylesheet">
    <link href="${ctx}/static/ht/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="${ctx}/static/ht/js/html5shiv.js"></script>
    <script src="${ctx}/static/ht/js/respond.min.js"></script>
    <script src="${ctx}/static/ht/js/lte-ie7.js"></script>
    <![endif]-->
</head>

<body>
<!-- container section start -->
<section id="container" class="">



    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <!--overview start-->
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <span id="menuName">个人会员列表</span>
                        </li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div>
                                <table class="gridtable">
                                    <thead>
                                        <tr>
                                            <th>用户名</th>
                                            <th>等级</th>
                                            <th>电话</th>
                                            <th>QQ</th>
                                            <th>微信</th>
                                            <th>创建时间</th>
                                            <th>创建者</th>
                                            <th>归属</th>
                                            <th>备注</th>
                                            <th>操作</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${list}" var="user">
                                            <tr>
                                                <td>${user.userid}</td>
                                                <td>${user.level}</td>
                                                <td>${user.phone}</td>
                                                <td>${user.qq}</td>
                                                <td>${user.weixin}</td>
                                                <td><fmt:formatDate  value="${user.createTime}" type="both" pattern="yyyy.MM.dd HH:mm:ss" /></td>
                                                <td>${user.createUser}</td>
                                                <td>${user.invitation}</td>
                                                <th>${user.remarks}</th>
                                                <th><a href="${ctx}/updateUser?username=${user.userid}">修改</a>/<a href="#" onclick="deleteU('${user.userid}')">删除</a></th>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




        </section>
    </section>
    <!--main content end-->
</section>
<!-- container section start -->

<!-- javascripts -->
<script src="${ctx}/static/ht/js/jquery.js"></script>
<script src="${ctx}/static/ht/js/jquery-ui-1.10.4.min.js"></script>
<script src="${ctx}/static/ht/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/ht/js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- bootstrap -->
<script src="${ctx}/static/ht/js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script src="${ctx}/static/ht/js/jquery.scrollTo.min.js"></script>
<script src="${ctx}/static/ht/js/jquery.nicescroll.js" type="text/javascript"></script>
<!-- charts scripts -->
<script src="${ctx}/static/ht/js/jquery.sparkline.js" type="text/javascript"></script>
<script src="${ctx}/static/ht/js/owl.carousel.js" ></script>
<!-- jQuery full calendar -->
<<script src="${ctx}/static/ht/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<!--script for this page only-->
<script src="${ctx}/static/ht/js/calendar-custom.js"></script>
<script src="${ctx}/static/ht/js/jquery.rateit.min.js"></script>
<!-- custom select -->
<script src="${ctx}/static/ht/js/jquery.customSelect.min.js" ></script>

<!--custome script for all page-->
<script src="${ctx}/static/ht/js/scripts.js"></script>
<!-- custom script for this page-->
<script src="${ctx}/static/ht/js/sparkline-chart.js"></script>
<script src="${ctx}/static/ht/js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${ctx}/static/ht/js/jquery-jvectormap-world-mill-en.js"></script>
<script src="${ctx}/static/ht/js/xcharts.min.js"></script>
<script src="${ctx}/static/ht/js/jquery.autosize.min.js"></script>
<script src="${ctx}/static/ht/js/jquery.placeholder.min.js"></script>
<script src="${ctx}/static/ht/js/gdp-data.js"></script>
<script src="${ctx}/static/ht/js/morris.min.js"></script>
<script src="${ctx}/static/ht/js/sparklines.js"></script>
<script src="${ctx}/static/ht/js/charts.js"></script>
<script src="${ctx}/static/ht/js/jquery.slimscroll.min.js"></script>
<script>
    function deleteU(data) {
        $.ajax({
            url:"${ctx}/deleteUser",
            type:"GET",
            data:"username="+data,
            success:function (res) {
                alert(res.message)
                window.location.reload();
            }
        })
    }

</script>
</body>
</html>

