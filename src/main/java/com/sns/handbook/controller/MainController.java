package com.sns.handbook.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.serivce.UserService;



@Controller
public class MainController {
	
	@Autowired
	UserService uservice;
	
	@RequestMapping("/")
	public ModelAndView chat() {
		
		ModelAndView mv=new ModelAndView();
		
		int totalCount=uservice.getTotalCount();
		
		mv.addObject("total",totalCount);
		
		mv.setViewName("/login/loginmain");
		return mv;
	}
}
