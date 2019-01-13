package com.glkj.webchat.controller;

import com.alibaba.fastjson.JSONObject;
import com.glkj.webchat.pojo.JsonResult;
import com.glkj.webchat.pojo.LivePc;
import com.glkj.webchat.service.LiveInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
//@CrossOrigin
@RequestMapping(value = "/live")
public class LiveInfoController {

    @Autowired
    private LiveInfoService infoService;

    @RequestMapping("/getLiveInfo")
    public JSONObject getLiveInfo(String callback) {//MappingJacksonValue
//        MappingJacksonValue jack = new  MappingJacksonValue(infoService.liveInfoToJson());
//        jack.setJsonpFunction(callback);
        return infoService.liveInfoToJson();
    }

    @RequestMapping("/getLivePc")
    public JsonResult getLivePc(String callback){//MappingJacksonValue
        JsonResult result;
        List<LivePc> livePcs = infoService.liveInfoToPc();
        if(livePcs == null)
            result =  new JsonResult<Void>(11,"暂无可观看的直播");
        else
            result = new JsonResult(1,"success",livePcs);
//        MappingJacksonValue jack = new  MappingJacksonValue(result);
//        jack.setJsonpFunction(callback);
        return result;


    }
}
