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

		offset = $
		{
			offset
		}
		;

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
				url : "insert",
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
			var divpost_num=$(this).attr("divpost_num");
			var divspost_num=$(this).attr("divspost_num")
			
			$("#"+divpost_num).hide();
			
			$("#"+divspost_num).show();
			
			
		});
		
		$(document).on("click", ".showbtn", function() {
			var divpost_num=$(this).attr("divpost_num");
			var divspost_num=$(this).attr("divspost_num")
			
			$("#"+divpost_num).show();
			
			$("#"+divspost_num).hide();
			
			
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

		$(document).on("click","#updatetbtn",function() {

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

		$(document).on("click", "#like", function() {
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
					location.reload();
				}
			})
		})

		$(document).on("click", "#dlike", function() {
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
					location.reload();
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
					"from_user":from_user,
					"to_user": to_user
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
.divmain {
	/* 예지가 width값 고침 */
	max-width: 650px;
	min-width: 550px;
	margin-left: 10%;
	height: 700px;
	border: 1px solid gray;
}

.top {
	width: 100%;
	height: 15%;
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
	height: 80%;
	border: 1px solid green;
}

.center-up {
	width: 100%;
	height: 30%;
}

.center-down {
	text-align: center;
	width: 100%;
	height: 70%;
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
</style>
</script>

<style type="text/css">
.allmain {
	width: 1000px;
	margin: auto;
	border: 1px solid yellow;
}

.divmain {
	margin: 0 auto;
	max-width: 750px;
	min-width: 650px;
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
	margin: 0 auto;
	max-width: 750px;
	min-width: 550px;
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
								<img alt="" src="${root }/photo/${user_photo}"
									style="width: 40px; height: 40px; border-radius: 20px;">
								<div>${user_name }</div>
								<br> <select class="form-control" name="post_access"
									id="post_access">
									<option value="all">전체공개</option>
									<option value="follower">팔로워 공개</option>
									<option value="onlyme">나만보기</option>
								</select>
							</div>
							<div class="form-group" style="width: 500px;">
								<input type="file" name="post_file" class="form-control"
									multiple="multiple" id="post_file">
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
							<select class="form-control" name="update_access"
								id="update_access" required="required">
								<option value="all">전체공개</option>
								<option value="follower">팔로워 공개</option>
								<option value="onlyme">나만보기</option>
							</select>
						</div>
						<div class="form-group" style="width: 500px;">
							<input type="file" name="update_file" class="form-control"
								required="required" multiple="multiple" id="update_file">
						</div>
						<div class="form-group">
							<textarea style="width: 550px; height: 150px;"
								name="update_content" class="form-control" required="required"
								id="update_content" placeholder="내용을 입력해주세요"></textarea>
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





		<section>
			<!-- 파일이 있을경우0 -->


			<c:forEach var="dto" items="${list }" varStatus="i">
				<c:if test="${dto.post_file!='no' }">

					<div class="shows" id="divs${dto.post_num }" style="display: none;">
					<button type="button" class="showbtn" divpost_num="div${dto.post_num }"divspost_num="divs${dto.post_num }" >게시물 보기</button></div>
					<div class="divmain" id="div${dto.post_num }">
						<div class="top">
							<div class="top-left">
								<img alt="" src="${root }/photo/${dto.user_photo}"
									style="width: 40px; height: 40px; border-radius: 20px; margin: 10px;">
								<b>${dto.user_name }${dto.post_access }</b> <span>${dto.post_time }</span>
							</div>
							<span class="top-right"> <span
								class="glyphicon glyphicon-th-list postmenu"
								post_num="${dto.post_num }" user_num="${sessionScope.user_num }" dtouser_num="${dto.user_num}"
								style="font-size: 1.3em; margin-right: 3%; color: gray;">
									<c:if test="${dto.checklogin ==1 }">

										<ul id="${dto.post_num }" class="postsubmenu"
											style="font-size: 25pt; line-height: 1.5em; display: none;">


											<li id="postupdate" class="postdetail" data-toggle="modal"
												data-target="#updatepost" post_num="${dto.post_num }"
												user_num="${dto.user_num }">게시물 수정</li>
											<li id="postdelete" class="postdetail"
												user_num="${dto.user_num }" post_num="${dto.post_num }">게시물
												삭제</li>
										</ul>
									</c:if> 
									<c:if test="${dto.checklogin !=1 }">
										<ul id="${dto.post_num }" class="postsubmenu"
											style="font-size: 25pt; line-height: 1.5em; display: none;">
											<li class="postdetail posthide" divpost_num="div${dto.post_num }"divspost_num="divs${dto.post_num }"  >게시물 숨김</li>
											<!--  이부분 팔로일땐 팔로우하기 or 팔로우 하고 있을 땐 팔로우 끊기 -->
											<c:if test="${dto.checkfollowing !=1 }">
											<li class="postdetail" id="postfollow" from_user="${sessionScope.user_num }" to_user="${dto.user_num }">팔로우 하기</li>
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

								<img src="/post_file/${dto.post_file }" class="img">
							</div>
						</div>
						<div class="bottom">
							<c:if test="${dto.likecheck ==0 }">
								<span class="bottom-left" style="cursor: pointer" id="like"
									user_num="${sessionScope.user_num}" post_num="${dto.post_num }"><span
									class="glyphicon glyphicon-heart-empty"
									style="font-size: 1.2em; top: 3px; color: red;"></span>&nbsp;좋아요
									${dto.like_count}</span>
							</c:if>

							<c:if test="${dto.likecheck !=0 }">
								<span class="bottom-left" style="cursor: pointer" id="dlike"
									user_num="${sessionScope.user_num}" post_num="${dto.post_num }"><span
									class="glyphicon glyphicon-heart"
									style="font-size: 1.2em; top: 3px; color: red;"></span>&nbsp;좋아요
									${dto.like_count}</span>
							</c:if>
							<span class="bottom-right"><span
								class="glyphicon glyphicon-comment"
								style="font-size: 1.2em; top: 3px; color: gray;"
								post_num="${dto.post_num }"></span>&nbsp;댓글</span>
						</div>

					</div>
					<br>
					<br>
				</c:if>

				<!-- 파일이 없을 경우 -->
				<c:if test="${dto.post_file=='no' }">
					<div class="shows" id="divs${dto.post_num }"style="display: none;">
					<button type="button" class="showbtn" divpost_num="div${dto.post_num }"divspost_num="divs${dto.post_num }" >게시물 보기</button></div>
					<div class="divmain2" id="div${dto.post_num }" >
						<div class="top2">
							<div class="top-left">
								<img alt="" src="${root }/photo/${dto.user_photo}"
									style="width: 40px; height: 40px; border-radius: 20px; margin: 10px;">
								<b>${dto.user_name }${dto.post_access }<span>${dto.post_time }</span>
								</b>
							</div>
							<span class="top-right"> <span
								class="glyphicon glyphicon-th-list postmenu"
								post_num="${dto.post_num }" user_num="${sessionScope.user_num }"  dtouser_num="${dto.user_num}"
								style="font-size: 1.3em; margin-right: 3%; color: gray;">
									<c:if test="${dto.checklogin ==1 }">

										<ul id="${dto.post_num }" class="postsubmenu"
											style="font-size: 25pt; line-height: 1.5em; display: none;">


											<li id="postupdate" class="postdetail" data-toggle="modal"
												data-target="#updatepost" post_num="${dto.post_num }"
												user_num="${dto.user_num }">게시물 수정</li>
											<li id="postdelete" class="postdetail"
												user_num="${dto.user_num }" post_num="${dto.post_num }">게시물
												삭제</li>
										</ul>
									</c:if> <c:if test="${dto.checklogin !=1 }">
										<ul id="${dto.post_num }" class="postsubmenu"
											style="font-size: 25pt; line-height: 1.5em; display: none;">
											<li class="postdetail posthide" divpost_num="div${dto.post_num }"divspost_num="divs${dto.post_num }"  >게시물 숨김</li>
											<!--  이부분 팔로일땐 팔로우하기 or 팔로우 하고 있을 땐 팔로우 끊기 -->
											<c:if test="${dto.checkfollowing !=1 }">
											<li class="postdetail" id="postfollow"  from_user="${sessionScope.user_num }" to_user="${dto.user_num }">팔로우 하기</li>
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
						<div class="bottom2">
							<c:if test="${dto.likecheck ==0 }">
								<span class="bottom-left2" style="cursor: pointer" id="like"
									user_num="${sessionScope.user_num}" post_num="${dto.post_num }"><span
									class="glyphicon glyphicon-heart-empty"
									style="font-size: 1.2em; top: 3px; color: red;"></span>&nbsp;좋아요
									${dto.like_count}</span>
							</c:if>

							<c:if test="${dto.likecheck !=0 }">
								<span class="bottom-left2" style="cursor: pointer" id="dlike"
									user_num="${sessionScope.user_num}" post_num="${dto.post_num }"><span
									class="glyphicon glyphicon-heart"
									style="font-size: 1.2em; top: 3px; color: red;"></span>&nbsp;좋아요
									${dto.like_count}</span>
							</c:if>
							<span class="bottom-right2"><span
								class="glyphicon glyphicon-comment"
								style="font-size: 1.2em; top: 3px; color: gray;"
								post_num="${dto.post_num }"></span>&nbsp;댓글</span>
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