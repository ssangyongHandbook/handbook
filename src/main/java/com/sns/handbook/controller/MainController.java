package com.sns.handbook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.serivce.UserService;



@Controller
public class MainController {
	
	@Autowired
	UserService uservice;
	
	@RequestMapping("/")
	public ModelAndView start(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		
		
		// 로그인상태인지 아닌지 확인
		String loginok = (String)session.getAttribute("loginok");
		
		int totalCount=uservice.getTotalCount();
		
		mv.addObject("total",totalCount);
		//로그인이 안되어있으면, 로그인 폼으로 이동
		if(loginok == null) {
			mv.setViewName("/login/loginmain");
		} else {
			//로그인이 되어있으면 타임라인으로 이동
			mv.setViewName("redirect:/post/timeline");
		}

		return mv;
	}
	
	
	@GetMapping("/user/mypage")
	public String mypage()
	{
		return "/sub/user/mypage";
	}
}
