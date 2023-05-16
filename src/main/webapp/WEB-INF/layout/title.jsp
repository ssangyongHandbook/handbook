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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://kit.fontawesome.com/d178b85e81.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
<style type="text/css">
.titlecontainer {
	width: 100%;
	display: inline-flex;
	align-items: center;
	justify-content: space-between;
	flex-wrap: nowrap;
	overflow: hidden;
}

.subtitlemenu {
	font-size: 12pt;
	line-height: 1.5em;
	padding-bottom: 30px;
	padding-top: 30px;
	display: inline-flex;
	flex-direction: column;
	justify-content: center;
	width: 200px;
	margin: 0 auto;
	margin-left: 25px;
}

.titledetail {
	margin-bottom: 10px;
	width: 150px;
	margin-bottom: 20px;
}

.titledetail div {
	margin-right: 20px;
}

.stitle {
	position: absolute;
	z-index: 5;
	right: 0px;
	margin-right: 20px;
	margin-top: 10px;
}

.titlemenu div a {
	display: inline-flex;
	color: black;
	text-decoration: none;
	align-items: center;
}

.titlemenu {
	flex-direction: column;
	justify-content: center;
	display: inline-flex;
	background-color: white;
	box-shadow: 0px 0px 10px lightgray;
}

.titlecircle {
	width: 40px;
	height: 40px;
	border-radius: 100px;
	background-color: #F0F2F5;
	text-align: center;
	padding-left: 2px;
	padding-bottom: 3px;
	line-height: 45px;
	font-size: 15pt;
}

.tti{
	width: 40px;
	height: 40px;
	border-radius: 100px;
	background-color: #F0F2F5;
	text-align: center;
	padding-left: 2px;
	padding-bottom: 3px;
	line-height: 45px;
	font-size: 15pt;
	margin-left: 5px;
	
}

.subtitlemenu>span{
	font-size: 15pt;
	font-weight: bold;
	margin-bottom: 30px;
}
.btntti{
	border: 0;
	outline: 0;
	background: none;
}

</style>

<script type="text/javascript">
	$(function() {
		searchWidhtChange();

		$(window).resize(function() {
			searchWidhtChange();
		})
	})

	function searchWidhtChange() {
		var windowWidth = $(window).width();

		if (windowWidth < 800) {
			$(".searchpost").css("width", (windowWidth / 10));
			$(".searcharea").css("width", (windowWidth / 10) + 100);
			$(".titlelogo").hide();
		} else {
			$(".searchpost").css("width", (windowWidth / 3));
			$(".searcharea").css("width", (windowWidth / 3) + 100);
			$(".titlelogo").show();
		}
	}
</script>
</head>
<body>



<div class = "titlecontainer">

   <div style="width: 280px;" class="titlelogo"><a href = "${root }/"><img src="../image/handbooklogo.png" style = "height: 80px; "></a></div>
    <c:if test="${sessionScope.loginok != null }">
       <div class = "searcharea" style = "width:550px;  margin: 10px;">
         
               <div style = "width: 100%;background-color: white; display: inline-flex; align-items: center;">
               <select class = "form-control searchcolumn" style ="width:150px;" name = "searchcolumn">
               <option value = "user_name" ${searchcolumn=='user_name'?'selected':'' }>작성자</option>
               <option value = "post_content" ${searchcolumn=='post_content'?'selected':'' }>내용</option>
               </select>
               &nbsp;&nbsp;&nbsp;
               <div style="background-color: #F0F2F5; border-radius: 60px; display: inline-flex; align-items: center; padding-left: 2%">
                  <span class = "glyphicon glyphicon-search" style = "font-size: 16pt;"></span>
                  <input type = "text" name = "searchword" class="searchpost"
                  style = "width:500px; border: none; background: none; outline: none; font-size: 15pt; padding: 10px;" placeholder="Handbook 검색">
               </div>
               </div>                         
       
   </div> 

	<div style="display: inline-flex; overflow: hidden; align-items: center; justify-content: center; width: 280px;">
		<c:if test="${sessionScope.loginok!=null }">
    		<div class="titlecircle tti"><button type ="button" onclick="location.href='/login/logoutprocess'" class = "btntti"><img alt="" src="../image/logout.png" style="width: 23px; margin-bottom: 5px;"></button></div>
		</c:if>
		
		
		<div class="titlecircle tti"><a href="#"><span class = "glyphicon glyphicon-th titlemenubar" style="font-size: 15pt; color: black;"></span></a></div>
		<div class="titlecircle tti"><a href="../message/main"><span style="font-size: 15pt; color: black;"><i class="fa-regular fa-comment-dots"></i></span></a></div>
		<div class="titlecircle tti"><a href="#"><span style="font-size: 15pt; color: black;"><i class="fa-solid fa-bell"></i></span></a></div>
		<c:if test="${sessionScope.user_photo=='no' }">
		<div class="titlecircle tti"><a href="/user/mypage?user_num=${sessionScope.user_num }"><span><img src="../image/noimg.png" alt="" style = "width:40px; height: 40px; border-radius: 100px; color: black;"></span></a></div>
		</c:if>
		
		<c:if test="${sessionScope.user_photo!='no' }">
		<div class="titlecircle tti"><a href="/user/mypage?user_num=${sessionScope.user_num }"><span><img src="../photo/${sessionScope.user_photo }" alt="" style = "width:40px; height: 40px; border-radius: 100px; color: black;"></span></a></div>
		</c:if>
	</div>
	 </c:if>

</div>
 <div class = "stitle">
 <div class = "titlemenu" style = "height:300px; width: 200px; border-radius: 10px;"> 
            <div class = "subtitlemenu">
            	<span>메뉴</span>
               <div class = "titledetail"><a href = "#" data-toggle="modal" data-target="#contentwrite"><div class="titlecircle"><span class = "glyphicon glyphicon-check"></span></div><span>게시물 작성</span></a></div>
               <div class = "titledetail"><a href = "#"><div class="titlecircle"><span class = "glyphicon glyphicon-search"></span></div><span>친구 찾기</span></a></div>
               <div class = "titledetail"><a href = "#"><div class="titlecircle"><span class = "glyphicon glyphicon-star"></span></div><span>즐겨 찾기</span></a></div>
            </div>
            
</div> 
</div>
<script type="text/javascript">
   $(".titlemenu").hide();
   $(".titlemenubar").click(function(){
      $(".titlemenu").toggle();
      
      
   });
   
   
   $(".searchpost").keyup(function(e){
      if(e.keyCode == 13){
         location.href="../post/timeline?searchcolumn="+$(".searchcolumn").val()+"&searchword="+$(".searchpost").val();
         
      }
      
   });
</script>
</body>