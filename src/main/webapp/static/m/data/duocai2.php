<?php
    //header("Content-type: text/html; charset=utf-8");
    error_reporting(E_ALL ^ E_NOTICE); 
    date_default_timezone_set('PRC');
    $output = [
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
    $data1 = file_get_contents($url1);
    $obj1 = json_decode($data1 , true);
    $output['jsk3']=$obj1['result']['data'][0];
    $data2 = file_get_contents($url2);
    $obj2 = json_decode($data2 , true);
    $output['ahk3']=$obj2['result']['data'][0];
    $data3 = file_get_contents($url3);
    $obj3 = json_decode($data3 , true);
    $output['gxk3']=$obj3['result']['data'][0];
    $data4 = file_get_contents($url4);
    $obj4 = json_decode($data4 , true);
    $output['hbk3']=$obj4['result']['data'][0];
    $data5 = file_get_contents($url5);
    $obj5 = json_decode($data5 , true);
    $output['bjk3']=$obj5['result']['data'][0];
    $data6 = file_get_contents($url6);
    $obj6 = json_decode($data6 , true);
    $output['heik3']=$obj6['result']['data'][0];
    $data7 = file_get_contents($url7);
    $obj7 = json_decode($data7 , true);
    $output['gsk3']=$obj7['result']['data'][0];
    $data8 = file_get_contents($url8);
    $obj8 = json_decode($data8 , true);
    $output['shk3']=$obj8['result']['data'][0];
    $data9 = file_get_contents($url9);
    $obj9 = json_decode($data9 , true);
    $output['gzk3']=$obj9['result']['data'][0];
    $data10 = file_get_contents($url10);
    $obj10 = json_decode($data10 , true);
    $output['jlk3']=$obj10['result']['data'][0];
    $data11 = file_get_contents($url11);
    $obj11 = json_decode($data11 , true);
    $output['ssc']=$obj11['result']['data'][0];
    $data12 = file_get_contents($url12);
    $obj12 = json_decode($data12 , true);
    $output['xjssc']=$obj12['result']['data'][0];
    $data13 = file_get_contents($url13);
    $obj13 = json_decode($data13 , true);
    $output['tjssc']=$obj13['result']['data'][0];
    $data14 = file_get_contents($url14);
    $obj14 = json_decode($data14 , true);
    $output['lucky28']=$obj14['result']['data'][0];
    $data15 = file_get_contents($url15);
    $obj15 = json_decode($data15 , true);
    $output['bjpk10']=$obj15['result']['data'][0];
    $data16 = file_get_contents($url16);
    $obj16 = json_decode($data16 , true);
    $output['lhc']=$obj16['result']['data'][0];
    $data17 = file_get_contents($url17);
    $obj17 = json_decode($data17 , true);
    $output['gdsyxw']=$obj17['result']['data'][0];
    $data18 = file_get_contents($url18);
    $obj18 = json_decode($data18 , true);
    $output['shsyxw']=$obj18['result']['data'][0];
    $data19 = file_get_contents($url19);
    $obj19 = json_decode($data19 , true);
    $output['sdsyxw']=$obj19['result']['data'][0];
    $data20 = file_get_contents($url20);
    $obj20 = json_decode($data20 , true);
    $output['jxsyxw']=$obj20['result']['data'][0];
    $data21 = file_get_contents($url21);
    $obj21 = json_decode($data21 , true);
    $output['fsd']=$obj21['result']['data'][0];
    echo json_encode($output);
?>