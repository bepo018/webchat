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
    <title>六合彩票</title>
    <link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">

    <link rel="stylesheet" href="//at.alicdn.com/t/font_847013_28ixa94fann.css">
    <script src="${ctx}/static/m/js/jquery.min.js"></script>

    <script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/m/css/index.css">
    <script type="text/javascript" src="${ctx}/static/m/js/jquery.qqFace.js"></script>
</head>
<body>
<div data-role="page" id="pageone">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <div class="chatHeader">
            <ul>
                <li>
                    <a href="">登陆</a>
                </li>
                <li>
                    <%-- ${ctx}/static/m/--%>
                    <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
                </li>
                <li>
                    <a href="">注册</a>
                </li>
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
                    <a href="#pagethree">投注</a>
                </li>
                <li>
                    <a href="#pagefour">开奖</a>
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
                    <marquee behavior="scroll" direction="left" scrollamount="5" onmouseover="this.start()">
                        温馨提示：欢迎光临希望彩票，点击优惠活动查询领取，祝你游戏愉快
                    </marquee>
                </div>
            </div>
            <!-- 开奖播报 -->
            <div class="rewordCarousel show-page-loading-msg" data-textonly="false" data-textvisible="false"
                 data-msgtext="" data-inline="true">
                <div class="scroll-wap">
                    <ul class="swiper-wrapper">
                        <span><img src="${ctx}/static/m/images/chat/loadlong.gif" alt=""></span>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div data-role="main">
        <!-- 聊天区域 -->
        <div class="chatlist" id="chat-view" onclick="$.mobile.silentScroll(10000);">
            <ul id="chat">
                <%-- usersMessage --%>
                <li class="chat-left">
                    <img src="${ctx}/static/m/images/chat/avater1.png" alt="">
                    <div>
                        <p>
                            <img src="${ctx}/static/m/images/chat/m-id-YK.png" alt="">
                            <span>me***zi</span>
                            <span>10:14:17</span>
                        </p>
                        <div>
                            <div class="pf">现在要开始连中模式现在要开始连中模</div>
                        </div>
                    </div>
                </li>
                <%-- userMessage --%>
                <li class="chat-right">
                    <img src="${ctx}/static/m/images/chat/avater1.png" alt="">
                    <div>
                        <p>
                            <img src="${ctx}/static/m/images/chat/m-id-YK.png" alt="">
                            <span>me***zi</span>
                            <span>10:14:17</span>
                        </p>
                        <div>
                            <div class="pf">
                                自己说的内容
                            </div>
                        </div>
                    </div>
                </li>
                <%--Notice--%>
                <li class="enter-chat-room">
                    <p>欢迎游客***1w加入聊天室</p>
                </li>
            </ul>
        </div>
    </div>
    <div data-role="footer" data-position="fixed" data-tap-toggle="false">
        <!-- 输入区域 -->
        <div class="chat-input">
            <i class="icon-add"></i>
            <i class="icon-face"></i>
            <input type="text" placeholder="禁言状态,晋级为黄金会员就可以发言哦！" id="saytext" name="saytext">
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
    <div class="sign-in">
        <div>
            <img src="${ctx}/static/m/images/chat/hb.png" alt="">
        </div>
        <div>
            <img src="${ctx}/static/m/images/chat/qiandao.png" alt="">
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
            <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
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
                    <a href="#pagethree">投注</a>
                </li>
                <li>
                    <a href="#pagefour">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
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
                    <div class="plan-tip">开奖历史</div>
                    <div class="plan-mains">
                        <ul class="plan-listTip">
                            <li>
                                <div>期号</div>
                                <div>开奖号码</div>
                            </li>
                        </ul>
                        <!-- 开奖区域 -->
                        <ul class="plan-list pk10List">
                        </ul>
                    </div>
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
                    <div class="plan-tip">开奖历史</div>
                    <div class="plan-mains">
                        <ul class="plan-listTip">
                            <li>
                                <div>期号</div>
                                <div>开奖号码</div>
                            </li>
                        </ul>
                        <ul class="plan-list cqsscList">

                        </ul>
                    </div>
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
                    <div class="plan-tip">开奖历史</div>
                    <div class="plan-mains">
                        <ul class="plan-listTip">
                            <li>
                                <div>期号</div>
                                <div>开奖号码</div>
                            </li>
                        </ul>
                        <ul class="plan-list jsk3List">

                        </ul>
                    </div>
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
                    <a href="#pagefour">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
        </div>
    </div>
    <div data-role="main">
        <div class="loadbet">
            <iframe src="http://m.111ctx.com" frameborder="0" scrolling="auto"></iframe>
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
                    <a href="#pagethree">投注</a>
                </li>
                <li>
                    <a href="#" class="nav-active">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
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
                    <a href="#pagethree">投注</a>
                </li>
                <li>
                    <a href="#pagefour">开奖</a>
                </li>
                <li>
                    <a href="#" class="nav-active">教程</a>
                </li>
                <li>
                    <a href="#pagesix">直播</a>
                </li>
            </ul>
        </div>
    </div>

    <div data-role="content">
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
                <img src="${ctx}/static/m/images/chat/cun-course.png" alt="">
            </li>
            <li>
                <img src="${ctx}/static/m/images/chat/daili-course.png" alt="">
            </li>
        </ul>
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
                    <a href="#pagethree">投注</a>
                </li>
                <li>
                    <a href="#pagefour">开奖</a>
                </li>
                <li>
                    <a href="#pagefive">教程</a>
                </li>
                <li>
                    <a href="#pagesix" class="nav-active">直播</a>
                </li>
            </ul>
        </div>
    </div>

    <div data-role="content">
        <p>后续开发中.......</p>
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
        console.log(str)
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
            wsServer = "ws://" + location.host + "${pageContext.request.contextPath}" + "/chatServer/" + whoClick;
            ws = new WebSocket(wsServer);
            ws.onopen = function (evt) {
            };
            ws.onmessage = function (evt) {
                if ($("#chat li").length >= 300) {
                    for (var i = 0; i < 100; i++) {
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
            if (message.list != null && message.list != undefined) {
                console.log("${level}")
                if ("${level}" == 4 || "${level}" == 3) {
                    showHighLevelOnline(message);
                } else {
                    showBasicLevelOnline(message);
                }
            }
        } else if (message.type == "noticeRobot") {
            showNotice(message.message);
        } else if (message.type == "noticeWin") {
            showWinNotice(message.message);
        } else if (message.type == "betting") {
            showNotice(message.message);
        } else if (message.type == "out") {
            cleanOut(message.message);
        }
    }

    //展示中奖
    function showWinNotice(winInfo) {
        $("#winInfo").html("<img src='${ctx}/static/images/qiqiu.png'><span>" + winInfo + "</span>");
        chab();
    }

    //展示进入房间
    function showNotice(notice) {

        $("#chat").append("<li class='enter-chat-room'><p>" + notice + "</p></li>");
        var chat = $("#chat-view");
        chat.scrollTop(chat[0].scrollHeight);
    }

    //展示用户聊天内容
    function showChat(message) {
        var reg = /^lottery_\d{2}$/;
        if (reg.test(message.content)) {
            console.log(message.content);
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
        }

        // var chat = $("#chat-view");
        // chat.scrollTop(chat[0].scrollHeight);
        // $.mobile.silentScroll($("#chat-view")[0].scrollHeight)
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
        if (gif == "gif")
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
        $(".md-ft>.face-body").hide();
    }


    //关闭连接
    function closeConnection() {
        if (ws != null) {
            ws.close();
            ws = null;
        } else {
        }
    }
</script>
</body>
</html>