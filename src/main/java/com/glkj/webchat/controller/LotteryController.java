package com.glkj.webchat.controller;


import com.alibaba.fastjson.JSONObject;
import com.glkj.webchat.pojo.JsonResult;
import com.glkj.webchat.pojo.YuCe;
import com.glkj.webchat.service.ILotteryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 *
 * @author qsjteam
 * @date 2018-10-1
 */
@RestController
@RequestMapping(value = "/lott")
public class LotteryController {

    @Autowired
    private ILotteryService iLotteryService;

    @RequestMapping(value = "/allLottList")
    public JSONObject getAllLotterys() {
        return iLotteryService.allLottList();
    }

    @RequestMapping(value = "/first/{lott}")
    public JSONObject firstLottery(@PathVariable("lott") String lott) {
        return iLotteryService.firstLottery(lott);
    }

    @RequestMapping(value = "/five")
    public JSONObject nextLottery() {
        return iLotteryService.fiveLottery();
    }

    @RequestMapping(value = "/yuce")
    public JsonResult yuceLottery(String lott, String gid, String play) {
        Map<String, Object> list = iLotteryService.yuceLottery(lott, gid, play);
        if (list == null || list.size() == 0)
            return new JsonResult<Void>(12, "暂无预测结果");
        return new JsonResult<>(1, "success", list);
    }

    @RequestMapping(value = "/appoint")
    public JsonResult appointLottery(String lott, String gid, String play) {
        Map<String, Object> list = iLotteryService.appointLottery(lott, gid, play);
        if (list == null || list.size() == 0)
            return new JsonResult<Void>(12, "暂无预测结果");
        return new JsonResult<>(1, "success", list);
    }
}
