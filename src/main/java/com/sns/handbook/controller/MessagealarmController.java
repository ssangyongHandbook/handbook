package com.sns.handbook.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.handbook.dto.FollowalarmDto;
import com.sns.handbook.dto.MessageDto;
import com.sns.handbook.dto.MessagealarmDto;
import com.sns.handbook.dto.PostalarmDto;
import com.sns.handbook.serivce.CommentService;
import com.sns.handbook.serivce.FollowalarmService;
import com.sns.handbook.serivce.MessageService;
import com.sns.handbook.serivce.MessagealarmService;
import com.sns.handbook.serivce.PostalarmService;
import com.sns.handbook.serivce.UserService;

@RestController
public class MessagealarmController{

	@Autowired
	UserService uservice;
	
	@Autowired
	MessageService mservice;
	
	@Autowired
	MessagealarmService maserive;
	
	@Autowired
	PostalarmService paservice;
	
	@Autowired
	CommentService cservice;
	
	@Autowired
	FollowalarmService faservice;
	
	//알림전송
	@GetMapping("/messagealaramadd")
	public void messagealaramAdd(HttpSession session, String other,
			int group)
	{
		//현재 사용자의 user_num
		String user_num=(String)session.getAttribute("user_num");
		
		//상대와의 메시지 알림이 있는지 확인
		int msgAlarmCount=maserive.getMessAlarmCount(group);
		
		//알림이 존재하면 알림 +1
		if(msgAlarmCount!=0) {
			maserive.updateMessAlarmChkcount(group);
		}else {
			//알림이 존재하지 않으면 insert
			maserive.insertMessAlarm(other, user_num, group, 1); //처음이니까 chkcount는 1
		}
	}
	
	//댓글 알림 전송
	@GetMapping("/postalarmadd")
	public void postalarmAdd(HttpSession session, Map<String, String> map) {
		//현재 사용자의 user_num
		String user_num=(String)session.getAttribute("user_num");
		
		PostalarmDto dto=new PostalarmDto();
		
		dto.setReceiver_num(user_num);
		dto.setPost_num(map.get("post_num"));
		dto.setSender_num(map.get("sender_num"));
		dto.setComment_num(map.get("comment_num"));
		
		String sender_name=uservice.getUserByNum(dto.getSender_num()).getUser_name();
		String sender_photo=uservice.getUserByNum(dto.getSender_num()).getUser_photo();
		String comment_content=cservice.getData(dto.getComment_num()).getComment_content();
		Timestamp comment_writeday=cservice.getData(dto.getComment_num()).getComment_writeday();
		
		dto.setSender_name(sender_name);
		dto.setSender_photo(sender_photo);
		dto.setComment_content(comment_content);
		dto.setComment_writeday(comment_writeday);
		
		//알림 insert
		paservice.insertPostAlarm(dto);
	}
	
	//팔로우 알림 전송
	@GetMapping("/followalarmadd")
	public void followalarmAdd(HttpSession session, String receiver_num) {
		//현재 사용자의 user_num
		String user_num=(String)session.getAttribute("user_num");

		FollowalarmDto dto=new FollowalarmDto();

		dto.setReceiver_num(receiver_num);
		dto.setSender_num(user_num);

		String sender_name=uservice.getUserByNum(dto.getSender_num()).getUser_name();
		String sender_photo=uservice.getUserByNum(dto.getSender_num()).getUser_photo();

		dto.setSender_name(sender_name);
		dto.setSender_photo(sender_photo);

		//알림 insert
		faservice.insertFollowalarm(dto);
	}
	
	//알림받아오기
	@GetMapping("/messagealarmget")
	public Map<String, Object> messagealarmGet(HttpSession session)
	{
		Map<String, Object> map=new HashMap<>();
		
		//내 num
		String user_num=(String)session.getAttribute("user_num");
		
		//알림개수 세기
		int msgalCount=maserive.getTotalCountMessAlarm(user_num);
		
		if(msgalCount!=0) {
			//메시지 알림 목록(최근대화목록)
			List<MessageDto> list=maserive.getAllMessAlarm(user_num);
			
			map.put("totalCount", maserive.getTotalCountMessAlarm(user_num));
			map.put("list", list);
		}
		
		//전체알림(메시지 제외)
		List<Object> alarmList=new ArrayList<>();
		int alarmCount=0;
		
		//댓글
		//댓글 알림개수 세기
		int postalarmCount=paservice.getTotalCountPostAlarm(user_num);
		alarmCount+=postalarmCount;
		
		if(postalarmCount!=0) {
			//댓글 목록
			List<PostalarmDto> paList=paservice.getAllPostAlarm(user_num);
			alarmList.addAll(paList);
		}
		
		//답글
		//좋아요
		
		//팔로우
		//팔로우 알림개수 세기
		int followalarmCount=faservice.getAllCountFollowalarm(user_num);
		alarmCount+=followalarmCount;
		
		if(followalarmCount!=0) {
			//팔로우 목록
			List<FollowalarmDto> faList=faservice.getAllFollowalarm(user_num);
			alarmList.addAll(faList);
		}
		
		map.put("alarmCount", alarmCount);
		map.put("alarmList", alarmList);
		
		return map;
	}
}
