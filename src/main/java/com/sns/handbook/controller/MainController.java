package com.sns.handbook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sns.handbook.oauth.KakaoLoginBO;
import com.sns.handbook.oauth.NaverLoginBO;
import com.sns.handbook.serivce.UserService;

@Controller
public class MainController {

	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	
	/* KakaoLogin */
	@Autowired
	private KakaoLoginBO kakaoLoginBO;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	UserService uservice;

	@RequestMapping("/")
	public ModelAndView start(HttpSession session) {
		ModelAndView mv = new ModelAndView();

 
		
		

		/* 생성한 인증 URL을 View로 전달 */
		//return "login";

		// 로그인상태인지 아닌지 확인
		String loginok = (String) session.getAttribute("loginok");

		int totalCount = uservice.getTotalCount();

		mv.addObject("total", totalCount);
		// 로그인이 안되어있으면, 로그인 폼으로 이동
		if (loginok == null) {
			/* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			/* 인증요청문 확인 */
			//System.out.println("urlNaver : " + naverAuthUrl);
			/* 객체 바인딩 */
			//model.addAttribute("urlNaver", naverAuthUrl);
			mv.addObject("urlNaver", naverAuthUrl);//loginmain.jsp에서 ${urlNaver}로 쓴다.
			
			
			/* 카카오 URL */
			String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
			//System.out.println("카카오:" + kakaoAuthUrl);
			mv.addObject("urlKakao", kakaoAuthUrl);
			//System.out.println("여기로");
			mv.setViewName("/sub/login/loginmain");
		} else {
			//System.out.println("로그인이 되어있음!");
			// 로그인이 되어있으면 타임라인으로 이동
			mv.setViewName("redirect:/post/timeline");
		}
		return mv;
	}

}
