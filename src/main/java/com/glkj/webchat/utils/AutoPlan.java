package com.glkj.webchat.utils;

import com.alibaba.fastjson.JSONObject;
import com.glkj.webchat.dao.ILottDao;
import com.glkj.webchat.pojo.LottType;
import com.glkj.webchat.pojo.YuCe;
import com.glkj.webchat.selectLott.HttpUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AutoPlan {

    private ILottDao lottDao;
    private ApplicationContext ac;
    private LottType lottType;
    private String lott;

    public AutoPlan(String lott) {
        this.lott = lott;
        ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
        lottDao = ac.getBean("lottDao",ILottDao.class);
        lottType = lottDao.findLottType(lott);
    }

    /**
     * 获取计划
     * @return 返回Obj数组 第一个元素为下期彩票开奖时间值 即线程睡眠的时间值
     *          第二个元素为发送的消息内容
     */
    public Object[] getPlanTemplate() {
        Object[] result = new Object[2];

        String lott;
        try {
            lott = HttpUtil.getLottInfo(this.lott,1);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        String firstArr = JSONObject.parseObject(lott).getJSONArray("data").getString(0);
        String nextOpenIssue = JSONObject.parseObject(firstArr).getString("nextOpenIssue");
        //截取期号的最后三位数  预测只支持查询期号后3位
        String temporaryIssue = nextOpenIssue.substring(nextOpenIssue.length()-3);
        long nextOpenTime = JSONObject.parseObject(firstArr).getDate("nextOpenTime").getTime();
        nextOpenTime -= new Date().getTime();
        result[0] = nextOpenTime;

        YuCe yuCe = lottDao.findYuCe(this.lott, temporaryIssue);

        System.out.println(yuCe);
        String message;

        if ("bjpk10".equals(this.lott)){
            int champNum = Integer.parseInt(yuCe.getChampNum());
            message = "<table>"+
                        "<tr>"+
                            "<td>彩种：</td>"+
                            "<td>"+lottType.getLottName()+"</td>"+
                            "<td>期号：</td>"+
                            "<td>"+nextOpenIssue+"</td>"+
                        "</tr>"+
                        "<tr>" +
                            "<td>预测：</td>"+
                            "<td>【冠军大小】</td>"+
                            "<td>"+(champNum > 5 ? "大":"小")+"</td>"+
                        "</tr>"+
                        "<tr>" +
                            "<td></td>"+
                            "<td>【冠军单双】</td>"+
                            "<td>"+(champNum / 2 == 0 ? "单":"双")+"</td>"+
                        "</tr>"+
                         "<tr>" +
                            "<td></td>"+
                            "<td>【冠军定位胆】</td>"+
                            "<td>"+yuCe.getChampNum()+"</td>"+
                        "</tr>"+
                        "<tr>"+
                            "<td colspan=1>投注命中率：</td>"+
                            "<td colspan=1></td>"+
                            "<td style='color:red;'>"+RandomCode.getFloat()+"%</td>"+
                        "</tr>"+
                    "</table>";
        }else if ("ssc".equals(this.lott)){
            int champNum = Integer.parseInt(yuCe.getChampNum());
            message = "<table>"+
                    "<tr>"+
                    "<td>彩种：</td>"+
                    "<td>"+lottType.getLottName()+"</td>"+
                    "<td>期号：</td>"+
                    "<td>"+nextOpenIssue+"</td>"+
                    "</tr>"+
                    "<tr>" +
                    "<td>预测：</td>"+
                    "<td>【万位大小】</td>"+
                    "<td>"+(champNum > 4 ? "大":"小")+"</td>"+
                    "</tr>"+
                    "<tr>" +
                    "<td></td>"+
                    "<td>【万位单双】</td>"+
                    "<td>"+(champNum / 2 == 0 ? "单":"双")+"</td>"+
                    "</tr>"+
                    "<tr>" +
                    "<td></td>"+
                    "<td>【万位定位胆】</td>"+
                    "<td>"+yuCe.getChampNum()+"</td>"+
                    "</tr>"+
                    "<tr>"+
                    "<td colspan=1>投注命中率：</td>"+
                    "<td colspan=1></td>"+
                    "<td style='color:red;'>"+RandomCode.getFloat()+"%</td>"+
                    "</tr>"+
                    "</table>";
        }else if ("jsk3".equals(this.lott)){
            String[] split = yuCe.getChampNum().split(",");
            int champNum = 0;
            for (String s : split){
                champNum += Integer.parseInt(s);
            }
            message = "<table>"+
                    "<tr>"+
                    "<td>彩种：</td>"+
                    "<td>"+lottType.getLottName()+"</td>"+
                    "<td>期号：</td>"+
                    "<td>"+nextOpenIssue+"</td>"+
                    "</tr>"+
                    "<tr>" +
                    "<td>预测：</td>"+
                    "<td>【和值大小】</td>"+
                    "<td>"+(champNum > 10 ? "大":"小")+"</td>"+
                    "</tr>"+
                    "<tr>" +
                    "<td></td>"+
                    "<td>【和值单双】</td>"+
                    "<td>"+(champNum / 2 == 0 ? "单":"双")+"</td>"+
                    "</tr>"+
                    "<tr>"+
                    "<td colspan=1>投注命中率：</td>"+
                    "<td colspan=1></td>"+
                    "<td style='color:red;'>"+RandomCode.getFloat()+"%</td>"+
                    "</tr>"+
                    "</table>";
        }else {
            return null;
        }
        result[1] = "{\"message\":{\"content\":\"" + message + "\",\"from\":\"" + "系统提示" + "\",\"to\":\"\",\"time\":\""
                + getTime() + "\"},\"type\":\"messageRobot\"}";
        return result;
    }

    /**
     * 获取当前时间
     *
     * @return
     */
    private String getTime() {
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 可以方便地修改日期格式
        String time = dateFormat.format(now);
        return time;
    }

}
