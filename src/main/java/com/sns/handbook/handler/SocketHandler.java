package com.sns.handbook.handler;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



//상속받은 TextWebSocketHandler는 handleTextMessage를 실행
@Component
public class SocketHandler extends TextWebSocketHandler{
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	
	//@Autowired
	//ChatMapper mapper;
    
	//웹소켓 연결이 되면 동작하는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //소켓 연결시
        super.afterConnectionEstablished(session);
        sessionMap.put(session.getId(), session);
    }
    
    //웹소켓 연결이 종료되면 동작하는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        //소켓 종료시
        sessionMap.remove(session.getId());
        super.afterConnectionClosed(session, status);
    }
    
    //메시지를 발송하면 동작하는 메소드
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        //메시지 발송시
        String msg = message.getPayload();
        //System.out.println(msg);
        String[] msgarr=msg.split(":");
        msgarr[0]=msgarr[0].substring(0,msgarr[0].length()-1);
        msgarr[1]=msgarr[1].substring(1,msgarr[1].length());
        
		
		 //ChatDto dto=new ChatDto();
		  
		 //dto.setWriter(msgarr[0]); dto.setMessage(msgarr[1]); dto.setCgroup(0);
		  
		 //mapper.insertChat(dto);
		 
        
        for(String key : sessionMap.keySet()) {
            WebSocketSession wss = sessionMap.get(key);
            try {
                wss.sendMessage(new TextMessage(msg));
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
}
