package com.glkj.webchat.websocket;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
@ServerEndpoint(value = "/videoServer", configurator = HttpSessionConfigurator.class)
public class VideoServer {
    private static final int MAX_CONNECTION = 20;
    private static final long MAX_TIMEOUT = 2 * 60 * 1000;
    private static final Map<String, String> usermap = Collections.synchronizedMap(new HashMap<String, String>());
    private static final Map<String, Session> sessions = Collections.synchronizedMap(new HashMap<String, Session>());

    @OnOpen
    public void onOpen(Session session){
        System.out.println("onOpen");
    }

    @OnMessage
    public void onMessage(String message, Session session){

    }

    @OnClose
    public void onClose(Session session){

    }

    @OnError
    public void onError(Throwable error){
        error.printStackTrace();
    }
}
