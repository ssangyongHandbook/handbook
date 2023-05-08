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
.addbtn img {
	width: 25px;
}

.userbox {
	width: 600px;
	height: 200px;
	border: 1px solid gray;
	border-radius: 5px;
}

.up {
	width: 30%;
	padding: 16px;
}

.userphoto {
	float: left;
	display: inline-block;
	width: 80px;
	border: 1px solid gray;
	border-radius: 10px;
}

.un {
	width: 16%;
	float: left;
	/* line-height:50px;
	display: inline-block; */
	display: flex;
	flex-direction: column;
	font-size:24px;
	font-weight:bold;
	padding-left: 15px;
	height: 168px;
	padding-bottom: 32px;
	justify-content: center;
}

.btndiv {
	width: 10%;
	float:right;
	display: inline-block;
	height:140px;
	line-height:140px;
}

.addbtn {
	width: 50px;
	background-color:#fff;
	border:none;
}

.tf{
	
}

.friendmenu{
	position : relative;
	width: 300px;
	height: 80px;
	top: -20px;
	border: 4px solid gray;
	border-radius: 10px;
	
}
</style>
</head>
<body>
	<section>
		<c:forEach var = "dto" items = "${list }">
			<div class="userbox">

				<c:if test="${dto.user_photo!=null}">
					<div class="up">
						<img src="/photo/${dto.user_photo }" style="width: 160px;"
							class="userphoto">
					</div>
				</c:if>

				<c:if test="${dto.user_photo==null}">
					<div class="up">
						<img src="../image/noimg.png" class="userphoto">
					</div>
				</c:if>
				<div class="un">
					<span>${dto.user_name }</span> <span class="tf"
						style="font-size: 11px;">함께아는친구: ${dto.tf_count }</span>
				</div>
				<div class="btndiv" style="margin: auto 0;">
					<button type="button" class="addbtn"><img src="../image/add.png"></button>
					
					<ul class="friendmenu" style="float: left; margin: auto 0; padding: 0;">
						
								<li class = "followdetail">
								<a href = "#"><img src = "../image/bookmark.png" style = "width:35px;">즐겨찾기</a></li>
								<li class = "followdetail">
								<a href = "#">&nbsp;<img src = "../image/followcancel.png" style = "width:25px;">&nbsp;팔로우 취소</a></li>
						
					</ul>
					
					</div>
				</div>
		
		</c:forEach>
	</section>
	<script type="text/javascript">
		$(".friendmenu").hide();
		$(".addbtn").click(function(){
			$(".friendmenu").toggle();
		});
	</script>
</body>
</html>