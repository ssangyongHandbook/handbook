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
시작페이지<br>
<b>유저 개수: ${total }</b>
<div>
	<h1>handbook</h1>
	<p>Handbook에서 전세에 있는 친구, 가족 <br>지인들과 함께 이야기를 나눠 보세요.​</p>
</div>
<table class="table table-bordered">
	<form action="" method="post">
		<input class="form-control" type="email" name="email" required="required" placeholder="이메일 입력"><br>
		<input class="form-control" type="password" name="pass" required="required" placeholder="비밀번호 입력">
	</form>
</table>
</body>
</html>