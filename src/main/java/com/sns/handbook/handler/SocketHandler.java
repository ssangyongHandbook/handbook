package com.sns.handbook.handler;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.sns.handbook.dto.MessageDto;
import com.sns.handbook.serivce.MessageService;
import com.sns.handbook.serivce.UserService;



//상속받은 TextWebSocketHandler는 handleTextMessage를 실행
@Component
public class SocketHandler extends TextWebSocketHandler{
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	
	@Autowired
	MessageService mservie;
	
	@Autowired
	UserService uservice;
    
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
        
        //메시지 구분(보낸사람:내용)
        String[] msgarr=msg.split(":");
        msgarr[0]=msgarr[0].substring(0,msgarr[0].length()-1); //보낸사람
        msgarr[1]=msgarr[1].substring(1,msgarr[1].length()-1); //메시지내용
        msgarr[2]=msgarr[2].substring(1,msgarr[2].length()-1); //받는사람num
        msgarr[3]=msgarr[3].substring(1,msgarr[3].length()-1); //그룹
        msgarr[4]=msgarr[4].substring(1,msgarr[4].length()); //그룹
        
        //메시지 저장
        MessageDto dto=new MessageDto();
		  
        String myid=msgarr[0];
        String user_num=uservice.getUserById(myid).getUser_num();
        dto.setSender_num(user_num);
        
        if(msgarr[4].equals("chat")) {
        	//사진을 선택 안했다면
        	msgarr[1]="<div class='bubblecontent'>"+msgarr[1]+"</div>";
        	dto.setMess_content(msgarr[1]);
        }else {
        	msgarr[1]="<img src='/messagephoto/"+msgarr[1]+"'>";
        	dto.setMess_content(msgarr[1]);
        }
        dto.setReceiver_num(msgarr[2]);
        
        dto.setMess_group(Integer.parseInt(msgarr[3]));
		  
        mservie.insertMessage(dto);
		 
        
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
