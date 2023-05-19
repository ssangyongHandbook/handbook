package com.sns.handbook.handler;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.OnMessage;

import org.json.JSONArray;
import org.json.JSONObject;
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
        
        JSONObject ob=new JSONObject(msg);
        
        //메시지 구분(보낸사람:내용)
        String mynum=ob.getString("mynum"); //보낸사람
        String upload=ob.getString("upload"); //메시지내용
        String reciever=""+ob.getInt("receiver"); //받는사람num
        String group=""+ob.getInt("group"); //그룹
        String type=ob.getString("type"); //그룹
        
        //메시지 저장
        MessageDto dto=new MessageDto();
		  
        String user_num=mynum;
        dto.setSender_num(user_num);
        
        if(type.equals("chat")) {
        	//사진을 선택 안했다면
        	if(upload.contains("http")) {
        		String checkContent="<div class='bubblecontent'>";
				
        		String[] linkArr=upload.split(" ");
        		for(String s:linkArr) {
        			if(s.contains("http")) {
        				checkContent+="<a href='"+s+"' target='_new' rel=\"nofollow noopener\" role=\"link\">"+s+"</a>"+" ";
        			}else {
        				checkContent+=s+" ";
        			}
        		}
        		
        		checkContent+="</div>";
        		upload=checkContent;
        		
        	}else {
        		upload="<div class='bubblecontent'>"+upload+"</div>";
        	}
        	dto.setMess_content(upload);
        }else {
        	upload="<img src='/messagephoto/"+upload+"'>";
        	dto.setMess_content(upload);
        }
        dto.setReceiver_num(reciever);
        
        dto.setMess_group(Integer.parseInt(group));
		  
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
