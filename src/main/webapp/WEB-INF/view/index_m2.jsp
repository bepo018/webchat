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
<!-- plan页面 -->
<div data-role="page" id="pagetwo">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
    	<div class="chatHeader">
            <ul>
                <li>
                    <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
                </li>
            </ul>
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#" class="nav-active">计划</a>
                </li>
                <li>
                    <a href="#pagethree" onclick="refreshFrame()">投注</a>
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
                        <ul class="plan-list pk10List" id="PK-history">
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
                        <ul class="plan-list cqsscList" id="SSC-history">

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
                        <ul class="plan-list jsk3List" id="KS-history">

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
        <div class="chatHeader">
            <ul>
                <li>
                    <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
                </li>
            </ul>
        </div>
        <div class="chatNav">
            <ul>
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
    </div>
    <div data-role="main">
        <div class="loadbet">
        </div>
    </div>
</div>
<!-- reword页面 -->
<div data-role="page" id="pagefour">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <div class="chatHeader">
            <ul>
                <li>
                    <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
                </li>
            </ul>
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#pagetwo">计划</a>
                </li>
                <li>
                    <a href="#pagethree"  onclick="refreshFrame()">投注</a>
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
        <div class="chatHeader">
            <ul>
                <li>
                    <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
                </li>
            </ul>
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#pagetwo">计划</a>
                </li>
                <li>
                    <a href="#pagethree"  onclick="refreshFrame()">投注</a>
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
                        <a href="http://%31%31%31%63%74%78%2E%63%6F%6D/register?id=94649462" class="jump">温馨提示：欢迎光临彩天下，点击优惠活动查询领取，祝你游戏愉快</a>
                    </marquee>
                </div>
            </div>

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
        <div class="chatHeader">
            <ul>
                <li>
                    <img src="${ctx}/static/m/images/chat/m-logo_ctx2.png" alt="">
                </li>
            </ul>
        </div>
        <div class="chatNav">
            <ul>
                <li>
                    <a href="#pagetwo">计划</a>
                </li>
                <li>
                    <a href="#pagethree"  onclick="refreshFrame()">投注</a>
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

    
 // 第四个页面
 //进入投注页面默认刷新
        function refreshFrame(){
            location.reload(true);
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
	                       //console.log(html);
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
	                            	"</span>"
	                            "</div>"+
	                        "</div>"+
	                    "</li>"
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
	                	 //console.log(pkhistoryList)
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
               var html5="";
               var sum=parseInt(numList[0])+parseInt(numList[1])+parseInt(numList[2]);
               var more="";
               var jo="";
               if(sum>=11){
                   more="大";
               }else{
                   more="小"; 
               }
               if(sum%2==0){
                   jo="双";
               }else{
                   jo="单";
               }
               html5="<li>"+
                           "<div class='lf'>"+
                               "<img src='${ctx}/static/images/lotttype/jsk3.png' alt=''>"+
                           "</div>"+
                           "<div class='rt'>"+
                               "<div class='top'>"+
                                   "<span>江苏快三</span>"+
                                   "<span>第"+data.data[0].gid+"期</span>"+
                               "</div>"+
                               "<div class='bottom'>"+
                                   "<span class='ball-wrap ball-ksan'>"+
                                       "<span class='ball ball"+numList[0]+"'></span>"+
                                   "</span>"+
                                   "<span class='ball-wrap ball-ksan'>"+
                                       "<span class='ball ball"+numList[1]+"'></span>"+
                                   "</span>"+
                                   "<span class='ball-wrap ball-ksan'>"+
                                       "<span class='ball ball"+numList[2]+"'></span>"+
                                   "</span>"+
                                   "<span class='ball-wrap ball-ksan special-wap'>"+
                                       "<span class='txt'>"+sum+"</span>"+
                                   "</span>"+
                                   "<span class='ball-wrap ball-ksan special-wap'>"+
                                       "<span class='txt special-txt'>"+more+"</span>"+
                                   "</span>"+
                                   "<span class='ball-wrap ball-ksan special-wap'>"+
                                       "<span class='txt'>"+jo+"</span>"+
                                   "</span>"+
                               "</div>"+
                           "</div>"+
                       "</li>"
               $(".swiper-wrapper").html(html5);
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
    	var a=window.screen.height-88.3;
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
               htmlpage = '<iframe width="100%" height="' + window.screen.height + '"  frameborder="0" scrolling="no" src="' + Obj.data[i].roomAddress + '?_'+randomnumber2+'"></iframe>'
            	
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
        var repage="";
        var randomnumber=Math.floor(Math.random()*100000);
        repage+='<iframe id="myframe" src="http://m.111ctx.com?_='+randomnumber+'" frameborder="0"  scrolling="auto" style="height:'+a+'px""></iframe>'
        $(".loadbet").html(repage); 

      	
    })
</script>
</body>
</html>