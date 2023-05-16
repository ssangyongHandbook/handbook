<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/2663817d27.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
<script src="https://kit.fontawesome.com/2663817d27.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {

		offset = ${offset};

		$("#insertbtn").click(function() {

			var post_access = $("#post_access").val();
			var post_content = $("#post_content").val();
			var user_num = $("#user_num").val();
			//var data="num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&addr="+updateaddr;
			//var data=$("#postInsert").serialize();

			var form = new FormData();
			form.append("photo", $("#post_file")[0].files[0]);
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
				url : "insertpost",
				success : function() {
					location.reload();
				}
			});
		});

		$(document).on("click", ".postmenu", function() {
			var user_num = $(this).attr("user_num");
			var post_num = $(this).attr("post_num");

			$("#" + post_num).toggle();

		});

		$(document).on("click", ".posthide", function() {
			var divpost_num = $(this).attr("divpost_num");
			var divspost_num = $(this).attr("divspost_num")

			$("#" + divpost_num).hide();

			$("#" + divspost_num).show();

		});

		$(document).on("click", ".showbtn", function() {
			var divpost_num = $(this).attr("divpost_num");
			var divspost_num = $(this).attr("divspost_num")

			$("#" + divpost_num).show();

			$("#" + divspost_num).hide();

		});

		$(document).on("click", ".liketoggle", function() {

			var likeshow1_num = $(this).attr("likeshow1_num");
			var likehide1_num = $(this).attr("likehide1_num");

			$("#" + likeshow1_num).toggle();
			$("#" + likehide1_num).toggle();

		});

		/* $(document).on("click", ".liketoggle3", function() {

			var likeshow1_num = $(this).attr("likeshow1_num");
			var likehide1_num = $(this).attr("likehide1_num");

			$("#" + likeshow1_num).toggle();
			$("#" + likehide1_num).toggle();

		}); */

		$(document).on("click", ".liketoggle2", function() {

			var likeshow2_num = $(this).attr("likeshow2_num");
			var likehide2_num = $(this).attr("likehide2_num");

			/* 		
					$(".likeshow2").toggle();
					$(".likehide2").toggle(); */

			$("#" + likeshow2_num).toggle();
			$("#" + likehide2_num).toggle();

		});

		$(document).on("click", ".userimg", function() {
			var num = $(this).attr("user_num");

			location.href = "/user/mypage?user_num=" + num;

		});

		$(document).on("click", "#postdelete", function() {
			delnum = $(this).attr("post_num");

			$.ajax({
				type : "get",
				dataType : "text",
				url : "delete",
				data : {
					"post_num" : delnum
				},
				success : function() {
					location.reload();
				}
			})
		})

		//수정버튼 클릭 시 모달에 데이터 넣기
		$(document).on("click", "#postupdate", function() {
			updatenum = $(this).attr("post_num");

			$.ajax({
				type : "get",
				dataType : "json",
				url : "updateform",
				data : {
					"post_num" : updatenum
				},
				success : function(res) {
					$("#update_access").val(res.post_access);
					$("#update_content").val(res.post_content);

				}
			})
		})

		$(document)
				.on(
						"click",
						"#updatetbtn",
						function() {

							var update_access = $("#update_access").val();
							var update_content = $("#update_content").val();

							var data = "post_num=" + updatenum
									+ "&post_access=" + update_access
									+ "&post_content=" + update_content;

							$.ajax({

								type : "post",
								dataType : "text",
								data : data,
								url : "update",
								success : function() {
									location.reload();
								}
							});
						});

		$(document).on("click", ".like", function() {
			var post_num = $(this).attr("post_num");
			var user_num = $(this).attr("user_num");

			$.ajax({
				type : "get",
				dataType : "text",
				url : "likeinsert",
				data : {
					"post_num" : post_num,
					"user_num" : user_num
				},
				success : function() {
				}
			})
		})

		$(document).on("click", ".dlike", function() {
			var post_num = $(this).attr("post_num");
			var user_num = $(this).attr("user_num");

			$.ajax({
				type : "get",
				dataType : "text",
				url : "likedelete",
				data : {
					"post_num" : post_num,
					"user_num" : user_num
				},
				success : function() {
				}
			})
		});

		$(document).on("click", "#postfollow", function() {
			var from_user = $(this).attr("from_user");
			var to_user = $(this).attr("to_user");

			$.ajax({
				type : "get",
				dataType : "text",
				url : "followinginsert",
				data : {
					"from_user" : from_user,
					"to_user" : to_user
				},
				success : function() {
					location.reload();
				}
			})
		})

		$(document).on("click", "#postunfollow", function() {
			var to_user = $(this).attr("to_user");
			$.ajax({
				type : "get",
				dataType : "text",
				url : "followingdelete",
				data : {
					"to_user" : to_user
				},
				success : function() {
					location.reload();
				}
			})
		})

		/*  window.onscroll = function(e) {
		        if((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
		           
		           offset=offset+2;
		           $.ajax({
		             type:"get",
		             dataType:"json",
		             url:"scroll",
		             data:{"offset":offset},
		             success:function(res){
		                $.each(res,function(i,item){
		                alert("hello");
		                   
		                   setTimeout(function(){
		                          
		                            var addTimeline = document.createElement("div");
		                            addTimeline.classList.add("divmain");
		                           
		                            addTimeline.innerHTML =
		                             
		                             document.querySelector('section').appendChild(addTimeline);
		                   }, 1000) 
		                })
		             }
		           });
		           
		         
		        }
		      }  */

	});
