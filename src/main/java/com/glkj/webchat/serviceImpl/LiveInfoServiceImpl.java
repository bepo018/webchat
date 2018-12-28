package com.glkj.webchat.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.glkj.webchat.pojo.LivePc;
import com.sun.org.apache.xpath.internal.operations.Bool;
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
    private Integer count = 1;
    private Boolean flag = true;

    @Override
    public void addOne(LiveInfo liveInfo) {
        iLiveDao.insert(liveInfo);
    }

    @Override
    public List<LiveInfo> selectAll() {
        List<LiveInfo> list = iLiveDao.selectAll(count);
        int time = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
        System.out.println(time);
        if (time == 5 || time == 17) {  //5点或17点时将标记设置为true
            flag = true;
        }
        if ((time == 6 && flag) || (time == 18 && flag)) {
            count += list.size();
            flag = false;     //count改变之后标记设置为false
        }

        if (list.size() < 40) {
            count = 1;
        } else if(list.size()==0){
            count = 1;
            list = iLiveDao.selectAll(count);
        }
        return list;
    }

    /**
     * 返回JSON字符
     *
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
