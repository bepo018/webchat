function planToggle(elment,index){
    $(elment).on("tap",function(){
        $(this).parent().next().children().eq(index).show().siblings().hide();

        /**201812081254star */
        var arrPk10=['冠军单双','冠军大小','冠军定位胆','亚军定位胆','第三名定位胆','第四名定位胆','第五名定位胆','第六名定位胆','第七名定位胆','第八名定位胆','第九名定位胆','第十名定位胆'];
        var arrSsc=['万位单双','万位大小','万位定位胆','千位定位胆','百位定位胆','十位定位胆','个位定位胆'];
        var arrJsk3=['和值单双','和值大小'];
        var togglePage='';
        if(elment==".pk10"){
            for( var i=0;i<arrPk10.length;i++){
                togglePage+=`<li class='pk10Num'>${arrPk10[i]}</li>`
            }
        }else if(elment==".ssc"){
            for( var i=0;i<arrSsc.length;i++){
                togglePage+=`<li  class='sscNum'>${arrSsc[i]}</li>`
            }
        }else{
            for( var i=0;i<arrJsk3.length;i++){
                togglePage+=`<li  class='jsk3Num'>${arrJsk3[i]}</li>`
            }
        }
        $(".togglePlan").html(togglePage);
        $()
        $(".togglePlan li").each(function (index) {
            $(this).click(function(){
                var num1=$(".plan-pk10 .current").html().slice(-4,-1);

                console.log(num1);
                var num2=$(".plan-cqssc .current").html().slice(-4,-1);
                console.log(num2);
                var num3=$(".plan-jsk3 .current").html().slice(-4,-1);
                console.log(typeof (num3));

                if($(this).hasClass('pk10Num')){
                    getDate('bjpk10',num1,index,'pk10ForecastList');
                }else if($(this).hasClass('sscNum')){
                    getDate('ssc',num2,index,'sscForecastList');
                }else{
                    getDate('jsk3',num3,index,'jsk3ForecastList');
                }
                //
                //
                $(this).parent().parent().hide();
            })
        })

        /**201812081254end */
    });


}





// 中奖播报
function chab(){
    var setTimer1=setTimeout(function(){
        $(".prize-wrap").animate({
            left:'0'
        });
    },1000)
    var setTimer2=setTimeout(function(){
        $(".prize-wrap").animate({
            left:'-100vw'
        });
        $(".prize-wrap").css("left","100vw");
        clearTimeout(setTimer1);
        setTimer1=null;
        clearTimeout(setTimer2);
        setTimer2=null;
    },3000) 
}
// 表情替换
function replace_em(str){
    // 替代小于号
    str = str.replace(/\</g,'<');
    // 替代大于号
    str = str.replace(/\>/g,'>');
    // 换行
    str = str.replace(/\n/g,'<br/>');

    str = str.replace(/\[em_([0-9]*)\]/g,'<img src="./face/$1.gif" border="0"/>');
    return str;
}

