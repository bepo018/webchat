<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"  content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>彩天下-聊天室</title>
    <link rel="shortcut icon" href="${ctx}/static/images/ctx.ico" type="image/x-icon" /> 
    <link rel="stylesheet" href="${ctx}/static/plugins/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="${ctx}/static/plugins/contextjs/css/context.standalone.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_847013_vx0c3bbwqw.css">
    <link rel="stylesheet" href="${ctx}/static/source/css/index.css">
    
    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1275283994'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s5.cnzz.com/z_stat.php%3Fid%3D1275283994' type='text/javascript'%3E%3C/script%3E"));</script>
</head>
<body>
    <div class="header">
        <nav class="navbar bg" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                        <span class="sr-only">切换导航</span>
                        <span class="iconSty"></span>
                        <span class="iconSty"></span>
                        <span class="iconSty"></span>
                    </button>
                    <a href=""><img src="${ctx}/static/images/logo.png" alt="Logo"></a>   
                </div>
                <div class="collapse navbar-collapse" id="example-navbar-collapse">
                    <ul class="nav navbar-nav fontCol">
                        <li class="">
                            <a href="javascript:void(0)" onclick="addFavorite()">
                                <i class="icon iconfont icon-icon_favor"></i>
                                <span>收藏</span>
                            </a>  
                        </li>
                        <li>
                            <a id="addServiceFrame" href="http://m.111ctx.com/service" target="mServiceFrame">
                                <i class="icon iconfont icon-shouji"></i>   
                                <span>手机聊天</span>
                            </a>
                            
                        </li>
                        <c:if test="${userid == null}">
                            <li>
                                <a href="${ctx}/register" class="btn btnReg btn-lg btn-block">注册</a>
                            </li>
                            <li>
                                <a href="${ctx}/user/login" class="btn btnLogin btn-lg btn-block">登陆</a>
                            </li>
                        </c:if>
                        <c:choose>
                            <c:when test="${level == 1}">
                                <li>游客：${userid}</li>
                            </c:when>
                            <c:otherwise>
                                <li>${userid},欢迎你</li>
                            </c:otherwise>
                        </c:choose>
                        <li>
                            <a id="addIframe" href="http://www.111ctx.com/register?id=94649462" target="myFrameName" class="btn btnReg btn-lg btn-block" >在线投注</a>
                        </li>
                        <li>
                        	<a id='closeIframe' style='margin-top: 2px;color: white;border-radius: 19%;cursor: pointer;background: rgb(230, 86, 16);display:none;width: 37px;text-align: center;margin-left: 40px; '>X</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="bodyer" id="bodyContent">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-md-3 hidden-sm hidden-xs LfBg">
                    <div class="row">
                        <div class="col-xs-4">
                            <a href="">
                                <img src="${ctx}/static/images/lfHd1.png" alt="">
                                <span>软件下载</span>
                            </a>
                        </div>
                        <div class="col-xs-4">
                            <a href="https://chat6.livechatvalue.com/chat/chatClient/chatbox.jsp?companyID=797426&configID=51364&jid=4302916724&s=1" target="_blank">
                                <img src="${ctx}/static/images/lfHd2.png" alt="">
                                <span>官方客服</span>
                            </a>
                        </div>
                        <div class="col-xs-4">
                            <a href="tencent://AddContact/?fromId=50&fromSubId=1&subcmd=all&uin=227777999">
                                <img src="${ctx}/static/images/lfHd3.png" alt="">
                                <span>在线客服</span> 
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 change-Bg" id="infoToggle">客服/管理</div>
                        <div class="col-xs-6" id="hallToggle">房间管理</div>
                    </div>
                    <div class="navLf-info">
                        <div class="info-room">在线管理</div>
                        <ul>
                            <li>
                                <a href="tencent://AddContact/?fromId=50&fromSubId=1&subcmd=all&uin=227777999" target="mServiceFrame">
                                    <img src="${ctx}/static/images/def-hd.gif" alt="">
                                    <span>充值、提额咨询</span>
                                </a>
                            </li>
                            <li>
                                <a href="http://m.111ctx.com/service" target="mServiceFrame">
                                    <img src="${ctx}/static/images/def-hd.gif" alt="">
                                    <span>注册、优惠咨</span>
                                </a>
                            </li>
                            <li>
                                <a href="http://m.111ctx.com/service" target="mServiceFrame">
                                    <img src="${ctx}/static/images/def-hd.gif" alt="">
                                    <span>投注、兑奖咨询</span>
                                </a>
                            </li>
                            <li>
                                <a href="http://m.111ctx.com/service" target="mServiceFrame">
                                    <img src="${ctx}/static/images/def-hd.gif" alt="">
                                    <span>诚招代理、月赚百万</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="navLf-hall" id="accordion2">
                        <div  class="panel">
                            <div>
                                <a class="rooms"  data-toggle='collapse' data-parent='#accordion2' href='#collapseTwo'>
                                    <img src="${ctx}/static/images/cz-pk10.png" alt="">
                                    	北京赛车
                                </a>
                            </div>
                            <div id="collapseTwo"  class="collapse" >
                                <div class="ptRoom"  id="bjsc">普通房间 <span id="bjsc_online"></span></div>
                                <div class="vipRoom" id="bjscVip">VIP房间 <span id="bjscVip_online"></span></div>
                            </div>
                            <div class="collapse">
                                <ul id="bjsc_list"></ul>
                                <ul id="bjsc_rabot"></ul>
                            </div>
                        </div>
                        <div  class="panel">
                            <div>
                                <a class="rooms"  data-toggle='collapse' data-parent='#accordion2' href='#collapseThree'>
                                    <img src="${ctx}/static/images/cz-cq_ssc.png" alt="">
                                    重庆时时彩
                                </a>
                            </div>
                            <div id="collapseThree"  class="collapse" >
                                <div class="ptRoom" id="cqssc">普通房间 <span id="cqssc_online"></span></div>
                                <div class="vipRoom" id="cqsscVip">VIP房间 <span id="cqsscVip_online"></span></div>
                            </div>
                            <div class="collapse" >
                                <ul id="cqssc_list"></ul>
                                <ul id="cqssc_rabot"></ul>
                            </div>
                        </div>
                        <div  class="panel">
                            <div>
                                <a class="rooms"  data-toggle='collapse' data-parent='#accordion2' href='#collapseFour'>
                                    <img src="${ctx}/static/images/cz-ah_k3.png" alt="">
                                    江苏快三
                                </a>
                            </div>
                            <div id="collapseFour"  class="collapse" >
                                <div class="ptRoom" id="jsks">普通房间 <span id="jsks_online"></span></div>
                                <div class="vipRoom" id="jsksVip">VIP房间 <span id="jsksVip_online"></span></div>
                            </div>
                            <div  class="collapse" >
                                <ul id="jsks_list"></ul>
                                <ul id="jsks_rabot"></ul>
                            </div>
                        </div>
                        <div  class="panel">
                            <div>
                                <a class="rooms" data-toggle='collapse' data-parent='#accordion2' href='#collapseFive'>
                                    <img src="${ctx}/static/images/caitianxia.png" alt="">
                                    	彩天下
                                </a>
                            </div>
                            <div id="collapseFive"  class="collapse" >
                                <div class="ptRoom" id="ctx">普通房间 <span id="ctx_online"></span></div>
                                <div class="vipRoom" id="ctxVip">VIP房间 <span id="ctxVip_online"></span></div>
                            </div>
                            <div class="collapse" >
                                <ul id="ctx_list"></ul>
                                <ul id="ctx_rabot"></ul>
                            </div>
                        </div>
                        <div  class="panel">
                            <div>
                                <a class="rooms" data-toggle='collapse' data-parent='#accordion2' href='#collapseSix'>
                                    <img src="${ctx}/static/images/df.png" alt="">
                                    大发彩票
                                </a>
                            </div>
                            <div id="collapseSix"  class="collapse" >
                                <div class="ptRoom" id="df">普通房间 <span id="df_online"></span></div>
                                <div class="vipRoom" id="dfVip">VIP房间 <span id="dfVip_online"></span></div>
                            </div>
                            <div class="collapse" >
                                <ul id="df_list"></ul>
                                <ul id="df_rabot"></ul>
                            </div>
                        </div>
                    </div>
                    <span class="Lrfd hidden-lg hidden-md hidden-sm">>></span>   
                </div>
                <div class="col-xs-12 col-md-9 body-rt ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-7 bdMd">
                            <div class="md-hd row">
                                <div class=" col-xs-3">
                                    <span>彩票</span>
                                    <span>头条</span>
                                </div>
                                <div class="col-xs-9">
                                    <marquee direction="left" scrollamount=6  onmouseover="this.stop()" onmouseout="this.start()">
                                        <span>温馨提示：欢迎光临彩天下，点击优惠活动查询领取，祝你游戏愉快</span>
                                    </marquee>
                                </div>
                            </div>
                            <div class="md-bd" id="chat-view">
                                <ul id="chat"></ul>
                                <div class="float-chat">
                                    <ul>
                                        <li id="winMsg">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="md-ft">
                                <div class="tool">
                                    <span class="tool-gif" id="toolChose"></span>
                                    <span class="icon iconfont icon-xiaolian" id="faceChose"></span>
                                    <span class="icon iconfont icon-tupian"></span>
                                   <span>您对
                                       <span id="sendto">全体成员</span>说:
                                    </span>
                                    <button onclick="$('#sendto').html('全体成员')">复位</button>
                                </div>
                                <div class="msg-in">
                                    <textarea name="message" id="message"  placeholder="这里输入你想发送的信息..."></textarea>
                                    <div class="send" id="sendmsg" >
                                        <span>发送</span>
                                    </div>
                                </div>
                                <!-- 表情图标显现框 -->
                                <div class="face-body" id="gif">
                            	</div>
                            	<div class="face-body" id="faceContent" style="display: none;">
                            		
                            	</div>
                            </div>
                            <span class="zfd hidden-sm hidden-md  hidden-lg"><<</span>
                            <span class="rfd hidden-md hidden-sm hidden-lg">>></span>
                        </div>
                        <div class="col-sm-12 col-sm-5 hidden-xs bdRt">
                            <div class="bdRt-hd">
                                <ul>
                                    <li id="addmIframe">
                                        <a href="${ctx}/mobile" target="mFrame">
                                            <i class="icon iconfont icon-link"></i>
                                            在线投注
                                        </a>
                                    </li>
                                    <li id="Click-plan" class="RtBg">
                                        <a href="javascript:;">
                                            <i class="icon iconfont icon-jiangbei"></i>
                                            彩票计划
                                        </a>
                                    </li>
                                    <li  id="Click-pk10">
                                        <a href="javascript:;">
                                            <i class="icon iconfont icon-qizhi"></i>
                                            pk10直播
                                        </a>
                                    </li>
                                    <li  id="Click-wordKj">
                                        <a href="javascript:;">
                                            <i class="icon iconfont icon-mianbaoxie"></i>
                                            文字开奖
                                        </a>
                                    </li>
                                    <li  id="Click-live">
                                        <a href="javascript:;">
                                            <i class="icon iconfont icon-shipin"></i>
                                            美女直播
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- 右侧内容显示栏 -->
                            <div class="bdrt-b">
                            	<div id="mFrame" class="bdRt-bd hide">
                            		
                            	</div>
                                <!-- 彩票计划 -->
                                <div class="bdRt-bd show plan-Cp">
                                    <!-- 北京赛车导航 -->
                                    <div class="bdRtBd-header show">
                                        <span>北京赛车</span>
                                        <span class="balance">切换计划</span>
                                        <div class="child" style="display: none;">
                                            <ul id="bjpk10Plan">
                                                <li>冠军大小</li>
                                                <li>冠军单双</li>
                                                <li>冠军定位胆</li>
                                                <li>亚军定位胆</li>
                                                <li>第三名定位胆</li>
                                                <li>第四名定位胆</li>
                                                <li>第五名定位胆</li>
                                                <li>第六名定位胆</li>
                                                <li>第七名定位胆</li>
                                                <li>第八名定位胆</li>
                                                <li>第九名定位胆</li>
                                                <li>第十名定位胆</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 重庆时时彩导航 -->
                                    <div class="bdRtBd-header hide">
                                        <span>重庆时时彩</span>
                                        <span class="balance">切换计划</span>
                                        <div class="child" style="display: none;">
                                            <ul id="sscPlan">
                                                <li>万位定位胆</li>
                                                <li>万位大小</li>
                                                <li>万位单双</li>
                                                <li>千位定位胆</li>
                                                <li>百位定位胆</li>
                                                <li>十位定位胆</li>
                                                <li>个位定位胆</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 江苏快三导航 -->
                                    <div class="bdRtBd-header hide">
                                        <span>江苏快三</span>
                                        <span class="balance">切换计划</span>
                                        <div class="child" style="display: none;">
                                            <ul id="jsk3Plan">
                                                <li>和值单双</li>
                                                <li>和值大小</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="plan-tab">
                                        <ul>
                                            <li id="bjsc-list">
                                                <img src="${ctx}/static/images/cz-pk10.png" alt="">
                                                <p>北京赛车</p>
                                            </li>
                                            <li id="cqssc-list">
                                                <img src="${ctx}/static/images/cz-cq_ssc.png" alt="">
                                                <p>重庆时时彩</p>
                                            </li>
                                            <li id="jsks-list">
                                                <img src="${ctx}/static/images/cz-ah_k3.png" alt="">
                                                <p>江苏快三</p>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- 北京赛车计划 -->
                                    <div class="plan-win hide">
                                    </div>
                                    <!-- 重庆时时彩计划 -->
                                    <div class="plan-win show">
                                    </div>
                                    <!-- 江苏快三计划 -->
                                    <div class="plan-win hide">
                                    </div>
                                    <div class="plan-tip">大吉大利</div>
                                    <div class="plan-main"> 
                                        <div class="planTypes">
                                            <ul>
                                                <li>实时计划</li>
                                            	<li>长龙提醒</li>
                                                <li>开奖历史</li>
                                            </ul>
                                        </div>
                                        <!-- 北京赛车开奖历史 -->
                                        <div class="planList PK-history hide">
                                            <div>
                                        		<p>
	                                                <span>期号</span>
	                                                <span>开奖号码</span>
	                                            </p>
	                                            <ul id="PK-history">
	                                            </ul>
                                        	</div>
                                        	<table class="plan-tb">
	                                        	<thead>
	                                        		<tr>
	                                        			<th>类别</th>
	                                        			<th>两面类型</th>
	                                        			<th>已开期数</th>
	                                        		</tr>
	                                        	</thead>
	                                        	<tbody>
	                                        		
	                                        	</tbody>
	                                        </table>
                                            <ul class="plan-list">
                                            </ul>
                                        </div>
                                        <!-- 重庆时时彩开奖历史 -->
                                        <div class="planList SSC-history hide">
                                        	<div>
	                                            <p>
	                                                <span>期号</span>
	                                                <span>开奖号码</span>
	                                            </p>
	                                            <ul id="SSC-history">
	                                            </ul>
	                                        </div>
	                                        <table class="plan-tb">
	                                        	<thead>
	                                        		<tr>
	                                        			<th>类别</th>
	                                        			<th>两面类型</th>
	                                        			<th>已开期数</th>
	                                        		</tr>
	                                        	</thead>
	                                        	<tbody>
	                                        	</tbody>
	                                        </table>
                                            <ul class="plan-list">
                                            </ul>
                                        </div>
                                        <!-- 江苏pk10 -->
                                        <div class="planList KS-history show">
                                        	<div>
	                                            <p>
	                                                <span>期号</span>
	                                                <span>开奖号码</span>
	                                            </p>
	                                            <ul id="KS-history">
	                                            </ul>
	                                        </div>
	                                        <table class="plan-tb">
	                                        	<thead>
	                                        		<tr>
	                                        			<th>类别</th>
	                                        			<th>两面类型</th>
	                                        			<th>已开期数</th>
	                                        		</tr>
	                                        	</thead>
	                                        	<tbody>
	                                        	</tbody>
	                                        </table>
                                            <ul class="plan-list">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- pk10直播页面 -->
                                <div class="bdRt-bd bdPk10 hide" id="load-pk10">
                                    <!-- <div class="iframe-shadow"></div>  -->
                                </div>
                                <!-- 文字开奖页面 -->
                                <div class="bdRt-bd bdword hide">
                                    <ul id="wordKj-list"></ul>
                                </div>
                                <!-- 美女直播平台列表 -->
                                <div class="bdRt-bd bdRt-z hide">
                                    <!-- 平台列表 -->
                                    <div class="bdRt-bdZb show">

                                    </div>
                                    <!-- 进入直播页面 -->
                                    <div class="Zb-P hide">
                                        <!-- 进入直播页面 -->
                                            <!-- 伊娃大姐姐 -->
                                    </div>
                                </div>
                            </div> 
                           	<div id="mServiceContent"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script src="${ctx}/static/plugins/jquery/jquery-2.1.4.min.js"></script>
	<script src="${ctx}/static/source/js/jquery.min.js"></script>
	<script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctx}/static/plugins/layer/layer.js"></script>
	<script src="${ctx}/static/plugins/laypage/laypage.js"></script>
	<script src="${ctx}/static/plugins/contextjs/js/context.js"></script>
	<script src="${ctx}/static/source/js/index.ui.js"></script>
	<script src="${ctx}/static/source/js/index.js"></script>
	<script src="${ctx}/static/source/js/jquery.qqFace.js"></script>
	
	<script type="text/javascript">
	//添加右键菜单
	$(function () {
			//getConnection(); 
	        context.init({preventDoubleContext: false});
	        context.settings({compress: true});
	        context.attach('#chat-view', [
	            {header: '操作菜单',},
	            {text: '清理', action: clearConsole},
	            {divider: true},
	            {
	                text: '选项', subMenu: [
	                {header: '连接选项'},
	                {text: '检查', action: checkConnection},
	                {text: '连接', action: getConnection},
	                {text: '断开', action: closeConnection}
	            ]
	            },
	            {
	                text: '销毁菜单', action: function (e) {
	                e.preventDefault();
	                context.destroy('#chat-view');
	            }
	            }
	        ]);
	        //游客禁言及禁止发送
	        /* if('${level}'==1){
	        	shutUp();
	        } */
	        //回车绑定事件
	        $(document).keydown(function(event){
	  		　　if(event.keyCode==13){
	  		　　	sendMessage();
	  		　　	event.cancelBubble=true;
	  		　　	event.preventDefault();
	  		　　	event.stopPropagation();
	  		　　	$(".md-ft>.face-body").hide();
	  		   }
	  		})
            //页面加载时，展示时时彩开奖
            getCaipiaoMsg("ssc",true);
            $(".plan-Cp").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide');
            $(".plan-Cp").children(":first").removeClass("show").addClass("hide").next().removeClass("hide").addClass("show").next().removeClass("show").addClass("hide");
            $(".plan-Cp").find(".plan-win:first").removeClass("show").addClass("hide").next().removeClass("hide").addClass("show").next().removeClass("show").addClass("hide");
            $(".PK-history").removeClass("show").addClass("hide");
            $(".SSC-history").removeClass("hide").addClass("show").children(":first").hide().next().show();
            $(".KS-history").removeClass("show").addClass("hide");
	    });


	/**
	 * 清空聊天区
	 */
	function clearConsole(){
	    $("#chat").html("");
	}
	function appendZero(s){return ("00"+ s).substr((s+"").length);}  //补0函数
	function getDateFull(){
	    var date = new Date();
	    var currentdate = date.getFullYear() + "-" + appendZero(date.getMonth() + 1) + "-" + appendZero(date.getDate()) + " " + appendZero(date.getHours()) + ":" + appendZero(date.getMinutes()) + ":" + appendZero(date.getSeconds());
	    return currentdate;
	}


	/**
	 * 检查连接
	 */
	function checkConnection(){
	    if(ws != null){
	        layer.msg(ws.readyState == 0? "连接异常":"连接正常", { offset: 0});
	    }else{
	        layer.msg("连接未开启!", { offset: 0, shift: 6 });
	    }
	}

	/**
	 * 连接
	 */
	 if("${level}" == 1){
         $(".ptRoom").click(function(){
             if(whoClick!=this.id){
                 clearConsole();
                 closeConnection();
             }
             whoClick=this.id;
             getConnection(whoClick)
         })
         $(".vipRoom").click(function(){
             closeConnection();
             clearConsole();
             alert("您不是会员，不能进入VIP房间！");
             $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
             $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
             $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
             $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
             $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
             $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
             $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
             $("#ctxVip").children(":last")[0].tagName == 'A'?$("#ctxVip").children(":last").remove():$("#ctxVip").children(":last");
             $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
             $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
         })
     }else{
         $(".ptRoom").click(function(){
             if(whoClick!=this.id){
                 clearConsole();
                 closeConnection();
             }
             whoClick=this.id;
             getConnection(whoClick)
         })
         $(".vipRoom").click(function(){
             if(whoClick!=this.id){
                 clearConsole();
                 closeConnection();
             }
             whoClick=this.id;
             getConnection(whoClick)
         })
     }

	function getConnection(whoClick){
	    if(ws == null){
	    	wsServer = "ws://" + location.host+"${pageContext.request.contextPath}" + "/chatServer/"+whoClick;
	   	     ws = new WebSocket(wsServer);
	   	     ws.onopen = function (evt) {
	   	         layer.msg("已经建立连接", { offset: 0});
	   	     };
	   	     ws.onmessage = function (evt) {
	   	   		//聊天内容长度限定
		  		if($("#chat li").length >= 300){
		  			for(var i=0;i<100;i++){
		  				$("#chat li")[i].remove();
		  			} 
		  			$("#chat li")[0].remove();
		    	}
	   	        analysisMessage(evt.data);  //解析后台传回的消息,并予以展示
	   	     };
	   	     ws.onerror = function (evt) {
	   	         layer.msg("产生异常", { offset: 0});
	   	     };
	   	     ws.onclose = function (evt) {
	   	         layer.msg("已经关闭连接", { offset: 0});
	   	     };
	   	  	if(whoClick=="bjsc"){
	   	  		let a=parseInt(Math.random()*(5000-3000+1)+3000);
	   	 		$("#bjsc_online").html("("+a+")人")
                $("#bjscVip_online").html("")
	   	 		$("#cqssc_online").html("")
                $("#cqsscVip_online").html("")
	   	 		$("#jsks_online").html("")
                $("#jsksVip_online").html("")
	   	 		$("#ctx_online").html("")
                $("#ctxVip_online").html("")
                $("#df_online").html("")
                $("#dfVip_online").html("")
                $("#bjsc_rabot").html("")
	   	 		addPeo("bjsc_rabot","pt");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#ctxVip").children(":last").remove():$("#ctxVip").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#bjsc").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
	   	  	}else if(whoClick=="bjscVip"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("("+a+")人")
                $("#cqssc_online").html("")
                $("#cqsscVip_online").html("")
                $("#jsks_online").html("")
                $("#jsksVip_online").html("")
                $("#ctx_online").html("")
                $("#ctxVip_online").html("")
                $("#df_online").html("")
                $("#dfVip_online").html("")
                $("#bjsc_rabot").html("")
                addPeo("bjsc_rabot","");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#ctxVip").children(":last").remove():$("#ctxVip").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#bjscVip").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }else if(whoClick=="cqssc"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("")
                $("#cqssc_online").html("("+a+")人")
                $("#cqsscVip_online").html("")
                $("#jsks_online").html("")
                $("#jsksVip_online").html("")
                $("#ctx_online").html("")
                $("#ctxVip_online").html("")
                $("#df_online").html("")
                $("#dfVip_online").html("")
                $("#cqssc_rabot").html("")
                addPeo("cqssc_rabot","pt");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#ctxVip").children(":last").remove():$("#ctxVip").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#cqssc").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }else if(whoClick=="cqsscVip"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("")
                $("#cqssc_online").html("")
                $("#cqsscVip_online").html("("+a+")人")
                $("#jsks_online").html("")
                $("#jsksVip_online").html("")
                $("#ctx_online").html("")
                $("#ctxVip_online").html("")
                $("#df_online").html("")
                $("#dfVip_online").html("")
                $("#cqssc_rabot").html("")
                addPeo("cqssc_rabot","");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#ctxVip").children(":last").remove():$("#ctxVip").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#cqsscVip").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }else if(whoClick=="jsks"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("")
                $("#cqssc_online").html("")
                $("#cqsscVip_online").html("")
                $("#jsks_online").html("("+a+")人")
                $("#jsksVip_online").html("")
                $("#ctx_online").html("")
                $("#ctxVip_online").html("")
                $("#df_online").html("")
                $("#dfVip_online").html("")
                $("#jsks_rabot").html("")
                addPeo("jsks_rabot","pt");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#ctxVip").children(":last").remove():$("#ctxVip").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#jsks").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }else if(whoClick=="jsksVip"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("")
                $("#cqssc_online").html("")
                $("#cqsscVip_online").html("")
                $("#jsks_online").html("")
                $("#jsksVip_online").html("("+a+")人")
                $("#ctx_online").html("")
                $("#ctxVip_online").html("")
                $("#df_online").html("")
                $("#dfVip_online").html("")
                $("#jsks_rabot").html("")
                addPeo("jsks_rabot","");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#ctxVip").children(":last").remove():$("#ctxVip").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#jsksVip").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }else if(whoClick=="ctx"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("")
                $("#cqssc_online").html("")
                $("#cqsscVip_online").html("")
                $("#jsks_online").html("")
                $("#jsksVip_online").html("")
                $("#ctx_online").html("("+a+")人")
                $("#ctxVip_online").html("")
                $("#df_online").html("")
                $("#dfVip_online").html("")
                $("#ctx_rabot").html("")
                addPeo("ctx_rabot","pt");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#ctxVip").children(":last").remove():$("#ctxVip").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#ctx").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }else if(whoClick=="ctxVip"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("")
                $("#cqssc_online").html("")
                $("#cqsscVip_online").html("")
                $("#jsks_online").html("")
                $("#jsksVip_online").html("")
                $("#ctx_online").html("")
                $("#ctxVip_online").html("("+a+")人")
                $("#df_online").html("")
                $("#dfVip_online").html("")
                $("#ctx_rabot").html("")
                addPeo("ctx_rabot","");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#ctxVip").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }else if(whoClick=="df"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("")
                $("#cqssc_online").html("")
                $("#cqsscVip_online").html("")
                $("#jsks_online").html("")
                $("#jsksVip_online").html("")
                $("#ctx_online").html("")
                $("#ctxVip_online").html("")
                $("#df_online").html("("+a+")人")
                $("#dfVip_online").html("")
                $("#df_rabot").html("")
                addPeo("df_rabot","pt");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#dfVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }else if(whoClick=="dfVip"){
                let a=parseInt(Math.random()*(5000-3000+1)+3000);
                $("#bjsc_online").html("")
                $("#bjscVip_online").html("")
                $("#cqssc_online").html("")
                $("#cqsscVip_online").html("")
                $("#jsks_online").html("")
                $("#jsksVip_online").html("")
                $("#ctx_online").html("")
                $("#ctxVip_online").html("")
                $("#df_online").html("")
                $("#dfVip_online").html("("+a+")人")
                $("#df_rabot").html("")
                addPeo("df_rabot","");
                $("#bjsc").children(":last")[0].tagName == 'A'?$("#bjsc").children(":last").remove():$("#bjsc").children(":last");
                $("#cqsscVip").children(":last")[0].tagName == 'A'?$("#cqsscVip").children(":last").remove():$("#cqsscVip").children(":last");
                $("#jsks").children(":last")[0].tagName == 'A'?$("#jsks").children(":last").remove():$("#jsks").children(":last");
                $("#bjscVip").children(":last")[0].tagName == 'A'?$("#bjscVip").children(":last").remove():$("#bjscVip").children(":last");
                $("#cqssc").children(":last")[0].tagName == 'A'?$("#cqssc").children(":last").remove():$("#cqssc").children(":last");
                $("#jsksVip").children(":last")[0].tagName == 'A'?$("#jsksVip").children(":last").remove():$("#jsksVip").children(":last");
                $("#ctx").children(":last")[0].tagName == 'A'?$("#ctx").children(":last").remove():$("#ctx").children(":last");
                $("#ctxVip").children(":last")[0].tagName == 'A'?$("#dfVip").children(":last").remove():$("#dfVip").children(":last");
                $("#df").children(":last")[0].tagName == 'A'?$("#df").children(":last").remove():$("#df").children(":last");
                $("#dfVip").append("<a class='changeShiliang'>&nbsp;&nbsp;所在房间<img src='${ctx}/static/images/down.png' style='width: 14px;'></a>");
            }

            var ptFlag=true
            var vipFlag=true
            $(".changeShiliang").click(function(){
                if(ptFlag==true){
                    $(".changeShiliang img").attr("src","${ctx}/static/images/up.png");
                    $(this).parent().next().hide().parent().next().attr("class","in");
                    ptFlag=false;
                }else{
                    $(".changeShiliang img").attr("src","${ctx}/static/images/down.png");
                    $(this).parent().next().show().parent().next().attr("class","collapse");
                    ptFlag=true;
                }
                if(vipFlag==true){
                    $(".changeShiliang img").attr("src","${ctx}/static/images/up.png");
                    $(this).parent().parent().next().attr("class","in");
                    vipFlag=false;
                }else{
                    $(".changeShiliang img").attr("src","${ctx}/static/images/down.png");
                    $(this).parent().parent().next().attr("class","collapse");
                    vipFlag=true;
                }
            })
	    }else{
	        layer.msg("连接已存在!", { offset: 0, shift: 6 });
	    }
	    
	}


	/**
	 * 关闭连接
	 */
	function closeConnection(){
	    if(ws != null){
	        ws.close();
	        ws = null;
	        //$("#list").html("");    //清空在线列表
	        layer.msg("已经关闭连接", { offset: 0});
	    }else{
	        layer.msg("未开启连接", { offset: 0, shift: 6 });
	    }
	}

	/**
	 * 发送信息给后台
	 */
	function sendMessage(){
	    if(ws == null){
	        layer.msg("连接未开启!", { offset: 0, shift: 6 });
	        return;
	    }
	    var message = $("#message").val();
	    var to = $("#sendto").text() == "全体成员"? "": $("#sendto").text();
	    if(message == null || message == ""){
	        layer.msg("请不要惜字如金!", { offset: 0, shift: 6 });
	        return;
	    }
	    ws.send(JSON.stringify({
	        message : {
	            content : message,
	            from : '${userid}',
	            to : to,      //接收人,如果没有则置空,如果有多个接收人则用,分隔
	            time : getDateFull(),
	            level : '${level}',
	            headmsg : '${headmsg}'
	        },
	        type : "message"
	    }));
	    $("#message").val(""); 
	}
	 /**
	  * 发送踢人信息
	  */
	 function sendInfo(info,type){
	     if(ws == null){
	         layer.msg("连接未开启!", { offset: 0, shift: 6 });
	         return;
	     }
	     ws.send(JSON.stringify({
	         message : {
	             from : "${userid}",
	             to : info
	         },
	         type : type
	     }));
	 }
	/**
	 * 发送表情给后台
	 */
	function sendgif(gif){
	    if(ws == null){
	        layer.msg("连接未开启!", { offset: 0, shift: 6 });
	        return;
	    }
	   
	    var to = $("#sendto").text() == "全体成员"? "": $("#sendto").text();
	    if(gif == "gif")
	    	return;
	    ws.send(JSON.stringify({
	        message : {
	            content : gif,
	            from : '${userid}',
	            to : to,      //接收人,如果没有则置空,如果有多个接收人则用,分隔
	            time : getDateFull(),
	            level : '${level}',
	            headmsg : '${headmsg}'
	        },
	        type : "message"
	    }));
	    $(".md-ft>.face-body").hide();
	}

	/**
	 * 解析后台传来的消息
	 * "massage" : {
	 *              "from" : "xxx",
	 *              "to" : "xxx",
	 *              "content" : "xxx",
	 *              "time" : "xxxx.xx.xx"
	 *          },
	 * "type" : {notice|message},
	 * "list" : {[xx],[xx],[xx]}
	 */
	function analysisMessage(message){
		message = JSON.parse(message);
	    if(message.type == "message"){      //会话消息
	        showChat(message.message);
	    }else if(message.type == "messageRobot"){      //会话消息
	    	robotChat(message.message);
	    }else if(message.type == "notice"){       //提示消息
	        showNotice(message.message);
			     if(message.list != null && message.list != undefined){//在线列表
			    	if("${level}"==4 || "${level}"==3){
			    		showHighLevelOnline(message);
			    	}else{
			    		showBasicLevelOnline(message);
			    	}
			    } 
		}else if(message.type == "noticeRobot"){       //提示消息
	        showNotice(message.message);
		}else if(message.type == "noticeWin"){      //中奖消息
	    	showWinNotice(message.message);
	    }else if(message.type == "betting"){      //投注消息
	    	showNotice(message.message);
	    }else if(message.type == "out"){        //踢出房间
	    	cleanOut(message.message);
	    }else if(message.type == "shutup"){    //禁言
	    	shutUp();
	    }else if(message.type == "warning"){ //警告
            warning(message.message);
        }
	}

	function warning(notice) {
        $("#chat").append("<li class='chat-welcome' ><span style='color: red;background-color: pink;'>"+notice+"</span></li>");
        var chat = $("#chat-view");
        chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面
    }
	 
	 //清理被踢者的界面
	function cleanOut(msg){
		 var msg =msg.split(",");
		 alert(msg[0]+"  你已被踢出房间")
		 $(".rooms").addClass('collapsed').parent().next().removeClass('in').addClass('collapse');
		 $("#"+msg[1]+"_list").html("");    //清空在线列表 
		 $("#"+msg[1]+"_online").html("")
	 }
	 
    //展示中奖消息
    function showWinNotice(winNotice){
    	$("#winMsg").html("<img src='${ctx}/static/images/qiqiu.png'><span>"+winNotice+"</span>");
    	setTimeout(function(){
            $(".float-chat").animate({
                right:'15%'
             },800),
            //setTimeout('fireworks()',600),
            setTimeout(function(){
                $(".float-chat").animate({
                    right:'175%'
                },800)
            },5000)
        },2000)

    }
	/**
	 * 展示提示信息
	 */
	function showNotice(notice){
	    $("#chat").append("<li class='chat-welcome'><span>"+notice+"</span></li>");
	    var chat = $("#chat-view");
	    chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面
	}
	
	/**
	* 展示会话信息
	 */
	 function showChat(message){ 
			var reg =/^lottery_\d{2}$/;
			if(reg.test(message.content)){
				message.content = "<img id="+message.content+" src='${ctx}/static/images/lottery/"+message.content+".gif' alt=''>"
			};
			message.content = replace_em(message.content)
		    var isSef1 = '${userid}' == message.from ? "md-bdSf" : "";   //如果是自己则显示在右边,他人信息显示在左边
		    var isSef2 = '${userid}' == message.from ? "tubiaoRt" : "tubiao";   //如果是自己则显示在右边,他人信息显示在左边
		   	var html="";
		    var img="";
		    if(message.level == 4){
		    	img="id_ZM.png";
		   	}else if(message.level == 3){
		   		img="id_BM.png";
		   	}else if(message.level == 2){
		   		img="id_BY.png";
		   	}else{
		   		img="id_YK.png";
		   	}
		    if((message.to !="" || message.to == null) && '${userid}' != message.from){
		    	message.to=" "+message.from+" @你";
		    }else if((message.to !="" || message.to == null) && '${userid}' == message.from){
		    	message.to=" 你@ "+message.to;
		    }
		  
		    html="<li class="+isSef1+">"+
	            "<div>"+
	                "<img src='${ctx}/static/images/avater/"+message.headmsg+"' alt=''>"+
	            "</div>"+
	            "<div>"+
	                "<p>"+
	                   "<img src='${ctx}/static/images/"+img+"' alt=''>"+
	                   "<span>&nbsp&nbsp"+message.from.slice(0,2)+"***"+message.from.slice(message.from.length-2)+"&nbsp&nbsp</span>"+
	                   "<span>"+message.time+"</span>"+
	                   "<span style='color:red;'>"+message.to+"</span>"+
	                "</p>"+
	             "</div>"+
	             "<div>"+
	                 "<div class="+isSef2+">"+
	                       message.content+
	                 "</div>"+
	              "</div>"+
          	"</li>"
		    $("#chat").append(html);
		    var chat = $("#chat-view");
		    chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面
		}
	 $("#sendmsg").click(function(){
		 // 获取输入的textarea里面的内容
         var str = $("#message").val();
	    // 提交后展示区的内容
       var strContent=replace_em(str);
       sendMessage(strContent);
       $("#message").val("");
       $(".md-ft>.face-body").hide();
	 })
	// 表情替换
		function replace_em(str){
		    // 替代小于号
		    str = str.replace(/\</g,'<');
		    // 替代大于号
		    str = str.replace(/\>/g,'>');
		    // 换行
		    str = str.replace(/\n/g,'<br/>');
		
		    str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${ctx}/static/images/face/$1.gif" border="0"/>');
		    return str;
		}
    //点击表情图，加载QQ表情
    $("#faceChose").click(function () {
        var faceItem=""
        for(var i=1;i<=75;i++){
            faceItem+="<div>"+
                "<img src='${ctx}/static/images/face/"+i+".gif'  onclick=\"$('#message').setCaret();$('#message').insertAtCaret('[em_"+i+"]');\">"+
            "</div>"
        }
        $("#faceContent").html(faceItem);
    })
	/**
	 * 机器会话信息
	 */
	function robotChat(message){ 
		var num=parseInt(Math.random()*137,10);
		var arr=["id_ZM.png","id_HM.png","id_BM.png"];
		var index = Math.floor((Math.random()*arr.length));
        var inde=arr[index];
	    var html=
	    	"<li>"+
	            "<div>"+
	                "<img src='${ctx}/static/images/avater/avater"+num+".png' alt=''>"+
	            "</div>"+
	            "<div>"+
	                "<p>"+
	                   "<img src='${ctx}/static/images/"+inde+"' alt=''>"+
	                   "<span>&nbsp&nbsp"+message.from+"&nbsp&nbsp</span>"+
	                   "<span>"+message.time+"</span>"+
	                "</p>"+
	             "</div>"+
	             "<div>"+
	                 "<div class=tubiao>"+
	                       message.content+
	                 "</div>"+
	              "</div>"+
	          "</li>"
	    $("#chat").append(html);
	    var chat = $("#chat-view");
	    chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面
	    
	}
	/**
	 * 展示level4,level3在线列表
	 */
	 function showHighLevelOnline(list){

            if(whoClick.indexOf("Vip") != -1){
                var w=whoClick.split("V")[0];
                $("#"+w+"_list").html("");    //清空在线列表
                $.each(list.list, function(index, item){     //添加私聊和视频按钮

                    if(item.level==4 && item.userid == "${userid}"){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span>"+item.userid.slice(0,3)+"****</span>"+
                            "<img src='${ctx}/static/images/id_ZM.png' alt=''>"+
                            "</li>"
                    }else if(item.level==4 && item.userid != "${userid}"){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<span class='sendSingle'>私聊</span>"+
                            "<img src='${ctx}/static/images/id_ZM.png' alt=''>"+
                            "</li>"
                    }else if(item.level==3 && item.userid == "${userid}"){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<img src='${ctx}/static/images/id_BM.png' alt=''>"+
                            "</li>"
                    }else if(item.level==3 && item.userid != "${userid}"){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<span class='sendSingle'>私聊</span>"+
                            "<img src='${ctx}/static/images/id_BM.png' alt=''>"+
                            "</li>"
                    }else if(item.level==2){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<span class='sendSingle'>私聊</span>"+
                            "<span class='user'>踢出房间</span>"+
                            "<span class='shut'>禁言</span>"+
                            "<img src='${ctx}/static/images/id_HM.png' alt=''>"+
                            "</li>"
                    }

                    $("#"+w+"_list").append(li);
                });

            }
            else{
                var w=whoClick;
                $("#"+w+"_list").html("");    //清空在线列表
                $.each(list.list, function(index, item){     //添加私聊和视频按钮

                    if(item.level==4 && item.userid == "${userid}"){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span>"+item.userid.slice(0,3)+"****</span>"+
                            "<img src='${ctx}/static/images/id_ZM.png' alt=''>"+
                            "</li>"
                    }else if(item.level==4 && item.userid != "${userid}"){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<span class='sendSingle'>私聊</span>"+
                            "<img src='${ctx}/static/images/id_ZM.png' alt=''>"+
                            "</li>"
                    }else if(item.level==3 && item.userid == "${userid}"){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<img src='${ctx}/static/images/id_BM.png' alt=''>"+
                            "</li>"
                    }else if(item.level==3 && item.userid != "${userid}"){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<span class='sendSingle'>私聊</span>"+
                            "<img src='${ctx}/static/images/id_BM.png' alt=''>"+
                            "</li>"
                    }else if(item.level==2){
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<span class='sendSingle'>私聊</span>"+
                            "<span class='user'>踢出房间</span>"+
                            "<span class='shut'>禁言</span>"+
                            "<img src='${ctx}/static/images/id_HM.png' alt=''>"+
                            "</li>"
                    }else{
                        var li ="<li>"+
                            "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                            "<span name='"+item.userid+"'>"+item.userid.slice(0,3)+"****</span>"+
                            "<span class='sendSingle'>私聊</span>"+
                            "<span class='user'>踢出房间</span>"+
                            "<span class='shut'>禁言</span>"+
                            "<img src='${ctx}/static/images/id_YK.png' alt=''>"+
                            "</li>"
                    }

                    $("#"+w+"_list").append(li);
                });

            }

		    //提出房间
		    $(".user").click(function(){  //提出房间
		    	sendInfo($(this).parent().children(":first").next().attr("name"),"out"); //将id传到服务器
		    })
		    $(".sendSingle").click(function(){ //私聊
		    	addChat($(this).parent().children(":first").next().attr("name"));
		    })
		    $(".shut").click(function(){
		    	sendInfo($(this).parent().children(":first").next().attr("name"),"shutup");
		    })
	}
	
	//禁言
	function shutUp(){
		$("#message").attr('readonly','readonly').html("禁言状态，晋级为黄金会员后才可以发言");
		$("#sendmsg").removeAttr('onclick');
	}
	
	 /**
      * 展示level2,游客在线列表
      */
     function showBasicLevelOnline(list){
            $("#"+whoClick+"_list").html("");    //清空在线列表
            $.each(list.list, function(index, item){     //添加私聊和视频按钮
                if(item.level==4){
                    var li ="<li>"+
                    "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                    "<span>"+item.userid.slice(0,3)+"****</span>"+
                    "<img src='${ctx}/static/images/id_ZM.png' alt=''>"+
                    "</li>"
                }else if(item.level==3){
                    var li ="<li>"+
                    "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                    "<span>"+item.userid.slice(0,3)+"****</span>"+
                    "<img src='${ctx}/static/images/id_BM.png' alt=''>"+
                    "</li>"
                }else if(item.level==2){
                    var li ="<li>"+
                    "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                    "<span>"+item.userid.slice(0,3)+"****</span>"+
                    "<img src='${ctx}/static/images/id_HM.png' alt=''>"+
                    "</li>"
                }else{
                    var li ="<li>"+
                    "<img src='${ctx}/static/images/avater/"+item.headmsg+"' alt=''>"+
                    "<span>"+item.userid.slice(0,3)+"****</span>"+
                    "<img src='${ctx}/static/images/id_YK.png' alt=''>"+
                    "</li>"
                }
                $("#"+whoClick+"_list").append(li);
            });
    }
	/**
	 * 添加接收人
	 */
	function addChat(user){
	    var sendto = $("#sendto");
	    var receive = sendto.text() == "全体成员" ? "" : sendto.text() + ",";
	    if(receive.indexOf(user) == -1){    //排除重复
	        sendto.text(receive + user);
	    }
	}
	 /**
	  *打开ws
	  */
	 var wsServer = null;
	 var ws = null;
	 var whoClick = "";
	 
	 
	 $("#gif").click(function(e){
         sendgif(e.target.id)
	})
    //点击表情图，加载动态表情
    $("#toolChose").click(function () {
        var html=""
        for(var i=1;i<=30;i++){
            if(i<10){
                html+="<img id='lottery_0"+i+"' src='${ctx}/static/images/lottery/lottery_0"+i+".gif' alt=''>"
            }else{
                html+="<img id='lottery_"+i+"' src='${ctx}/static/images/lottery/lottery_"+i+".gif' alt=''>"
            }
        }
        $("#gif").append(html)
    })

    $("#faceChose").click(function () {
        var html=""
        for(var i=1;i<=30;i++){
            if(i<10){
                html+="<img id='lottery_0"+i+"' src='${ctx}/static/images/lottery/lottery_0"+i+".gif' alt=''>"
            }else{
                html+="<img id='lottery_"+i+"' src='${ctx}/static/images/lottery/lottery_"+i+".gif' alt=''>"
            }
        }
        $("#gif").append(html)
    })
    $("#faceChose").click(function () {
        var html=""
        for(var i=1;i<=30;i++){
            if(i<10){
                html+="<img id='lottery_0"+i+"' src='${ctx}/static/images/lottery/lottery_0"+i+".gif' alt=''>"
            }else{
                html+="<img id='lottery_"+i+"' src='${ctx}/static/images/lottery/lottery_"+i+".gif' alt=''>"
            }
        }
        $("#gif").append(html)
    })

	// 右侧按钮栏页面切换及文字开奖
	$(function(){
		var flag = true;
		var mFrameFlag=true;
		$("#addServiceFrame").click(function(){
   			$(".bdrt-b").hide();
   			$("#mServiceContent").html("<iframe name='mServiceFrame' scrolling='auto' frameborder='0' style='width:100%;height:100%'></iframe>");
   		})
		$("#addmIframe").click(function(){
			$(".bdrt-b").show();
			$("#mServiceContent").html("");
			flag = false;
	    	if(flag == false){
				$("#load-pk10").html("");
			}else{
				$("#load-pk10").html("<iframe data-v-bcfa0f24='' id='sp' scrolling='no' frameborder='0' src='//kj.kai861.com/view/video/PK10/video.html?10001' style='display: block; width: 100%; height: 289.032px;'></iframe>");
			}
	    	getCaipiaoMsg("",false);
	    	$(this).addClass('RtBg').siblings().removeClass('RtBg');
   			$("#mFrame").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide');
   			if(mFrameFlag==true){
   				$("#mFrame").prepend("<iframe id='mFrameId' name='mFrame' scrolling='auto' frameborder='0' style='width:100%;height:100%'></iframe>");
   			}
   			mFrameFlag=false;
   		});
	    $("#Click-pk10").click(function(){
	    	$(".bdrt-b").show();
	    	$("#mServiceContent").html("");
	    	flag = true;
	        getCaipiaoMsg("",false);
	        $(this).addClass('RtBg').siblings().removeClass('RtBg');
	        $(".bdPk10").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide');  
	        if(flag == false){
				$("#load-pk10").html("");
			}else{
				$("#load-pk10").html("<iframe data-v-bcfa0f24='' id='sp' scrolling='no' frameborder='0' src='//kj.kai861.com/view/video/PK10/video.html?10001' style='display: block; width: 100%; height: 289.032px;'></iframe>");
			}
	    })
	    $("#Click-wordKj").click(function(){
	    	$(".bdrt-b").show();
	    	$("#mServiceContent").html("");
	    	flag = false;
	    	if(flag == false){
				$("#load-pk10").html("");
			}else{
				$("#load-pk10").html("<iframe data-v-bcfa0f24='' id='sp' scrolling='no' frameborder='0' src='//kj.kai861.com/view/video/PK10/video.html?10001' style='display: block; width: 100%; height: 289.032px;'></iframe>");
			}
	    	getCaipiaoMsg("",false);
	    	$("#wordKj-list").html("");
	        $(this).addClass('RtBg').siblings().removeClass('RtBg');
	        $(".bdword").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide'); 
	        $.ajax({
	            url: "${ctx}/lott/allLottList",
	            type: "GET",
	            /* dataType: "jsonp", //指定服务器返回的数据类型 */
	            beforeSend:function(XMLHttpRequest){
		        	 $("#wordKj-list").html("<img src='${ctx}/static/images/load.gif' style='width:50%;margin-top:200px;'><img src='${ctx}/static/images/load.gif' style='width:50%;margin-top:200px;'>")
		         },
	            success: function (data) {  
	            	$("#wordKj-list").children()[0].remove();
	            	$("#wordKj-list").children()[0].remove();
	            	
	            	for(var i=0;i<data.data.length;i++){
	            		var numList=data.data[i][0].award.split(",");
	            		var name=data.data[i][0].lott;
	            		var ballHtml="";
	            		for(var j=0;j<numList.length;j++){
	            			ballHtml+="<span>"+numList[j]+"</span>"
	            		}
	            		var li="<li>"+
		                    "<div class='list-logo'>"+
		  	                  "<img src='${ctx}/static/images/lotttype/"+data.data[i][0].lott+".png' alt=''>"+
		  	                  "</div>"+
		  	                  "<div class='list-detail'>"+
		  	                      "<div>"+
		  	                          "<span>"+data.data[i][0].cnName+"</span>"+
		  	                          "<span class='rt'>"+data.data[i][0].time+"</span>"+
		  	                      "</div>"+
		  	                      "<div class='period'>"+data.data[i][0].gid+"</div>"+
		  	                      "<div class='ui-list-balls'>"+
		  	                    	ballHtml+
		  	                      "</div>"+
		                    "</div>"+
	                    "</li>"
	                    $("#wordKj-list").append(li);
	            	}    
	            } 
	        });
	    })
	    $("#Click-live").click(function(){
	    	$(".bdrt-b").show();
	    	$("#mServiceContent").html("");
	    	flag = false;
	    	getCaipiaoMsg("",false);
	        $(this).addClass('RtBg').siblings().removeClass('RtBg');
	        $(".bdRt-z").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide'); 
	        if(flag == false){
				$("#load-pk10").html("");
			}else{
				$("#load-pk10").html("<iframe data-v-bcfa0f24='' id='sp' scrolling='no' frameborder='0' src='//kj.kai861.com/view/video/PK10/video.html?10001' style='display: block; width: 100%; height: 289.032px;'></iframe>");
			}
	    })
	    $("#Click-plan").click(function(){
	    	$(".bdrt-b").show();
	    	$("#mServiceContent").html("");
	    	flag = false;
	    	getCaipiaoMsg("ssc",true);
	        $(this).addClass('RtBg').siblings().removeClass('RtBg');
	        $(".plan-Cp").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide'); 
	        $(".plan-Cp").children(":first").removeClass("show").addClass("hide").next().removeClass("hide").addClass("show").next().removeClass("show").addClass("hide");
	        $(".plan-Cp").find(".plan-win:first").removeClass("show").addClass("hide").next().removeClass("hide").addClass("show").next().removeClass("show").addClass("hide");
	        $(".PK-history").removeClass("show").addClass("hide");
	        $(".SSC-history").removeClass("hide").addClass("show").children(":first").hide().next().show();
	        $(".KS-history").removeClass("show").addClass("hide");
	        if(flag == false){
				$("#load-pk10").html("");
			}else{
				$("#load-pk10").html("<iframe data-v-bcfa0f24='' id='sp' scrolling='no' frameborder='0' src='//kj.kai861.com/view/video/PK10/video.html?10001' style='display: block; width: 100%; height: 289.032px;'></iframe>");
			}
	    })
	    
	})
    //加载直播
    $("#Click-live").click(function(){
        $.ajax({
            url:"${ctx}/live/getLiveInfo",
            type: "GET",
            success:function (result) {
                var liveImgHtml="";
                for(var i=0;i<result.data.length;i++){
                    if(i % 2 ==0){
                        liveImgHtml+="<div class='row'>"+
                                "<div class='col-xs-6 zbList'>"+
                                    "<img src='"+result.data[i].photo+"' id='zbImg"+parseInt(i+1)+"'>"+
                                    "<span>"+
                                        "<i class='icon iconfont icon-icon-'></i>"+
                                        "<span>"+result.data[i].hot+"</span>万"+
                                    "</span>"+
                                    "<p>"+result.data[i].name+"</p>"+
                                    "<video src='"+result.data[i].roomAddress+"' controls='controls' poster='"+result.data[i].photo+"' width='300' height='500' style='display:none;margin: 0 auto;'><video>"+
                                "</div>"+
                                "<div class='col-xs-6 zbList'>"+
                                     "<img src='"+result.data[i+1].photo+"' id='zbImg"+parseInt(i+2)+"'>"+
                                    "<span>"+
                                        "<i class='icon iconfont icon-icon-'></i>"+
                                        "<span>"+result.data[i+1].hot+"</span>万"+
                                    "</span>"+
                                    "<p>"+result.data[i+1].name+"</p>"+
                                    "<video src='"+result.data[i+1].roomAddress+"' controls='controls' poster='"+result.data[i+1].photo+"'  width='300' height='500' style='display:none;margin: 0 auto;'><video>"+
                                "</div>"+
                            "</div>"
                    }
                }
                $(".bdRt-bdZb").html(liveImgHtml)
            }
        })
    })

    //点击图片直播
    $(document).on('click','.zbList',function(e){
        $(this).children(":first").next().next().next().css('display','block')
        $(".bdRt-bdZb").html($(this).children(":first").next().next().next())
    })
	 //请求彩票数据
	function getCaipiaoMsg(lott,flag){
		 if(flag==true){
			 $.ajax({
				 url: "${ctx}/lott/first/"+lott,
		         type: "GET",
		         beforeSend:function(XMLHttpRequest){
		        	 $(".plan-win").html("<div class='planinfo'><span>开奖中<span></div><img src='${ctx}/static/images/load.gif' style='width:50%;'><img src='${ctx}/static/images/load.gif' style='width:50%;'>")
		         },
	             success: function (data) {
	            	 var mId="";
	            	 var sId="";
	            	 var trueTime=data.time + 120000;  //正常开奖时间延时120秒
	            	 var m = parseInt(trueTime/1000 / 60.0);
	            	 var s = Math.ceil((parseFloat(trueTime/1000 / 60.0) -
	                         parseInt(trueTime/1000 / 60.0)) * 60);
                     clearInterval(set);
	            	 var set = setInterval(function() {
	            	    	if( (m == 0 && s == 0) || (m == null && s == null) ){
	            	    		clearInterval(set);
	            	    		getCaipiaoMsg(lott,true);
	            	   	    }else if( m >= 0 ){
	            				if( s > 0 ){
	            					 s--;
	            	 			}else if( s == 0 ){
	            	 				m--;
	            					s = 59;
	            	  			}
	            	 		}
	            	    	$("#"+mId+"").html(m);
	            	        $("#"+sId+"").html(s);
	            	    }, 1000);
	                 var adHtml = '';
	                 var arr=data.data[0];
	                 var lottName="";
	                 var lottBallHtml="";
	                 var numList=arr.award.split(",");
	                 var HTML="";
	                 if(lott=="bjpk10"){
	                	 $("#PK-history").html("");
	                	 $(".PK-history").children(":first").next().children(":first").next().html("");
	                	 lottName="北京赛车";
	                	 lottBallHtml="<div class='planPK'>"+
		                     "<span class='PKball PKball-"+numList[0]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[1]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[2]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[3]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[4]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[5]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[6]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[7]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[8]+"'></span>"+
		                     "<span class='PKball PKball-"+numList[9]+"'></span>"+
	                 	 "</div>";
	                	 HTML=$(".plan-Cp").find(".plan-win:first");
	                	 mId="minute";
	                	 sId="second";
	                	 var pkhistoryHtml="";
		                 for(var i=0;i<data.data.length;i++){
		                	 var pkhistoryList=data.data[i].award.split(",");
		                	 pkhistoryHtml="<li>"+
	                             "<span>"+data.data[i].gid+"</span>"+
		                             "<span class='PKball PKball-"+pkhistoryList[0]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[1]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[2]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[3]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[4]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[5]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[6]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[7]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[8]+"'></span>"+
				                     "<span class='PKball PKball-"+pkhistoryList[9]+"'></span>"+
	                             "</span>"
	                         "</li>";
				             $("#PK-history").append(pkhistoryHtml);
		                 }

		                 for(var k=0;k<data.luzhu.data.length;k++){
		                		 var ranking=data.luzhu.data[k].rank;
			                	 var rankNum="";
			                	 if(ranking==1){
			                		 rankNum="冠军"
			                	 }else if(ranking==2){
			                		 rankNum="亚军"
			                	 }else if(ranking==3){
			                		 rankNum="第三名"
			                	 }else if(ranking==4){
			                		 rankNum="第四名"
			                	 }else if(ranking==5){
			                		 rankNum="第五名"
			                	 }else if(ranking==6){
			                		 rankNum="第六名"
			                	 }else if(ranking==7){
			                		 rankNum="第七名"
			                	 }else if(ranking==8){
			                		 rankNum="第八名"
			                	 }else if(ranking==9){
			                		 rankNum="第九名"
			                	 }else if(ranking==10){
			                		 rankNum="第十名"
			                	 }else{
			                		 rankNum="冠亚和"
			                	 }
			                	 var size=data.luzhu.data[k].roadBeads[0];
			                	 var sizePeriods="";
			                	 var SingleDouble=data.luzhu.data[k].roadBeads[0];
			                	 var SingleDoublePeriods="";
			                	 if(size == 1 && data.luzhu.data[k].state == 2){
			                		 size="大";
			                		 sizePeriods=data.luzhu.data[k].totals[0];
			                	 }
			                	 if(size == 0 && data.luzhu.data[k].state == 2){
			                		 size="小";
			                		 sizePeriods=data.luzhu.data[k].totals[1];
			                	 }
			                	 if(SingleDouble ==1 && data.luzhu.data[k].state == 1){
			                		 SingleDouble="双";
			                		 SingleDoublePeriods=data.luzhu.data[k].totals[0];
			                	 }
			                	 if(SingleDouble ==0 && data.luzhu.data[k].state == 1){
			                		 SingleDouble="单";
			                		 SingleDoublePeriods=data.luzhu.data[k].totals[1];
			                	 }
			                	 if(size=="大"||size=="小"){
			                		 var trHtml1="<tr>"+
				                 			"<td>"+rankNum+"</td>"+ 
				                			"<td>"+size+"</td>"+ 
				                			"<td>"+sizePeriods+"</td>"+
				                		"</tr>"
				                	$(".PK-history").children(":first").next().children(":first").next().append(trHtml1);
			                	 }
				               	if(SingleDouble=="单"||SingleDouble=="双"){
				               		var trHtml2="<tr>"+
			                 			"<td>"+rankNum+"</td>"+ 
			                			"<td>"+SingleDouble+"</td>"+ 
			                			"<td>"+SingleDoublePeriods+"</td>"+
		                			"</tr>"
			                		$(".PK-history").children(":first").next().children(":first").next().append(trHtml2);
				               	} 
		                 }
	                 }else if(lott=="ssc"){
	                	 $("#SSC-history").html("");
	                	 $(".SSC-history").children(":first").next().children(":first").next().html("");
	                	 lottName="重庆时时彩";
	                	 lottBallHtml="<div class='planball'>"+
				              "<span>"+numList[0]+"</span>"+
				              "<span>"+numList[1]+"</span>"+
				              "<span>"+numList[2]+"</span>"+
				              "<span>"+numList[3]+"</span>"+
				              "<span>"+numList[4]+"</span>"+
	          	  		  "</div>";
	                	 HTML=$(".plan-Cp").find(".plan-win:first").next();
	                	 mId="minute1";
	                	 sId="second1";
	                	 var schistoryHtml="";
		                 for(var i=0;i<data.data.length;i++){
		                	 var schistoryList=data.data[i].award.split(",");
		                	 schistoryHtml="<li>"+
	                             "<span>"+data.data[i].gid+"</span>"+
	                             "<span class='planball'>"+
			                         "<span>"+schistoryList[0]+"</span>"+
			                         "<span>"+schistoryList[1]+"</span>"+
			                         "<span>"+schistoryList[2]+"</span>"+
			                         "<span>"+schistoryList[3]+"</span>"+
			                         "<span>"+schistoryList[4]+"</span>"+
		                         "</span>"+
	                         "</li>";
				             $("#SSC-history").append(schistoryHtml);
		                 }
		                 for(var k=0;k<data.luzhu.data.length;k++){
	                		 var ranking=data.luzhu.data[k].rank;
		                	 var rankNum="";
		                	 if(ranking==1){
		                		 rankNum="万位"
		                	 }else if(ranking==2){
		                		 rankNum="千位"
		                	 }else if(ranking==3){
		                		 rankNum="百位"
		                	 }else if(ranking==4){
		                		 rankNum="十位"
		                	 }else if(ranking==5){
		                		 rankNum="个位"
		                	 }else if(ranking==6){
		                		 rankNum="总和"
		                	 }
		                	 var size=data.luzhu.data[k].roadBeads[0];
		                	 var sizePeriods="";
		                	 var SingleDouble=data.luzhu.data[k].roadBeads[0];
		                	 var SingleDoublePeriods="";
		                	 if(size == 1 && data.luzhu.data[k].state == 2){
		                		 size="大";
		                		 sizePeriods=data.luzhu.data[k].totals[0];
		                	 }
		                	 if(size == 0 && data.luzhu.data[k].state == 2){
		                		 size="小";
		                		 sizePeriods=data.luzhu.data[k].totals[1];
		                	 }
		                	 if(SingleDouble ==1 && data.luzhu.data[k].state == 1){
		                		 SingleDouble="双";
		                		 SingleDoublePeriods=data.luzhu.data[k].totals[0];
		                	 }
		                	 if(SingleDouble ==0 && data.luzhu.data[k].state == 1){
		                		 SingleDouble="单";
		                		 SingleDoublePeriods=data.luzhu.data[k].totals[1];
		                	 }
		                	 if(size=="大"||size=="小"){
		                		 var trHtml1="<tr>"+
			                 			"<td>"+rankNum+"</td>"+ 
			                			"<td>"+size+"</td>"+ 
			                			"<td>"+sizePeriods+"</td>"+
			                		"</tr>"
			                	$(".SSC-history").children(":first").next().children(":first").next().append(trHtml1);
		                	 }
			               	if(SingleDouble=="单"||SingleDouble=="双"){
			               		var trHtml2="<tr>"+
		                 			"<td>"+rankNum+"</td>"+ 
		                			"<td>"+SingleDouble+"</td>"+ 
		                			"<td>"+SingleDoublePeriods+"</td>"+
	                			"</tr>"
		                		$(".SSC-history").children(":first").next().children(":first").next().append(trHtml2);
			               	} 
	                 }
	                 }else{
	                	 $("#KS-history").html("");
	                	 $(".KS-history").children(":first").next().children(":first").next().html("");
	                	 lottName="江苏快三";
	                	 lottBallHtml="<div class='planball'>"+
				              "<span>"+numList[0]+"</span>"+
				              "<span>"+numList[1]+"</span>"+
				              "<span>"+numList[2]+"</span>"+
	     	  		     "</div>";
	                	 HTML=$(".plan-Cp").find(".plan-win:first").next().next();
	                	 mId="minute2";
	                	 sId="second2";
	                	 var kshistoryHtml="";
		                 for(var i=0;i<data.data.length;i++){
		                	 var kshistoryList=data.data[i].award.split(",");
		                	 kshistoryHtml="<li>"+
	                             "<span>"+data.data[i].gid+"</span>"+
	                             "<span class='planball'>"+
		                             "<span>"+kshistoryList[0]+"</span>"+
		                             "<span>"+kshistoryList[1]+"</span>"+
		                             "<span>"+kshistoryList[2]+"</span>"+
	                             "</span>"
	                         "</li>";
				             $("#KS-history").append(kshistoryHtml);
		                 }
		                 for(var k=0;k<data.luzhu.data.length;k++){
	                		 var ranking=data.luzhu.data[k].rank;
		                	 var rankNum="";
		                	 if(ranking==1){
		                		 rankNum="第一码"
		                	 }else if(ranking==2){
		                		 rankNum="第二码"
		                	 }else if(ranking==3){
		                		 rankNum="第三码"
		                	 }else if(ranking==0){
		                		 rankNum="总和"
		                	 }
		                	 var size=data.luzhu.data[k].roadBeads[0];
		                	 var sizePeriods="";
		                	 var SingleDouble=data.luzhu.data[k].roadBeads[0];
		                	 var SingleDoublePeriods="";
		                	 if(size == 1 && data.luzhu.data[k].state == 2){
		                		 size="大";
		                		 sizePeriods=data.luzhu.data[k].totals[0];
		                	 }
		                	 if(size == 0 && data.luzhu.data[k].state == 2){
		                		 size="小";
		                		 sizePeriods=data.luzhu.data[k].totals[1];
		                	 }
		                	 if(SingleDouble ==1 && data.luzhu.data[k].state == 1){
		                		 SingleDouble="双";
		                		 SingleDoublePeriods=data.luzhu.data[k].totals[0];
		                	 }
		                	 if(SingleDouble ==0 && data.luzhu.data[k].state == 1){
		                		 SingleDouble="单";
		                		 SingleDoublePeriods=data.luzhu.data[k].totals[1];
		                	 }
		                	 if(size=="大"||size=="小"){
		                		 var trHtml1="<tr>"+
			                 			"<td>"+rankNum+"</td>"+ 
			                			"<td>"+size+"</td>"+ 
			                			"<td>"+sizePeriods+"</td>"+
			                		"</tr>"
			                	$(".KS-history").children(":first").next().children(":first").next().append(trHtml1);
		                	 }
			               	if(SingleDouble=="单"||SingleDouble=="双"){
			               		var trHtml2="<tr>"+
		                 			"<td>"+rankNum+"</td>"+ 
		                			"<td>"+SingleDouble+"</td>"+ 
		                			"<td>"+SingleDoublePeriods+"</td>"+
	                			"</tr>"
		                		$(".KS-history").children(":first").next().children(":first").next().append(trHtml2);
			               	} 
	                 	}
	                 }
	                 adHtml += "<div class='planinfo'>"+
		                 "<span>"+lottName+"</span> 第 "+
		                 "<span>"+arr.gid+"期</span> 下期倒计时："+
		                 "<span id='"+mId+"'></span> 分"+
		                 "<span id='"+sId+"'></span> 秒"+
		             "</div>"+
		             lottBallHtml;
		             HTML.html(adHtml);
	             }
	         });  
		 }
	 }
	 
	//彩票切换
	 $(function(){
	     //开奖开关
         var bjscCount = 0;
         var sscCount = 0;
         var jsk3Count = 0;
	   	//计划开奖历史之间切换
         $(".planTypes ul").children(":first").click(function(){
             if($(".SSC-history").is(':hidden') && $(".KS-history").is(':hidden')){
                 $(".PK-history").removeClass("hide").addClass("show").children(":first").hide().next().hide().next().show();
                 var id=$("#PK-history").children(":first").children(":first").html();
                 lottPlan("bjpk10",id,"");
             }
             if($(".PK-history").is(':hidden') && $(".KS-history").is(':hidden')){
                 $(".SSC-history").removeClass("hide").addClass("show").children(":first").hide().next().hide().next().show();
                 var id=$("#SSC-history").children(":first").children(":first").html();
                 lottPlan("ssc",id,"1");
             }
             if($(".SSC-history").is(':hidden') && $(".PK-history").is(':hidden')){
                 $(".KS-history").removeClass("hide").addClass("show").children(":first").hide().next().hide().next().show();
                 var id=$("#KS-history").children(":first").children(":first").html();
                 lottPlan("jsk3",id,"DS");
             }
         })
	   	 $(".planTypes ul").children(":first").next().click(function(){
	   		 if($(".SSC-history").is(':hidden') && $(".KS-history").is(':hidden')){
	   			$(".PK-history").removeClass("hide").addClass("show").children(":first").hide().next().show().next().hide();
	   		 }
	   		if($(".PK-history").is(':hidden') && $(".KS-history").is(':hidden')){
	   			$(".SSC-history").removeClass("hide").addClass("show").children(":first").hide().next().show().next().hide();
	   		 }
	   		if($(".SSC-history").is(':hidden') && $(".PK-history").is(':hidden')){
	   			$(".KS-history").removeClass("hide").addClass("show").children(":first").hide().next().show().next().hide();
	   		 }
	   	 })
	   	 $(".planTypes ul").children(":first").next().next().click(function(){
	   		if($(".SSC-history").is(':hidden') && $(".KS-history").is(':hidden')){
	   			$(".PK-history").removeClass("hide").addClass("show").children(":first").show().next().hide().next().hide();
	   		}
	   		if($(".PK-history").is(':hidden') && $(".KS-history").is(':hidden')){
	   			$(".SSC-history").removeClass("hide").addClass("show").children(":first").show().next().hide().next().hide();
	   		}
	   		if($(".SSC-history").is(':hidden') && $(".PK-history").is(':hidden')){
	   			$(".KS-history").removeClass("hide").addClass("show").children(":first").show().next().hide().next().hide();
	   		}
	   	 })
	   	 $("#bjsc-list").click(function(){
             bjscCount++
	   	     if(bjscCount == 1){
                 getCaipiaoMsg("bjpk10",true);
             }
             sscCount = 0;
             jsk3Count = 0;
	         $(".plan-Cp").children(":first").removeClass("hide").addClass("show").next().removeClass("show").addClass("hide").next().removeClass("show").addClass("hide");
	         $(".plan-Cp").find(".plan-win:first").removeClass("hide").addClass("show").next().removeClass("show").addClass("hide").next().removeClass("show").addClass("hide");
	         $(".PK-history").removeClass("hide").addClass("show").children(":first").hide().next().show().next().hide();
	         $(".SSC-history").removeClass("show").addClass("hide");
	         $(".KS-history").removeClass("show").addClass("hide");
	     });
	     $("#cqssc-list").click(function(){
             sscCount++
             if(sscCount == 1){
                 getCaipiaoMsg("ssc",true);
             }
             bjscCount = 0;
             jsk3Count = 0;
	         $(".plan-Cp").children(":first").removeClass("show").addClass("hide").next().removeClass("hide").addClass("show").next().removeClass("show").addClass("hide");
	         $(".plan-Cp").find(".plan-win:first").removeClass("show").addClass("hide").next().removeClass("hide").addClass("show").next().removeClass("show").addClass("hide");
	         $(".PK-history").removeClass("show").addClass("hide");
	         $(".SSC-history").removeClass("hide").addClass("show").children(":first").hide().next().show().next().hide();
	         $(".KS-history").removeClass("show").addClass("hide");

	     });
	     $("#jsks-list").click(function(){
             jsk3Count++
             if(jsk3Count == 1){
                 getCaipiaoMsg("jsk3",true);
             }
             bjscCount = 0;
             sscCount = 0;
	         $(".plan-Cp").children(":first").removeClass("show").addClass("hide").next().removeClass("show").addClass("hide").next().removeClass("hide").addClass("show");
	         $(".plan-Cp").find(".plan-win:first").removeClass("show").addClass("hide").next().removeClass("show").addClass("hide").next().removeClass("hide").addClass("show");
	         $(".PK-history").removeClass("show").addClass("hide");
	         $(".SSC-history").removeClass("show").addClass("hide");
	         $(".KS-history").removeClass("hide").addClass("show").children(":first").hide().next().show().next().hide();
	     })
	 })
	
	function addPeo(c,level){
        var a=[];
        var html="";
	     if(level == "pt"){
             for(var i=0;i<50;i++){
                 var array=["id_ZM.png","id_YK.png","id_HM.png","id_BM.png"];
                 var ever=Math.random().toString(36).substr(2).slice(0,3);
                 var index = Math.floor((Math.random()*array.length));
                 var ind=array[index];
                 var num=parseInt(Math.random()*137,10);
                 var html="<li><img src='${ctx}/static/images/avater/avater"+num+".png' alt=''><span>"+ever+"****</span><img src='${ctx}/static/images/"+ind+"' alt=''>"
                 a.push(html);
             }
         }else{
             for(var i=0;i<50;i++){
                 var array=["id_ZM.png","id_HM.png","id_BM.png"];
                 var ever=Math.random().toString(36).substr(2).slice(0,3);
                 var index = Math.floor((Math.random()*array.length));
                 var ind=array[index];
                 var num=parseInt(Math.random()*137,10);
                 var html="<li><img src='${ctx}/static/images/avater/avater"+num+".png' alt=''><span>"+ever+"****</span><img src='${ctx}/static/images/"+ind+"' alt=''>"
                 a.push(html);
             }
         }
         for(let key in a){
             var b=document.getElementById(c);
             b.innerHTML+=a[key];
         }
     }
	$(function(){
		$("#hallToggle").trigger("click");
		$("#bjsc").trigger("click");
	})
    //北京赛车彩票计划切换
    $("#bjpk10Plan").children(":first").click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"");
        }
    )
    $("#bjpk10Plan").children(":first").next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"DS");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"1");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"2");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next()
        .next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"3");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next()
        .next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"4");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next()
        .next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"5");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next()
        .next().next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"6");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next()
        .next().next().next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"7");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next()
        .next().next().next().next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"8");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next()
        .next().next().next().next().next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"9");
        }
    )
    $("#bjpk10Plan").children(":first").next().next().next()
        .next().next().next().next().next().next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("bjpk10",id,"10");
        }
    )
    //北京赛车彩票计划切换
    $("#sscPlan").children(":first").click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("ssc",id,"1");
        }
    )
    $("#sscPlan").children(":first").next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("ssc",id,"");
        }
    )
    $("#sscPlan").children(":first").next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("ssc",id,"DS");
        }
    )
    $("#sscPlan").children(":first").next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("ssc",id,"2");
        }
    )
    $("#sscPlan").children(":first").next().next().next()
        .next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("ssc",id,"3");
        }
    )
    $("#sscPlan").children(":first").next().next().next()
        .next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("ssc",id,"4");
        }
    )
    $("#sscPlan").children(":first").next().next().next()
        .next().next().next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("ssc",id,"5");
        }
    )
    //北京赛车彩票计划切换
    $("#jsk3Plan").children(":first").click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("jsk3",id,"DS");
        }
    )
    $("#jsk3Plan").children(":first").next().click(
        function () {
            $(this).parent().parent().toggle()
            var id=$(this).parent().parent().parent().next().next().next().next().children(":first").children(":first").next().html().slice(0,-1)
            lottPlan("jsk3",id,"");
        }
    )
    //彩票计划
    function lottPlan(lott,gid,play) {
        $.ajax({
            url: "${ctx}/lott/yuce",
            type: "GET",
            data:{"lott":lott,"gid":gid.substring(gid.length-3),"play":play},
            success: function (data) {
                var guessMsg='';
                var result='';
                var win='';
                var liHtml='';
                var winMsg='';
                for(var i=0,j=0;i<data.data.yuce.length;i++){
                    if(play==''&& lott=='bjpk10'){
                        guessMsg='冠军大小'
                        winMsg='开'+data.data.lott[j].award.split(',')[0]
                        if(data.data.yuce[i].champNum < 5){
                            result='小'
                            if(data.data.lott[j].award.split(',')[0] < 5){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }else{
                            result='大'
                            if(data.data.lott[j].award.split(',')[0] > 5){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }
                    }
                    if(play=='DS'&& lott=='bjpk10'){
                        guessMsg='冠军单双'
                        winMsg='开'+data.data.lott[j].award.split(',')[0]
                        if(data.data.yuce[i].champNum % 2 ==0){
                            result='双'
                            if(data.data.lott[j].award.split(',')[0] % 2 ==0){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }else{
                            result='单'
                            if(data.data.lott[j].award.split(',')[0] % 2 !=0){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }
                    }
                    if(play=='1'&& lott=='bjpk10'){
                        guessMsg='冠军定位胆'
                        result=data.data.yuce[i].first;
                        winMsg='开'+data.data.lott[j].award.split(',')[0]
                        if(data.data.yuce[i].first.indexOf(data.data.lott[j].award.split(',')[0]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='2'&& lott=='bjpk10'){
                        guessMsg='亚军定位胆'
                        result=data.data.yuce[i].second;
                        winMsg='开'+data.data.lott[j].award.split(',')[1]
                        if(data.data.yuce[i].second.indexOf(data.data.lott[j].award.split(',')[1]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='3'&& lott=='bjpk10'){
                        guessMsg='第三名定位胆'
                        result=data.data.yuce[i].third;
                        winMsg='开'+data.data.lott[j].award.split(',')[2]
                        if(data.data.yuce[i].third.indexOf(data.data.lott[j].award.split(',')[2]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='4'&& lott=='bjpk10'){
                        guessMsg='第四名定位胆'
                        result=data.data.yuce[i].forth;
                        winMsg='开'+data.data.lott[j].award.split(',')[3]
                        if(data.data.yuce[i].forth.indexOf(data.data.lott[j].award.split(',')[3]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='5'&& lott=='bjpk10'){
                        guessMsg='第五名定位胆'
                        result=data.data.yuce[i].fifth;
                        winMsg='开'+data.data.lott[j].award.split(',')[4]
                        if(data.data.yuce[i].fifth.indexOf(data.data.lott[j].award.split(',')[4]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='6'&& lott=='bjpk10'){
                        guessMsg='第六名定位胆'
                        result=data.data.yuce[i].sixth;
                        winMsg='开'+data.data.lott[j].award.split(',')[5]
                        if(data.data.yuce[i].sixth.indexOf(data.data.lott[j].award.split(',')[5]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='7'&& lott=='bjpk10'){
                        guessMsg='第七名定位胆'
                        result=data.data.yuce[i].seventh;
                        winMsg='开'+data.data.lott[j].award.split(',')[6]
                        if(data.data.yuce[i].seventh.indexOf(data.data.lott[j].award.split(',')[6]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='8'&& lott=='bjpk10'){
                        guessMsg='第八名定位胆'
                        result=data.data.yuce[i].eighth;
                        winMsg='开'+data.data.lott[j].award.split(',')[7]
                        if(data.data.yuce[i].eighth.indexOf(data.data.lott[j].award.split(',')[7]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='9'&& lott=='bjpk10'){
                        guessMsg='第九名定位胆'
                        result=data.data.yuce[i].ninth;
                        winMsg='开'+data.data.lott[j].award.split(',')[8]
                        if(data.data.yuce[i].ninth.indexOf(data.data.lott[j].award.split(',')[8]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='10'&& lott=='bjpk10'){
                        guessMsg='第十名定位胆'
                        result=data.data.yuce[i].tenth;
                        winMsg='开'+data.data.lott[j].award.split(',')[9]
                        if(data.data.yuce[i].tenth.indexOf(data.data.lott[j].award.split(',')[9]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='1'&& lott=='ssc'){
                        guessMsg='万位定位胆'
                        result=data.data.yuce[i].first;
                        winMsg='开'+data.data.lott[j].award.split(',')[0]
                        if(data.data.yuce[i].first.indexOf(data.data.lott[j].award.split(',')[0]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play==''&& lott=='ssc'){
                        guessMsg='万位大小'
                        winMsg='开'+data.data.lott[j].award.split(',')[0]
                        if(data.data.yuce[i].champNum < 4){
                            result='小'
                            if(data.data.lott[j].award.split(',')[0] < 4){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }else{
                            result='大'
                            if(data.data.lott[j].award.split(',')[0] > 4){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }
                    }
                    if(play=='DS'&& lott=='ssc'){
                        guessMsg='万位单双'
                        winMsg='开'+data.data.lott[j].award.split(',')[0]
                        if(data.data.yuce[i].champNum % 2 ==0){
                            result='双'
                            if(data.data.lott[j].award.split(',')[0] % 2 ==0){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }else{
                            result='单'
                            if(data.data.lott[j].award.split(',')[0] % 2 !=0){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }
                    }
                    if(play=='2'&& lott=='ssc'){
                        guessMsg='千位定位胆'
                        result=data.data.yuce[i].second;
                        winMsg='开'+data.data.lott[j].award.split(',')[1]
                        if(data.data.yuce[i].second.indexOf(data.data.lott[j].award.split(',')[1]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='3'&& lott=='ssc'){
                        guessMsg='百位定位胆'
                        result=data.data.yuce[i].third;
                        winMsg='开'+data.data.lott[j].award.split(',')[2]
                        if(data.data.yuce[i].third.indexOf(data.data.lott[j].award.split(',')[2]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='4'&& lott=='ssc'){
                        guessMsg='十位定位胆'
                        result=data.data.yuce[i].forth;
                        winMsg='开'+data.data.lott[j].award.split(',')[3]
                        if(data.data.yuce[i].forth.indexOf(data.data.lott[j].award.split(',')[3]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play=='5'&& lott=='ssc'){
                        guessMsg='个位定位胆'
                        result=data.data.yuce[i].fifth;
                        winMsg='开'+data.data.lott[j].award.split(',')[4]
                        if(data.data.yuce[i].fifth.indexOf(data.data.lott[j].award.split(',')[4]) != -1 ){
                            win='中'
                            winClass="state-0"
                        }else{
                            win='错'
                            winClass="state-1"
                        }
                    }
                    if(play==''&& lott=='jsk3'){
                        guessMsg='和值大小'
                        var num=data.data.yuce[i].champNum.split(",");
                        var sum=parseInt(num[0])+parseInt(num[1])+parseInt(num[2]);
                        winMsg='开'+(parseInt(data.data.lott[j].award.split(',')[0])+parseInt(data.data.lott[j].award.split(',')[1])+parseInt(data.data.lott[j].award.split(',')[2]))
                        if(sum < 11){
                            result='小'
                            if((parseInt(data.data.lott[j].award.split(',')[0])+parseInt(data.data.lott[j].award.split(',')[1])+parseInt(data.data.lott[j].award.split(',')[2]) )< 11){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }else{
                            result='大'
                            if((parseInt(data.data.lott[j].award.split(',')[0])+parseInt(data.data.lott[j].award.split(',')[1])+parseInt(data.data.lott[j].award.split(',')[2]) )> 11){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }
                    }
                    if(play=='DS'&& lott=='jsk3'){
                        guessMsg='和值单双'
                        var num=data.data.yuce[i].champNum.split(",");
                        var sum=parseInt(num[0])+parseInt(num[1])+parseInt(num[2]);
                        winMsg='开'+(parseInt(data.data.lott[j].award.split(',')[0])+parseInt(data.data.lott[j].award.split(',')[1])+parseInt(data.data.lott[j].award.split(',')[2]))
                        if(sum % 2 ==0){
                            result='双'
                            if((parseInt(data.data.lott[j].award.split(',')[0])+parseInt(data.data.lott[j].award.split(',')[1])+parseInt(data.data.lott[j].award.split(',')[2]) ) % 2 ==0){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }else{
                            result='单'
                            if((parseInt(data.data.lott[j].award.split(',')[0])+parseInt(data.data.lott[j].award.split(',')[1])+parseInt(data.data.lott[j].award.split(',')[2]) ) % 2 !=0){
                                win='中'
                                winClass="state-0"
                            }else{
                                win='错'
                                winClass="state-1"
                            }
                        }
                    }
                    if(i==0){
                        liHtml+="<li>" +
                            data.data.lott[j].nextOpenIssue+"期 猜 "+guessMsg+"【"+result+"】"+
                            "<span class='state-2'>开</span>" +
                            "</li>"
                    }else{
                        liHtml+="<li>" +
                            data.data.lott[j].gid+"期 猜 "+guessMsg+"【"+result+"】"+winMsg+
                            " <span class='"+winClass+"'>"+win+"</span>" +
                            "</li>"
                        j++;
                    }
                }
                $(".plan-list").html(liHtml)
            }
        })
    }
	</script>
	<script type="text/javascript">
		var iframeFlag=true;
   		$("#addIframe").click(function(){
   			if(iframeFlag==true){
   				$(".bodyer").prepend("<iframe id='myFrameId' name='myFrameName' scrolling='auto' frameborder='0' style='width:100%;height:100%'></iframe>");
   			}
   			$("#closeIframe").show();
   			$('#bodyContent .container-fluid').hide();
   			iframeFlag=false;
   		});
   		$("#closeIframe").click(function(){
			$("#bodyContent")[0].firstChild.remove();
   			$("#closeIframe").hide();
   			$('#bodyContent .container-fluid').show();
   			iframeFlag=true;
	   	});
   		
    </script>
</body>
</html>