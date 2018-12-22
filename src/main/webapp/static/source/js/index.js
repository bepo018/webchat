
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
    $("#Click-teach").click(function(){
        $(this).addClass('RtBg').siblings().removeClass('RtBg');
        $(".bdteach").removeClass('hide').addClass('show').siblings().removeClass('show').addClass('hide');
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

// 第五个页面
$(function(){
    // <!-- 201812091515star -->
    $('.course-list li').each(function(index,element){
        $(this).on('click',function(){
            if(index==0){
                $('.imgContent').html(ZCimgHtml);
            }else if(index==1){
                $('.imgContent').html(CZimgHtml);
            }else if(index==2){
                $('.imgContent').html(GCimgHtml);
            }else if(index==3){
                $('.imgContent').html(TXimgHtml);
            }else if(index==4){
                $('.imgContent').html(DLimgHtml);
            }else if(index==5){
                $('.imgContent').html(PLimgHtml);
            }

            $(this).parent().addClass("hide").removeClass("show").next().addClass("show").removeClass("hide");
        })
    })


    $('.course-close').on('click',function(){
        $(this).parent().addClass("hide").removeClass("show").prev().addClass("show").removeClass("hide");
    })
    var imgList={
        'zc':[
            './static/m/images/course/zc_01.jpg',
            './static/m/images/course/zc_02.jpg',
            './static/m/images/course/zc_03.jpg',
        ],
        'cz':[
            './static/m/images/course/cz_01.jpg',
            './static/m/images/course/cz_02.jpg',
            './static/m/images/course/cz_03.jpg',
            './static/m/images/course/cz_04.jpg',
            './static/m/images/course/cz_05.jpg'
        ],
        'gc':[
            './static/m/images/course/gc_01.jpg',
            './static/m/images/course/gc_02.jpg',
            './static/m/images/course/gc_03.jpg',
            './static/m/images/course/gc_04.jpg',
        ],
        'tx':[
            './static/m/images/course/tx_01.jpg',
            './static/m/images/course/tx_02.jpg',
            './static/m/images/course/tx_03.jpg'
        ],
        'dl':[
            './static/m/images/course/dl_01.jpg',
            './static/m/images/course/dl_02.jpg',
            './static/m/images/course/dl_03.jpg',
            './static/m/images/course/dl_04.jpg'
        ],
        'pl':[
            './static/m/images/course/pl_01.jpg',
            './static/m/images/course/pl_02.jpg',
            './static/m/images/course/pl_03.jpg'
        ]
    }
    var ZCimgHtml="",CZimgHtml="",GCimgHtml="",TXimgHtml="",DLimgHtml="",PLimgHtml="";
    for(var i=0;i<imgList.zc.length;i++){
        ZCimgHtml+=`<li>
                            <img src="${imgList.zc[i]}" alt="">
                        </li>`
    }
    for(var i=0;i<imgList.cz.length;i++){
        CZimgHtml+=`<li>
                            <img src="${imgList.cz[i]}" alt="">
                        </li>`
    }
    for(var i=0;i<imgList.gc.length;i++){
        GCimgHtml+=`<li>
                            <img src="${imgList.gc[i]}" alt="">
                        </li>`
    } for(var i=0;i<imgList.tx.length;i++){
        TXimgHtml+=`<li>
                            <img src="${imgList.tx[i]}" alt="">
                        </li>`
    }
    for(var i=0;i<imgList.dl.length;i++){
        DLimgHtml+=`<li>
                            <img src="${imgList.dl[i]}" alt="">
                        </li>`
    }
    for(var i=0;i<imgList.pl.length;i++){
        PLimgHtml+=`<li>
                            <img src="${imgList.pl[i]}" alt="">
                        </li>`
    }
})
