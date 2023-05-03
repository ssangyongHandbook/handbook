<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign up(회원가입)</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<h3>핸드폰 번호 : ${user_hp }</h3>
<div>
	<div style="margin:0px auto; width: 400px; margin-top: 100px;">
		<p style="font-size: 3em;" align="center">handbook</p>
		<div>
			<form action="signupprocess" method="post">
				<p align="center" style="font-size: 1.2em;">새 계정 만들기</p>
				<div class="form-floating">
				   <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름 입력"  required="required">
				</div><br>
				
				<div class="form-floating">
				   <input type="email" class="form-control" id="user_email" name="user_email" placeholder="이메일 입력" required="required">
				</div><br>
				
				<div class="form-floating">
				   <input type="password" class="form-control" id="user_pass" name="user_pass" placeholder="비밀번호 입력" required="required">
				</div><br>
				
				<div class="form-floating">
					<p>핸드폰 번호</p>
					<p>
						<select class="form-control" id="hp1" name="hp1" size="1" style="width:100px; display:inline-block;" >
							<option value="010" class="hp1">010</option>
							<option value="011" class="hp2">011</option>
							<option value="016" class="hp3">016</option>
							<option value="070" class="hp4">070</option>
						</select>
						<span>-</span>
						<input type="text" class="form-control" id="hp2" name="hp2" size="3" required="required" style="width:100px;display:inline-block;" required="required">
						<span>-</span>
						<input type="text" class="form-control" id="hp3" name="hp3" size="3" required="required" style="width:100px;display:inline-block;" required="required">
					</p>
				</div>
				
				<div class="form-floating">
					<p>주소</p>
					<input id="member_post" class="form-control" type="text" placeholder="우편번호" readonly onclick="findAddr()" style="background-color: white;">
					<input id="member_addr" name="addr1" class="form-control"type="text" placeholder="주소" readonly style="background-color: white;" required="required"> <br>
					<input type="text" name="addr2" class="form-control" placeholder="상세주소">
  				</div><br>
				
				<div class="form-floating">
					<p>생일</p>
					<input type="date" class="form-control" name="user_birth" value="1990-01-01">
				</div><br>
				
				
				<div class="form-floating">
					<p>성별</p>
					여자<input type="radio" name="user_gender" value="여자" checked="checked">&nbsp;&nbsp;
					남자<input type="radio" name="user_gender" value="남자">&nbsp;&nbsp;
					기타<input type="radio" name="user_gender" value="기타">
				</div><br>
				
				<div class="d-grid gap-2">
					<button class="btn btn-primary btn-block" type="submit">가입하기</button>
				</div><br>
				
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('member_post').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	}

</script>
</html>