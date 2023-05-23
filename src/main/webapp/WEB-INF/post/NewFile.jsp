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
	<div class='shows' id='divs210'>
		<div class='showtext'>게시물을 숨겼습니다. 다시보려면 게시물을 눌러주세요.</div>
		<button type='button' class='showbtn' divpost_num='div210' divspost_num='divs210'>게시물보기</button>
	</div>
	<div class="divmain" id="div210">
		<div class="top">
			<div class="top-left">
				<div style="float: left;" class="userimgdiv">
					<img src="/photo/f_20230509162340icon02.png" class="userimg" user_num="17">
				</div>
				<span style="float: left; padding: 3%; margin-right: 5px;">
					<div>
						<b>
							지성웅
							<i class='fa-solid fa-earth-americas'></i>
						</b>
					</div>
					<div>4일 전</div>
				</span>
			</div>
			<span class="top-right">
				<span class="postmenu dropdown" post_num="210" user_num="17" dtouser_num="17">
					<i class="fa-solid fa-ellipsis"></i>
					<ul id='210' class='dropdown-menu dropdown-menu-right postsubmenu'
						style='font-size: 20pt; line-height: 1.5em; display: none;'>
						<li id='postupdate' class='postdetail' data-toggle='modal' data-target='#updatepost'
							post_num='210' user_num='17'>게시물 수정</li>
						<li id='postdelete' class='postdetail' user_num='17' post_num='210'>게시물 삭제</li>
					</ul>
				</span>
			</span>
		</div>
		<div class="center">
			<div class="center-up"></div>
			<div class="center-down sliders" id="dto-210">
				<div class="fileimg">
					<a href="/post_file/1_202305181130_bag01.png" target="_new"
						style="text-decoration: none; outline: none;">
						<img src="/post_file/1_202305181130_bag01.png">
					</a>
				</div>
				<div class="fileimg">
					<a href="/post_file/2_202305181130_captain.png" target="_new"
						style="text-decoration: none; outline: none;">
						<img src="/post_file/2_202305181130_captain.png">
					</a>
				</div>
				<div class="fileimg">
					<a href="/post_file/3_202305181130_icon01.png" target="_new"
						style="text-decoration: none; outline: none;">
						<img src="/post_file/3_202305181130_icon01.png">
					</a>
				</div>
				<div class="fileimg">
					<a href="/post_file/4_202305181130_icon02.png" target="_new"
						style="text-decoration: none; outline: none;">
						<img src="/post_file/4_202305181130_icon02.png">
					</a>
				</div>
			</div>
		</div>
		<div class="bottom">
			<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
			<div class="bottom-up">
				<span class='bottom-left liketoggle' style='cursor: pointer' user_num='17'
					likehide1_num='likehide1210' likeshow1_num='likeshow1210' post_num='210'>
					<span class='like' id='likehide1210' user_num='17' likehide1_num='likehide1210'
						likeshow1_num='likeshow1210' post_num='210'>
						<span style='font-size: 1.2em; top: 3px; color: gray;'>
							<i class='fa-regular fa-thumbs-up'></i>
						</span>
						&nbsp;좋아요 0
					</span>
					<span class='dlike' id='likeshow1210' user_num='17' post_num="210" style="display: none;">
						<span style="font-size: 1.2em; top: 3px; color: blue;">
							<i class="fa-solid fa-thumbs-up"></i>
						</span>
						&nbsp;좋아요 회원님
					</span>
				</span>
				<span class="bottom-right commentspan" style="cursor: pointer;" user_name="지성웅" post_num="210">
					<span style="font-size: 1.3em; color: gray;">
						<i class="fa-regular fa-comment"></i>
					</span>
					&nbsp;댓글 2
				</span>
			</div>
		</div>
	</div>
	<br>
	<br>
</body>
</html>