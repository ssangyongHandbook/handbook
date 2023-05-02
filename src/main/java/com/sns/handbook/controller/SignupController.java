package com.sns.handbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignupController {
	
	@GetMapping("/signupform")
	public String signupform() {
		return "/login/signup";
	}
}
