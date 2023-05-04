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
import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.FollowingService;
import com.sns.handbook.serivce.UserService;

@Controller
public class UserController {

	@Autowired
	UserService uservice;
	
	@Autowired
	FollowingService fservice;
	
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
	public ModelAndView mypage(HttpSession session)
	{
		ModelAndView model=new ModelAndView();
		
		int followercount=fservice.getTotalFollower((String)session.getAttribute("user_num"));
		
		List<UserDto> list=uservice.getAllUsers();
		
		model.addObject("list", list);
		model.addObject("followercount", followercount);
		
		model.setViewName("/sub/user/mypage");
		
		return model;
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
