<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
	<div>
		<div class="container my-auto">
			<div class="row">
				<div>
					<h4>비밀번호 찾기</h4>
				</div>
				<div>
				 <!-- onsubmit="return check()" -->
					<form role="form" action="/find/sendEmail" method="post" name="sendEmail">
						<p>입력한 이메일로 임시 비밀번호가 전송됩니다.</p>
						
						<label class="form-label">Email</label>
						<div class="input-group">
							<input type="email" id="userEmail" name="memberEmail" class="form-control" required>
							<!-- <button type="button" class="btn btn-danger" id="btnidcheck">중복체크</button>
							&nbsp;<span class="emailsuccess" style="width: 60px; color: green;"></span> -->
						</div>
						<div class="text-center">
							<button type="submit" class="btn" id="checkEmail">비밀번호 발송</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#checkEmail").click(function() {
			const userEmail = $("#userEmail").val();
			const sendEmail = document.forms["sendEmail"];
			$.ajax({
				type : 'post',
				url : 'emailDuplication',
				data : {
					'memberEmail' : userEmail
				},
				dataType : "text",
				success : function(result) {
					if (result == "yes") {
						// 중복되는 것이 있다면 no == 일치하는 이메일이 있다!
						alert('임시비밀번호를 전송 했습니다.');
						sendEmail.submit();
					} else {
						alert('가입되지 않은 이메일입니다.');
					}
				},
				error : function() {
					console.log('에러 체크!!')
				}
			})
		});
		
		//submit 전에 호출
		function check(){
			//이메일 중복체크
			if($("span.idsuccess").text() != 'ok') {
				alert("아이디 중복체크를 해주세요");
				return false;
			}
		}
	</script>
</body>
</html>