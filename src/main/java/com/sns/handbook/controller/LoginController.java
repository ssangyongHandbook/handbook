package com.sns.handbook.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.sns.handbook.dto.UserDto;
import com.sns.handbook.oauth.GoogleLoginBO;
import com.sns.handbook.oauth.KakaoLoginBO;
import com.sns.handbook.oauth.NaverLoginBO;
import com.sns.handbook.serivce.UserService;

@Controller
public class LoginController {

	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	/* KakaoLogin */
	@Autowired
	private KakaoLoginBO kakaoLoginBO;

	// googleLogin
	@Autowired
	private GoogleLoginBO googleLoginBO;

	private String apiResult = null;

	@Autowired
	UserService service;

	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String user_id, @RequestParam String user_pass, HttpSession session) {
		int check = service.loginIdPassCheck(user_id, user_pass); // 입력한 아이디 비번에 맞는 계정 있는지 없는지 확인
		if (check == 1) { // 계정 있으면
			UserDto dto = service.getUserDtoById(user_id);
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간
			session.setAttribute("myid", user_id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("user_num", dto.getUser_num()); // session에 num값 넣음.
			session.setAttribute("user_photo", dto.getUser_photo());// session에 photo 넣음.

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
		session.invalidate(); // 세션의 모든 속성을 삭제
		return "redirect:/";
	}

	// 네이버 로그인 callback
	@GetMapping("/navercallback")
	public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;

		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// 프로필 조회, 네이버는 나이, 프로필 이미지(가져와야하는데 안가져와짐), 닉네임 안가져오는걸로.
		String name = (String) response_obj.get("name");
		String email = (String) response_obj.get("email");
		String gender = (String) response_obj.get("gender");
		String birthday = (String) response_obj.get("birthday");
		String birthyear = (String) response_obj.get("birthyear");
		String mobile = (String) response_obj.get("mobile");

		int check = service.loginEmailCheck(email); // 입력한 이메일이 가입되어있는지 아닌지 판단

		// 이메일에서 user_id 추출
		String splitemail[] = email.split("@");
		String user_id;
		user_id = splitemail[0];

		// 이 아래는 아무튼 로그인 한다.
		// 이미 예전에 로그인한 네이버 계정이면 그냥 로그인
		// 아니면 db에 회원정보 입력 후 로그인.
		if (check == 1) { // 계정 있으면
			UserDto dto = service.getUserDtoById(user_id);
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간

			// 세션에 사용자 정보 등록
			// session.setAttribute("islogin_r", "Y");
			session.setAttribute("signIn", apiResult);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", user_id);
			session.setAttribute("user_num", dto.getUser_num()); // session에 num값 넣음.
			session.setAttribute("user_photo", dto.getUser_photo());// session에 photo 넣음.

			return "redirect:post/timeline"; // 로그인 하면 타임라인으로 넘어감.
		} else {
			// 계정 로그인 안 되어있으면 db에 넣고(일단회원가입) 로그인 세션 유지
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간
			session.setAttribute("signIn", apiResult);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("myid", user_id);
			session.setAttribute("loginok", "yes");

			UserDto user = new UserDto();
			String user_birth;
			user_birth = birthyear + "-" + birthday;
			user.setUser_birth(user_birth);
			user.setUser_email(email);
			if (gender.equalsIgnoreCase("m")) {
				user.setUser_gender("남자");
			} else if (gender.equalsIgnoreCase("f")) {
				user.setUser_gender("여자");
			} else {
				user.setUser_gender("기타");
			}
			user.setUser_hp(mobile);
			user.setUser_id(user_id);
			// user.setUser_pass(user_pass);
			user.setUser_name(name);
			// user.setUser_photo(profile_image);

			service.insertUserInfo(user);
			session.setAttribute("user_num", user.getUser_num()); // session에 num값 넣음.
			session.setAttribute("user_photo", user.getUser_photo());// session에 photo 넣음.

			// System.out.println("signin session : "+session.getAttribute("signIn"));
			return "redirect:post/timeline";
		}
	}

	@GetMapping("/kakaocallback")
	public String callbackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다
		apiResult = kakaoLoginBO.getUserProfile(oauthToken);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;

		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
		JSONObject response_obj2 = (JSONObject) response_obj.get("profile");

		// 프로필 조회
		String email = (String) response_obj.get("email");
		String name = (String) response_obj2.get("nickname");
		// id 이메일에서 가져오기
		String splitemail[] = email.split("@");
		String user_id;
		user_id = splitemail[0];
		String gender = (String) response_obj.get("gender");

		int check = service.loginEmailCheck(email); // 입력한 이메일이 가입되어있는지 아닌지 판단
		// 이 아래는 아무튼 로그인 한다.
		// 이미 예전에 로그인한 네이버 계정이면 그냥 로그인
		// 아니면 db에 회원정보 입력 후 로그인.
		if (check == 1) { // 계정 있으면
			UserDto dto = service.getUserDtoById(user_id);
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간

			// 세션에 사용자 정보 등록
			// session.setAttribute("islogin_r", "Y");
			session.setAttribute("signIn", apiResult);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", user_id);
			session.setAttribute("user_num", dto.getUser_num()); // session에 num값 넣음.
			session.setAttribute("user_photo", dto.getUser_photo());// session에 photo 넣음.

			return "redirect:post/timeline"; // 로그인 하면 타임라인으로 넘어감.
		} else {
			// 계정 로그인 안 되어있으면 db에 넣고(일단회원가입) 로그인 세션 유지
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간
			session.setAttribute("signIn", apiResult);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("myid", user_id);
			session.setAttribute("loginok", "yes");

			UserDto user = new UserDto();
			user.setUser_email(email);
			if (gender.equalsIgnoreCase("male")) {
				user.setUser_gender("남자");
			} else if (gender.equalsIgnoreCase("female")) {
				user.setUser_gender("여자");
			} else {
				user.setUser_gender("기타");
			}
			user.setUser_id(user_id);
			user.setUser_name(name);

			service.insertUserInfo(user);
			session.setAttribute("user_num", user.getUser_num()); // session에 num값 넣음.
			session.setAttribute("user_photo", user.getUser_photo());// session에 photo 넣음.

			return "redirect:post/timeline";
		}
	}

	@GetMapping("/googlecallback")
	public String googlecallback(Model model, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = googleLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다
		apiResult = googleLoginBO.getUserProfile(oauthToken);
		System.out.println("apiResult : " + apiResult);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;

		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj;

		// 프로필 조회
		String email = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		String photo = (String) response_obj.get("picture");
		// id 이메일에서 가져오기
		String splitemail[] = email.split("@");
		String user_id;
		user_id = splitemail[0];
		System.out.println("name+email+photo : " + name + "//" + email + "//" + photo);

		int check = service.loginEmailCheck(email); // 입력한 이메일이 가입되어있는지 아닌지 판단

		// 이 아래는 아무튼 로그인 한다.
		// 이미 예전에 로그인한 구글 계정이면 로그인
		// 아니면 db에 회원정보 입력 후 로그인.
		if (check == 1) { // 계정 있으면
			UserDto dto = service.getUserDtoById(user_id);
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간

			// 세션에 사용자 정보 등록
			// session.setAttribute("islogin_r", "Y");
			session.setAttribute("signIn", apiResult);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", user_id);
			session.setAttribute("user_num", dto.getUser_num()); // session에 num값 넣음.
			session.setAttribute("user_photo", dto.getUser_photo());// session에 photo 넣음.

			return "redirect:post/timeline"; // 로그인 하면 타임라인으로 넘어감.
		} else {
			// 계정 로그인 안 되어있으면 db에 넣고(일단회원가입) 로그인 세션 유지
			session.setMaxInactiveInterval(60 * 60 * 8); // 8시간
			session.setAttribute("signIn", apiResult);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("myid", user_id);
			session.setAttribute("loginok", "yes");

			UserDto user = new UserDto();
			user.setUser_email(email);
			user.setUser_gender("기타");
			user.setUser_id(user_id);
			user.setUser_name(name);

			service.insertUserInfo(user);
			session.setAttribute("user_num", user.getUser_num()); // session에 num값 넣음.
			session.setAttribute("user_photo", user.getUser_photo());// session에 photo 넣음.

			return "redirect:post/timeline";
		}
	}
}
