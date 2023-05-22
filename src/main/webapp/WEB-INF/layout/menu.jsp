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
.menu{
   font-size: 25pt;
} 
.menulist{
   font-size: 20pt;
   margin-left: 10px;
   margin-top:15px;
  
}
.menub{
   font-size: 12pt;
   color: black;
   margin-left: 10px;
}
</style>
</head>
<body>
	<c:set var = "root" value = "<%=request.getContextPath() %>"/>

	<div class = "menu">

		<div class ="menuprofile">
		<c:if test="${sessionScope.loginok==null }">
		<img alt = "" src = "${root }/image/noimg.png" class = "img-circle" style ="border:1px solid black; border: none;">
		</c:if>
		
		<c:if test="${sessionScope.loginok!=null }"> <!-- 로그인 컨트롤러에서 세션으로 받아온다 -->
		<a href="/user/mypage?user_num=${sessionScope.user_num }" style="margin-left: 5px; "><img alt = "" src = "${root }/photo/${sessionScope.user_photo}" width="35" height="35" class = "img-circle"></a>
		<span style="font-size: 12pt; margin-left: 3px;">${sessionScope.name}</span>
		</c:if>
		</div>
		
		<br>
		
		
        <div class = "menulist">
            <a href="${root }/following/recommendlist?from_user=${sessionScope.user_num}" style="text-decoration-line: none;" ><i class="fa-solid fa-user-plus"></i><span class = "menub"><span>팔로워</span><span style="margin-left: 3px;">추천</span></span></a>
        </div>
        
        <div class = "menulist">
            <a href="${root }/following/followlist?from_user=${sessionScope.user_num}" style="text-decoration-line: none;" ><i class="fa-solid fa-user-group"></i><span class = "menub"><span>팔로워</span><span style="margin-left: 3px;">목록</span></span></a>
        </div>
       
        <div class = "menulist">
            <a href="#" style="text-decoration-line: none;"><i class="fa-solid fa-star" style="color: #ffd43b;"></i><span class = "menub">즐겨찾기</span></a>
        </div>
      	
        <div class = "menulist">
            <a href="#" data-toggle="modal" data-target="#contentwrite" style="text-decoration-line: none;"><i class="fa-solid fa-pen-to-square" style="color: black;"></i><span class = "menub">게시글</span></a>
        </div>
    	
	</div>
</body>
</html>