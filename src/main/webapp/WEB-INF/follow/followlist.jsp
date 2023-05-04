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
	.addbtn img{
		width: 20px;
		
	}
	
	.userbox{
		border: 1px solid gray;
		width: 600px;
		height: 200px;
		border-radius: 5px;
	}
	
	.up{
		max-width: 80px;
		border: 1px solid gray;
		border-radius: 10px;
	}
</style>
</head>
<body>
	<section>
		<c:forEach var = "dto" items = "${list }">
			<div class = "userbox">
				<span class = "up"><img src="../photo/${dto.user_photo }"></span>
				<br>
				<span class = "un">${dto.user_name }</span>
				<br>
				<button type = "button" class = "addbtn"><img src = "../image/add.png"></button>
			</div>
		</c:forEach>
	</section>
</body>
</html>