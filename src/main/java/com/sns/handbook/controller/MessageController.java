package com.sns.handbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MessageController {

	@GetMapping("/message/main")
	public String meesageMain()
	{
		return "/sub/message/messagemain";
	}
}