</script>



<style type="text/css">
body {
	background-color: #F0F2F5;
}

.allmain {
	width: 1000px;
	height: 100%;
	background-color: #F0F2F5;
}

.divmain {
	margin: 0 auto;
	max-width: 750px;
	min-width: 650px;
	height: 600px;
	border-radius: 10px 10px;
	background-color: white;
}

.top {
	width: 100%;
	height: 10%;
}

.top-left {
	float: left;
	width: 50%;
	height: 100%;
}

.top-right {
	text-align: right;
	float: right;
	width: 50%;
	height: 100%;
}

.center {
	width: 100%;
	height: 78.5%;
}

.center-up {
	width: 100%;
	height: 20%;
}

.center-down {
	text-align: center;
	width: 100%;
	height: 80%;
}

.bottom {
	width: 100%;
	height: 6.5%;
}

.bottom-up {
	width: 100%;
	height: 10%;
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

.bottom-down {
	width: 100%;
	height: 10%;
}

.fileimg {
	text-align: center;
	width: 20%;
	height: 100%;
}

/* 파일 없을 경우  */
.divmain2 {
	margin: 0 auto;
	max-width: 750px;
	min-width: 550px;
	height: 300px;
	border-radius: 10px 10px;
	background-color: white;
}

.top2 {
	width: 100%;
	height: 20%;
}

.top-left2 {
	float: left;
	width: 50%;
	height: 100%;
}

.top-right2 {
	text-align: right;
	float: right;
	width: 50%;
	height: 100%;
}

.center2 {
	width: 100%;
	height: 57%;
}

.center-up2 {
	width: 100%;
	height: 100%;
}

.bottom2 {
	width: 100%;
	height: 13%;
}

.bottom-up2 {
	width: 100%;
	height: 10%;
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

.bottom-down2 {
	width: 100%;
	height: 90%;
}

.postmenu {
	cursor: pointer;
	font-size: 2.5em;
	margin-right: 3%;
	color: gray;
}

.postsubmenu {
	font-size: 1.5em;
}

.postdetail:hover {
	text-decoration: underline;
}

.postdetail {
	font-size: 0.8em;
	color: black;
}

.userimg {
	cursor: pointer;
	width: 40px;
	height: 40px;
	border: 1px solid gray;
	border-radius: 20px;
	margin: 10px;
}

.contentmodal {
	/* background: #F0F2F5; */
	border-radius: 60px;
	margin: 0 auto;
	max-width: 750px;
	min-width: 550px;
}

#writeinput {
	width: 100%;
	border-radius: 30px;
	text-align: left;
	outline: none;
	border: none;
	font-size: 15pt;
	background: #F0F2F5;
	padding: 1.2%;
}

#coverinput {
	background: white;
	height: 65px;
	width: 100%;
	border-radius: 10px;
	padding: 1.5%;
	padding-top: 2%;
}

