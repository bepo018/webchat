<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="en">
  <head>
    <title>大发彩票后台管理</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="大发彩票后台管理">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="大发彩票后台管理">

      <link rel="shortcut icon" href="${ctx}/static/images/ctx.ico" type="image/x-icon" />

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


      <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
            </div>

            <!--logo start-->
            <a href="ht_index.jsp" class="logo">大发 <span class="lite">后台管理</span></a>
            <!--logo end-->

            <div class="top-nav notification-row">
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">

                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img style="width: 34px;" src="${ctx}/static/images/avater/${headmsg}">
                            </span>
                            <span class="username">${userid}</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <%--<li class="eborder-top">
                                <a href="${ctx}"><i class="icon_profile"></i>我的信息</a>
                            </li>--%>
                            <li>
                                <a href="${ctx}/admin/logout"><i class="icon_key_alt"></i>退出后台</a>
                            </li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>
      </header>
      <!--header end-->

      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->


              <ul class="sidebar-menu">

                  <c:forEach items="${menus}" var="menu">
                    <c:if test="${menu.type >= 100}">
                        <li class="sub-menu">
                            <a href="javascript:;" class="">
                                <i class="icon_document_alt"></i>
                                <span>${menu.menuName}</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">
                            <c:forEach items="${menus}" var="subMenu">
                                <c:if test="${menu.type /10 == subMenu.type}">
                                    <li><a class="subMenuName" id="${subMenu.href}">${subMenu.menuName}</a></li>
                                </c:if>
                            </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                  </c:forEach>
              </ul>

              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->

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
      $('.subMenuName').click(function () {
          if($("#container").children(":last")[0].tagName == "IFRAME"){
              $("#container").children(":last").remove();
          }
          $("#container").append("<iframe src='${ctx}"+$(this)[0].id+"' scrolling='auto' frameborder='0' style='width:100%;height:100%'></iframe>");

      })
  </script>
  </body>
</html>

