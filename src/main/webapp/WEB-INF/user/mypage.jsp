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
	.cover{
			width: 100%;
			height: 300px;
			border-radius: 10px 10px;
			background-color: red;
		}
		
		.profile{
			width: 100%;
			height: 120px;
			background-color: green;
		}
		
		.menu{
			width: 100%;
			height: 50px;
			background-color: yellow;
		}
		
		.intro{
			width: 100%;
			height: 320px;
			background-color: green;
			border-radius: 10px 10px;
			margin-top: 10px;
			/* margin: 10px; */
		}
		
		.galary{
			width: 100%;;
			height: 380px;
			background-color: green;
			border-radius: 10px 10px;
			/* margin: 10px; */
		}
		
		.friend{
			width: 100%;
			height: 500px;
			background-color: green;
			border-radius: 10px 10px;
			/* margin: 10px; */
		}
		
		 .write{
			width:100%;
			height: 100px;
			background-color: green;
			border-radius: 10px 10px;
			/* margin: 10px; */
		}
		
		.content{
			width: 100%;
			height: 
		}
		
		.left{
			width: 50%;
			float: left;
		}
		
		.right{
			width:50%;
			float: right;
		}
		
		.photo{
			width: 100px;
			height: 100px;
			border-radius: 100px 100px;
			background-color: pink;
		}
		
		.cover-label{
			cursor: pointer;
			color: white;
			background-color: black;
			padding: 6px 16px;
			border-radius: 4px;
		}
		
		.btncover{
			position: relative;
    		top: 80%;
    		left: 85%;
		}
		
</style>
</head>
<body>
<div class="mypage">
	<div class="cover">
		커버 사진
		<div class="btncover">
			<label for="cover-photo" class="cover-label">커버 사진 추가</label>
			<input type="file" style="display: none;" id="cover-photo" class="cover-photo">
		</div>
	</div>
	
	<div class="profile">
		<div class="photo">
				프로필 사진
		</div>
	</div>
	
	<div class="menu">
		메뉴
	</div>
	
	<div class="left">
		<div class="intro">
			프로필 소개
		</div>
		
		<div class="galary">
			사진
		</div>
		
		<div class="friend">
			친구
		</div>
		
	</div>
	
		<div class="right">
			<div class="write">
			게시글 작성
			</div>
			
			<div class="content">
			게시글
			</div>
		</div>
	
</div>
</body>
</html>