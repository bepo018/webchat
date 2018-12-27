<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>彩天下-聊天室</title>
    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_847013_28ixa94fann.css">
    <link rel="stylesheet" href="${ctx}/static/m/css/index.css">
    
    <script src="${ctx}/static/m/js/jquery.min.js"></script>

    <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
   
    <script type="text/javascript" src="${ctx}/static/m/js/jquery.qqFace.js"></script>
</head>
<body>
<div data-role="page" id="pageone">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <div class="chatHeader">
            <ul>
                <%--<li>
                    <a href="https://m.111ctx.com/login">登录</a>
                </li>--%>
                <li>
                    <%-- ${ctx}/static/m/--%>
                    <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
                </li>
                <%--<li>
                    <a href="https://m.111ctx.com/register?id=94649462">注册</a>
                </li>--%>
            </ul>
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#" class="nav-active">聊天</a>
                </li>
                <li>
                    <a href="#pagetwo">计划</a>
                </li>
                <li>
                    <a href="#pagethree" onclick="refreshFrame()" style="cursor:pointer;">投注</a>
                </li>
                <li>
                    <a href="#pagefour" onclick="getLottList()">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
        </div>
        <!-- 滚动区域 -->
        <div class="tip">
            <!-- 字体轮播 -->
            <div class="wordCarousel">
                <div>
                    <span>彩票</span>
                    <span>头条</span>
                </div>
                <div>
                    <marquee behavior="scroll" direction="left" scrollamount="5" <%--onmouseover="this.start()"--%>>
                        <%--20181215star增加跳转--%>
                        <a href="https://%31%31%31%63%74%78%2E%63%6F%6D/register?id=94649462" class="jump">温馨提示：欢迎光临彩天下，点击优惠活动查询领取，祝你游戏愉快</a>
                    </marquee>
                </div>
            </div>
            <!-- 开奖播报 -->
            <%--<div class="rewordCarousel show-page-loading-msg" data-textonly="false" data-textvisible="false"
                 data-msgtext="" data-inline="true">
                <div class="scroll-wap">
                    <ul class="swiper-wrapper">
                        <span><img src="${ctx}/static/m/images/chat/loadlong.gif" alt=""></span>
                    </ul>
                </div>
            </div>--%>
        </div>
    </div>
    <div data-role="main">
        <!-- 聊天区域 -->
        <div class="chatlist" id="chat-view" onclick="$.mobile.silentScroll(10000);">
            <ul id="chat">
            
            </ul>
        </div>
    </div>
    <div data-role="footer" data-position="fixed" data-tap-toggle="false">
        <!-- 输入区域 -->
        <div class="chat-input">
            <i class="icon-add"></i>
            <i class="icon-face"></i>
            <input type="text" placeholder="这里输入你想发送的信息..." id="saytext" name="saytext">
            <i class="icon-send" id="sendInfo"></i>

        </div>
        <!-- 表情选择区域 -->
        <div class="emoji" style="display:none;">
            <div id="gif" class="emojiListOne" style="display:none;">
                <div>
                    <img id="lottery_01" src="${ctx}/static/m/images/chat/lottery/lottery_1.gif" alt="">
                </div>
                <div>
                    <img id="lottery_02" src="${ctx}/static/m/images/chat/lottery/lottery_2.gif" alt="">
                </div>
                <div>
                    <img id="lottery_03" src="${ctx}/static/m/images/chat/lottery/lottery_3.gif" alt="">
                </div>
                <div>
                    <img id="lottery_04" src="${ctx}/static/m/images/chat/lottery/lottery_4.gif" alt="">
                </div>
                <div>
                    <img id="lottery_05" src="${ctx}/static/m/images/chat/lottery/lottery_5.gif" alt="">
                </div>
                <div>
                    <img id="lottery_06" src="${ctx}/static/m/images/chat/lottery/lottery_6.gif" alt="">
                </div>
                <div>
                    <img id="lottery_07" src="${ctx}/static/m/images/chat/lottery/lottery_7.gif" alt="">
                </div>
                <div>
                    <img id="lottery_08" src="${ctx}/static/m/images/chat/lottery/lottery_8.gif" alt="">
                </div>
                <div>
                    <img id="lottery_09" src="${ctx}/static/m/images/chat/lottery/lottery_9.gif" alt="">
                </div>
                <div>
                    <img id="lottery_10" src="${ctx}/static/m/images/chat/lottery/lottery_10.gif" alt="">
                </div>
                <div>
                    <img id="lottery_11" src="${ctx}/static/m/images/chat/lottery/lottery_11.gif" alt="">
                </div>
                <div>
                    <img id="lottery_12" src="${ctx}/static/m/images/chat/lottery/lottery_12.gif" alt="">
                </div>
                <div>
                    <img id="lottery_13" src="${ctx}/static/m/images/chat/lottery/lottery_13.gif" alt="">
                </div>
                <div>
                    <img id="lottery_14" src="${ctx}/static/m/images/chat/lottery/lottery_14.gif" alt="">
                </div>
                <div>
                    <img id="lottery_15" src="${ctx}/static/m/images/chat/lottery/lottery_15.gif" alt="">
                </div>
                <div>
                    <img id="lottery_16" src="${ctx}/static/m/images/chat/lottery/lottery_16.gif" alt="">
                </div>
                <div>
                    <img id="lottery_17" src="${ctx}/static/m/images/chat/lottery/lottery_17.gif" alt="">
                </div>
                <div>
                    <img id="lottery_18" src="${ctx}/static/m/images/chat/lottery/lottery_18.gif" alt="">
                </div>
                <div>
                    <img id="lottery_19" src="${ctx}/static/m/images/chat/lottery/lottery_19.gif" alt="">
                </div>
                <div>
                    <img id="lottery_20" src="${ctx}/static/m/images/chat/lottery/lottery_20.gif" alt="">
                </div>
                <div>
                    <img id="lottery_21" src="${ctx}/static/m/images/chat/lottery/lottery_21.gif" alt="">
                </div>
                <div>
                    <img id="lottery_22" src="${ctx}/static/m/images/chat/lottery/lottery_22.gif" alt="">
                </div>
                <div>
                    <img id="lottery_23" src="${ctx}/static/m/images/chat/lottery/lottery_23.gif" alt="">
                </div>
                <div>
                    <img id="lottery_24" src="${ctx}/static/m/images/chat/lottery/lottery_24.gif" alt="">
                </div>
                <div>
                    <img id="lottery_25" src="${ctx}/static/m/images/chat/lottery/lottery_25.gif" alt="">
                </div>
                <div>
                    <img id="lottery_26" src="${ctx}/static/m/images/chat/lottery/lottery_26.gif" alt="">
                </div>
                <div>
                    <img id="lottery_27" src="${ctx}/static/m/images/chat/lottery/lottery_27.gif" alt="">
                </div>
                <div>
                    <img id="lottery_28" src="${ctx}/static/m/images/chat/lottery/lottery_28.gif" alt="">
                </div>
                <div>
                    <img id="lottery_29" src="${ctx}/static/m/images/chat/lottery/lottery_29.gif" alt="">
                </div>
                <div>
                    <img id="lottery_30" src="${ctx}/static/m/images/chat/lottery/lottery_30.gif" alt="">
                </div>
            </div>
            <!-- 表情 -->
            <div class="emojiListTwo">

            </div>
            <div class="emojiItems">
                <div class="itm active">
                    <img src="${ctx}/static/m/images/chat/emoji1_avatar.png" alt="">
                </div>
                <div class="itm-face">
                    <span></span>
                </div>
            </div>
        </div>
    </div>
    <!-- 中奖播报 -->
    <div class="prize-wrap">
        <ul>
            <li id="winInfo">
                <%--展示中奖信息--%>
            </li>
        </ul>
    </div>
