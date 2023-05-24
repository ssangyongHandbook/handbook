<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class='shows' id='divs392'>
		<div class='showtext'>게시물을 숨겼습니다. 다시보려면 게시물을 눌러주세요.</div>
		<button type='button' class='showbtn' divpost_num='div392' divspost_num='divs392'>게시물보기</button>
	</div>
	<div class="divmain2" id="div392">
		<div class="top2">
			<div class="top-left2">
				<span style="float: left;" class="userimgdiv">
					<img src="/photo/null" class="userimg" user_num="3">
				</span>
				<span style="float: left; padding: 3%; margin-right: 5px;">
					<div>
						<b>
							홍길동
							<i class='fa-solid fa-earth-americas'></i>
						</b>
					</div>
					<div>56분 전</div>
				</span>
			</div>
			<span class="top-right2">
				<span class='follow' id='follow392' followpost_num='follow392' unfollowpost_num='unfollow392'
					from_user='17' to_user='3'>팔로우</span>
				<span class='unfollow' id='unfollow392' followpost_num='follow392'
					unfollowpost_num='unfollow392' style='display: none;' from_user='17' to_user='3'>팔로우 </span>
				<span class='postmenu dropdown' post_num='392' user_num='17' dtouser_num='3'>
					<i class='fa-solid fa-ellipsis'></i>
					<ul id='392' class='dropdown-menu dropdown-menu-right postsubmenu'
						style='font-size: 20px; line-height: 1.5em; display: none;'>
						<li class='postdetail posthide' divpost_num='div392' divspost_num='divs392'>게시물 숨김</li>
					</ul>
				</span>
			</span>
		</div>
		<div class="center2">
			<div class="center-up2">ㄹㄴㅇㄹㄴㅇ</div>
		</div>
		<div class="bottom2">
			<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
			<div class="bottom-up2">
				<span class='bottom-left2 liketoggle' style='cursor: pointer' user_num='17'
					likehide1_num='likehide1392' likeshow1_num='likeshow1392' post_num='392'>
					<span class='like' id='likehide1392' user_num='17' likehide1_num='likehide1392'
						likeshow1_num='likeshow1392' post_num='392'>
						<span style='font-size: 1.2em; top: 3px; color: gray;'>
							<i class='fa-regular fa-thumbs-up'></i>
						</span>
						&nbsp;좋아요 0
					</span>
					<span class='dlike' id='likeshow1392' user_num='17' post_num="392" style="display: none;">
						<span style="font-size: 1.2em; top: 3px; color: blue;">
							<i class="fa-solid fa-thumbs-up"></i>
						</span>
						&nbsp;좋아요 회원님
					</span>
				</span>
				<span class="bottom-right2 commentspan" style="cursor: pointer;" user_name="홍길동" post_num="392">
					<span style="font-size: 1.3em; color: gray;">
						<i class="fa-regular fa-comment"></i>
					</span>
					&nbsp;댓글 0
				</span>
			</div>
		</div>
	</div>
	<br>
	<br>
</body>
</html>