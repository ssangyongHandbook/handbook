package com.sns.handbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.handbook.dto.MailDto;
import com.sns.handbook.serivce.UserService;

@Controller
public class FindPasswordController {

	@Autowired
	UserService service;

	@GetMapping("/find/findpass")
	public String findpass() {
		return "/sub/login/findpass";
	}

//	@PostMapping("/find/emailDuplication")
//	@ResponseBody // json 반환 파싱
//	public String idCheckPass(@RequestParam String email) {
//		Map<String, Integer> map = new HashMap<>();
//		// email
//		int n = service.loginEmailCheck(email);
//		if (n == 1) { // 등록되지 않은 이메일
//			return "no";
//		} else if (n == 0) {// 이미 등록된 이메일
//			return "yes";
//		} else {
//			return "?";
//		}
//	}

	@PostMapping("/find/sendEmail")
	public String sendEmail(@RequestParam("memberEmail") String memberEmail) {
		MailDto dto = service.createMailAndChangePassword(memberEmail);
		service.mailSend(dto);
		//return "redirect:/";
		return "/sub/login/loginmain";
	}
}