</div>
<!-- plan页面 -->
<div data-role="page" id="pagetwo">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <div class="planHeader">


            <!-- 201812081006star -->
            <div></div>
            <div>
                <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
            </div>
            <div>
                <div class="toggleButton">切换计划</div>
                <div class="icon-toggle">
                    <ul class="togglePlan">
                        <li >冠军大小</li>
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
            <!-- 201812081006end -->
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#pageone">聊天</a>
                </li>
                <li>
                    <a href="#" class="nav-active">计划</a>
                </li>
                <li>
                    <a href="#pagethree" onclick="refreshFrame()" style="cursor:pointer;">投注</a>
                </li>
                <li>
                    <a href="#pagefour" onclick="getLottList()">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
        </div>
        <!-- 滚动区域 -->
        <div class="tip">
            <!-- 字体轮播 -->
            <div class="wordCarousel">
                <div>
                    <span>彩票</span>
                    <span>头条</span>
                </div>
                <div>
                    <marquee behavior="scroll" direction="left" scrollamount="5" <%--onmouseover="this.start()"--%>>
                        <%--20181215star增加跳转--%>
                        <a href="https://%31%31%31%63%74%78%2E%63%6F%6D/register?id=94649462" class="jump">温馨提示：欢迎光临彩天下，点击优惠活动查询领取，祝你游戏愉快</a>
                    </marquee>
                </div>
            </div>

        </div>
    </div>
    <div data-role="main">
        <ul class="plan-tab">
            <li class="pk10">
                <img src="${ctx}/static/m/images/chat/cz-pk10.png" alt="">
                <p>北京赛车</p>
            </li>
            <li class="ssc">
                <img src="${ctx}/static/m/images/chat/cz-cq_ssc.png" alt="">
                <p>重庆时时彩</p>
            </li>
            <li class="jsk3">
                <img src="${ctx}/static/m/images/chat/cz-ah_k3.png" alt="">
                <p>江苏快三</p>
            </li>
        </ul>
        <div>
            <div class="plan-pk10">
                <div class="plan-win">
                    <div class="planinfo">
                    </div>
                    <div class="win-ball">
                        <div class="plan-ball-pk10 pk10-code">
                            <span><img src="${ctx}/static/m/images/chat/loadlong.gif" alt=""></span>
                        </div>
                    </div>
                </div>
                <div class="plan-main">
                    <div class="plan-tip">
                        <%--201812031300star--%>
                        <div class="rewordHistory">开奖历史</div>
                        <div class="rewordForecast">开奖预测</div>
                        <%--201812031300end--%>
                    </div>
                    <div class="plan-mains">
                        <ul class="plan-listTip">
                            <li>
                                <div>期号</div>
                                <div>开奖号码</div>
                            </li>
                        </ul>
                        <!-- 开奖区域 -->
                        <ul class="plan-list pk10List" id="PK-history">
                        </ul>
                    </div>
                    <!--201812031312star 开奖预测页面 star-->
                    <div class="plan-mains hide">
                        <ul class="plan-listTip">
                            <li class="Forecast">
                                <div>期号</div>
                                <div>预测结果</div>
                            </li>
                        </ul>
                        <!-- 开奖区域 -->
                        <ul class="plan-list pk10ForecastList">
                        </ul>
                    </div>
                    <!--201812031312star 开奖预测页面 end-->
                </div>
            </div>
            <div class="plan-cqssc">
                <div class="plan-win">
                    <div class="planinfo">

                    </div>
                    <div class="win-ball">
                        <div class="plan-ball-ssc cqssc-code">
                            <img src="${ctx}/static/m/images/chat/loadlong.gif" alt="">
                        </div>
                    </div>
                </div>
                <div class="plan-main">
                    <div class="plan-tip">
                        <%--201812031300star--%>
                        <div class="rewordHistory">开奖历史</div>
                        <div class="rewordForecast">开奖预测</div>
                            <%--201812031300end--%>
                    </div>
                    <div class="plan-mains">
                        <ul class="plan-listTip">
                            <li>
                                <div>期号</div>
                                <div>开奖号码</div>
                            </li>
                        </ul>
                        <ul class="plan-list cqsscList" id="SSC-history">

                        </ul>
                    </div>
                    <!--201812031312star 开奖预测页面 star-->
                    <div class="plan-mains hide">
                        <ul class="plan-listTip">
                            <li class="Forecast">
                                <div>期号</div>
                                <div>预测结果</div>
                            </li>
                        </ul>
                        <!-- 开奖区域 -->
                        <ul class="plan-list sscForecastList">
                        </ul>
                    </div>
                    <!--201812031312star 开奖预测页面 end-->
                </div>
            </div>
            <div class="plan-jsk3">
                <div class="plan-win">
                    <div class="planinfo">

                    </div>
                    <div class="win-ball">
                        <div class="plan-ball-ssc jsk3-code">
                            <img src="${ctx}/static/m/images/chat/loadlong.gif" alt="">
                        </div>
                    </div>
                </div>
                <div class="plan-main">
                    <div class="plan-tip">
                        <%--201812031300star--%>
                        <div class="rewordHistory">开奖历史</div>
                        <div class="rewordForecast">开奖预测</div>
                        <%--201812031300end--%>
                    </div>
                    <div class="plan-mains">
                        <ul class="plan-listTip">
                            <li>
                                <div>期号</div>
                                <div>开奖号码</div>
                            </li>
                        </ul>
                        <ul class="plan-list jsk3List" id="KS-history">

                        </ul>
                    </div>
                    <!--201812031312star 开奖预测页面 star-->
                    <div class="plan-mains hide">
                        <ul class="plan-listTip">
                            <li class="Forecast">
                                <div>期号</div>
                                <div>预测结果</div>
                            </li>
                        </ul>
                        <!-- 开奖区域 -->
                        <ul class="plan-list jsk3ForecastList">
                        </ul>
                    </div>
                    <!--201812031312star 开奖预测页面 end-->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- bet页面 -->
