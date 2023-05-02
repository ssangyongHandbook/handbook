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
ul{
   list-style:none;
  }
</style>
</head>
<body>
	<div>
	<ul class = "menu">
		<li>
		<br>
        <c:set var = "root" value = "<%=request.getContextPath() %>"/>
	
		<c:if test="${sessionScope.loginok==null }">
		
		<img alt = "" src = "${root }/noimg.png" width="130" height="130" class = "img-circle" style ="border:1px solid black;">
		</c:if>
	
		<c:if test="${sessionScope.loginok!=null }">
		<img alt = "" src = "${root }/photo/${sessionScope.loginphoto}" width="130" height="130" class = "img-circle">
		</c:if>
		<br><br>
		</li>
		
        <li>
            <a href="#"><span class="glyphicon glyphicon-search" style="padding:10px;">&nbsp;팔로우 추천</span></a>
        </li>
        <li>
            <a href="#"><span class="glyphicon glyphicon-th-list" style="padding:10px;">&nbsp;팔로우 목록</span></a>
        </li>
        <li>
            <a href="#"><span class="glyphicon glyphicon-star" style="padding:10px;">&nbsp;즐겨찾기</span></a>
        </li>
        <li>
            <a href="#"><span class="glyphicon glyphicon-check" style="padding:10px;">&nbsp;게시글</span></a>
        </li>
    </ul>
</div>
</body>
</html>