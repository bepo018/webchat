<?php
    //header("Content-type: text/html; charset=utf-8");
    error_reporting(E_ALL ^ E_NOTICE); 
    date_default_timezone_set('PRC');
    $output = [
        'lott'=>[],
        'roadBeads'=>[]
    ];
    //设置接口参数
    @$gamekey = $_REQUEST['gamekey'] or die('{"code":401,"msg":"gamekey required"}');
    $uid = '330';
    //试用口令,返回的开奖数据为测试数据.具体以购买接口后获得的token为准
    $token = 'f740161ff9aec92f23d616f65488f6a7';
    $api = 'apiGameList';
    $time = (string)time();
    $key = md5(md5($time . '-' . $token));
    $site = 'api.jiekouapi.com';

    // 主要接口源,返回中奖号json
    $url = "http://api.caipiaoapi.com/hall/nodeService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&gamekey=".$gamekey."&time=".$time."&site=".$site;
    // 返回路珠json
    $url1 = "http://api.jiekouapi.com:7373/hall/trendService/getRoadBeads?lotKey=".$gamekey."&uid=330&time=1540179556&md5=f7ab80d949a4e60bcd1590c31060b6d4&site=www.caipiaoapi.com";
    //print_r($url);echo '<br/>';
    $data = file_get_contents($url);
	//print_r($url); echo '<br/>';
    $data1 = file_get_contents($url1);
    //echo $data;
    $output['lott']=json_decode($data);
    $output['roadBeads']=json_decode($data1);
    echo json_encode($output);
?>