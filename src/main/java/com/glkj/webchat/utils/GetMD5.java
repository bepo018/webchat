package com.glkj.webchat.utils;

import com.glkj.webchat.utils.ex.SpeedException;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 获取MD5加密字符串 TODO 10 这里修改过
 */
public class GetMD5 {
    public static String getMD5(String str){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            return new BigInteger(1,md.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            throw new SpeedException("MD5加密出现错误");
        }
    }

    public static void main(String[] args) {
        System.out.println(getMD5("efefef"));;
    }
}
