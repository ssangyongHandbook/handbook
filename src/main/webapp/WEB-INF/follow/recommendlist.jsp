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

</style>
</head>
<script type="text/javascript">
	$(function(){
			$(document).on("click",".addbtn",function(){
				var to_user = $(this).attr("user_num");
				$.ajax({
					type:"get",
					dataType:"text",
					url:"insertfollowing",
					data:{"from_user":"${sessionScope.user_num}", "to_user":to_user},
					success:function(){
						location.reload();
					}
				})
			});
		});
	

</script>

<body>
	<div style = "border: 1px solid gray; display: inline-flex; justify-content: center; width: 900px; flex-direction: column; margin-top: 15px; ">
	  	<div style="display: inline-flex; align-items: center; justify-content: space-between; margin-top: 20px;">	
		<span style="margin-left:35px; margin-bottom: 20px; font-size: 20pt; font-weight: bold;">친구</span>	
		<div style=" margin-right:60px; background-color: #F0F2F5; border-radius: 60px; display: inline-flex; align-items: center; padding-left: 2%">
						<span class = "glyphicon glyphicon-search" style = "font-size: 16pt;"></span>
						<input type = "text" name = "searchword" class="followsearchbox"
						style = " width:150px; height:30px; border: none; background: none; outline: none; font-size: 13pt;
						padding: 10px;" placeholder="검색">
		</div>
		</div>
	</div>
	
	<section class = "section">
		<c:forEach var = "dto" items = "${list }">
			<div class="userbox">

				<c:if test="${dto.user_photo!=null}">
					<div class="up">
						<img src="/photo/${dto.user_photo }" class="userphoto">
					</div>
				</c:if>

				<c:if test="${dto.user_photo==null}">
					<div class="up">
						<img src="../image/noimg.png" class="userphoto">
					</div>
				</c:if>
				<div class="un">
					<span>${dto.user_name }</span> 
					<c:if test="${dto.tf_count>0 }">
					<span class="tf" style="font-size: 11px;">함께아는친구: ${dto.tf_count }</span>
					</c:if>
				</div>
				<div class="btndiv" style="margin: auto 0;">
					<c:if test="${dto.to_user != null }">				
						<button type="button" class="addbtn" user_num = ${dto.to_user }>팔로워하기</button>
					</c:if>
					<c:if test="${dto.to_user == null }">				
						<button type="button" class="addbtn" user_num = ${dto.user_num }>팔로워하기</button>
					</c:if>
					
				</div>
			</div>
		
		</c:forEach>
		
		
		
	</section>
</body>
</html>