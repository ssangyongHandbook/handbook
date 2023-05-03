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
	.titlecontainer{
		width:100%;
		display: inline-flex;
		align-items: center;
		justify-content: space-between;
	}
	.titledetail{
		
	}
	
</style>

</head>
<body>

<div class = "titlecontainer">

	<div style="width: 180px;"><img src="../image/handbooklogo.png" style = "height: 80px; "></div>
	 <div class = "searcharea" style = "width:550px;  margin: 10px;">
			<form action = "list" class = "form-inline" style = "width:600px;">
				
					<div style = "width: 600px; background-color: white; display: inline-flex; align-items: center;">
					<select class = "form-control" style ="width:150px;" name = "searchcolumn">
					<option value = "name">작성자</option>
					<option value = "content">내용</option>
					</select>
					&nbsp;&nbsp;&nbsp;
					<div style="background-color: #F0F2F5; border-radius: 60px; display: inline-flex; align-items: center; padding-left: 2%">
						<span class = "glyphicon glyphicon-search" style = "font-size: 16pt;"></span>
						<input type = "text" name = "searchword" style = "width:530px; border: none; background: none; outline: none; font-size: 15pt; padding: 10px;" placeholder="Handbook 검색">
					</div>
					</div>
					
				
			</form>
	</div> 

	<div>
		<c:if test="${sessionScope.loginok!=null }">
    		<button type ="button" onclick="location.href='/login/logoutprocess'">로그아웃</button>
		</c:if>
		
		
		<a href="#"><span><img src="../image/menuicon.jpg" class = "titlemenubar" alt="" style = "width: 40px; height: 40px;"></span></a>
		<a href="#"><span><img src="../image/message.png" alt="" style = "width:40px; height: 40px;"></span></a>
		<a href="#"><span><img src="../image/bell.png" alt="" style = "width:40px; height: 40px;"></span></a>
		<a href="#"><span><img src="../image/noimg.png" alt="" style = "width:40px; height: 40px; border-radius: 100px;"></span></a>
		
		
		
	</div>

</div>

 <ul class = "titlemenu" style = "position: relative; left: 85%; top: 8%; height:500px; background-color: #F7F8FA; width: 300px; border-radius: 10px;">
		 	<li>
		 		<br>
		 		<h1>메뉴</h1>
		 		
		 		<!-- <div style="background-color: white; border-radius: 10px;  height: 300px;"> -->
		   		<ul class = "subtitlemenu" style = "font-size: 15pt; line-height: 1.5em; background-color: white; padding-bottom: 70px; padding-top: 70px; text-align: center;" >
					<li class = "titledetail" style="margin-bottom: 10px; align-items: center;"><a href = "#"><img src = "../image/createboard.png" style = "width:50px;">게시물 작성</a></li>
					<li class = "titledetail" style="margin-bottom: 10px; align-items: center;"><a href = "#"><img src = "../image/findfriend.png" style = "width:50px;">친구 찾기</a></li>
					<li class = "titledetail" style="margin-bottom: 10px; align-items: center;"><a href = "#"><img src = "../image/star.png" style = "width:50px;">즐겨 찾기</a></li>
				</ul>
				<!-- </div> -->
			</li>
</ul> 

<script type="text/javascript">
	$(".titlemenu").hide();
	$(".titlemenubar").click(function(){
		$(".titlemenu").toggle();
		
	});

</script>
</body>
</html>