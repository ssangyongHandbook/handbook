<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class='allcomment' style='margin-left: 100px;'>
		<div style='position: relative; left: -50px; top: 40px; height: 0;'>
			<img src='../image/re.png' style='width: 30px;'>
		</div>
		<div class='comment'>
			<img src='/photo/f_20230510164034icon02.png' class='profile'><b
				class='name'>테스트</b><br>
			<span class='content'>내용 지우기</span>
		</div>
		<div class='cmlike'>
			<span class='glyphicon glyphicon-heart'>좋아요</span><span
				class='recontent' comment_num='66'>답글달기</span><span
				class='comment_writeday'>4시간 전</span>
		</div>
		<form method="post" class="form-inline" id="comment66" style="">
			<input type="hidden" name="comment_num" value="75"><input
				type="hidden" name="post_num" value="9">
			<div id="commentaddform">
				<img src="/photo/f_20230510164034icon02.png" id="commentprofile"><input
					hidden="hidden" /> <input type="text" name="comment_content"
					placeholder="댓글을 입력하세요" id="commentinput">
				<button type="button" id="btn66" class="btn btn-info"
					style="margin-right: 20px;">입력</button>
			</div>
		</form>
	</div>
</body>
</html>