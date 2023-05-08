<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<style type="text/css">
		html, body {
			height:100%;
		}
		.wrapper {
			display:flex;
			justify-content: center; /* 가로 중앙. */
  			align-items: center; /*새로중앙*/
  			height:100%;
		}
	</style>
</head>
<body>
<div class="wrapper">
	<div style="background-color: green; width: 30%;">
		<div style="margin: 0 auto; width: 90%;">
		   <p style="font-size: 50px;">handbook</p>
		   <p style="font-size: 20px;">Handbook에서 전세에 있는 친구, 가족 <br>지인들과 함께 이야기를 나눠 보세요.​</p>
		</div>
	</div>
	<div style="background-color: red; width: 30%;">
		<div style="width: 60%;margin:0 auto;">
			<form action="/login/loginprocess" method="post">
				<div class="form-floating">
					<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 입력">
				</div><br>
				<div class="form-floating">
				   	<input type="password" class="form-control" id="user_pass" name="user_pass" placeholder="비밀번호 입력">
				</div><br>
				<div class="d-grid gap-2">
				   	<button class="btn btn-primary btn-block" type="submit">로그인</button>
				</div><br>
				<!-- 네이버 로그인 -->
				<%-- <button type ="button" class= "btn" onclick="location.href='${urlNaver}'">네이버</button> --%>
				<div ><img width="50%" src="/image/nav_btn.png" onclick="location.href='${urlNaver}'" style="cursor: pointer;"></div>
				<!-- <div id="naver_id_login" onclick="location.href='/login/naverlogin'"></div> -->
	      	</form>
	      
			<div align="center">
				<a href="#">계정을 잊으셨나요?</a>
			</div><br>
			<div align="center">
			   	<button type="button" class="btn btn-warning" onclick="location.href='/signupform'">새 계정 만들기</button>
			</div>
	   </div>
	</div>
</div>
	
<script>
	//브라우저 화면크기 바뀔 때마다 리로드하면서 중앙에 배치.
	var windowHeight = window.innerHeight;
	$(".wrapper").css('height', windowHeight-80);
	
	window.onresize = function(event){
		location.reload();
	}
</script>

<!-- <script>
	//네이버 로그인 버튼
	var naver_id_login = new naver_id_login("9p2j68Qiov9kpjGNrVqL", "http://localhost:7777/login/oauth2/login/naver");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 2, 40);
	naver_id_login.setDomain("http://localhost:7777");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>

네이버아디디로로그인 Callback페이지 처리 Script
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
	}
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
//네이버아디디로로그인 Callback페이지 처리 Script -->
</body>
</html>