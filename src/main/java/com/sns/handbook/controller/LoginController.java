package com.sns.handbook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.handbook.dto.UserDto;
import com.sns.handbook.serivce.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService service;

	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String user_id, @RequestParam String user_pass, HttpSession session) {
		int check = service.loginIdPassCheck(user_id, user_pass); // 입력한 아이디 비번에 맞는 계정 있는지 없는지 확인
		if (check == 1) { // 계정 있으면
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간
			session.setAttribute("myid", user_id);
			session.setAttribute("loginok", "yes");

			return "redirect:../post/timeline"; // 로그인 하면 타임라인으로 넘어감.
		} else { // 로그인 실패시
			return "/login/passfail";
		}
	}

	@GetMapping("/login/logincenterform")
	public String logincenter() {

		return "/login/logincenter";
	}

	// 로그아웃 버튼 누르면 로그아웃되게함. 그 후에 메인화면으로 리다이렉트
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		session.removeAttribute("loginok");
		return "redirect:/";
	}
}
