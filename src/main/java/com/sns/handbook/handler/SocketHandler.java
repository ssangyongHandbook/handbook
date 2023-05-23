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

import com.sns.handbook.dto.CommentalarmDto;
import com.sns.handbook.dto.FollowalarmDto;
import com.sns.handbook.dto.MessageDto;
import com.sns.handbook.dto.PostalarmDto;
import com.sns.handbook.serivce.CommentService;
import com.sns.handbook.serivce.CommentalarmService;
import com.sns.handbook.serivce.FollowalarmService;
import com.sns.handbook.serivce.MessageService;
import com.sns.handbook.serivce.PostService;
import com.sns.handbook.serivce.PostalarmService;
import com.sns.handbook.serivce.UserService;



//상속받은 TextWebSocketHandler는 handleTextMessage를 실행
@Component
public class SocketHandler extends TextWebSocketHandler{
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	
	@Autowired
	MessageService mservie;
	
	@Autowired
	UserService uservice;
	
	@Autowired
	FollowalarmService faservice;
	
	@Autowired
	PostalarmService paservice;
	
	@Autowired
	PostService pservice;
	
	@Autowired
	CommentalarmService caservice;
	
	@Autowired
	CommentService cservice;
    
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
        
        if((ob.getString("type")).equals("follow")) {
        	FollowalarmDto dto=new FollowalarmDto();
        	
        	String receiver_num=ob.getString("receiver_num");
        	String sender_num=ob.getString("sender_num");
        	
        	int sameData=faservice.findSameFollowalarm(receiver_num, sender_num);
        	
        	if(sameData!=0) {
        		//중복 데이터가 있으면 삭제하고 다시 넣음(최신순으로 넣으려고..)
        		String followal_num=faservice.getFollowalarmByNum(receiver_num, sender_num).getFollowal_num();
        		faservice.deleteFollowalarm(followal_num);
        	}
        	
        	dto.setReceiver_num(receiver_num);
        	dto.setSender_num(sender_num);
        	
        	faservice.insertFollowalarm(dto);
        }
        
        else if((ob.getString("type")).equals("post")) {
        	PostalarmDto dto=new PostalarmDto();
        	
        	String sender_num=ob.getString("sender_num");
        	String post_num=ob.getString("post_num");
        	String comment_content=ob.getString("comment_content");
        	
        	String receiver_num=pservice.getDataByNum(post_num).getUser_num();
        	
        	dto.setReceiver_num(receiver_num);
        	dto.setSender_num(sender_num);
        	dto.setPost_num(post_num);
        	dto.setComment_content(comment_content);
        	
        	paservice.insertPostAlarm(dto);
        }
        
        else if((ob.getString("type")).equals("comment")) {
        	CommentalarmDto dto=new CommentalarmDto();
        	
        	String sender_num=ob.getString("sender_num");
        	String comment_num=ob.getString("comment_num");
        	String comment_content=ob.getString("comment_content");
        	
        	String receiver_num=cservice.getData(comment_num).getUser_num();
        	
        	dto.setReceiver_num(receiver_num);
        	dto.setSender_num(sender_num);
        	dto.setComment_num(comment_num);
        	dto.setComment_content(comment_content);
        	
        	caservice.insertCommentAlarm(dto);
        }
        
        else {
        	//메시지 구분(보낸사람:내용)
            String mynum=ob.getString("mynum"); //보낸사람
            String upload=ob.getString("upload"); //메시지내용
            String reciever=ob.getString("receiver"); //받는사람num
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
    		
        }
        
        for(String key : sessionMap.keySet()) {
            WebSocketSession wss = sessionMap.get(key);
            try {
                wss.sendMessage(new TextMessage(msg));
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        /////
    }
}
