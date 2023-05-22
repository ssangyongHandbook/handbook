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
<script src="https://kit.fontawesome.com/d178b85e81.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
<style type="text/css">
ul{
   list-style:none;
   line-height: 30px;
  }
 
menu{
   padding:10px; 
   font-size: 30pt;
} 
</style>
</head>
<body>
	<c:set var = "root" value = "<%=request.getContextPath() %>"/>

	<div class = "menu">
	
		<div>
		<c:if test="${sessionScope.loginok==null }">
		<img alt = "" src = "${root }/image/noimg.png" width="40" height="40" class = "img-circle" style ="border:1px solid black; border: none;">
		</c:if>
		
		<c:if test="${sessionScope.loginok!=null }"> <!-- 로그인 컨트롤러에서 세션으로 받아온다 -->
		<img alt = "" src = "${root }/photo/${sessionScope.user_photo}" width="40" height="40" class = "img-circle">
		</c:if>
		</div>
		
        <div>
            <a href="${root }/following/recommendlist?from_user=${sessionScope.user_num}" ><i class="fa-solid fa-user-plus"></i><b style="font-size: 15pt;">&nbsp;<span>팔로워</span><span style="margin-left: 3px;">추천</span></b></a>
        </div>
        
        <div>
            <a href="${root }/following/followlist?from_user=${sessionScope.user_num}" ><i class="fa-solid fa-user-group"></i><b style="font-size: 15pt;">&nbsp;<span>팔로워</span><span style="margin-left: 3px;">목록</span></b></a>
        </div>
        
        <div>
            <a href="#"><i class="fa-solid fa-star"></i><b style="font-size: 15pt;">&nbsp;즐겨찾기</b></a>
        </div>
        
        <div>
            <a href="#" data-toggle="modal" data-target="#contentwrite"><i class="fa-solid fa-pen-to-square"></i><b style="font-size: 15pt;">&nbsp;게시글</b></a>
        </div>
    
	</div>
</body>
</html>