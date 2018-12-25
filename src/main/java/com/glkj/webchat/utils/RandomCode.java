package com.glkj.webchat.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 *
 * @author qsjteam
 * @date 2018-10-1
 */
public class RandomCode {

    private static Random rand = new Random();

    /**
     * 随机游客名
     *
     * @param length
     * @return
     */
    public static String getCode(int length) {
        String[] arrs = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            sb.append(arrs[rand.nextInt(arrs.length)]);
        }
        return sb.toString();
    }

    /**
     * 随机数
     *
     * @param length
     * @return
     */
    public static int getNum(int length) {
        return rand.nextInt(length);
    }

    public static float getFloat(){
        long s = rand.nextInt(10000);
        while (s < 6000) {
            s = rand.nextInt(10000);
        }
        return s/100f;
    }

    /**
     * 彩票预测
     *
     * @param lott
     * @return
     */
    public static String getLottYuCe(String lott) {

        if (lott == null || lott == "")
            return "操作有误，请刷新页面";

        if (lott.equals("bjpk10")) {
            return getRepeatCode(10, 1, 10, false);
        } else if (lott.matches(".*ssc.*")) {
            return getRepeatCode(5, 0, 10, true);
        } else if (lott.matches(".*k3.*")) {
            return getRepeatCode(3, 1, 6, true);
        }else if (lott.matches(".*syxw.*")) {
            return getRepeatCode(5, 1, 11, false);
        }
        return "预测系统正忙，请稍后再试...";
    }

    private static String getRepeatCode(int length, int min, int max, boolean repeat) {
        List<Integer> list = new ArrayList<>();
        while (list.size() <= length - 1) {
            int a = rand.nextInt(max) + min;
            if (!repeat) {
                if (!list.contains(a)) {
                    list.add(a);
                }
            } else {
                list.add(a);
            }
        }
        return listToString(list);
    }

    private static String listToString(List<Integer> list) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < list.size(); i++) {
            if (i != 0) {
                sb.append(",");
            }
            if (list.size() >= 10 && list.get(i) / 10 <= 0){
                sb.append("0");
            }
            sb.append(list.get(i));
        }
        return sb.toString();
    }

}
