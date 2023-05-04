package com.sns.handbook.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.dto.MessageDto;
import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.MessageService;
import com.sns.handbook.serivce.UserService;

@Controller
public class MessageController {
	
	@Autowired
	MessageService mservice;
	
	@Autowired
	UserService uservice;

	@GetMapping("/message/main")
	public ModelAndView meesageMain(HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		
		//사용자의 num 받기
		String myid=(String)session.getAttribute("myid");
		String user_num=uservice.getUserById(myid).getUser_num();
		
		//로그인한 사용자가 가장 최근한 대화한 채팅방
		int recentGroup=mservice.getRecentGroup(user_num);
		
		//가장 최근 대화한 상대 정보 전달
		List<Map<String, Object>> chatMember=mservice.selectAllChatMemeber(user_num);
		
		//최근 상대방의 userDto
		UserDto otherInfo=uservice.getUserByNum(chatMember.get(0).get("member_num").toString());
		
		//저장
		model.addObject("recentgroup",recentGroup);
		model.addObject("otherinfo",otherInfo);
		model.addObject("user_num",user_num);
		
		model.setViewName("/sub/message/messagemain");
		
		return model;
	}
	
	@GetMapping("/message/chatting")
	@ResponseBody
	public List<MessageDto> chatting(int mess_group,HttpSession session)
	{
		//사용자의 num 받기
		String myid=(String)session.getAttribute("myid");
		String user_num=uservice.getUserById(myid).getUser_num();
				
		List<MessageDto> chat=new ArrayList<>();
		
		chat=mservice.selectAllByGroup(mess_group, user_num);
		Collections.reverse(chat); //역정렬
		
		return chat;
	}
	
	@GetMapping("/message/memberlist")
	@ResponseBody
	public List<Map<String, Object>> memberlist(HttpSession session)
	{
		//사용자의 num 받기
		String myid=(String)session.getAttribute("myid");
		String user_num=uservice.getUserById(myid).getUser_num();

		//대화 상대와 메시지 그룹 받아오기
		List<Map<String, Object>> chatMember=mservice.selectAllChatMemeber(user_num);

		//상대측 아이디,이름,유저사진(프사) 추가하기
		for(Map<String, Object> map:chatMember)
		{
			UserDto udto=uservice.getUserByNum(map.get("member_num").toString()); //상대방의 userDto

			map.put("member_id", udto.getUser_id());
			map.put("member_name", udto.getUser_name());
			map.put("member_photo", udto.getUser_photo());

			//대화 시간 오늘 날짜에서 빼기(몇 초전... 몇 분 전...)
			Date today=new Date();
			/* System.out.println(today); */
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
			Date writeday=new Date();
			try {
				writeday=sdf.parse(map.get("writeday").toString());
				/* System.out.println(writeday); */
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			long diffSec=(today.getTime()-writeday.getTime());
			diffSec-=32400000L; //DB에 now()로 들어가는 시간이 9시간 차이 나서 빼줌
			/* System.out.println(diffSec); */

			//일시분초
			long day=(diffSec/(60*60*24*1000L))%365;
			long hour=(diffSec/(60*60*1000L))%24;
			long minute=(diffSec/(60*1000L))%60;
			long second=(diffSec/1000L)%60;

			String preTime="";

			if(day!=0) {
				//하루 이상이 지났으면 일수만 표시
				preTime=""+day+"일 전";
			}else {
				if(hour!=0) {
					//1시간 이상이 지났으면 시(hour)만 표시
					preTime=""+hour+"시간 전";
				}else {
					if(minute!=0) {
						//1분 이상이 지났으면 분만 표시
						preTime=""+minute+"분 전";
					}else {
						//1분 미만 초만 표시
						preTime=""+second+"초 전";
					}
				}
			}

			map.put("writeday", preTime); //시간 다시 넣어주기
		}

		return chatMember;	
	}
}
