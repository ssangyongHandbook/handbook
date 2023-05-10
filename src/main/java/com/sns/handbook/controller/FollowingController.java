package com.sns.handbook.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.dto.FollowingDto;
import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.FollowingService;
import com.sns.handbook.serivce.UserService;

@Controller
@RequestMapping("following")
public class FollowingController {

	@Autowired
	FollowingService service;
	
	@Autowired
	UserService uservice;
	
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
	
	@GetMapping("followlist")
	public ModelAndView followList(@RequestParam(defaultValue = "0") int offset, String from_user, HttpSession session) {
		
		
		ModelAndView model = new ModelAndView();

		
		List<FollowingDto> list = service.getFollowList(from_user, offset); 
		
		for(int i = 0; i<list.size(); i++) {
			UserDto dto = uservice.getUserByNum(list.get(i).getTo_user()); //여러가지 수많은 데이터에서 i번째 데이터만 가져오기, 여기서 필요한 상대방 num을 list에서 뽑아옴
			list.get(i).setUser_name(dto.getUser_name());// 위에서 dto에서 name photo를 뽑아내서 리스트에 set을 해줌
			list.get(i).setUser_photo(dto.getUser_photo());
			list.get(i).setTf_count(service.togetherFollow(dto.getUser_num(),(String)session.getAttribute("user_num")));

		}
		
		model.addObject("list", list);
		model.addObject("offset", offset);
		model.addObject("from_user",from_user);
		model.setViewName("/follow/followlist");

		
		return model;
		
	}
	
	@GetMapping("followlistscroll")
	@ResponseBody
	public List<FollowingDto> followlistscroll(int offset,String from_user,HttpSession session){
		
		List<FollowingDto> list=service.getFollowList(from_user, offset);
		
		for(int i = 0; i<list.size(); i++) {
			UserDto dto = uservice.getUserByNum(list.get(i).getTo_user()); //여러가지 수많은 데이터에서 i번째 데이터만 가져오기, 여기서 필요한 상대방 num을 list에서 뽑아옴
			list.get(i).setUser_name(dto.getUser_name());// 위에서 dto에서 name photo를 뽑아내서 리스트에 set을 해줌
			list.get(i).setUser_photo(dto.getUser_photo());
			list.get(i).setTf_count(service.togetherFollow(dto.getUser_num(),(String)session.getAttribute("user_num")));

		}
		
		return list;
	}
	
	
	
	
}
