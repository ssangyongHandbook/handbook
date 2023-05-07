package com.sns.handbook.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.dto.FollowingDto;
import com.sns.handbook.dto.PostDto;
import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.FollowingService;
import com.sns.handbook.serivce.PostService;
import com.sns.handbook.serivce.UserService;

@Controller
public class UserController {

	@Autowired
	UserService uservice;
	
	@Autowired
	FollowingService fservice;
	
	@Autowired
	PostService pservice;
	
	@PostMapping("/user/coverupdate")
	@ResponseBody
	public void coverupdate(String user_num, MultipartFile cover,
			HttpSession session,@ModelAttribute UserDto dto)
	{
			//업로드 경로
			String path=session.getServletContext().getRealPath("/cover");
			
			//파일명 구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String coverName="f_"+sdf.format(new Date())+cover.getOriginalFilename();
			
			try {
				cover.transferTo(new File(path+"\\"+coverName));
				
				//db수정
				uservice.updateCover(user_num, coverName);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
	}
	
	@PostMapping("/user/photoupdate")
	@ResponseBody
	public void photoupdate(String user_num,MultipartFile photo,
			HttpSession session,@ModelAttribute UserDto dto)
	{
		//업로드 경로
		String path=session.getServletContext().getRealPath("/photo");
		
			//파일명 구하기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photoName="f_"+sdf.format(new Date())+photo.getOriginalFilename();
			
			try {
				photo.transferTo(new File(path+"\\"+photoName));
				
				uservice.updatePhoto(user_num, photoName);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	@GetMapping("/user/mypage")
	public ModelAndView mypage(HttpSession session,String to_user,String from_user)
	{
		ModelAndView model=new ModelAndView();
		
		int followercount=fservice.getTotalFollower((String)session.getAttribute("user_num"));
		int togetherFollowcount=fservice.togetherFollow(to_user, from_user);
		
		List<UserDto> list=uservice.getAllUsers();
		List<PostDto> postlist=uservice.getPost((String)session.getAttribute("user_num"));
		
		model.addObject("list", list);
		model.addObject("postlist",postlist);
		model.addObject("followercount", followercount);
		model.addObject("togetherFollowcount", togetherFollowcount);
		model.setViewName("/sub/user/mypage");
		
		return model;
	}
	
	@PostMapping("/user/insertpost")
	@ResponseBody
	public void insertPost(@ModelAttribute PostDto dto, @RequestParam(required = false ) MultipartFile photo, HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/post_file");
		
		if(photo==null) {
	         dto.setPost_file("no");
	         pservice.insertPost(dto);
	         
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
		
		pservice.insertPost(dto);
	    }
	}
	
	@ResponseBody
	@PostMapping("/user/updateinfo")
	public void updateinfo(UserDto dto)
	{
		uservice.updateUserInfo(dto);
	}
	
	@GetMapping("/user/info")
	public String info()
	{
		return "/sub/user/info";
	}
	
	@GetMapping("/user/friend")
	public String friend()
	{
		return "/sub/user/friend";
	}

	
}
