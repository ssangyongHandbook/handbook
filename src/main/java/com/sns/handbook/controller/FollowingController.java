package com.sns.handbook.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.handbook.dto.FollowingDto;
import com.sns.handbook.serivce.FollowingService;

@Controller
@RequestMapping("following")
public class FollowingController {

	@Autowired
	FollowingService service;
	
	@GetMapping("/test")
	public String test(Model model) {
		
		
		
		model.addAttribute("totalCount", service.getTotalFollowing("1"));
		model.addAttribute("totalCount2", service.getTotalFollowing("2"));
		
		return "/follow/following";
	}
	
	@GetMapping("insertfollowing")
	@ResponseBody
	public void insertFollowing(@ModelAttribute FollowingDto dto) {
		
		service.insertFollowing(dto);
	}
	
	@GetMapping("followcheck")
	@ResponseBody
	public Map<String, Integer> fingCheck(String from_user,String to_user){
		
		Map<String, Integer> map=new HashMap<>();
		
		
		map.put("fingcheck", service.checkFollowing(from_user, to_user));
		map.put("fwercheck", service.checkFollower(from_user, to_user));
		
		return map;
	}
	
	@GetMapping("deletefollowing")
	@ResponseBody
	public void deleteFollowing(String to_user) {
		
		service.deleteFollowing(to_user);
	}
}