<div data-role="page" id="pagethree">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <div class="planHeader">
            <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#pageone">聊天</a>
                </li>
                <li>
                    <a href="#pagetwo">计划</a>
                </li>
                <li>
                    <a href="#" class="nav-active">投注</a>
                </li>
                <li>
                    <a href="#pagefour" onclick="getLottList()">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
        </div>
        <!-- 滚动区域 -->
        <div class="tip">
            <!-- 字体轮播 -->
            <div class="wordCarousel">
                <div>
                    <span>彩票</span>
                    <span>头条</span>
                </div>
                <div>
                    <marquee behavior="scroll" direction="left" scrollamount="5" <%--onmouseover="this.start()"--%>>
                        <%--20181215star增加跳转--%>
                        <a href="https://%31%31%31%63%74%78%2E%63%6F%6D/register?id=94649462" class="jump">温馨提示：欢迎光临彩天下，点击优惠活动查询领取，祝你游戏愉快</a>
                    </marquee>
                </div>
            </div>

        </div>
    </div>
    <div data-role="main">
        <div class="loadbet" >
        </div>
    </div>
</div>
<!-- reword页面 -->
<div data-role="page" id="pagefour">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <div class="planHeader">
            <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#pageone">聊天</a>
                </li>
                <li>
                    <a href="#pagetwo">计划</a>
                </li>
                <li>
                    <a href="#pagethree"  onclick="refreshFrame()" style="cursor:pointer;">投注</a>
                </li>
                <li>
                    <a href="#" class="nav-active" onclick="getLottList()">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
        </div>
        <!-- 滚动区域 -->
        <div class="tip">
            <!-- 字体轮播 -->
            <div class="wordCarousel">
                <div>
                    <span>彩票</span>
                    <span>头条</span>
                </div>
                <div>
                    <marquee behavior="scroll" direction="left" scrollamount="5" <%--onmouseover="this.start()"--%>>
                        <%--20181215star增加跳转--%>
                        <a href="https://%31%31%31%63%74%78%2E%63%6F%6D/register?id=94649462" class="jump">温馨提示：欢迎光临彩天下，点击优惠活动查询领取，祝你游戏愉快</a>
                    </marquee>
                </div>
            </div>

        </div>
    </div>

    <div data-role="main">
        <ul class="reword-page">
            <img src="${ctx}/static/m/images/chat/loadReword.gif" alt="" style="width:100vw;">
        </ul>
    </div>

</div>
<!-- course页面 -->
<div data-role="page" id="pagefive">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <div class="planHeader">
            <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#pageone">聊天</a>
                </li>
                <li>
                    <a href="#pagetwo">计划</a>
                </li>
                <li>
                    <a href="#pagethree"  onclick="refreshFrame()" style="cursor:pointer;">投注</a>
                </li>
                <li>
                    <a href="#pagefour" onclick="getLottList()">开奖</a>
                </li>
                <li>
                    <a href="#" class="nav-active">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
        </div>
        <!-- 滚动区域 -->
        <div class="tip">
            <!-- 字体轮播 -->
            <div class="wordCarousel">
                <div>
                    <span>彩票</span>
                    <span>头条</span>
                </div>
                <div>
                    <marquee behavior="scroll" direction="left" scrollamount="5" <%--onmouseover="this.start()"--%>>
                        <%--20181215star增加跳转--%>
                        <a href="https://%31%31%31%63%74%78%2E%63%6F%6D/register?id=94649462" class="jump">温馨提示：欢迎光临彩天下，点击优惠活动查询领取，祝你游戏愉快</a>
                    </marquee>
                </div>
            </div>

        </div>
    </div>

    <div data-role="content">
        <!-- 教程入口页面 -->
        <ul class="course-list">
            <li>
                <img src="${ctx}/static/m/images/chat/register-course.png" alt="">
            </li>
            <li>
                <img src="${ctx}/static/m/images/chat/chongzhi-course.png" alt="">
            </li>
            <li>
                <img src="${ctx}/static/m/images/chat/bet-course.png" alt="">
            </li>
            <li>
                <img src="${ctx}/static/m/images/chat/tixian-course.png" alt="">
            </li>
            <li>
                <img src="${ctx}/static/m/images/chat/daili-course.png" alt="">
            </li>
            <!--20181218star-->
            <li>
                <img src="${ctx}/static/m/images/chat/cun-course.png" alt="">
            </li>
            <!--20181218end-->
        </ul>
        <!-- 201812091515star -->
        <div class="course-content hide">
            <div class="course-close">
                <span></span>
            </div>
            <ul class="imgContent">
            </ul>
        </div>
        <!-- 201812091515end-->

    </div>

</div>
<!-- live页面 -->
<div data-role="page" id="pagesix">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <div class="planHeader">
            <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#pageone">聊天</a>
                </li>
                <li>
                    <a href="#pagetwo">计划</a>
                </li>
                <li>
                    <a href="#pagethree"  onclick="refreshFrame()" style="cursor:pointer;">投注</a>
                </li>
                <li>
                    <a href="#pagefour" onclick="getLottList()">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix" class="nav-active">直播</a>
                </li>
            </ul>
        </div>
        <!-- 滚动区域 -->
        <div class="tip">
            <!-- 字体轮播 -->
            <div class="wordCarousel">
                <div>
                    <span>彩票</span>
                    <span>头条</span>
                </div>
                <div>
                    <marquee behavior="scroll" direction="left" scrollamount="5" <%--onmouseover="this.start()"--%>>
                        <%--20181215star增加跳转--%>
                        <a href="https://%31%31%31%63%74%78%2E%63%6F%6D/register?id=94649462" class="jump">温馨提示：欢迎光临彩天下，点击优惠活动查询领取，祝你游戏愉快</a>
                    </marquee>
                </div>
            </div>

        </div>
    </div>
	
	<div data-role="content">
        <!-- 直播页面 -->
        <div class="live-list">
        </div>
        <!-- 进入直播 -->
        <div class="live-detail hide">
            <div class="detail-page">
               <div class="video-close">
                  <i class="iconfont icon-close"></i>
               </div>
               <div id="reLive">
               </div>
               
             </div>
                
        </div>
    </div>
    
