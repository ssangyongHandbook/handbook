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
</head>
<body>
<span>이름과 전화번호 쳐서 이메일찾기</span><br>
	

<form id="form">
	이름입력 : <input type="text" name="user_name" required="required" id="user_name"><br>
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
	<button type="button" class="btn" onclick="find()">찾기</button>
</form>
	
	<div class="result">
		<span>이메일은</span>
		<span class="returnemail">???</span>
		<span>입니다.</span>
	</div>
<script>
	function find() {
		var formData = $("#form").serialize();
		 $.ajax({
            url : "findemailaction",
            type : 'POST', 
            data : formData,
            dataType:"text",
            success : function(data) {
                $(".returnemail").text(data);
            },
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
		});
	}
</script>
</body>
</html>