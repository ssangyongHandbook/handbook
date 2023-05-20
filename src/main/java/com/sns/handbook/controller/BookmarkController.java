package com.sns.handbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.handbook.dto.BookmarkDto;
import com.sns.handbook.serivce.BookmarkService;

@Controller
public class BookmarkController {
	
	@Autowired
	BookmarkService service;
	

	@GetMapping("following/insertbookmark")
	@ResponseBody
	public void insertBookmark(@ModelAttribute BookmarkDto dto) {

		service.insertBookmark(dto);
	}
	
	@GetMapping("following/deletebookmark")
	@ResponseBody
	public void deleteBookmark(String owner_num, String bfriend_num){
		service.deleteBookmark(owner_num, bfriend_num);
	}
	
}