</div>
<script src="${ctx}/static/m/js/index.ui.js"></script>
<script src="${ctx}/static/m/js/index.js"></script>

<script type="text/javascript">

    var wsServer = null;
    var ws = null;

    //默认连接
    $(function () {
        //TODO 清屏未处理
        //clearConsole();
        getConnection("bjsc");
        
      
    });

    //监听消息发送
    $("#sendInfo").on("tap", function () {

        // 获取输入的textarea里面的内容
        var str = $("#saytext").val();
        // 提交后展示区的内容
        var strContent=replace_em(str);
        sendMessage(strContent);
        $("#saytext").val("");
        $(".emoji").hide();
    })
    //处理message 文字图像转换
    function replace_em(str){
        // 替代小于号
        str = str.replace(/\</g,'<');
        // 替代大于号
        str = str.replace(/\>/g,'>');
        // 换行
        str = str.replace(/\n/g,'<br/>');

        str = str.replace(/\[em_([0-9]*)\]/g,'<img src="./static/m/face/$1.gif" border="0"/>');
        return str;
    }

    //绑定 回车发送事件
    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                sendMessage();
                event.cancelBubble = true;
                event.preventDefault();
                event.stopPropagation();
            }
        })
    });

    //清空聊天区内容
    function clearConsole() {
        $("#chat").html("");
    }

    //获取连接
    function getConnection(whoClick) {
        if (ws == null) {
            wsServer = "wss://" + location.host + "${pageContext.request.contextPath}" + "/chatServer/" + whoClick;
            ws = new WebSocket(wsServer);
            ws.onopen = function (evt) {
            };
            ws.onmessage = function (evt) {
                if ($("#chat li").length >= 50) {
                    for (var i = 0; i < 10; i++) {
                        $("#chat li")[i].remove();
                    }
                    $("#chat li")[0].remove();
                }
                analysisMessage(evt.data);
            };
            ws.onerror = function (evt) {
                // layer.msg("产生异常", { offset: 0});
                console.log("产生异常");
            };
            ws.onclose = function (evt) {
                console.log("已经关闭连接");
                // layer.msg("已经关闭连接", { offset: 0});
            };

        } else {
            console.log("连接已存在")
            // layer.msg("连接已存在!", { offset: 0, shift: 6 });
        }

    }

    //----------消息相关--------------

    //发送消息
    function sendMessage() {
        if (ws == null) {
            return;
        }
        var message = $("#saytext").val();
        var to = $("#sendto").text() == "全体成员" ? "" : $("#sendto").text();
        if (message == null || message == "") {
            return;
        }
        ws.send(JSON.stringify({
            message: {
                content: message,
                from: '${userid}',
                to: to,
                time: getDateFull(),
                level: '${level}',
                headmsg: '${headmsg}'
            },
            type: "message"
        }));
        $("#saytext").val("");
    }

    //解析消息类型
    function analysisMessage(message) {
        message = JSON.parse(message);
        if (message.type == "message") {
            showChat(message.message);
        } else if (message.type == "messageRobot") {
            robotChat(message.message);
        } else if (message.type == "notice") {
            showNotice(message.message);
        } else if (message.type == "noticeRobot") {
            showNotice(message.message);
        } else if (message.type == "noticeWin") {
            showWinNotice(message.message);
        } else if (message.type == "betting") {
            showNotice(message.message);
        } else if (message.type == "out") {
            cleanOut(message.message);
        }else if(message.type == "warning"){ //警告
            warning(message.message);
        }
    }

    function warning(notice) {
        $("#chat").append("<li class='enter-chat-room'><p style='color: red;background-color: pink;'>" + notice + "</p></li>");
        scroll();
    }

    //展示中奖
    function showWinNotice(winInfo) {
        $("#winInfo").html("<img src='${ctx}/static/images/qiqiu.png'><span>" + winInfo + "</span>");
        chab();
       
    }

    //展示进入房间
    function showNotice(notice) {
        $("#chat").append("<li class='enter-chat-room'><p>" + notice + "</p></li>");
        scroll();
    }

    //展示用户聊天内容
    function showChat(message) {
        var reg = /^lottery_\d{2}$/;
        if (reg.test(message.content)) {
            message.content = "<img id=" + message.content + " src='${ctx}/static/images/lottery/" + message.content + ".gif' alt='' style='width:13vw;'>"
            var isSef1 = '${userid}' == message.from ? "chat-right" : "chat-left";
            var html = "";
            var img = "";
            if (message.level == 4) {
                img = "id_ZM.png";
            } else if (message.level == 3) {
                img = "id_BM.png";
            } else if (message.level == 2) {
                img = "id_BY.png";
            } else {
                img = "id_YK.png";
            }
            if ((message.to != "" || message.to == null) && '${userid}' != message.from) {
                message.to = " " + message.from + " @你";
            } else if ((message.to != "" || message.to == null) && '${userid}' == message.from) {
                message.to = " 你@ " + message.to;
            }

            html = "<li class='" + isSef1 + "'>" +
                "<img src='${ctx}/static/images/avater/" + message.headmsg + "'>" +
                "<div>" +
                "<p>" +
                "<img src='${ctx}/static/images/" + img + "'>" +
                "<span>" + message.from.slice(0, 2) + "***" + message.from.slice(message.from.length - 2) + "</span>" +
                "<span>" + message.time + "</span>" +
                "</p>" +
                "<div>" +
                "<div class='pf' style='background:#fff;'>" + message.content + "</div>" +
                "</div>" +
                "</div>" +
                "</li>";

            $("#chat").append(html);
            scroll();
        } else {
            var isSef1 = '${userid}' == message.from ? "chat-right" : "chat-left";
            var html = "";
            var img = "";
            if (message.level == 4) {
                img = "id_ZM.png";
            } else if (message.level == 3) {
                img = "id_BM.png";
            } else if (message.level == 2) {
                img = "id_BY.png";
            } else {
                img = "id_YK.png";
            }
            if ((message.to != "" || message.to == null) && '${userid}' != message.from) {
                message.to = " " + message.from + " @你";
            } else if ((message.to != "" || message.to == null) && '${userid}' == message.from) {
                message.to = " 你@ " + message.to;
            }

            var msg = replace_em(message.content)
            html = "<li class='" + isSef1 + "'>" +
                "<img src='${ctx}/static/images/avater/" + message.headmsg + "'>" +
                "<div>" +
                "<p>" +
                "<img src='${ctx}/static/images/" + img + "'>" +
                "<span>" + message.from.slice(0, 2) + "***" + message.from.slice(message.from.length - 2) + "</span>" +
                "<span>" + message.time + "</span>" +
                "</p>" +
                "<div>" +
                "<div class='pf'>" + msg + "</div>" +
                "</div>" +
                "</div>" +
                "</li>";

            $("#chat").append(html);
            scroll();
        }
    }

    //展示机器人聊天内容
    function robotChat(message) {
        var num = parseInt(Math.random() * 137, 10);
        var arr = ["id_ZM.png", "id_HM.png", "id_BM.png"];
        var index = Math.floor((Math.random() * arr.length));
        var inde = arr[index];
        var html =
            "<li class='chat-left'>" +
            "<img src='${ctx}/static/images/avater/avater" + num + ".png' alt=''>" +
            "<div>" +
            "<p>" +
            "<img src='${ctx}/static/images/" + inde + "' alt=''>" +
            "<span>&nbsp&nbsp" + message.from + "&nbsp&nbsp</span>" +
            "<span>" + message.time + "</span>" +
            "</p>" +
            "<div>" +
            "<div class='pf'>" + message.content + "</div>" +
            "</div>" +
            "</div>" +
            "</li>"
        $("#chat").append(html);
        scroll();
    }

    function appendZero(s) {
        return ("00" + s).substr((s + "").length);
    }

    //获取完整时间
    function getDateFull() {
        var date = new Date();
        var currentdate = date.getFullYear() + "-" + appendZero(date.getMonth() + 1) + "-" + appendZero(date.getDate()) + " " + appendZero(date.getHours()) + ":" + appendZero(date.getMinutes()) + ":" + appendZero(date.getSeconds());
        return currentdate;
    }

    //---------发送图片相关---------------

    //获取并发送图片表情
    $("#gif").click(function (e) {
        sendgif(e.target.id)
    })

    //发送图片表情
    function sendgif(gif) {
        if (ws == null) {
            return;
        }
        if (gif == "")
            return;
        ws.send(JSON.stringify({
            message: {
                content: gif,
                from: '${userid}',
                to: "",
                time: getDateFull(),
                level: '${level}',
                headmsg: '${headmsg}'
            },
            type: "message"
        }));
        $(".emoji").hide();
    }


    //关闭连接
    function closeConnection() {
        if (ws != null) {
            ws.close();
            ws = null;
        } else {
        }
    }
    
 // 第四个页面
 //进入投注页面默认刷新
        function refreshFrame(){


            //判断用户终端类型
            if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
                //判断是ios用户的时候执行某种操作--%>
                var tempwindow=window.open('${ctx}/#pagethree?'+(new Date()).getTime(),'_self'); // 先打开页面

           } else{
                //判断是安卓用户的时候执行某种操作--%>
                window.location.reload(true);
            }


        }
    function getLottList(){
        var a=setTimeout(function(){
            $.ajax({
                url: "${ctx}/lott/allLottList",
                type:"POST",
                //dataType:'json',
                success:function(data){
                    $(".reword-page").html("");
                    var html="",liHtml="";
                    for(var i=0;i<data.data.length;i++){
                    	html="";
                    	var msgLott=data.data[i][0].award.split(",");
                    	for(var j=0;j<msgLott.length;j++){
                            html+="<span class='reword-ball'><strong>"+msgLott[j]+"</strong></span>"
                        }
                    	liHtml="<li>"+
	                        "<div class='list-logo'>"+
	                            "<img src='${ctx}/static/images/lotttype/"+data.data[i][0].lott+".png' alt=''>"+
	                        "</div>"+
	                        "<div class='list-detail'>"+
	                            "<div class='title'>"+
	                                "<span>"+data.data[i][0].cnName+"</span>"+
	                                "<span>"+data.data[i][0].time+"</span>"+
	                            "</div>"+
	                            "<div class='period'>"+data.data[i][0].gid+"</div>"+
	                            "<div class='ui-list-balls'>"+
		                            "<span>"+
		                                	html+
	                            	"</span>"+
	                            "</div>"+
	                        "</div>"+
	                    "</li>";
	                    $(".reword-page").append(liHtml);
                    }
                }
            }) 
            clearTimeout(a);
            a=null;
        },4000)   
    }
 
	//获得彩票数据
	function getCaipiaoMsg(lott){
	    $.ajax({
	        url: "${ctx}/lott/first/"+lott,
	        type:"POST",
	        dataType:'json',
	        success:function(data){
	        	var mId="";
	           	var sId="";
	           	var trueTime=data.time + 120000;  //正常开奖时间延时120秒
	           	var m = parseInt(trueTime/1000 / 60.0);
	           	var s = Math.ceil((parseFloat(trueTime/1000 / 60.0) -
	                        parseInt(trueTime/1000 / 60.0)) * 60);
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
                    // 201812031354调用预测历史记录star
                    var forecastPage="";
                    var code=data.data[0].nextOpenIssue;
                    var codeList=data.yuce.split(',');

                    getForecast(codeList,code,forecastPage,'pk10ForecastList');
                    // 201812031354调用预测历史记录end
               	 $("#PK-history").html("");
               	 $(".PK-history").children(":first").next().children(":first").next().html("");
               	 lottName="北京赛车";
               	 lottBallHtml="<div class='plan-ball-pk10 pk10-code'>"+
	                     "<span class='planball ball-"+numList[0]+"'>"+numList[0]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[1]+"'>"+numList[1]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[2]+"'>"+numList[2]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[3]+"'>"+numList[3]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[4]+"'>"+numList[4]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[5]+"'>"+numList[5]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[6]+"'>"+numList[6]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[7]+"'>"+numList[7]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[8]+"'>"+numList[8]+"</span>&nbsp;"+
	                     "<span class='planball ball-"+numList[9]+"'>"+numList[9]+"</span>&nbsp;"+
                	 "</div>";
               	 HTML=$(".plan-pk10").find(".plan-win:first");
               	 mId="minute";
               	 sId="second";
               	 var pkhistoryHtml="";
	                 for(var i=0;i<data.data.length;i++){
	                	 var pkhistoryList=data.data[i].award.split(",");
	                	 pkhistoryHtml="<li>"+
                            "<div>"+data.data[i].gid+"</div>"+
                            "<div class='plan-ball-pk10 pk10Item'>"+
	                             "<span class='planball ball-"+pkhistoryList[0]+"'>"+pkhistoryList[0]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[1]+"'>"+pkhistoryList[1]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[2]+"'>"+pkhistoryList[2]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[3]+"'>"+pkhistoryList[3]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[4]+"'>"+pkhistoryList[4]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[5]+"'>"+pkhistoryList[5]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[6]+"'>"+pkhistoryList[6]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[7]+"'>"+pkhistoryList[7]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[8]+"'>"+pkhistoryList[8]+"</span>&nbsp;"+
			                     "<span class='planball ball-"+pkhistoryList[9]+"'>"+pkhistoryList[9]+"</span>&nbsp;"+
                            "</div>"
                        "</li>";
			             $("#PK-history").append(pkhistoryHtml);
	                 }
                }else if(lott=="ssc"){

                    // 201812031354调用预测历史记录star
                    var forecastPage="";
                    var code=data.data[0].nextOpenIssue;
                    var codeList=data.yuce.split(',');

                    getForecast(codeList,code,forecastPage,'sscForecastList');
                    // 201812031354调用预测历史记录end

	               	 $("#SSC-history").html("");
	            	 $(".SSC-history").children(":first").next().children(":first").next().html("");
	            	 lottName="重庆时时彩";
	            	 lottBallHtml="<div class='plan-ball-ssc cqssc-code'>"+
			              "<span>"+numList[0]+"</span>"+
			              "<span>"+numList[1]+"</span>"+
			              "<span>"+numList[2]+"</span>"+
			              "<span>"+numList[3]+"</span>"+
			              "<span>"+numList[4]+"</span>"+
	      	  		  "</div>";
	            	 HTML=$(".plan-cqssc").find(".plan-win:first");
	            	 mId="minute1";
	            	 sId="second1";
	            	 var schistoryHtml="";
	                 for(var i=0;i<data.data.length;i++){
	                	 var schistoryList=data.data[i].award.split(",");
	                	 schistoryHtml="<li>"+
	                	 	 "<div>"+data.data[i].gid+"</div>"+
	                         "<div class='plan-ball-ssc cqsscItem'>"+
		                         "<span>"+schistoryList[0]+"</span>"+
		                         "<span>"+schistoryList[1]+"</span>"+
		                         "<span>"+schistoryList[2]+"</span>"+
		                         "<span>"+schistoryList[3]+"</span>"+
		                         "<span>"+schistoryList[4]+"</span>"+
	                         "</div>"+
	                     "</li>";
			             $("#SSC-history").append(schistoryHtml);
	                 }
             }else{

                    // 201812031354调用预测历史记录star
                    var forecastPage="";
                    var code=data.data[0].nextOpenIssue;
                    var codeList=data.yuce.split(',');

                    getForecast(codeList,code,forecastPage,'jsk3ForecastList');
                    // 201812031354调用预测历史记录end

            	 $("#KS-history").html("");
            	 $(".KS-history").children(":first").next().children(":first").next().html("");
            	 lottName="江苏快三";
            	 lottBallHtml="<div class='plan-ball-ssc cqssc-code'>"+
		              "<span>"+numList[0]+"</span>"+
		              "<span>"+numList[1]+"</span>"+
		              "<span>"+numList[2]+"</span>"+
 	  		     "</div>";
            	 HTML=$(".plan-jsk3").find(".plan-win:first");
            	 mId="minute2";
            	 sId="second2";
            	 var kshistoryHtml="";
                 for(var i=0;i<data.data.length;i++){
                	 var kshistoryList=data.data[i].award.split(",");
                	 kshistoryHtml="<li>"+
                	 	"<div>"+data.data[i].gid+"</div>"+
                	 	"<div class='plan-ball-ssc cqsscItem'>"+
                             "<span>"+kshistoryList[0]+"</span>"+
                             "<span>"+kshistoryList[1]+"</span>"+
                             "<span>"+kshistoryList[2]+"</span>"+
                         "</div>"
                     "</li>";
		             $("#KS-history").append(kshistoryHtml);
                 }

             }
                adHtml += "<div class='planinfo'>"+
	                "<span class='plan-name'>"+lottName+"</span> 第 "+
	                "<span class='current'>"+arr.gid+"期</span> 下期倒计时："+
	                "<span class='djs'>"+
		                "<span style='color:red;' class='getm' id='"+mId+"'></span> 分"+
		                "<span style='color:red;' class='gets' id='"+sId+"'></span> 秒"+
	                "</span>"+
	            "</div>"+
	            "<div class='win-ball'>"+
	            	lottBallHtml+
	            "</div>";
	            HTML.html(adHtml);
	        }
	    })
	}
	//拼接直播
    $(function () {

        $.getJSON("${ctx}/live/getLiveInfo", function (Obj) {
            var htmllist = "";
            var htmlpageList=[];
   
            var htmlpage="";
            for (var i = 0; i < Obj.data.length; i++) {
            	var randomnumber2=Math.floor(Math.random()*100000);
                htmllist += '<div class="item">' +
                    '<div class="avatar" id=>' +
                    '<img src="' + Obj.data[i].photo + '">' +
                    '<div class="hot">' + Obj.data[i].hot + '</div>' +
                    '</div>' +
                    '<div class="name">' + Obj.data[i].name + '</div>' +
                    '</div>'
               htmlpage = '<video  autoplay width="100%" height="' + window.screen.height + '"  frameborder="0" scrolling="no" src="' + Obj.data[i].roomAddress + '?_'+new Date().getTime()+'"></video>'
            	
                htmlpageList.push(htmlpage);
           
            }
    
            $(".live-list").html(htmllist);
           /*  $(".live-detail").html(hmtlpage); */


            $('.item').each(function(index,element){
                $(this).on('tap',function(){
                    $(this).parent().next().removeClass("hide").children().eq(index).removeClass("hide").addClass("show").siblings().removeClass("show").addClass("hide");
                    $("#reLive").html(htmlpageList[index]);
                    
                })
            })

            // 房间点击按钮
            $('.video-close').on("tap",function () {
                 $(this).parent().parent().addClass("hide");
                 $("#reLive").html("");
            })

        });

        // 201812141255star
        // 判断安卓或者ios
         var ua = window.navigator.userAgent.toLowerCase();
        // //console.log(ua)
         if(ua.indexOf("android")!=-1){
             var a=window.screen.height-88.3;
             var repage="";
             var randomnumber=Math.floor(Math.random()*100000);
             repage+='<iframe id="myframe" src="https://%31%31%31%63%74%78%2E%63%6F%6D?_='+(new Date()).getTime()+'" frameborder="0"  scrolling="auto" style="height:'+a+'px"></iframe>'


         }else {
            var a=window.screen.height+100;
             var repage="";
             var randomnumber=Math.floor(Math.random()*100000);
             //repage+='<iframe id="myframe" src="https://m.111ctx.com?_='+(new Date()).getTime()+'" frameborder="0"  scrolling="auto" style="height:'+a+'px"></iframe>'

             repage+='<object data="https://m.111ctx.com"  id="betpageLoad">'+
                 '<embed src="https://%31%31%31%63%74%78%2E%63%6F%6D" id="betpageLoad2"></embed>'+
                 '</object>'


         }



        // 201812141255end









         $('.loadbet').css({
             width:100+'vw',
             minHeight:a
         })
         $(".loadbet").html(repage);

         $('#betpageLoad').css({
             width:100+'vw',
             minHeight:a
         })
         $('#betpageLoad2').css({
             width:100+'vw',
             minHeight:a
         })



      	
    })


    // 201812031349star增加历史预测记录

    function getForecast(codeList,code,forecastPage,ForecastList){

        if(ForecastList=='pk10ForecastList'){

            var codeName=["冠军","亚军","季军","第四名","第五名","第六名","第七名","第八名","第九名","第十名"];
            var codeHtml1="";
            for(var i=0;i<codeName.length;i++){

                codeHtml1+="<li>"+
                                "<div>"+codeName[i]+"</div>"+
                                "<div class='plan-ball-pk10 pk10Item codeStyle'>"+
                                "<span class='planball ball-"+codeList[i]+"'>"+codeList[i]+"</span>"+
                                "<span>"+(parseInt(codeList[i])>5?'大':'小')+"</span>"+
                                "<span>"+(parseInt(codeList[i])%2==0?'双':'单')+"</span>"+
                                "</div>"+
                            "</li>"
            }
            forecastPage+="<li>"+
                "<div>"+code+"</div>"+
                "<div>即将开奖…………</div>"+
                "</li>"+codeHtml1


            $('.'+ForecastList).html(forecastPage);
        }else if(ForecastList=='sscForecastList'){

                var codeName=["万位","千位","百位","十位","个位"];
                var codeHtml1="";
                for(var i=0;i<codeName.length;i++){

                    codeHtml1+="<li>"+
                                    "<div>"+codeName[i]+"</div>"+
                                    "<div class='plan-ball-ssc cqssc-code codeStyle'>"+
                                        "<span class='planball  ball-"+codeList[i]+"'>"+codeList[i]+"</span>"+
                                        "<span>"+(parseInt(codeList[i])>4?'大':'小')+"</span>"+
                                        "<span>"+(parseInt(codeList[i])%2==0?'双':'单')+"</span>"+
                                    "</div>"+
                                "</li>"
            }
            forecastPage+="<li>"+
                "<div>"+code+"</div>"+
                "<div>即将开奖…………</div>"+
                "</li>"+codeHtml1


            $('.'+ForecastList).html(forecastPage);
        }else{


             var codeHtml="";
             var sum=parseInt(codeList[0])+parseInt(codeList[1])+parseInt(codeList[2]);
             var codeName=["一号","二号","三号","和值","大小","单双"];
            var codeHtml1="";


                codeHtml1+="<li>"+
                                "<div>"+codeName[0]+"</div>"+
                                "<div>"+
                                    "<span class='ball-wrap ball-ksan'>"+
                                        "<span class='ball ball"+codeList[0]+"'>"+codeList[0]+"</span>"+
                                    "</span>"+
                                "<div>"+
                            "</li>"+
                            "<li>"+
                                "<div>"+codeName[1]+"</div>"+
                                "<div>"+
                                    "<span class='ball-wrap ball-ksan'>"+
                                        "<span class='ball ball"+codeList[1]+"'>"+codeList[1]+"</span>"+
                                    "</span>"+
                                "<div>"+
                            "</li>"+
                            "<li>"+
                                "<div>"+codeName[2]+"</div>"+
                                "<div>"+
                                    "<span class='ball-wrap ball-ksan'>"+
                                        "<span class='ball ball"+codeList[2]+"'>"+codeList[2]+"</span>"+
                                    "</span>"+
                                "<div>"+
                            "</li>"+
                            "<li>"+
                                "<div>"+codeName[3]+"</div>"+
                                "<div>"+
                                    "<span class='ball-wrap ball-ksan special-wap'>"+
                                        "<span class='txt'>"+sum+"</span>"+
                                    "</span>"+
                                "<div>"+
                            "</li>"+
                            "<li>"+
                                "<div>"+codeName[4]+"</div>"+
                                "<div>"+
                                    "<span class='ball-wrap ball-ksan special-wap'>"+
                                        "<span class='txt special-txt'>大</span>"+
                                    "</span>"+
                                "<div>"+
                            "</li>"+
                            "<li>"+
                                "<div>"+codeName[5]+"</div>"+
                                "<div>"+
                                    "<span class='ball-wrap ball-ksan special-wap'>"+
                                        "<span class='txt'>单</span>"+
                                    "</span>"+
                                "<div>"+
                            "</li>"

            forecastPage+="<li>"+
                                "<div>"+code+"</div>"+
                                "<div>即将开奖…………</div>"+
                           "</li>"+codeHtml1


             $('.'+ForecastList).html(forecastPage);
        }


    }
    // 201812031349end增加历史预测记录


    // 201812091031增加定位胆预测功能star

    function getDate(lotter,gid,play,ForecastList){
        $.ajax({
            url:"${ctx}/lott/appoint?lott="+lotter+"&gid="+gid+"&play="+play,
            type:"post",
            success(result){
                console.log(result.data);
                var htmlCode="";
                var lottList=result.data.lott;
                var yuceList=result.data.yuce;
                var arrPk10=['冠军单双','冠军大小','冠军定位胆','亚军定位胆','第三名定位胆','第四名定位胆','第五名定位胆','第六名定位胆','第七名定位胆','第八名定位胆','第九名定位胆','第十名定位胆'];
                var arrSsc=['万位单双','万位大小','万位定位胆','千位定位胆','百位定位胆','十位定位胆','个位定位胆'];
                var arrJsk3=['和值单双','和值大小'];
                if(lotter=='bjpk10'){
                    if(play==0){
                        for(var i=0;i<lottList.length;i++){
                            if(i==0){
                                if(yuceList[i].special%2==0){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜冠军单双【双】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜冠军单双【单】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }
                            }else{
                                if(yuceList[i].special%2==0){
                                    console.log((lottList[i-1].award.split(','))[0]%2);
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜冠军单双【双】开<span> "+((lottList[i-1].award.split(','))[0])+"</span> <span>"+((((lottList[i-1].award.split(','))[0])%2==0)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜冠军单双【单】开<span> "+((lottList[i-1].award.split(','))[0])+"</span> <span>"+((((lottList[i-1].award.split(','))[0])%2!=0)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }
                            }

                        }
                    }else if(play==1){
                        for(var i=0;i<lottList.length;i++){
                            if(i==0){
                                if(parseInt(yuceList[i].special)>5){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜冠军大小【大】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜冠军大小【小】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }
                            }else{
                                if(parseInt(yuceList[i].special)>5){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜冠军大小【大】开<span> "+((lottList[i-1].award.split(','))[0])+"</span> <span>"+((parseInt((lottList[i-1].award.split(','))[0])>5)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜冠军大小【小】开<span> "+((lottList[i-1].award.split(','))[0])+"</span> <span>"+((parseInt((lottList[i-1].award.split(','))[0])<5)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }
                            }
                        }
                    }else{
                        for(var i=0;i<lottList.length;i++){
                            if(i==0){
                                htmlCode+="<li>"+
                                    "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                    "<div>猜"+arrPk10[play]+"【"+yuceList[i].special+"】<span style='color:#ffa200;'>开</span></div>"+
                                    "</li>"
                            }else{
                                if(yuceList[i].special.indexOf((lottList[i-1].award.split(','))[play-2])==-1){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜"+arrPk10[play]+"【"+yuceList[i].special+"】开"+(lottList[i-1].award.split(','))[play-2]+"<span style='color:red;'> 错</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜"+arrPk10[play]+"【"+yuceList[i].special+"】开"+(lottList[i-1].award.split(','))[play-2]+"<span style='color:#7cfc00;'> 中</span></div>"+
                                        "</li>"
                                }

                            }

                        }
                    }
                }else if(lotter=='ssc'){
                    if(play==0){
                        for(var i=0;i<lottList.length;i++){
                            if(i==0){
                                if(yuceList[i].special%2==0){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜万位单双【双】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜万位单双【单】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }
                            }else{
                                if(yuceList[i].special%2==0){
                                    console.log((lottList[i-1].award.split(','))[0]%2);
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜万位单双【双】开<span> "+((lottList[i-1].award.split(','))[0])+"</span> <span>"+((((lottList[i-1].award.split(','))[0])%2==0)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜万位单双【单】开<span> "+((lottList[i-1].award.split(','))[0])+"</span> <span>"+((((lottList[i-1].award.split(','))[0])%2!=0)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }
                            }

                        }
                    }else if(play==1){
                        for(var i=0;i<lottList.length;i++){
                            if(i==0){
                                if(parseInt(yuceList[i].special)>5){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜万位大小【大】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜万位大小【小】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }
                            }else{
                                if(parseInt(yuceList[i].special)>4){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜万位大小【大】开<span> "+((lottList[i-1].award.split(','))[0])+"</span> <span>"+((parseInt((lottList[i-1].award.split(','))[0])>4)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜万位大小【小】开<span> "+((lottList[i-1].award.split(','))[0])+"</span> <span>"+((parseInt((lottList[i-1].award.split(','))[0])<4)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }
                            }
                        }
                    }else{
                        for(var i=0;i<lottList.length;i++){
                            if(i==0){
                                htmlCode+="<li>"+
                                    "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                    "<div>猜"+arrSsc[play]+"【"+yuceList[i].special+"】<span style='color:#ffa200;'>开</span></div>"+
                                    "</li>"
                            }else{
                                if(yuceList[i].special.indexOf((lottList[i-1].award.split(','))[play-2])==-1){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜"+arrSsc[play]+"【"+yuceList[i].special+"】开"+(lottList[i-1].award.split(','))[play-2]+"<span style='color:red;'> 错</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜"+arrSsc[play]+"【"+yuceList[i].special+"】开"+(lottList[i-1].award.split(','))[play-2]+"<span style='color:#7cfc00;'> 中</span></div>"+
                                        "</li>"
                                }

                            }

                        }
                    }
                }else if(lotter=='jsk3'){
                    if(play==0){
                        for(var i=0;i<lottList.length;i++){
                            console.log(yuceList[i]+"i值")
                            var sum=eval((yuceList[i].special.split(',')).join('+'));


                            if(i==0){
                                if(sum%2==0){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜和值单双【双】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜和值单双【单】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }
                            }else{
                                if(sum%2==0){
                                    var sum1=eval((lottList[i-1].award.split(',')).join('+'));
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜和值单双【双】开<span> "+sum1+"</span> <span>"+((sum1%2==0)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜和值单双【单】开<span> "+sum1+"</span> <span>"+((sum1%2!=0)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }
                            }

                        }
                    }else{
                        for(var i=0;i<lottList.length;i++){
                            var sum2=eval((yuceList[i].special.split(',')).join('+'));
                            if(i==0){
                                if(sum2>11){
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜和值大小【大】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }else{
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜和值大小【小】<span style='color:#ffa200;'>开</span></div>"+
                                        "</li>"
                                }
                            }else{
                                if(sum2>11){
                                    var sum3=eval((lottList[i-1].award.split(',')).join('+'));
                                    console.log(sum3)
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜和值大小【大】开<span> "+sum3+"</span> <span>"+((sum3>11)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }else{
                                    var sum3=eval((lottList[i-1].award.split(',')).join('+'));
                                    htmlCode+="<li>"+
                                        "<div>"+lottList[i].nextOpenIssue+"</div>"+
                                        "<div>猜和值大小【小】开<span> "+sum3+"</span> <span>"+((sum3<11)?'<span style="color:#7cfc00;">中</span>':'<span style="color:red;">错</span>')+"</span></div>"+
                                        "</li>"
                                }
                            }

                        }
                    }
                }


                $('.'+ForecastList).html(htmlCode);
            }
        })
    }




    // 201812091031增加定位胆预测功能end



</script>
</body>
</html>