.writeimg {
	width: 35px;
	height: 35px;
	border: 1px solid gray;
	border-radius: 20px;
}

.postimg {
	width: 35px;
	height: 35px;
	border: 1px solid gray;
	border-radius: 20px;
}

.shows {
	display: none;
	background-color: white;
	margin: 0 auto;
	max-width: 750px;
	min-width: 650px;
	height: 50px;
	border-radius: 10px 10px;
	padding: 0.6%;
	font-size: 18px;
	text-align: center;
}

.showtext {
	float: left;
	padding: 1%;
	margin-left: 10%;
}

.showbtn {
	border-radius: 5px 5px;
	background-color: #F0F2F5;
	border: 0.5px solid gray;
	float: right;
	height: 37px;
}

.commentarrow {
	width: 30px;
	height: 30px;
	margin-right: 3%;
	cursor: pointer;
}
</style>
</head>



<body>

	<c:set var="root" value="<%=request.getContextPath()%>" />

	<div class="allmain">
		<br>
		<!-- writemodal -->

		<div class="contentmodal">
			<div id="coverinput">
				<div>
					<span style="float: left; width: 8%; top: 50%;">
						<img src="${root }/photo/${user_photo}" class="writeimg">
					</span>
					<span style="float: right; width: 92%;">
						<input type="button" data-toggle="modal" data-target="#contentwrite" name="contentwirte"
							id="writeinput" value="무슨 생각을 하고 계신가요?">
					</span>
				</div>
			</div>
		</div>

		<br>
		<!-- Modal -->
		<div class="modal fade" id="contentwrite" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<form method="post" enctype="multipart/form-data" id="postInsert">

					<input type="hidden" name="user_num" id="user_num" value="${sessionScope.user_num }">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">게시글 만들기</h4>
						</div>
						<div class="modal-body">
							<div class="form-group" style="width: 500px;">
								<img alt="" src="${root }/photo/${user_photo}"
									style="width: 40px; height: 40px; border-radius: 20px;">
								<span>${login_name}</span>
							</div>
							<br> <select class="form-control" name="post_access" style="width: 150px;"
								id="post_access">
								<option value="all">전체공개</option>
								<option value="follower">팔로워 공개</option>
								<option value="onlyme">나만보기</option>
							</select>
							<div class="form-group" style="width: 500px;">
								<input type="file" name="post_file" class="form-control" multiple="multiple" id="post_file">
							</div>
							<div class="form-group">
								<textarea style="width: 550px; height: 150px;" name="post_content" class="form-control"
									required="required" id="post_content" placeholder="내용을 입력해주세요"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal" id="insertbtn">게시</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
							<select class="form-control" name="update_access" id="update_access" required="required">
								<option value="all">전체공개</option>
								<option value="follower">팔로워 공개</option>
								<option value="onlyme">나만보기</option>
							</select>
						</div>
						<div class="form-group" style="width: 500px;">
							<input type="file" name="update_file" class="form-control" required="required"
								multiple="multiple" id="update_file">
						</div>
						<div class="form-group">
							<textarea style="width: 550px; height: 150px;" name="update_content" class="form-control"
								required="required" id="update_content" placeholder="내용을 입력해주세요"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="updatetbtn">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					</div>
				</div>

			</div>
		</div>





		<section>
			<!-- 파일이 있을경우0 -->
							<!--  동영상일 경우와 사진이 1장만 있을 경우도 .해주어야함   -->

			<c:forEach var="dto" items="${list }" varStatus="i">
				<c:if test="${dto.post_file!='no' }">

					<div class="shows" id="divs${dto.post_num }">
						<div class="showtext">게시물을 숨겼습니다. 다시 보려면 게시물 보기를 눌러주세요.</div>
						<button type="button" class="showbtn" divpost_num="div${dto.post_num }"
							divspost_num="divs${dto.post_num }">게시물 보기</button>
					</div>
					<div class="divmain" id="div${dto.post_num }">
						<div class="top">
							<div class="top-left">
								<span style="float: left;">
									<img src="${root }/photo/${dto.user_photo}" class="userimg" user_num="${dto.user_num }">
								</span>
								<span style="float: left; padding: 3%; margin-right: 5px;">
									<div>
										<b>${dto.user_name }
											<c:if test="${dto.post_access =='follower'}">
												<i class="fa-solid fa-user-group"></i>
											</c:if>
											<c:if test="${dto.post_access =='all'}">
												<i class="fa-solid fa-earth-americas"></i>
											</c:if>
											<c:if test="${dto.post_access =='onlyme'}">
												<i class="fa-solid fa-lock"></i>
											</c:if>

										</b>
									</div>

									<div>${dto.post_time }</div>
								</span>
							</div>
							<span class="top-right">
								<span class="postmenu dropdown" post_num="${dto.post_num }"
									user_num="${sessionScope.user_num }" dtouser_num="${dto.user_num}">
									<i class="fa-solid fa-ellipsis"></i>
									<c:if test="${dto.checklogin ==1 }">

										<ul id="${dto.post_num }" class="dropdown-menu dropdown-menu-right postsubmenu "
											style="font-size: 20pt; line-height: 1.5em; display: none;">


											<li id="postupdate" class="postdetail" data-toggle="modal" data-target="#updatepost"
												post_num="${dto.post_num }" user_num="${dto.user_num }">게시물 수정</li>
											<li id="postdelete" class="postdetail" user_num="${dto.user_num }"
												post_num="${dto.post_num }">게시물 삭제</li>
										</ul>
									</c:if>
									<c:if test="${dto.checklogin !=1 }">
										<ul id="${dto.post_num }" class="dropdown-menu dropdown-menu-right postsubmenu"
											style="font-size: 25pt; line-height: 1.5em; display: none;">
											<li class="postdetail posthide" divpost_num="div${dto.post_num }"
												divspost_num="divs${dto.post_num }">게시물 숨김</li>
											<!--  이부분 팔로일땐 팔로우하기 or 팔로우 하고 있을 땐 팔로우 끊기 -->
											<c:if test="${dto.checkfollowing !=1 }">
												<li class="postdetail" id="postfollow" from_user="${sessionScope.user_num }"
													to_user="${dto.user_num }">팔로우 하기</li>
											</c:if>
											<c:if test="${dto.checkfollowing ==1 }">
												<li class="postdetail" id="postunfollow" to_user="${dto.user_num }">팔로우 끊기</li>
											</c:if>
										</ul>
									</c:if>
								</span>
							</span>

						</div>

						<div class="center">
							<div class="center-up">${dto.post_content }</div>

							<div class="center-down">

								<img src="/post_file/${dto.post_file }" class="fileimg">
							</div>
						</div>
						<div class="bottom">
							<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
							<div class="bottom-up">









								<!-- 체크 안했으면 보이는거 -->
								<c:if test="${dto.likecheck ==0 }">
									<span class="bottom-left liketoggle" style="cursor: pointer"
										user_num="${sessionScope.user_num}" likehide1_num="likehide1${dto.post_num}"
										likeshow1_num="likeshow1${dto.post_num}" post_num="${dto.post_num }">
										<span class="like" id="likehide1${dto.post_num}" 
										user_num="${sessionScope.user_num}" likehide1_num="likehide1${dto.post_num}"
										likeshow1_num="likeshow1${dto.post_num}" post_num="${dto.post_num }">
											<span style="font-size: 1.2em; top: 3px; color: gray;">
												<i class="fa-regular fa-thumbs-up"></i>
											</span>
											<c:if test="${dto.like_count==0 }">
											&nbsp;좋아요 ${dto.like_count}
											</c:if> 
											<c:if test="${dto.like_count !=0 }">
											&nbsp;좋아요 ${dto.like_count}명
											</c:if>
										</span>
										<span class="dlike" id="likeshow1${dto.post_num}" user_num="${sessionScope.user_num}"
											post_num="${dto.post_num }" style="display: none;">
											<span style="font-size: 1.2em; top: 3px; color: blue;">
												<i class="fa-solid fa-thumbs-up"></i>
											</span>
											<c:if test="${dto.like_count==0 }">
											&nbsp;좋아요 회원님 
											</c:if>
											<c:if test="${dto.like_count !=0 }">
											&nbsp;좋아요 회원님 외${dto.like_count}명
											</c:if>
										</span>

									</span>


								</c:if>

								<!-- 처음부터 체크되어있으면 보이는거  -->
								<c:if test="${dto.likecheck !=0 }">
									<span class="bottom-left liketoggle2" style="cursor: pointer"
										likehide2_num="likehide2${dto.post_num}" likeshow2_num="likeshow2${dto.post_num}"
										user_num="${sessionScope.user_num}" post_num="${dto.post_num }">
										<span id="likehide2${dto.post_num}" class="dlike"
										user_num="${sessionScope.user_num}" likehide1_num="likehide1${dto.post_num}"
										likeshow1_num="likeshow1${dto.post_num}" post_num="${dto.post_num }"
										>
											<span style="font-size: 1.2em; top: 3px; color: blue;">
												<i class="fa-solid fa-thumbs-up"></i>
											</span>
											
											<c:if test="${dto.like_count!= 1}">
											&nbsp;좋아요 회원님 외 ${dto.like_count-1}명
											</c:if>
											<c:if test="${dto.like_count ==1 }">
											&nbsp;좋아요 회원님 
											</c:if>
										</span>
										<span user_num="${sessionScope.user_num}" id="likeshow2${dto.post_num}" class="like"
											post_num="${dto.post_num }" style="display: none;">
											<span style="font-size: 1.2em; top: 3px; color: gray;">
												<i class="fa-regular fa-thumbs-up"></i>
												<c:if test="${dto.like_count== 1}">
											&nbsp;좋아요 0
											</c:if>
											<c:if test="${dto.like_count!= 1}">
											&nbsp;좋아요 ${dto.like_count -1 }
											</c:if>
											
											</span>
										</span>


									</span>
								</c:if>


								
									<!-- comment -->	
								<span class="bottom-right"  id="commentmodal"
								style="cursor: pointer;">
									<span style="font-size: 1.3em; color: gray;" post_num="${dto.post_num }">
										<i class="fa-regular fa-comment"></i>
									</span>
									&nbsp;댓글
								</span>
							
							</div>
							<%-- <div class="bottom-down">
								<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
								<span style="float: left; width: 8%; padding-left: 1%;">
									<img src="${root }/photo/${user_photo}" class="writeimg">
								</span>
								<span
									style="background-color: #F0F2F5; width: 8%; width: 88%; float: left; border-radius: 60px; display: inline-flex; align-items: center;">
									<input type="text" name="commentwrite"
										style="width: 600px; border: none; background: none; outline: none; font-size: 15pt; padding: 1%; margin-right: 10px;"
										placeholder="댓글을 입력하세요...">
									<img class="commentarrow" src="${root }/image/submit.png">
								</span>
							</div> --%>
						</div>

					</div>
					<br>
					<br>
				</c:if>

				<!-- 파일이 없을 경우 -->
				<c:if test="${dto.post_file=='no' }">
					<div class="shows" id="divs${dto.post_num }">
						<div class="showtext">게시물을 숨겼습니다. 다시 보려면 게시물 보기를 눌러주세요.</div>
						<button type="button" class="showbtn" divpost_num="div${dto.post_num }"
							divspost_num="divs${dto.post_num }">게시물 보기</button>
					</div>
					<div class="divmain2" id="div${dto.post_num }">
						<div class="top2">
							<div class="top-left2">
								<span style="float: left;">
									<img src="${root }/photo/${dto.user_photo}" class="userimg" user_num="${dto.user_num }">
								</span>
								<span style="float: left; padding: 3%; margin-right: 5px;">
									<div>
										<b>${dto.user_name }
											<c:if test="${dto.post_access =='follower'}">
												<i class="fa-solid fa-user-group"></i>
											</c:if>
											<c:if test="${dto.post_access =='all'}">
												<i class="fa-solid fa-earth-americas"></i>
											</c:if>
											<c:if test="${dto.post_access =='onlyme'}">
												<i class="fa-solid fa-lock"></i>
											</c:if>


										</b>
									</div>

									<div>${dto.post_time }</div>
								</span>
							</div>
							<span class="top-right2">
								<span class="postmenu dropdown" post_num="${dto.post_num }"
									user_num="${sessionScope.user_num }" dtouser_num="${dto.user_num}">
									<i class="fa-solid fa-ellipsis"></i>
									<c:if test="${dto.checklogin ==1 }">

										<ul id="${dto.post_num }" class="dropdown-menu dropdown-menu-right postsubmenu"
											style="font-size: 20pt; line-height: 1.5em; display: none;">


											<li id="postupdate" class="postdetail" data-toggle="modal" data-target="#updatepost"
												post_num="${dto.post_num }" user_num="${dto.user_num }">게시물 수정</li>
											<li id="postdelete" class="postdetail" user_num="${dto.user_num }"
												post_num="${dto.post_num }">게시물 삭제</li>
										</ul>
									</c:if>
									<c:if test="${dto.checklogin !=1 }">
										<ul id="${dto.post_num }" class="dropdown-menu dropdown-menu-right postsubmenu"
											style="font-size: 25pt; line-height: 1.5em; display: none;">
											<li class="postdetail posthide" divpost_num="div${dto.post_num }"
												divspost_num="divs${dto.post_num }">게시물 숨김</li>
											<c:if test="${dto.checkfollowing !=1 }">
												<li class="postdetail" id="postfollow" from_user="${sessionScope.user_num }"
													to_user="${dto.user_num }">팔로우 하기</li>
											</c:if>
											<c:if test="${dto.checkfollowing ==1 }">
												<li class="postdetail" id="postunfollow" to_user="${dto.user_num }">팔로우 끊기</li>
											</c:if>
										</ul>
									</c:if>
								</span>

							</span>
						</div>
						<div class="center2">
							<div class="center-up2">${dto.post_content }</div>

						</div>
						<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
						<div class="bottom2">
							<div class="bottom-up2">



								<!-- 체크 안했으면 보이는거 -->
								<c:if test="${dto.likecheck ==0 }">
									<span class="bottom-left2 liketoggle" style="cursor: pointer"
										user_num="${sessionScope.user_num}" likehide1_num="likehide1${dto.post_num}"
										likeshow1_num="likeshow1${dto.post_num}" post_num="${dto.post_num }">
										<span class="like" id="likehide1${dto.post_num}" 
										user_num="${sessionScope.user_num}" likehide1_num="likehide1${dto.post_num}"
										likeshow1_num="likeshow1${dto.post_num}" post_num="${dto.post_num }">
											<span style="font-size: 1.2em; top: 3px; color: gray;">
												<i class="fa-regular fa-thumbs-up"></i>
											</span>
											<c:if test="${dto.like_count==0 }">
											&nbsp;좋아요 ${dto.like_count}
											</c:if> 
											<c:if test="${dto.like_count !=0 }">
											&nbsp;좋아요 ${dto.like_count}명
											</c:if>
										</span>
										<span class="dlike" id="likeshow1${dto.post_num}" user_num="${sessionScope.user_num}"
											post_num="${dto.post_num }" style="display: none;">
											<span style="font-size: 1.2em; top: 3px; color: blue;">
												<i class="fa-solid fa-thumbs-up"></i>
											</span>
											<c:if test="${dto.like_count==0 }">
											&nbsp;좋아요 회원님 
											</c:if>
											<c:if test="${dto.like_count !=0 }">
											&nbsp;좋아요 회원님 외${dto.like_count}명
											</c:if>
										</span>

									</span>


								</c:if>

								<!-- 처음부터 체크되어있으면 보이는거  -->
								<c:if test="${dto.likecheck !=0 }">
									<span class="bottom-left2 liketoggle2" style="cursor: pointer"
										likehide2_num="likehide2${dto.post_num}" likeshow2_num="likeshow2${dto.post_num}"
										user_num="${sessionScope.user_num}" post_num="${dto.post_num }">
										<span id="likehide2${dto.post_num}" class="dlike"
										user_num="${sessionScope.user_num}" likehide1_num="likehide1${dto.post_num}"
										likeshow1_num="likeshow1${dto.post_num}" post_num="${dto.post_num }"
										>
											<span style="font-size: 1.2em; top: 3px; color: blue;">
												<i class="fa-solid fa-thumbs-up"></i>
											</span>
											
											<c:if test="${dto.like_count!= 1}">
											&nbsp;좋아요 회원님 외 ${dto.like_count-1}명
											</c:if>
											<c:if test="${dto.like_count ==1 }">
											&nbsp;좋아요 회원님 
											</c:if>
										</span>
										<span user_num="${sessionScope.user_num}" id="likeshow2${dto.post_num}" class="like"
											post_num="${dto.post_num }" style="display: none;">
											<span style="font-size: 1.2em; top: 3px; color: gray;">
												<i class="fa-regular fa-thumbs-up"></i>
												<c:if test="${dto.like_count== 1}">
											&nbsp;좋아요 0
											</c:if>
											<c:if test="${dto.like_count!= 1}">
											&nbsp;좋아요 ${dto.like_count -1 }
											</c:if>
											
											</span>
										</span>


									</span>
								</c:if>









									<!-- comment -->
								<span class="bottom-right2"  id="commentmodal"
								style="cursor: pointer;" >
									<span style="font-size: 1.2em; top: 3px; color: gray;" post_num="${dto.post_num }">
										<i class="fa-regular fa-comment"></i>
									</span>
									&nbsp;댓글
								</span>
							
							</div>
							
							
							
							
							<%-- 
							<div class="bottom-down2">
								<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
								<span style="float: left; width: 8%; padding-left: 1%;">
									<img src="${root }/photo/${user_photo}" class="writeimg">
								</span>
								<span
									style="background-color: #F0F2F5; width: 8%; width: 88%; float: left; border-radius: 60px; display: inline-flex; align-items: center;">
									<input type="text" name="commentwrite"
										style="width: 600px; border: none; background: none; outline: none; font-size: 15pt; padding: 1%; margin-right: 10px;"
										placeholder="댓글을 입력하세요...">
									<img class="commentarrow" src="${root }/image/submit.png">
								</span>
							</div> --%>
						</div>


					</div>

					<br>
					<br>
				</c:if>
			</c:forEach>
		</section>

	</div>

</body>
</html>