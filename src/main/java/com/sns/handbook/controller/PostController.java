package com.sns.handbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.serivce.PostService;

@Controller
public class PostController {

	@Autowired
	PostService pserivce;
	
	@GetMapping("/post/write")
	public String write() {
		return "/post/post_writeform";
	}
	
	
	@GetMapping("/post/timeline")
	public ModelAndView list() {
		
        ModelAndView model=new ModelAndView();
        int totalCount=pserivce.getTotalCount();
		
		model.addObject("total",totalCount);

        model.setViewName("/post/post_timeline");
		return model;
	}
}
