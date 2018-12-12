
// 中奖播报js调用
function chab(){
    setTimeout(function(){
        $(".float-chat").animate({
            right:'15%'
         },800),
        //setTimeout('fireworks()',600),
        setTimeout(function(){
            $(".float-chat").animate({
                right:'175%'
            },800)
        },3000)
        // setTimeout(function(){
        //     $(".float-chat").css({
        //         "right":"-70%"
        //     });
        // },5000)  
    },5000)
} 
// 烟花爆炸效果
function fireworks(){
    // var oEvent=ev||event;
    var aDiv=[];
    var oDiv=null;
    var oDiv=document.createElement('div');
    var bDiv=document.createElement('div');
    bDiv.className="dRemv";
    bDiv.style.height='100%';
    bDiv.style.zIndex='2';
    bDiv.style.position='absolute';
    bDiv.style.top='0';
    document.body.appendChild(bDiv);
    var i=0;
    // 获取当前屏幕的宽高
    var WL=document.documentElement.clientWidth;
    var HL=document.documentElement.clientHeight;
    var x=WL/2;
    var y=HL/2; 
    // var x=oEvent.clientX;
    // var y=oEvent.clientY;  
    var t=setInterval(function (){
        if(oDiv.offsetTop<=y){
            clearInterval(t);
            show();
            // document.body.removeChild(oDiv);
            // bDiv.removeChild(oDiv);
        }   
        oDiv.style.top=oDiv.offsetTop-30+'px';
    }, 30);    
    function show(){
        var oDiv=null;    
        for(var i=0;i<100;i++){
            oDiv=document.createElement('div');
            oDiv.style.width='20px';//烟花的宽度
            oDiv.style.height='30px';//烟花的高度
            // oDiv.style.background='#'+Math.ceil(Math.random()*0xEFFFFF+0x0FFFFF).toString(16);
            oDiv.style.background="url('./images/xhb_k.png')no-repeat";
            oDiv.style.position='absolute';
            oDiv.style.left=x+'px';
            oDiv.style.top=y+'px'; 
            oDiv.style.zIndex='30';
            var a=Math.random()*360;      
            //oDiv.speedX=Math.random()*40-20;
            //oDiv.speedY=Math.random()*40-20;
            oDiv.speedX=Math.sin(a*180/Math.PI)*30*Math.random();
            oDiv.speedY=Math.cos(a*180/Math.PI)*30*Math.random();
            // document.body.appendChild(oDiv);
            bDiv.appendChild(oDiv);
            aDiv.push(oDiv);
        }
    } 
    setInterval(doMove, 30);
    function doMove(){
        for(var i=0;i<aDiv.length;i++){
            aDiv[i].style.left=aDiv[i].offsetLeft+aDiv[i].speedX+'px';
            aDiv[i].style.top=aDiv[i].offsetTop+aDiv[i].speedY+'px';
            aDiv[i].speedY+=1;  
            if(aDiv[i].offsetLeft<0+30 || aDiv[i].offsetLeft>document.documentElement.clientWidth-50 || aDiv[i].offsetTop<0+30 || aDiv[i].offsetTop>document.documentElement.clientHeight-100){
                // document.body.removeChild(aDiv[i]);
                bDiv.removeChild(aDiv[i]);
                aDiv.splice(i, 1);
                setTimeout(function(){
                    var c=document.getElementsByClassName("dRemv");
                    console.log(c);
                    // bDiv.style.zIndex='1';
                    // // if(bDiv){
                    // //     document.body.removeChild(bDiv);
                    // // }
                    
                    // document.body.removeChild(bDiv);
                },1000)
            }
        }
    }
};
// 点击收藏功能
function addFavorite() {
    var url = window.location;
    var title = document.title;
    var ua = navigator.userAgent.toLowerCase();
    if (ua.indexOf("360se") > -1){
        alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
    }else if (ua.indexOf("msie 8") > -1){
        window.external.AddToFavoritesBar(url, title); //IE8
    }else if (document.all) {//IE类浏览器
        try{
            window.external.addFavorite(url, title);
        }catch(e){
            alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
        }
    }
    else if(window.sidebar){//firfox等浏览器；
        window.sidebar.addPanel(title, url, "");
    }else{
        alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
    }
}  