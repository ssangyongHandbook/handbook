package com.sns.handbook.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.dto.PostDto;
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
	public ModelAndView list(@RequestParam(defaultValue = "0") int offset) {
		List<PostDto> list = pserivce.postList(offset);
        ModelAndView model=new ModelAndView();
        int totalCount=pserivce.getTotalCount();
		
        model.addObject("offset",offset);
		model.addObject("total",totalCount);
		model.addObject("list",list);
        model.setViewName("/post/post_timeline");
		return model;
	}
	
	@PostMapping("/post/insert")
	@ResponseBody
	public void insertPost(@ModelAttribute PostDto dto, @RequestParam(required = false ) MultipartFile photo, HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/post_file");
		
		if(photo==null) {
	         dto.setPost_file("no");
	         pserivce.insertPost(dto);
	         
	      }else {//upload 한 경우

	  		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmm");
	  		String fileName="f_"+sdf.format(new Date())+photo.getOriginalFilename();

	  		dto.setPost_file(fileName);
		
		try {
			photo.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		pserivce.insertPost(dto);
	      }
}
	//delete
	@GetMapping("/post/delete")
	public void delete (int num) {
		
		pserivce.deletePost(num);
	}
	
}
