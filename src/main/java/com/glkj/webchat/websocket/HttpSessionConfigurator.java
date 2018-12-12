package com.glkj.webchat.websocket;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

/**
 * Copyright © 2018 The so-called success is to make extraordinary persistence
 * in the ordinary.
 * 
 * @author qsjteam
 * @date 2018-10-1
 */
public class HttpSessionConfigurator extends ServerEndpointConfig.Configurator  {
    @Override
    public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response){
        
    	HttpSession httpSession = (HttpSession)request.getHttpSession();
    	//try {
    		config.getUserProperties().put(HttpSession.class.getName(),httpSession);
    	/*}catch(NullPointerException e) {
    		
    	}*/
    }
}
