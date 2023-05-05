<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function() {

		$("#insertbtn").click(function() {

			var post_access = $("#post_access").val();
			var post_content = $("#post_content").val();
			var user_num = $("#user_num").val();
			//var data="num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&addr="+updateaddr;
			//var data=$("#postInsert").serialize();

			var form = new FormData();
			form.append("photo", $("#pfile")[0].files[0]);
			form.append("post_access", post_access);
			form.append("post_content", post_content);
			form.append("user_num", user_num);
			console.dir(form);

			$.ajax({

				type : "post",
				dataType : "text",
				processData : false,
				contentType : false,
				data : form,
				url : "insert",
				success : function() {
					location.reload();
				}
			});
		});

		$(".postsubmenu").hide();
		$(document).on("click", ".postmenu", function() {

			var i = $(this).attr("i");
			$("#" + i).toggle();

		});

		$(document).on("click", "#postdelete", function() {
			var post_num = $(this).attr("post_num");

			$.ajax({
				type : "get",
				dataType : "text",
				url : "delete",
				data : {
					"post_num" : post_num
				},
				success : function() {
					location.reload();
				}
			})
		})

	});
</script>

<style type="text/css">
.allmain {
	width: 1000px;
	margin: auto;
	border: 1px solid yellow;
}

.divmain {
	max-width: 650px;
	min-width: 550px;
	height: 700px;
	border: 1px solid gray;
}

.top {
	width: 100%;
	height: 10%;
}

.top-left {
	float: left;
	width: 50%;
	height: 100%;
	border: 1px solid red;
}

.top-right {
	text-align: right;
	float: right;
	width: 50%;
	height: 100%;
	border: 1px solid green;
}

.center {
	width: 100%;
	height: 85%;
	border: 1px solid green;
}

.center-up {
	width: 100%;
	height: 20%;
}

.center-down {
	text-align: center;
	width: 100%;
	height: 80%;
	border: 1px solid green;
}

.bottom {
	width: 100%;
	height: 5%;
}

.bottom-left {
	text-align: center;
	font-size: 1.2em;
	float: left;
	width: 50%;
	height: 100%;
}

.bottom-right {
	text-align: center;
	font-size: 1.2em;
	float: right;
	width: 50%;
	height: 100%;
}

.img {
	text-align: center;
	width: 20%;
	height: 100%;
}

/* 파일 없을 경우  */
.divmain2 {
	max-width: 650px;
	min-width: 550px margin-left: 10%;
	height: 400px;
	border: 1px solid gray;
	height: 400px;
}

.top2 {
	width: 100%;
	height: 15%;
}

.top-left2 {
	float: left;
	width: 50%;
	height: 100%;
	border: 1px solid red;
}

.top-right2 {
	text-align: right;
	float: right;
	width: 50%;
	height: 100%;
	border: 1px solid green;
}

.center2 {
	width: 100%;
	height: 77%;
	border: 1px solid green;
}

.center-up2 {
	width: 100%;
	height: 100%;
}

.bottom2 {
	width: 100%;
	height: 8%;
}

.bottom-left2 {
	text-align: center;
	font-size: 1.2em;
	float: left;
	width: 50%;
	height: 100%;
}

.bottom-right2 {
	text-align: center;
	font-size: 1.2em;
	float: right;
	width: 50%;
	height: 100%;
}

.postmenu {
	cursor: pointer;
}

