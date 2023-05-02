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
</style>

</head>
<body>

<div class = "titlecontainer">

	<div style="width: 180px;"><img src="../image/handbooklogo.png" style = "width:130px;"></div>
	 <div class = "searcharea" style = "width:550px; margin: 10px;">
			<form action = "list" class = "form-inline" style = "width:600px;">
				
					<div style = "width: 600px; background-color: white; display: inline-flex; align-items: center;">
					<span class = "glyphicon glyphicon-search" style = "font-size: 15pt;"></span>
					<input type = "text" name = "searchword" class = "form-control" style = "width:550px; border: none;" placeholder="검색어를 입력하세요">
					<button type = "submit" class = "btn btn-success">검색</button>
					</div>
					
				
			</form>
	</div> 

	<div>
		<button type ="button">로그아웃</button>
		<a href="#"><span><img src="../image/message.png" alt="" style = "width:40px;"></span></a>
		<a href="#"><span><img src="../image/bell.png" alt="" style = "width:40px;"></span></a>
		<a href="#"><span><img src="../image/user.png" alt="" style = "width:40px;"></span></a>
		<a href="#"><span class="glyphicon glyphicon-th" style="padding:10px; float:right; font-size:20pt;"></span></a>
	</div>

</div>

</body>
</html>