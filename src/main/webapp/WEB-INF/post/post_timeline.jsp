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
	 $(function(){
		 
		 
		 
		$("#insertbtn").click(function(){
			  
			  
			  var post_access=$("#post_access").val();
			  var post_content=$("#post_content").val();
			  var user_num=$("#user_num").val();
			//var data="num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&addr="+updateaddr;
			  //var data=$("#postInsert").serialize();
			  

			  
			   var form=new FormData();
			   form.append("photo",$("#pfile")[0].files[0]);
			   form.append("post_access",post_access);
			   form.append("post_content",post_content);
			   form.append("user_num",user_num);
			   console.dir(form);
			   
			  
			   $.ajax({
				  
				  type:"post",
				  dataType:"text",
				  processData:false,
				  contentType:false,
				  data:form,
				  url:"insert",
				  success:function(){
					  location.reload();
				  }
			  }); 
		  });
	});
	</script>
	
	<style type="text/css">
	
	.divmain{
	width:80%;
	margin-left:10%;
	height :700px;
		border : 1px solid gray;
	}
	.top{
	
	width:100%;
	height:15%;
	}
	
	
	.top-left{
	float:left;
	width:50%;
	height:100%;
	border : 1px solid red;	
	}
	
	.top-right{
	text-align:right;
	float:right;
	width:50%;
	height:100%;
		border : 1px solid green;
	}
	.center{
	width:100%;
	height:80%;
	border : 1px solid green;
	}
	.center-up{
	width:100%;
	height:30%;
	}
	.center-down{
	text-align:center;
	width:100%;
	height:70%;
		border : 1px solid green;
	
	}
	.bottom{
	width:100%;
	height:5%;
	
	}
	.bottom-left{
	text-align:center;
	font-size:1.2em;
	float:left;
	width:50%;
	height:100%;
	}
	
	.bottom-right{
	text-align:center;
	font-size:1.2em;
	float:right;
	width:50%;
	height:100%;
	}
	
	.img{
	text-align:center;
	width:20%;
	height:100%;
	}
	
	</style>
</head>
<body>
	<div >
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">글쓰기</button>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<form  method="post" enctype="multipart/form-data" id="postInsert">
				
					<input type="hidden" name="user_num" id="user_num" value="1"> 
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">게시글 만들기</h4>
						</div>
						<div class="modal-body">
							<div class="form-group" style="width:150px;" >
								<select class="form-control" name="post_access" id="post_access">
								<option value="all">전체공개</option>
									<option value="follower">팔로워 공개</option>
									<option value="onlyme">나만보기</option></select>
							</div>
							<div class="form-group" style="width:500px;">
								<input type="file" name="post_file" class="form-control"
									multiple="multiple" id="pfile">
							</div>
							<div class="form-group">
								<textarea style="width: 550px; height: 150px;" name="post_content"
									class="form-control" required="required" id="post_content"
									placeholder="내용을 입력해주세요"></textarea>
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




<c:forEach var="dto" items="${list }">
		
<div class="divmain">
<div class="top">
<span class="top-left">이름: 지성웅</span><span class="top-right">시간: ${dto.post_writeday }</span>
</div>
<div class="center">
<div class="center-up">${dto.post_content }</div>

<div class="center-down">

<c:if test="${dto.post_file!='no' }">
<img src="/post_file/${dto.post_file }"  class="img">
</c:if>
</div>
</div>
<div class="bottom">
<span class="bottom-left  "><span class="glyphicon glyphicon-heart" style="font-size:1.2em;top:3px; color:red;"></span>&nbsp;좋아요</span>
<span class="bottom-right"><span class="glyphicon glyphicon-comment" style="font-size:1.2em;top:3px; color:white;"></span>&nbsp;댓글</span>
</div>

</div>
<br><br>
</c:forEach>
	</div>

<button type="button" id ="btnbtn"> 버튼튼</button>

	post_timeline ${total }
</body>
</html>