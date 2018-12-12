package com.glkj.webchat.utils;

import java.util.HashMap;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
@SuppressWarnings({ "unchecked", "rawtypes", "serial" })
public class Result extends HashMap {
    public static final int SUCCESS = 0;
    public static final int ERROR = -1;

    public Result(int _result, String _msg){
        this.put("result", _result);
        this.put("msg", _msg);
    }

    public static Result success(String _msg){
        return new Result(SUCCESS, _msg);
    }

    public static Result error(String _msg){
        return new Result(ERROR, _msg);
    }
}
