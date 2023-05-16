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
	<div class='allcomment' style='margin-left: 0px;'>
		<div class='comment' id='div100'>
			<img src='/photo/f_20230510164034icon02.png' class='profile'>
			<b class='name'>테스트</b>
			<br>
			<span class='content'>안녕</span>
		</div>
		<div class='cmlike'>
			<span class="glyphicon glyphicon-heart yeslike" style="color: red;" comment_num="100">1</span>
			<div style="height: 0; width: 450px; position: relative; left: -30px; top: 30px;">
				<img src="../image/add.png" class="ulimg" style="width: 20px; float: right;" comment_num="100">
				<ul class="list-group commentul" id="ul100">
					<li class="list-group-item list-group-item-success commentmod" comment_num="100">수정</li>
					<li class="list-group-item list-group-item-danger commentdel" comment_num="100">삭제</li>
				</ul>
				<div class="comment" id="commentmod100" style="display: none; width: 447px; position: relative; left: 31px; bottom: 31px;">
					<img src="/photo/f_20230510164034icon02.png" class="profile">
					<b class="user_name">테스트</b>
					<br>
					<input type="text" class="inputmod" style="width: 200px;" comment_num="100" value="안녕">
				</div>
			</div>
			<span class='recontent' comment_num='100'>답글달기</span>
			<span class='comment_writeday'>4일 전</span>
		</div>
		<form method="post" class="form-inline" id="comment100" style="display: none;">
			<input type="hidden" name="comment_num" value="75">
			<input type="hidden" name="post_num" value="9">
			<div id="commentaddform">
				<img src="/photo/f_20230510164034icon02.png" id="commentprofile">
				<input hidden="hidden" />
				<input type="text" class="input" name="comment_content" placeholder="댓글을 입력하세요" id="input100">
				<button type="button" class="btn btn-info cminsert" comment_num="100" post_num="9" style="margin-right: 20px;">답글입력</button>
			</div>
		</form>
	</div>
</body>
</html>