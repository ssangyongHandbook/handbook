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
	
	@GetMapping("/find/findemail")
	public String findemail() {
		return "/sub/login/findemail";
	}
	
	@PostMapping("/find/findemailaction")
	@ResponseBody
	public String findemailaction(Model model, @RequestParam String user_name,
			@RequestParam String hp1, @RequestParam String hp2, @RequestParam String hp3) {
		String email = "";
		String hp = hp1+"-"+hp2+"-"+hp3;
		
		try {
			email = service.getUserEmailBynamehp(user_name, hp);
			model.addAttribute(email);
		} catch (Exception e) {
			email = "해당하는 이메일 없음";
			model.addAttribute(email);
		}
		//System.out.println(email);
		return email;
	}
}
