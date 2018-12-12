
// 功能1：页面刷新滚动页面
$(function(){
    // window.onbeforeunload = function(){
    //     //刷新后页面自动回到顶部
    //     document.documentElement.scrollTop = 0;  //ie下
    //     document.body.scrollTop = 0;  //非ie
    // }
    window.onbeforeunload = function () {
        window.scrollTo(0, 0);
    }

})
//点击表情图，加载QQ表情
$("#faceChose").click(function () {
    var faceItem=""
    for(var i=1;i<=75;i++){
        faceItem+=`<div>
                        <img src="${ctx}/static/images/face/${i}.gif" alt=""  onclick="$(\'#'+'message'+'\').setCaret();$(\'#'+'message'+'\').insertAtCaret(\'' + '['+'em_'+${i}+']' + '\');">
                    </div>`
    }
    $("#faceContent").html(faceItem);
})

// 功能2：房间切换管理
$(function(){
    $("#infoToggle").click(function(){
        $(this).addClass("change-Bg").siblings().removeClass("change-Bg");        
        $('.navLf-info').css({
            'display':'block'
        });
        $('.navLf-hall').css('display','none');
    })
    $("#hallToggle").click(function(){
        $(this).addClass("change-Bg").siblings().removeClass("change-Bg");
        $('.navLf-info').css('display','none');
        $('.navLf-hall').css('display','block');
    })
})
//功能3：统计各个房间人数
/*$(function(){
    // console.log($("#collapseOne>ul>li").length);
    var gtLength=$("#collapseOne>ul>li").length;
    var scLength=$("#collapseTwo>ul>li").length;
    var sscLength=$("#collapseThree>ul>li").length;
    var ksLength=$("#collapseFour>ul>li").length;
    $("#GT").html(gtLength);
    $("#SC").html(scLength);
    $("#SSC").html(sscLength);
    $("#KS").html(ksLength);
})*/
//功能4：表情选择弹出框
$(function(){
    $("#toolChose").click(function(){
        $("#gif").toggle();
    })
})
//功能：笑脸表情选择弹出框
$(function(){
    $("#faceChose").click(function(){
        $("#faceContent").toggle();
    })
})
// 右侧按钮栏页面切换
$(function(){
    $("#Click-pk10").click(function(){
        $(this).addClass('RtBg').siblings().removeClass('RtBg');
        $(".bdPk10").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide');  
    })
    $("#Click-wordKj").click(function(){
        $(this).addClass('RtBg').siblings().removeClass('RtBg');
        $(".bdword").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide'); 
    })
    $("#Click-live").click(function(){
        $(this).addClass('RtBg').siblings().removeClass('RtBg');
        $(".bdRt-z").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide'); 
    })
    $("#Click-plan").click(function(){
        $(this).addClass('RtBg').siblings().removeClass('RtBg');
        $(".plan-Cp").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide'); 
    })
})

// 不同屏幕下显示加载界面按钮
$(function(){
    // 加载最左侧界面
    $(".zfd").click(function(){
        $(this).parent().parent().parent().addClass("hidden-xs hidden-sm").siblings().removeClass("hidden-xs");
    })
    $(".rfd").click(function(){
        $(this).parent().addClass("hidden-xs").siblings().removeClass("hidden-xs");
    })
    $(".Rzfd").click(function(){
        $(this).parent().addClass("hidden-xs").siblings().removeClass("hidden-xs");
    })
    $(".Lrfd").click(function(){
        $(this).parent().addClass("hidden-xs").siblings().removeClass("hidden-xs");
    })
})
//切换计划
$(".balance").click(function () {
    $(this).next().toggle();
})
  
