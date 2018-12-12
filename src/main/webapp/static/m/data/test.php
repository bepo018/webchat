<?php
    //header("Content-type: text/html; charset=utf-8");
    error_reporting(E_ALL ^ E_NOTICE); 
    date_default_timezone_set('PRC');
    $output = [
        {"result":array[]}
        'jsk3'=>[],
        'ahk3'=>[],
        'gxk3'=>[],
        'hbk3'=>[],
        'bjk3'=>[],
        'heik3'=>[],
        'gsk3'=>[],
        'shk3'=>[],
        'gzk3'=>[],
        'jlk3'=>[],
        'ssc'=>[],
        'xjssc'=>[],
        'tjssc'=>[],
        'lucky28'=>[],
        'bjpk10'=>[],
        'lhc'=>[],
        'gdsyxw'=>[],
        'shsyxw'=>[],
        'sdsyxw'=>[],
        'jxsyxw'=>[],
        'fsd'=>[],
    ];
    //设置接口参数
    $uid = '330';
    //试用口令,返回的开奖数据为测试数据.具体以购买接口后获得的token为准
    $token = 'f740161ff9aec92f23d616f65488f6a7';
    $api = 'apiGameList';
    $time = (string)time();
    $key = md5(md5($time . '-' . $token));
    $site = 'api.jiekouapi.com';

    // 主要接口源,返回中奖号json
    $url1 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=jsk3&time=".$time."&site=".$site;
    $url2 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=ahk3&time=".$time."&site=".$site;
    $url3 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=gxk3&time=".$time."&site=".$site;
    $url4 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=hbk3&time=".$time."&site=".$site;
    $url5 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=bjk3&time=".$time."&site=".$site;
    $url6 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=heik3&time=".$time."&site=".$site;
    $url7 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=gsk3&time=".$time."&site=".$site;
    $url8 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=shk3&time=".$time."&site=".$site;
    $url9 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=gzk3&time=".$time."&site=".$site;
    $url10 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=jlk3&time=".$time."&site=".$site;
    $url11 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=ssc&time=".$time."&site=".$site;
    $url12 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=xjssc&time=".$time."&site=".$site;
    $url13 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=tjssc&time=".$time."&site=".$site;
    $url14 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=lucky28&time=".$time."&site=".$site;
    $url15 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=bjpk10&time=".$time."&site=".$site;
    $url16 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=lhc&time=".$time."&site=".$site;
    $url17 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=gdsyxw&time=".$time."&site=".$site;
    $url18 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=shsyxw&time=".$time."&site=".$site;
    $url19 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=sdsyxw&time=".$time."&site=".$site;
    $url20 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=jxsyxw&time=".$time."&site=".$site;
    $url21 = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=fsd&time=".$time."&site=".$site;
    // //print_r($url);echo '<br/>';
    // $data = file_get_contents($url);
	// //print_r($url); echo '<br/>';
    // $data1 = file_get_contents($url1);
    // //echo $data;
    $output['jsk3']=json_decode(file_get_contents($url1));
    $output['ahk3']=json_decode(file_get_contents($url2));
    $output['gxk3']=json_decode(file_get_contents($url3));
    $output['hbk3']=json_decode(file_get_contents($url4));
    $output['bjk3']=json_decode(file_get_contents($url5));
    $output['heik3']=json_decode(file_get_contents($url6));
    $output['gsk3']=json_decode(file_get_contents($url7));
    $output['shk3']=json_decode(file_get_contents($url8));
    $output['gzk3']=json_decode(file_get_contents($url9));
    $output['jlk3']=json_decode(file_get_contents($url10));
    $output['ssc']=json_decode(file_get_contents($url11));
    $output['xjssc']=json_decode(file_get_contents($url12));
    $output['tjssc']=json_decode(file_get_contents($url13));
    $output['lucky28']=json_decode(file_get_contents($url14));
    $output['bjpk10']=json_decode(file_get_contents($url15));
    $output['lhc']=json_decode(file_get_contents($url16));
    $output['gdsyxw']=json_decode(file_get_contents($url17));
    $output['shsyxw']=json_decode(file_get_contents($url18));
    $output['sdsyxw']=json_decode(file_get_contents($url19));
    $output['jxsyxw']=json_decode(file_get_contents($url20));
    $output['fsd']=json_decode(file_get_contents($url21));
    echo json_encode($output);
?>