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
		flex-wrap: nowrap;
		overflow: hidden;
	}
	.titledetail{
		
	}
	
	.st{
		font-size: 10pt;
		float: left;
		
	}
</style>

<script type="text/javascript">
	$(function(){
		searchWidhtChange();
		
		$(window).resize(function(){
			searchWidhtChange();
		})
	})
	
	function searchWidhtChange(){
		var windowWidth=$(window).width();
		
		if(windowWidth<800){
			$(".searchpost").css("width",(windowWidth/10));
			$(".searcharea").css("width",(windowWidth/10)+100);
			$(".titlelogo").hide();
		}else{
			$(".searchpost").css("width",(windowWidth/3));
			$(".searcharea").css("width",(windowWidth/3)+100);
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
			<!-- <form class = "form-inline" style = "width:600px;"> -->
				
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
					
				
			<!-- </form> -->
	</div> 

	<div style="display: inline-flex; overflow: hidden; align-items: center; justify-content: center; width: 280px;">
		<c:if test="${sessionScope.loginok!=null }">
    		<button type ="button" onclick="location.href='/login/logoutprocess'" style="width: 80px; height: 30px; margin-right: 5px;">로그아웃</button>
		</c:if>
		
		
		<a href="#"><span><img src="../image/menuicon.jpg" class = "titlemenubar" alt="" style = "width: 40px; height: 40px; margin-right: 5px;"></span></a>
		<a href="#"><span><img src="../image/message.png" alt="" style = "width:40px; height: 40px; margin-right: 5px;"></span></a>
		<a href="#"><span><img src="../image/bell.png" alt="" style = "width:40px; height: 40px; margin-right: 5px;"></span></a>
		<c:if test="${sessionScope.user_photo==null }">
		<a href="/user/mypage?user_num=${sessionScope.user_num }"><span><img src="../image/noimg.png" alt="" style = "width:40px; height: 40px; border-radius: 100px;"></span></a>
		</c:if>
		
		<c:if test="${sessionScope.user_photo!=null }">
		<a href="/user/mypage?user_num=${sessionScope.user_num }"><span><img src="../photo/${sessionScope.user_photo }" alt="" style = "width:40px; height: 40px; border-radius: 100px;"></span></a>
		</c:if>
	</div>
	 </c:if>

</div>

 <ul class = "titlemenu" style = "position: relative; left: 83%; height:100px; background-color: #F7F8FA; width: 200px; border-radius: 10px;">
		 	
		 		
		 		<!-- <div style="background-color: white; border-radius: 10px;  height: 300px;"> -->
		   		<!-- <ul class = "subtitlemenu" style = "font-size: 15pt;  background-color: white; height:180px; 
		   			text-align: center; margin-right: 40px;" > -->
		   			
					<li class = "titledetail" style="align-items: center;"><a href = "#" data-toggle="modal" data-target="#myModal"><span class = "glyphicon glyphicon-check st">&nbsp;게시물작성</span></a></li><br>
					<li class = "titledetail" style="align-items: center;"><a href="${root }/following/followlist?from_user=${sessionScope.user_num}"><span class = "glyphicon glyphicon-th-list st">&nbsp;팔로워목록</span></a></li><br>
					<li class = "titledetail" style="align-items: center;"><a href = "#"><span class = "glyphicon glyphicon-star st">&nbsp;즐겨찾기</span></a></li><br>
					
				<!-- </ul> -->
				<!-- </div> -->
			
</ul> 

<script type="text/javascript">
	$(".titlemenu").hide();
	$(".titlemenubar").click(function(){
		$(".titlemenu").toggle();
		
		
	});
	
	
	$(".searchpost").keyup(function(e){
		if(e.keyCode == 13){

			location.redirect="../post/timeline?searchcolumn="+$(".searchcolumn").val()+"&searchword="+$("searchpost").val();
			
		}
		
	});
</script>
</body>
</html>