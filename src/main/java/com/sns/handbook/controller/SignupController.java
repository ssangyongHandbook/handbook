package com.sns.handbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.UserService;

@Controller
public class SignupController {
	
	@Autowired
	UserService service;
	

	@GetMapping("/signupform")
	public String signupform() {
		return "/sub/login/signup";
	}

	@PostMapping("/signupprocess")
	public String signupprocess(@RequestParam String hp1, @RequestParam String hp2, @RequestParam String hp3,
			@RequestParam String user_name, @RequestParam String user_email, @RequestParam String user_pass,
			@RequestParam String user_birth, @RequestParam String user_gender, @RequestParam String addr1,
			@RequestParam String addr2) {
		
		String user_addr;
		if (addr2.equals("")) {
			user_addr = addr1;
		}
		else {
			user_addr = addr1 + " " + addr2;
		}
		
		String user_hp = hp1 + "-" + hp2 + "-" + hp3;
		String split_user_emali[] = user_email.split("@");

		UserDto user = new UserDto();
		user.setUser_addr(user_addr);
		user.setUser_birth(user_birth);
		user.setUser_email(user_email);
		user.setUser_gender(user_gender);
		user.setUser_hp(user_hp);
		user.setUser_id(split_user_emali[0]);
		user.setUser_pass(user_pass);
		user.setUser_name(user_name);

		/*
		 * System.out.println(hp1 + hp2 + hp3); System.out.println(addr1 + " " + addr2);
		 * System.out.println(user_name); System.out.println(user_email);
		 * System.out.println(user_pass); System.out.println(user_birth);
		 * System.out.println(user_gender); System.out.println(user.getUser_id());
		 */
		
		service.insertUserInfo(user);
		
		//새 계정 생성 후 로그인 화면으로 간다.
		return "/";
	}
}
