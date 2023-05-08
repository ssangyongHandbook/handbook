package com.sns.handbook.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.dto.CommentDto;
import com.sns.handbook.serivce.CommentService;


@Controller
public class CommentController {

	@Autowired
	CommentService service;
	
	@GetMapping("test/comment")
	public ModelAndView test(@RequestParam(defaultValue = "0") String comment_num,
			@RequestParam(defaultValue = "0") int comment_group,
			@RequestParam(defaultValue = "0") int comment_step,
			@RequestParam(defaultValue = "0") int comment_level,
			@RequestParam(defaultValue = "0")int offset,
			@RequestParam(defaultValue = "12") String post_num) {
		
		ModelAndView model=new ModelAndView();
		
		List<CommentDto> list=service.selectScroll(post_num, offset);
		
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
	public void insert(@ModelAttribute CommentDto dto) {
	
		
		service.insert(dto);

	}
	
	@GetMapping("test/page")
	public String page() {
		
		return "/comment/page";
	}
	
	@GetMapping("test/scroll")
	@ResponseBody
	public List<CommentDto> scroll (String post_num,int offset) {
	
		List<CommentDto> list=service.selectScroll("12", offset);
		
		
		return list;

	}
}
