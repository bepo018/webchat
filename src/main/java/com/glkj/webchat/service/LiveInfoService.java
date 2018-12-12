package com.glkj.webchat.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.glkj.webchat.pojo.LiveInfo;
import com.glkj.webchat.pojo.LivePc;

public interface LiveInfoService {
    /**
     * 添加一条记录
     *
     * @param liveInfo
     */
    void addOne(LiveInfo liveInfo);

    /**
     * 查询所有直播数据
     * @return
     */
    List<LiveInfo> selectAll();

    /**
     * 将直播数据返回为json
     * @return
     */
    JSONObject liveInfoToJson();

    /**
     * 获取pc直播数据
     * @return
     */
    List<LivePc> liveInfoToPc();
}
