package com.glkj.webchat.service;

import com.alibaba.fastjson.JSONObject;
import com.glkj.webchat.pojo.YuCe;

import java.util.List;
import java.util.Map;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 *
 * @author qsjteam
 * @date 2018-10-1
 */
public interface ILotteryService {

    /**
     * 获取所有彩票的最新一期开奖结果
     *
     * @return
     */
    JSONObject allLottList();

    JSONObject firstLottery(String lott);

    JSONObject fiveLottery();

    Map<String, Object> yuceLottery(String lott, String gid, String play);

    Map<String, Object> appointLottery(String lott, String gid, String play);

}
