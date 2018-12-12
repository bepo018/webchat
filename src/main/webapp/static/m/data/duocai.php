<?php
    //header("Content-type: text/html; charset=utf-8");
    error_reporting(E_ALL ^ E_NOTICE); 
    date_default_timezone_set('PRC');
    //设置接口参数
    //@$gamekey = $_REQUEST['gamekey'] or die('{"code":401,"msg":"gamekey required"}');
    $uid = '330';
    //试用口令,返回的开奖数据为测试数据.具体以购买接口后获得的token为准
    $token = 'f740161ff9aec92f23d616f65488f6a7';
    $api = 'apiGameList';
    $time = (string)time();
    $key = md5(md5($time . '-' . $token));
    $site = 'api.jiekouapi.com';

    // 主要接口源,返回json
    $url = "http://api.caipiaoapi.com/hall/multService/api_request?uid=".$uid."&md5=".$key."&api=".$api."&time=".$time."&site=".$site;
	//print_r($url); echo '<br/>';
    $data = file_get_contents($url);
    echo $data; //echo '<br/>';
?>