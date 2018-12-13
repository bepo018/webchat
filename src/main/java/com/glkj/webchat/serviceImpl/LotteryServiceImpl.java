package com.glkj.webchat.serviceImpl;

import java.io.IOException;
import java.util.*;

import javax.annotation.PostConstruct;

import com.glkj.webchat.pojo.AppointYuCe;
import com.glkj.webchat.pojo.YuCe;
import com.glkj.webchat.utils.RandomCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.glkj.webchat.dao.ILottDao;
import com.glkj.webchat.pojo.LottType;
import com.glkj.webchat.selectLott.BufferPool;
import com.glkj.webchat.selectLott.HttpUtil;
import com.glkj.webchat.selectLott.LotteryHandler;
import com.glkj.webchat.service.ILotteryService;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 *
 * @author qsjteam
 * @date 2018-10-1
 */
@Service("iLotteryService")
public class LotteryServiceImpl implements ILotteryService {

    @Autowired
    private ILottDao iLottDao;

    List<LottType> list;
    String[] fives = new String[]{"ssc", "bjpk10", "jsk3", "lhc", "gdsyxw"};
    String[] fivesc = new String[]{"重庆时时彩", "北京赛车", "江苏快三", "香港六合彩", "广东11选5"};

    @PostConstruct
    public void init() {
        list = iLottDao.selectActivation(1);

        for (LottType lottery : list) {
            String lottInfo;
            try {
                lottInfo = HttpUtil.getLottInfo(lottery.getLottCode(), 1);
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
            BufferPool.getInstance().put(lottery.getLottCode(), lottInfo);
        }
        for (LottType lottery : list) {
            String lottInfo;
            try {
                lottInfo = HttpUtil.getLottInfo(lottery.getLottCode(), 20);
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
            BufferPool.getInstance().put20(lottery.getLottCode(), lottInfo);
        }
        for (LottType lottery : list) {
            BufferPool.getInstance().putLottType(lottery.getLottCode(), lottery);
        }
    }

    @Override
    public JSONObject allLottList() {
        JSONObject data = new JSONObject();
        JSONArray arrays = new JSONArray();
        for (LottType lott : list) {
            String lottery = lott.getLottCode();
            String result = LotteryHandler.getLottery(lottery, 1);

            data = JSONObject.parseObject(result);
            JSONArray array = data.getJSONArray("data");
            JSONObject subJson = JSONObject.parseObject(array.get(0).toString());
            subJson.put("lott", lottery);
            subJson.put("cnName", lott.getLottName());
            array.remove(0);
            array.add(subJson);
            arrays.add(array);
        }
        data.put("data", arrays);
        return data;
    }

    @Override
    public JSONObject firstLottery(String lott) {
        if (lott == null)
            return null;
        //throw new RuntimeException("该彩票不存在");
        String result = LotteryHandler.getLottery(lott, 20);

        //将缓存中的字符串转换为json对象
        JSONObject data = JSONObject.parseObject(result);
        //获取下一次开奖时间
        Date date = JSONObject.parseObject(data.getJSONArray("data").getString(0)).getDate("nextOpenTime");
        long nexttimestamp = date.getTime();
        //获取系统当前时间的毫秒数
        long systemTime = new Date().getTime();
        //将倒计时的秒数存入json中
        data.put("time", nexttimestamp - systemTime);
        //将露珠转换成json对象存入json对象中
        String luzhu = LotteryHandler.getLuzhu(lott);
        data.put("luzhu", JSONObject.parseObject(luzhu));
        data.put("yuce", RandomCode.getLottYuCe(lott));
        return data;
    }

    @Override
    public Map<String, Object> yuceLottery(String lott, String gid, String play) {
        HashMap<String, Object> map = new HashMap<>();
        List<YuCe> yuCeList = iLottDao.findYuCeByIds(lott, gid, play);
        String lottStr = LotteryHandler.getLottery(lott, 20);
        JSONArray lottArr = JSONObject.parseObject(lottStr).getJSONArray("data");
        map.put("yuce", yuCeList);
        map.put("lott", lottArr);
        return map;
    }

    @Override
    public JSONObject fiveLottery() {
        JSONObject data = new JSONObject();
        JSONArray arrays = new JSONArray();
        for (int i = 0; i < fives.length; i++) {
            String lottery = fives[i];
            String result = LotteryHandler.getLottery(lottery, 1);

            data = JSONObject.parseObject(result);
            JSONArray array = data.getJSONArray("data");
            JSONObject subJson = JSONObject.parseObject(array.get(0).toString());
            subJson.put("lott", lottery);
            subJson.put("cnName", fivesc[i]);
            array.remove(0);
            array.add(subJson);
            arrays.add(array);
        }
        data.put("data", arrays);
        return data;
    }

    @Override
    public Map<String, Object> appointLottery(String lott, String gid, String play) {
        HashMap<String, Object> map = new HashMap<>();
        String lottStr = LotteryHandler.getLottery(lott, 20);
        JSONArray lottArr = JSONObject.parseObject(lottStr).getJSONArray("data");

        //if (Integer.parseInt(gid)-20 < 0)

        List<YuCe> yuCeList = iLottDao.findYuCeByIds(lott, gid,  play);

        List<AppointYuCe> list = new ArrayList<>(yuCeList.size());
        for (YuCe yuCe : yuCeList){
            AppointYuCe appointYuCe = new AppointYuCe();
            appointYuCe.setId(yuCe.getId());
            appointYuCe.setLottId(yuCe.getLottId());
            appointYuCe.setGid(yuCe.getGid());
            if (lott.equals("bjpk10")){
                switch (play) {
                    case "0":
                    case "1":
                        appointYuCe.setSpecial(yuCe.getChampNum());
                        break;
                    case "2":
                        appointYuCe.setSpecial(yuCe.getFirst());
                        break;
                    case "3":
                        appointYuCe.setSpecial(yuCe.getSecond());
                        break;
                    case "4":
                        appointYuCe.setSpecial(yuCe.getThird());
                        break;
                    case "5":
                        appointYuCe.setSpecial(yuCe.getForth());
                        break;
                    case "6":
                        appointYuCe.setSpecial(yuCe.getFifth());
                        break;
                    case "7":
                        appointYuCe.setSpecial(yuCe.getSixth());
                        break;
                    case "8":
                        appointYuCe.setSpecial(yuCe.getSeventh());
                        break;
                    case "9":
                        appointYuCe.setSpecial(yuCe.getEighth());
                        break;
                    case "10":
                        appointYuCe.setSpecial(yuCe.getNinth());
                        break;
                    case "11":
                        appointYuCe.setSpecial(yuCe.getTenth());
                }
            }else if(lott.equals("ssc")){
                switch (play) {
                    case "0":
                    case "1":
                        appointYuCe.setSpecial(yuCe.getChampNum());
                        break;
                    case "2":
                        appointYuCe.setSpecial(yuCe.getFirst());
                        break;
                    case "3":
                        appointYuCe.setSpecial(yuCe.getSecond());
                        break;
                    case "4":
                        appointYuCe.setSpecial(yuCe.getThird());
                        break;
                    case "5":
                        appointYuCe.setSpecial(yuCe.getForth());
                        break;
                    case "6":
                        appointYuCe.setSpecial(yuCe.getFifth());
                }
            }else if (lott.equals("jsk3")){
                appointYuCe.setSpecial(yuCe.getChampNum());
            }
            list.add(appointYuCe);
        }

        map.put("yuce", list);
        map.put("lott", lottArr);
        return map;
    }

}
