package com.sns.handbook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.handbook.dto.MessageDto;
import com.sns.handbook.dto.MessagealarmDto;
import com.sns.handbook.serivce.MessageService;
import com.sns.handbook.serivce.MessagealarmService;
import com.sns.handbook.serivce.UserService;

@RestController
public class MessagealarmController{

	@Autowired
	UserService uservice;
	
	@Autowired
	MessageService mservice;
	
	@Autowired
	MessagealarmService maserive;
	
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
		
		return map;
	}
}
