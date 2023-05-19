package com.sns.handbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@PostMapping("/find/sendEmail")
	public String sendEmail(@RequestParam("memberEmail") String memberEmail) {
		MailDto dto = service.createMailAndChangePassword(memberEmail);
		service.mailSend(dto);
		return "redirect:/";
	}
	
	@GetMapping("/find/findemail")
	public String findemail() {
		return "/sub/login/findemail";
	}
}
