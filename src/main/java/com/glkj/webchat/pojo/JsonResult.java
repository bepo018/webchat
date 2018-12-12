package com.glkj.webchat.pojo;

import java.io.Serializable;

public class JsonResult<T> implements Serializable {
    private Integer code;
    private String message;
    private T data;

    public JsonResult(){}

    public JsonResult(Integer code, String message){
        this.code = code;
        this.message = message;
    }

    public JsonResult(Integer code, String message, T data){
        this(code,message);
        this.data = data;
    }

    @Override
    public String toString() {
        return "JsonResult{" +
                "code=" + code +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
