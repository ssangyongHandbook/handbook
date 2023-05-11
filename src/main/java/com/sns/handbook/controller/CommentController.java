package com.sns.handbook.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.dto.CommentDto;
import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.CommentService;
import com.sns.handbook.serivce.UserService;


@Controller
public class CommentController {

	@Autowired
	CommentService service;
	@Autowired
	UserService uservice;
	
	@GetMapping("test/comment")
	public ModelAndView test(@RequestParam(defaultValue = "0") String comment_num,
			@RequestParam(defaultValue = "0") int comment_group,
			@RequestParam(defaultValue = "0") int comment_step,
			@RequestParam(defaultValue = "0") int comment_level,
			@RequestParam(defaultValue = "0")int offset,
			@RequestParam(defaultValue = "9") String post_num) {
		
		ModelAndView model=new ModelAndView();
		
		List<CommentDto> list=service.selectScroll(post_num, offset);
		
		for(int i=0;i<list.size();i++) {
			
			UserDto udto=uservice.getUserByNum(list.get(i).getUser_num());
			list.get(i).setUser_name(udto.getUser_name());
			list.get(i).setUser_photo(udto.getUser_photo());
			
			
			// 대화 시간 오늘 날짜에서 빼기(몇 초전... 몇 분 전...)
	         Date today = new Date();
	         /* System.out.println(today); */
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
	         Date writeday = new Date();
	         try {
	            writeday = sdf.parse(list.get(i).getComment_writeday().toString());
	            /* System.out.println(writeday); */
	         } catch (ParseException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }

	         long diffSec = (today.getTime() - writeday.getTime());
	         diffSec -= 32400000L; // DB에 now()로 들어가는 시간이 9시간 차이 나서 빼줌
	         /* System.out.println(diffSec); */

	         // 일시분초
	         long day = (diffSec / (60 * 60 * 24 * 1000L)) % 365;
	         long hour = (diffSec / (60 * 60 * 1000L)) % 24;
	         long minute = (diffSec / (60 * 1000L)) % 60;
	         long second = (diffSec / 1000L) % 60;

	         String preTime = "";

	         if (day != 0) {
	            // 하루 이상이 지났으면 일수만 표시
	            preTime = "" + day + "일 전";
	         } else {
	            if (hour != 0) {
	               // 1시간 이상이 지났으면 시(hour)만 표시
	               preTime = "" + hour + "시간 전";
	            } else {
	               if (minute != 0) {
	                  // 1분 이상이 지났으면 분만 표시
	                  preTime = "" + minute + "분 전";
	               } else {
	                  // 1분 미만 초만 표시
	                  preTime = "" + second + "초 전";
	               }
	            }
	         }
	         list.get(i).setPerTime(preTime);
		}
		
		model.addObject("comment_num", comment_num);
		model.addObject("comment_group", comment_group);
		model.addObject("comment_step", comment_step);
		model.addObject("comment_level", comment_level);
		model.addObject("list",list);
		model.addObject("offset", offset);

		
		model.setViewName("/comment/test");
		
		return model;
	}
	
	@PostMapping("test/cinsert")
	@ResponseBody
	public void insert(@ModelAttribute CommentDto dto,HttpSession session) {
	
		System.out.println(dto.getComment_num());
		
		if(!dto.getComment_num().equals("0")) {
			CommentDto momDto= service.getData(dto.getComment_num());
			
			dto.setComment_group(momDto.getComment_group());
			dto.setComment_step(momDto.getComment_step());
			dto.setComment_level(momDto.getComment_level());
		}else {
			
			dto.setComment_group(0);
			dto.setComment_step(0);
			dto.setComment_level(0);
		}
		dto.setUser_num((String)session.getAttribute("user_num"));
		service.insert(dto);

	}
	
	
	@GetMapping("test/scroll")
	@ResponseBody
	public List<CommentDto> scroll (String post_num,int offset) {
	
		List<CommentDto> list=service.selectScroll(post_num	, offset);
		
		for(int i=0;i<list.size();i++) {
			
			UserDto udto=uservice.getUserByNum(list.get(i).getUser_num());
			list.get(i).setUser_name(udto.getUser_name());
			list.get(i).setUser_photo(udto.getUser_photo());
			
			// 대화 시간 오늘 날짜에서 빼기(몇 초전... 몇 분 전...)
	         Date today = new Date();
	         /* System.out.println(today); */
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
	         Date writeday = new Date();
	         try {
	            writeday = sdf.parse(list.get(i).getComment_writeday().toString());
	            /* System.out.println(writeday); */
	         } catch (ParseException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }

	         long diffSec = (today.getTime() - writeday.getTime());
	         diffSec -= 32400000L; // DB에 now()로 들어가는 시간이 9시간 차이 나서 빼줌
	         /* System.out.println(diffSec); */

	         // 일시분초
	         long day = (diffSec / (60 * 60 * 24 * 1000L)) % 365;
	         long hour = (diffSec / (60 * 60 * 1000L)) % 24;
	         long minute = (diffSec / (60 * 1000L)) % 60;
	         long second = (diffSec / 1000L) % 60;

	         String preTime = "";

	         if (day != 0) {
	            // 하루 이상이 지났으면 일수만 표시
	            preTime = "" + day + "일 전";
	         } else {
	            if (hour != 0) {
	               // 1시간 이상이 지났으면 시(hour)만 표시
	               preTime = "" + hour + "시간 전";
	            } else {
	               if (minute != 0) {
	                  // 1분 이상이 지났으면 분만 표시
	                  preTime = "" + minute + "분 전";
	               } else {
	                  // 1분 미만 초만 표시
	                  preTime = "" + second + "초 전";
	               }
	            }
	         }
	         list.get(i).setPerTime(preTime);
		}
		
		
		return list;

	}
}
