package com.khtime.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/chatting.do")
public class ChattingServer {
	
	private static Map<String,Session> clients = new HashMap();
	
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		System.out.println("클라이언트 접속");
		System.out.println(session.getId());
		clients.put(session.getId(), session);
	}
	
	@OnMessage
	public void message(Session session, String msg) {
		System.out.println(session.getId()+"::::"+msg);
		
		String[] data = msg.split(","); // 0번인덱스=발송자 1번인덱스=내용
		
		session.getUserProperties().put("msg",data);
		
		Set<String> keys = clients.keySet();
		for(String key : keys) {
			Session s = clients.get(key);
			
			String [] clientData = (String[])s.getUserProperties().get("msg");
			
			if(clientData != null) {
				
				if(data[1].length() > 0) {
					if(clientData[0].equals(data[0])) {
						try {
							s.getBasicRemote().sendText(msg);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
	}
}
