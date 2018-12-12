package com.glkj.webchat.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.glkj.webchat.pojo.LivePc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.glkj.webchat.dao.ILiveDao;
import com.glkj.webchat.pojo.LiveInfo;
import com.glkj.webchat.pojo.LiveOK;
import com.glkj.webchat.service.LiveInfoService;

@Service(value = "liveInfoService")
public class LiveInfoServiceImpl implements LiveInfoService {
    @Autowired
    private ILiveDao iLiveDao;

    @Override
    public void addOne(LiveInfo liveInfo) {
        iLiveDao.insert(liveInfo);
    }

    @Override
    public List<LiveInfo> selectAll() {
        return iLiveDao.selectAll();
    }

    /**
     * 返回JSON字符
     * @return
     */
    public JSONObject liveInfoToJson() {
        JSONObject result = new JSONObject();
        List<LiveInfo> infos = selectAll();
        Date date = infos.get(0).getCreateTime();
        JSONArray jsonArray = new JSONArray();
        for (LiveInfo info : infos) {
            LiveOK ok = new LiveOK();
            ok.setName(info.getName());
            ok.setHot(info.getHot());
            ok.setPhoto(info.getPhoto());
            ok.setRoomAddress(info.getRoomAddress());
            JSONObject josn = (JSONObject) JSONObject.toJSON(ok);
            jsonArray.add(josn);
        }
        System.out.println(date);
        SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
        String s = sdf.format(date);
        result.put("code", s);
        result.put("data", jsonArray);
        return result;
    }

    @Override
    public List<LivePc> liveInfoToPc() {
        return iLiveDao.selectLive();

    }
}
