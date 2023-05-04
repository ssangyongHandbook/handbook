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
</body>
</html>