.postdetail:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="allmain">
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">글쓰기</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<form method="post" enctype="multipart/form-data" id="postInsert">

					<input type="hidden" name="user_num" id="user_num" value="1">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">게시글 만들기</h4>
						</div>
						<div class="modal-body">
							<div class="form-group" style="width: 150px;">
								<select class="form-control" name="post_access" id="post_access">
									<option value="all">전체공개</option>
									<option value="follower">팔로워 공개</option>
									<option value="onlyme">나만보기</option>
								</select>
							</div>
							<div class="form-group" style="width: 500px;">
								<input type="file" name="post_file" class="form-control"
									multiple="multiple" id="pfile">
							</div>
							<div class="form-group">
								<textarea style="width: 550px; height: 150px;"
									name="post_content" class="form-control" required="required"
									id="post_content" placeholder="내용을 입력해주세요"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="insertbtn">게시</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>

						</div>
					</div>
				</form>

			</div>
		</div>

		<!-- 수정 Modal -->


		<div class="modal fade" id="updatepost" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">게시글 수정</h4>
					</div>



					<div class="modal-body">
						<div class="form-group" style="width: 150px;">
							<select class="form-control" name="post_access" id="post_access">
								<option value="all">전체공개</option>
								<option value="follower">팔로워 공개</option>
								<option value="onlyme">나만보기</option>
							</select>
						</div>
						<div class="form-group" style="width: 500px;">
							<input type="file" name="post_file" class="form-control"
								multiple="multiple" id="pfile">
						</div>
						<div class="form-group">
							<textarea style="width: 550px; height: 150px;"
								name="post_content" class="form-control" required="required"
								id="post_content" placeholder="내용을 입력해주세요"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="updatetbtn">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					</div>
				</div>

			</div>
		</div>








		<!-- 파일이 있을경우0 -->
		<c:forEach var="dto" items="${list }" varStatus="i">
			<c:if test="${dto.post_file!='no' }">

				<div class="divmain">
					<div class="top">
						<span class="top-left">이름: 지성웅<span>게시글범위:${dto.post_access }</span><span>시간:
								${dto.post_writeday }</span></span> <span class="top-right"> <span
							class="glyphicon glyphicon-th-list postmenu" i="${i.count}"
							style="font-size: 1.3em; margin-right: 3%; color: gray;">
								<ul id="${i.count }" class="postsubmenu"
									style="font-size: 25pt; line-height: 1.5em;">
									<li id="postupdate" class="postdetail" data-toggle="modal"
										data-target="#updatepost" post_num="${dto.post_num }">게시물
										수정</li>
									<li id="postdelete" class="postdetail"
										post_num="${dto.post_num }">게시물 삭제</li>
									<!--  이부분 팔로일땐 팔로우하기 or 팔로우 하고 있을 땐 팔로우 끊기 -->
									<li class="postdetail">팔로우 하기</li>
								</ul>
						</span>

						</span>
					</div>
					<div class="center">
						<div class="center-up">${dto.post_content }</div>

						<div class="center-down">

							<img src="/post_file/${dto.post_file }" class="img">
						</div>
					</div>
					<div class="bottom">
						<span class="bottom-left"><span
							class="glyphicon glyphicon-heart"
							style="font-size: 1.2em; top: 3px; color: red;"></span>&nbsp;좋아요</span>
						<span class="bottom-right"><span
							class="glyphicon glyphicon-comment"
							style="font-size: 1.2em; top: 3px; color: gray;"></span>&nbsp;댓글</span>
					</div>

				</div>
				<br>
				<br>
			</c:if>

			<!-- 파일이 없을 경우 -->
			<c:if test="${dto.post_file=='no' }">
				<div class="divmain2">
					<div class="top2">
						<span class="top-left">이름: 지성웅<span>게시글범위:${dto.post_access }</span>
							<span>시간: ${dto.post_writeday }</span>
						</span> <span class="top-right"> <span
							class="glyphicon glyphicon-th-list postmenu" i="${i.count }"
							style="font-size: 1.3em; margin-right: 3%; color: gray;">
								<ul id="${i.count }" class="postsubmenu"
									style="font-size: 25pt; line-height: 1.5em;">
									<li id="postupdate" class="postdetail" data-toggle="modal"
										data-target="#updatepost" post_num="${dto.post_num }">게시물
										수정</li>
									<li id="postdelete" class="postdetail"
										post_num="${dto.post_num }">게시물 삭제</li>
									<!--  이부분 팔로일땐 팔로우하기 or 팔로우 하고 있을 땐 팔로우 끊기 -->
									<li class="postdetail">팔로우 하기</li>
								</ul>
						</span>

						</span>
					</div>
					<div class="center2">
						<div class="center-up2">${dto.post_content }</div>

					</div>
					<div class="bottom2">
						<span class="bottom-left2"><span
							class="glyphicon glyphicon-heart"
							style="font-size: 1.2em; top: 3px; color: red;"></span>&nbsp;좋아요</span>
						<span class="bottom-right2"><span
							class="glyphicon glyphicon-comment"
							style="font-size: 1.2em; top: 3px; color: gray;"></span>&nbsp;댓글</span>
					</div>

				</div>
				<br>
				<br>
			</c:if>
		</c:forEach>


	</div>

	<button type="button" id="btnbtn">버튼튼</button>

	post_timeline ${total }
</body>
</html>