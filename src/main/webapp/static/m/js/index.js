// *********chat页面*****
// 触屏滚动查看开奖情况
$(function(){ 
    // $(".swiper-wrapper").on("swipeleft",function(){
    //     $(".swiper-wrapper>li").length--;
    // })
    var a=window.screen.height-88.3;
    $(".loadbet>iframe").css("height",a)
    $(".icon-face").on("tap",function(){
        $(".emoji").toggle();
    })
    $(".itm").on("tap",function(){
        $(".emojiListTwo").css("display","none");
        $(".emojiListOne").css("display","flex");
        $(this).addClass("active").siblings().removeClass("active");
    })
    $(".itm-face").on("tap",function(){
        $(".emojiListTwo").css("display","flex");   
        $(".emojiListOne").css("display","none");
        $(this).addClass("active").siblings().removeClass("active");
    })





    var emojiitem=""
    for(var i=1;i<=75;i++){
        emojiitem+=`<div>
                        <img src="./static/m/face/${i}.gif" alt=""  onclick="$(\'#'+'saytext'+'\').setCaret();$(\'#'+'saytext'+'\').insertAtCaret(\'' + '['+'em_'+${i}+']' + '\');">
                    </div>`
    }
    $(".emojiListTwo").html(emojiitem);













})
// 第二个页面
$(function(){
    //计划切换
    planToggle(".pk10",0);
    planToggle(".ssc",1);
    planToggle(".jsk3",2);
    // 北京赛车
    getCaipiaoMsg("bjpk10");
    // 时时彩
    getCaipiaoMsg("ssc");
    // 江苏快三
    getCaipiaoMsg("jsk3");

    /*点击切换开奖预测20181203star*/
    $(".rewordForecast").on("tap",function(){

        $(this).parent().next().addClass("hide").removeClass("show").next().removeClass("hide").addClass("show");
    })
    $(".rewordHistory").on("tap",function(){

        $(this).parent().next().addClass("show").removeClass("hide").next().removeClass("show").addClass("hide");
    })
    /*点击切换开奖预测20181203end*/



    /* 2018/12081011star */
    $(".toggleButton").on("tap",function(){
        $(this).next().toggle();
    },function(){
        $(this).next().toggle();
    })



    /* 2018/12081011end */

})
// 第三个页面
$(function(){

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
        ]
    }
    var ZCimgHtml="",CZimgHtml="",GCimgHtml="",TXimgHtml="",DLimgHtml="";
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



    // <!-- 201812091515end -->


})
// 第六个页面
$(function(){

})


