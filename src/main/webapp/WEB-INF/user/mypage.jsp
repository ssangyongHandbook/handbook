<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

//주소 찾기 API
function findAddr(){
    new daum.Postcode({
         oncomplete: function(data) {
            
            console.log(data);
            
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var roadAddr = data.roadAddress; // 도로명 주소 변수
             var jibunAddr = data.jibunAddress; // 지번 주소 변수
             // 우편번호와 주소 정보를 해당 필드에 넣는다.
            /*  document.getElementById('member_post').value = data.zonecode; */
             if(roadAddr !== ''){
                 document.getElementById("member_addr").value = roadAddr;
             } 
             else if(jibunAddr !== ''){
                 document.getElementById("member_addr").value = jibunAddr;
             }
         }
     }).open();
 }


$(function(){
		
		//강제 호출
		$("#btnnewcover").click(function(){
			
			$("#newcover").trigger("click");
		});
		
		//커버 사진만 변경
		$("#newcover").change(function(){
			
			var num=$(this).attr("num");
	
			var form=new FormData();
			form.append("cover",$("#newcover")[0].files[0]); //선택한 1개 추가
			form.append("user_num",num);
			
			$.ajax({
				
				type: "post",
				dataType: "text",
				url: "coverupdate",
				processData: false,
				contentType: false,
				data: form,
				success: function(){
					
					location.reload();
				}
			})
		});
		
		//강제 호출
		$("#btnnewcover2").click(function(){
			
			$("#newcover2").trigger("click");
		});
		
		//프로필 편집 시 커버 미리보기하기
		$("#newcover2").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showcover").attr("src",e.target.result);
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
		
		//강제 호출
		$("#btnnewphoto").click(function(){
			
			$("#newphoto").trigger("click");
		});
		
		//프로필 사진만 변경
		$("#newphoto").change(function(){
			
			var num=$(this).attr("num");
			
			var form=new FormData();
			form.append("photo",$("#newphoto")[0].files[0]);
			form.append("user_num",num);
			
			$.ajax({
				
				type: "post",
				dataType: "text",
				url: "photoupdate",
				processData: false,
				contentType: false,
				data: form,
				success: function(){
					
					location.reload();
				}
			});
		})
		
		//강제 호출
		$("#btnnewphoto2").click(function(){
			
			$("#newphoto2").trigger("click");
		});
		
		//프로필 편집 시 사진 미리보기하기
		$("#newphoto2").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showphoto").attr("src",e.target.result);
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
		
		//프로필 편집 미리보기 후 수정
		$("#btnupdate").click(function(){
					
					var num=$(this).attr("num");
					var addr=$("#member_addr").val()+","+$("#member_addr2").val();
					var email=$("#uemail").val();
					var hp=$("#uhp1").val()+"-"+$("#uhp2").val()+"-"+$("#uhp3").val();
					var data="user_num="+num+"&user_addr="+addr+"&user_email="+email+"&user_hp="+hp;
					
					var form=new FormData();
					
					form.append("photo",$("#newphoto2")[0].files[0]);
					form.append("cover",$("#newcover2")[0].files[0]);
					form.append("user_num",num);
					
					$.ajax({
						
						type: "post",
						dataType: "text",
						url: "photoupdate",
						processData: false,
						contentType: false,
						data: form,
						success: function(){
							
							location.reload();
						}
					});
					
					$.ajax({
						
						type: "post",
						dataType: "text",
						url: "coverupdate",
						processData: false,
						contentType: false,
						data: form,
						success: function(){
							
							location.reload();
						}
					});
					
					$.ajax({
						
						type: "post",
						dataType: "text",
						url: "updateinfo",
						data: data,
						success: function(){
							
							location.reload();
						}
						
					});
				})
				
		//강제 호출
		$("#btnmodcontentphoto").click(function(){
			
			$("#update_file").trigger("click");
		});
		
		//게시물 수정 시 사진 미리보기
		$("#update_file").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showmodimg").attr("src",e.target.result);
			   $("#showtext").hide();
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
		
		//강제 호출
		$("#btncontentphoto").click(function(){
			
			$("#contentphoto").trigger("click");
		});
		
		//게시글 작성 시 사진 미리보기하기
		$("#contentphoto").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showimg").attr("src",e.target.result);
			   $("#showtext").hide();
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
		
		//게시글,방명록 작성(다중 업로드)
		$("#btnwrite").click(function() {

			var owner_num=$(this).attr("num");
			var write_num="${loginnum}";
			var guest_content= $("#post_content").val();
			var guest_file= $("#contentphoto")[0].files;
			var guest_access= $("#post_access").val();
			var post_access = $("#post_access").val();
			var post_content = $("#post_content").val();
			var files = $("#contentphoto")[0].files;
			
			var form = new FormData();
			
		    for (var i = 0; i < files.length; i++) {
		        form.append("photo", files[i]);
		    }
		    
		    if(write_num==owner_num){
		    	
				form.append("post_access", post_access);
				form.append("post_content", post_content);
				form.append("user_num",owner_num);

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
		    }
		    
		    else{
		    	
		    	form.append("guest_content",guest_content);
		    	form.append("write_num",write_num);
		    	form.append("owner_num",owner_num);
		    	
		    	$.ajax({
		    		
		    		type: "post",
		    		dataType: "text",
		    		processData: false,
		    		contentType: false,
		    		data: form,
		    		url: "insertguestbook",
		    		success: function() {
		    			
		    			location.reload();
		    		}
		    	});
		    }
			

		});
		
		//사진 넘기면서 보기
		$(document).ready(function() {
			
		 $('#slider').slick({
			 
			 	prevArrow: '<img src="../image/left.png" id="prev">',
			 	nextArrow: '<img src="../image/right.png" id="next">',
		        autoplay: false,         // 자동 재생 여부
		        autoplaySpeed: 0,    // 자동 재생 속도 (단위: ms)
		        dots: false,             // 점 네비게이션 표시 여부
		        arrows: true,           // 화살표 네비게이션 표시 여부
		        infinite: false,         // 무한 슬라이드 여부
		        slidesToShow: 1,        // 한 화면에 보여줄 슬라이드 수
		        slidesToScroll: 1      // 한 번에 스크롤할 슬라이드 수
	
		    });
		 
		 //마지막,처음 화살표 삭제
		 $('#slider').on('afterChange', function(event, slick, currentSlide){
			    if(currentSlide == 0){
			        $('#prev').hide();
			    } else {
			        $('#prev').show();
			    }
			    if(currentSlide == slick.slideCount - 1){
			        $('#next').hide();
			    } else {
			        $('#next').show();
			    }
			});
		});
		
		//게시물 수정 값 불러오기
		$(".modpost").click(function(){
			
			updatenum=$(this).attr("post_num");

			$.ajax({
				type : "get",
				dataType : "json",
				url : "updateform",
				data : {"post_num" : updatenum},		
				success : function(res) {
					$("#update_access").val(res.post_access);
					$("#update_content").val(res.post_content);
					$("#showmodimg").attr("src","/post_file/"+res.post_file);
				}
			})
		})
		
		//게시물 수정		
		$("#btnupdate2").click(function(){
			
			var update_access=$("#update_access").val();
			var update_content=$("#update_content").val();
			
			var form = new FormData();

			var files=$("#update_file")[0].files;
			
			for (var i = 0; i < files.length; i++) {
		        form.append("photo", files[i]);
		    }
			form.append("post_num",updatenum);
			form.append("post_access",update_access);
			form.append("post_content",update_content);
			
			$.ajax({
				type: "post",
				dataType: "text",
				url: "updatepost",
				processData: false,
				contentType: false,
				data: form,
				success: function(){
					location.reload();
				}
			});
			
		})
		
		//게시물 삭제
		$(".delpost").click(function(){
			
			var post_num=$(this).attr("post_num");
			$.ajax({
				
				type: "get",
				dataType: "text",
				data: {"post_num":post_num},
				url: "deletepost",
				success: function(){
					
					location.reload();
				}
			});
		})
		
		//좋아요
		$(".img_like").click(function(){
			
			var post_num = $(this).attr("post_num");
			var user_num = "${loginnum}";
			
			$.ajax({
				type : "get",
				dataType : "text",
				url : "likeinsert",
				data : {"post_num" : post_num,"user_num" : user_num},
				success : function() {
					location.reload();
					
				}
			})
		})
		
		//좋아요 취소
		$(".img_dlike").click(function(){
			
			var post_num = $(this).attr("post_num");
			var user_num = "${loginnum}";
			
			$.ajax({
				type : "get",
				dataType : "text",
				url : "likedelete",
				data : {"post_num" : post_num,"user_num" : user_num},
				success : function() {
					location.reload();

						}
					})
				})
				
		//팔로우 하기
		$("#btnfollow").click(function(){
			
			var from_user=$(this).attr("from_user");
			var to_user=$(this).attr("to_user");
			
			$.ajax({
				
				type: "get",
				dataType: "text",
				url: "insertfollowing",
				data:{"from_user":from_user,"to_user":to_user},
				success: function(){
					
					location.reload();
				}
			});
		})
		
		//팔로우 취소
		$("#btnunfollow").click(function(){
			
			var to_user=$(this).attr("to_user");
			
			$.ajax({
				
				type: "get",
				dataType: "text",
				url: "unfollowing",
				data: {"to_user":to_user},
				success: function(){
					
					location.reload();
				}
			});
		})
		
		//이미지 박스 hide&show
		$("#btncontentphoto").click(function(){
			
			$("#showimg").show();
			$("#showtext").show();
		})

	})
</script>

<style type="text/css">

	html{
		background-color: #F0F2F5;
	}

	.cover{
			width: 100%;
			height: 300px;
			border-radius: 10px 10px;
		}
		
		.profile{
			width: 100%;
			height: 120px;
			background-color: white;
		}
		
		.menu{
			width: 100%;
			height: 50px;
			background-color: white;
			
		}
		
		.menu a {
  			margin: 0 10px;
		}

		.mypage-main{
			margin: 0 auto;
		}
		
		.intro{
			width: 98%;
			height: 250px;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;	
		}
		
		.intro-info{
			line-height: 45px;
			margin-left: 1%;
		}
		
		.galary{
			width: 98%;
			height: 550px;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;		
		}
		
		.friend{
			width: 98%;
			height: 680px;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;
		
		}
		
		 .write{
			width:99%;
			height: 100px;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;
		}
		
		.content{
			width:99%;
			height: 100%;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;
		}
		
		.left{
			width: 31%;
			float: left;
			
		}
		
		.right{
			width:69%;
			float: right;
		}
		
		#btnnewcover{
			cursor: pointer;
			color: white;
			background-color: black;
			padding: 6px 16px;
			border-radius: 5px;
			position: relative;
			left: 85%;
			bottom:20%;
		}
		
		.btnprofile{
			position: relative;
    		bottom: 30%;
    		left: 65%;
    		font-weight: bold;
    		padding: 10px;
    		background-color: #F0F2F5;
    		padding: 8px;
		}
		
		#btnupdate{
			width:570px;
			background-color: lightblue;
			color: blue;
			font-weight: 700;
		}
		
		#btnwrite{
			width: 570px;
			background-color:#3578E5;
			color: white;
			font-weight: 700;
		}
		
		.top-user{
			display: flex; 
			align-items: center;		 
		}
		
		.top-writeday{
			display: flex;
			flex-direction: column;
		}
		
		.center-up{
			margin-left: 10px;
		}
		
		.bottom{
			margin: 2%;
		}
		
		.galary-photo{
			width: 160px;
			height: 160px;
			border-radius: 10px;
			border: 1px solid gray;
			margin: 1% 1% 0.25% 1%;
		}
		
		.galary-photoall{
			display: flex;
			flex-wrap: wrap;
		}
		
		.bottom-up{
			display: flex; 			
		}
		
		.like{
			width: 50%;
		}
		
		.comment{
			width: 50%;
		}
		
		.friend-photoall{
			display: flex;
			flex-wrap: wrap;
		}
		
		.friend-photo{
			width: 160px;
			height: 160px;
			border-radius: 10px;
			border: 1px solid gray;
		}

		#prev{
			top: 300px;
   			position: relative;
    		z-index: 1;
    		border: none;
    		width: 100px; 
    		height: 100px;
    		cursor: pointer;
		}
		
		#next{	
			float: right;
			bottom: 300px;
   			position: relative;
   			border: none;
   			width: 100px; 
    		height: 100px;
    		cursor: pointer;

		}
		
		.btnfollow{
			color: white;
			background-color: #3578E5;
			border: none;
			border-radius: 5px;
			font-weight: bold;
			padding: 8px;
			position: relative;
			bottom: 30%;
			left: 80%;
		}
		
		.btnunfollow{
			color: white;
			background-color: #3578E5;
			border: none;
			border-radius: 5px;
			font-weight: bold;
			padding: 8px;
			position: relative;
			bottom: 30%;
			left: 80%;
		}
		
		.btnmessage{
			color: black;
			border: none;
			border-radius: 5px;
			font-weight: bold;
			padding: 8px;
			background-color: #F0F2F5;
			position: relative;
			bottom: 30%;
			left: 81%;
		}
		
		.hp{
			display: flex;
			align-items: center;
			width: 250px;
			margin-bottom: 2%;
		}
		
		.email{
			width: 250px;
		}
		
		textarea::placeholder {
 			 font-size: 1.2em;
		}
		
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	
	<!-- 프로필 수정 -->
		<div class="container">
		  <!-- Modal -->
		  <div class="modal fade" id="infoupdate" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="font-weight: 600; text-align: center;">프로필 수정</h4>
		        </div>
		        
		        <div class="modal-body">
		          <div class="title-photo">
		          	<span style="font-weight: 700; margin-right: 450px; font-size: 12pt;">프로필 사진</span> 
		          	<span style="color:lightblue; cursor: pointer;"><a id="btnnewphoto2" >수정</a></span>
		          	<input type="file" id="newphoto2" name="newphoto2" style="display: none;">
		
		          	<div class="modal-photo">
		          		<c:if test="${sessionScope.loginok!=null &&  dto.user_photo!=null}">
		          			<img src="${root }/photo/${dto.user_photo}" id="showphoto" style="width: 180px; height: 180px; border-radius: 90px; margin: 3% 34%;
		          			border:3px solid gray;">
		          		</c:if>
		          		
		          		<c:if test="${sessionScope.loginok!=null &&  dto.user_photo==null}" >
		          			<img src="${root }/image/profile.png" id="showphoto"  style="width: 180px; height: 180px; border-radius: 90px; margin: 3% 34%;">
		          		</c:if>
		          		
		          	</div>
		          </div>
		          
		          <div class="title-cover">
		          	<span style="font-weight: 700; margin-right: 465px; font-size: 12pt;">커버 사진</span> 
		          	<span style="color:lightblue; cursor: pointer;"><a id="btnnewcover2">수정</a></span>
		          	<input type="file" id="newcover2" name="newcover2" style="display: none;">
		          	
		          	<div class="modal-cover">
		          		<c:if test="${sessionScope.loginok!=null &&  dto.user_cover!=null}">
		          			<img src="${root }/cover/${dto.user_cover}" id="showcover" style="width: 400px; height: 150px; border-radius: 10px; margin: 3% 16%;">
		          		</c:if>
		          		
		          		<c:if test="${sessionScope.loginok!=null &&  dto.user_cover==null}" >
		          			<img src="${root }/image/cover.png" id="showcover" style="width: 400px; height: 150px; border-radius: 10px; margin: 3% 16%;">
		          		</c:if>
		          	</div>
		          </div>
		          
		          
		          	<span style="font-weight: 700; font-size: 12pt;">회원님을 소개할 항목을 구성해주세요</span>
		          	
			          	<div class="modal-intro" style="margin-top: 2%;">
							<span><b>주소</b></span>
								<div class="addr">
									<input id="member_addr" style="width: 250px; margin-bottom: 1%;" name="addr1"  type="text" placeholder="주소" readonly required="required"
										 value="${dto.user_addr.split(',')[0]}">&nbsp;&nbsp;
									<button type="button" onclick="findAddr()" style="border: none; border-radius: 5px; width: 55px; padding: 4px; font-weight: bold;">검색</button><br>
									
										
										<input type="text" id="member_addr2" name="addr2" style="width: 250px; margin-bottom: 2%;" placeholder="상세주소" value="${dto.user_addr.split(',')[1]}">
								</div>
								
								<span><b>전화번호</b></span>
								<div class="hp">
									 <select class="form-control" id="uhp1" name="uhp1" size="1">
										<option value="010" class="hp1">010</option>
										<option value="011" class="hp2">011</option>
										<option value="016" class="hp3">016</option>
										<option value="070" class="hp4">070</option>
									</select>&nbsp;-&nbsp;
							
									 <input type="text" id="uhp2" class="form-control" value="${dto.user_hp.split('-')[1]}">&nbsp;-&nbsp;
									 <input type="text" id="uhp3" class="form-control"  value="${dto.user_hp.split('-')[2]}"><br>
								 </div>
								 
								 <span><b>이메일</b></span>
								 <div class="email">					 
									 <input type="text" id="uemail" class="form-control" value="${dto.user_email }">
								 </div>
			          	</div>
		          
		        </div>
		        
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate"  num="${dto.user_num }">정보 수정</button>
		        </div>
		      </div>  
		    </div>
		  </div>
		</div>

<!-- 게시글 수정 -->
	<div class="modal fade" id="updatepost" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="font-weight: 700; text-align: center;">게시물 수정</h4>
				</div>

				<div class="modal-body">
				<div style="margin-bottom: 2%; display: flex; align-items: center;">
					<img alt="" src="${root }/photo/${dto.user_photo}" style="width: 40px; height: 40px; border-radius: 20px;">
					<div style="margin-left: 2%;">
		          	<span style="font-size: 11pt;"><b>${dto.user_name }</b></span><br>
		          	
						<select class="form-control" name="update_access"
							id="update_access" required="required" >
							<option value="all">전체공개</option>
							<option value="follower">팔로워 공개</option>
							<option value="onlyme">나만보기</option>
						</select>
						</div>
						</div>
					<textarea id="update_content" placeholder="무슨 생각을 하고 계신가요?" style="width: 100%; height:100%; border: none; outline: none;  resize: none;"></textarea>
								
						<img src="" id="showmodimg" style="width: 500px; height: 150px; border: 1px solid gray; border-radius: 10px;"><br>
					
					<input type="file" name="update_file" class="form-control" required="required" multiple="multiple" id="update_file" style="display: none;">
					
					<button type="button" id="btnmodcontentphoto">사진 선택</button>				
				</div>
				
				<div class="modal-footer" style="text-align: center;">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate2" style="background-color: #3578E5; width: 30%; color: white;">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 30%;">Close</button>
				</div>
			</div>
		</div>
	</div>

<!-- 게시글 작성 -->
	<div class="container">
		  <!-- Modal -->
		  <div class="modal fade" id="contentwrite" role="dialog" >
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		      
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="font-weight: 700; text-align: center;">게시물 만들기</h4>
		        </div>
		        
		        <div class="modal-body">
			        <c:if test="${sessionScope.user_num==dto.user_num }">
				        <div style="margin-bottom: 2%; display: flex; align-items: center;">
				        	
				          		<img src="${root }/photo/${dto.user_photo}" style="width: 40px; height: 40px; border-radius: 20px;">
				        	
				         <div style="margin-left: 2%;">
				          <span style="font-size: 11pt;"><b>${dto.user_name }</b></span><br>
				          
					          <select class="form-control" name="post_access" id="post_access" style="background-color: #F0F2F5;">
								<option value="all">전체공개</option>
								<option value="follower">팔로워 공개</option>
								<option value="onlyme">나만보기</option>
							 </select>
		
						</div>
						</div>
					</c:if>
					
					<c:if test="${sessionScope.user_num!=dto.user_num }">
				        <div style="margin-bottom: 2%; display: flex; align-items: center;">
				        	
				          		<img src="${root }/photo/${sessionScope.user_photo}" style="width: 40px; height: 40px; border-radius: 20px;">
				        	
				         <div style="margin-left: 2%;">
				          <span style="font-size: 11pt;"><b>${dto.user_name }</b></span><br>
				          
					      <span style="border-radius: 5px; padding: 4px; background-color: #F0F2F5;"><b><i class="fa-solid fa-user-group"></i>팔로워 공개</b></span>
		
						</div>
						</div>
					</c:if>
				
				  <div style="height: 150px;">
		          	<textarea id="post_content" placeholder="무슨 생각을 하고 계신가요?" style="width: 100%; height:100%; border: none; outline: none;  resize: none;"></textarea>
		          </div>
				  <div class="show" id="show" style="position: relative;">
				  	<img id="showimg" style="display:none; width: 500px; height: 150px; border: 1px solid gray; border-radius: 10px;"><br>
				  	<p id="showtext" style="display:none; position: absolute; top: 65px; left: 190px; font-weight: bold;">사진/동영상 추가</p>
				  </div>
				  
				  <input type="file" multiple="multiple" id="contentphoto" name="contentphoto" style="display: none;">
				  <button type="button" id="btncontentphoto"style="margin-top: 1%;">사진 선택</button>

		        </div>
		        
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnwrite" num="${dto.user_num }">게시</button>
		        </div>
		        
		      </div>
		      
		    </div>
		  </div>
		  
		</div>
		
		<div class="mypage" >
		
			<div class="cover">	
			
				<c:if test="${sessionScope.loginok!=null && dto.user_cover!=null }">
					<img src="${root }/cover/${dto.user_cover }"style="width: 100%; height: 100%; ">
				</c:if>
				
				<c:if test="${sessionScope.loginok!=null && dto.user_cover==null }">
					<img src="${root }/image/cover.png"style="width: 100%; height: 100%;">
				</c:if>
				
						<input type="file" id="newcover" style="display: none;" num="${dto.user_num }">
						
						<!-- 수정 시 호출 -->
						<c:if test="${sessionScope.user_num==dto.user_num }">
							<button type="button" id="btnnewcover" >
								<i class="fa-solid fa-camera fa-xl - 1.5em - 24px"></i>&nbsp;&nbsp;커버 사진 추가
							</button>
						</c:if>
			</div>
			
			<div class="profile">                         
				<div class="dropdown" style="width: 0%; height: 100%; position: relative; left: 10%;">
				
					<input type="file" id="newphoto" style="display: none;" num="${dto.user_num }">
								
						    <ul class="dropdown-menu">
						      <li><a href="${root }/photo/${sessionScope.user_photo}">프로필 사진 보기</a></li>
						      <c:if test="${sessionScope.user_num==dto.user_num }">  
						      	<li><a href="#" id="btnnewphoto">프로필 사진 업데이트</a></li>
						       </c:if>
						    </ul>			    
					     
						<c:if test="${sessionScope.loginok!=null && dto.user_photo!=null }">
					    <img data-toggle="dropdown" alt="" src="${root }/photo/${dto.user_photo}" 
					    style="width: 180px; height: 180px; border:3px solid gray; cursor: pointer; border-radius: 90px; position: relative; bottom: 62%;">
					    </c:if>
					    
					    <c:if test="${sessionScope.loginok!=null && dto.user_photo==null }">
					    <img data-toggle="dropdown" alt="" src="${root }/image/profile.png" 
					    style="width: 180px; height: 180px; cursor: pointer; border-radius: 90px; position: relative; bottom: 62%;">
					    </c:if>
					     
					   <img alt="" src="${root }/image/camera.png" style="width: 50px; height: 50px; cursor: pointer;
					   position: relative; bottom:100%;">
					   
				</div>
					   <c:if test="${sessionScope.user_num!=dto.user_num && checkfollowing !=1 }">
					   	<button type="button" class="btnfollow" id="btnfollow" from_user="${sessionScope.user_num }" to_user="${dto.user_num }">
					   	<i class="fa-solid fa-user-group"></i>&nbsp;팔로우 추가</button>
					  </c:if>
					  
					  <c:if test="${sessionScope.user_num!=dto.user_num && checkfollowing ==1 }">
					   	<button type="button" class="btnunfollow" id="btnunfollow" to_user="${dto.user_num }">
					   	<i class="fa-solid fa-user-group"></i>&nbsp;팔로우 취소</button>
					  </c:if>
					  
					  <button type="button" class="btnmessage"><i class="fa-solid fa-comment"></i>&nbsp;메시지 보내기</button>
					  
					  <span style="font-size: 22pt; font-weight: bold; position: relative; bottom: 70%; left: 14%;">${dto.user_name }</span>
					  <span style="font-size: 13pt; font-weight: bold; color:#65676b;">친구 ${tf_count}명</span>
					  
				<c:if test="${sessionScope.user_num==dto.user_num }">
					<button type="button" class="btnprofile" data-toggle="modal" data-target="#infoupdate" style="border-radius: 5px; border: none;">
						<i class="fa-solid fa-pencil fa-xl - 1.5em - 24px"></i>&nbsp;&nbsp;프로필 편집
					</button>
				</c:if>
			</div>
			
			<div class="menu">
			<hr style="border: 1px solid lightgray; margin:0px;">
				<div style="font-weight: bold; font-size: 15pt;">
					<a href="/user/mypage?user_num=${dto.user_num }" style="color: black;"><span>게시글</span></a>
					<a href="/user/info" style="color: black;"><span>정보</span></a>
					<a href="${root }/following/followlist?from_user=${sessionScope.user_num}" style="color: black;"><span>친구</span></a>
				</div>
			</div>
			
			<div class="mypage-main">
				<div class="left">
					<div class="intro">
						<span><b style="font-size: 16pt;">소개</b></span>
						<div class="intro-info">
							<span>&nbsp;<i class="fa-solid fa-house fa-2x - 2em"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.user_addr.replaceAll(',', ' ') }</b>&nbsp;&nbsp;</span><br>
							<span>&nbsp;&nbsp;<i class="fa-solid fa-location-dot  fa-2x - 2em"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.user_addr.substring(0, 2)}</b>&nbsp;&nbsp;출신</span><br>
							<span><i class="fa-solid fa-wifi fa-2x - 2em"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>${followercount }</b>&nbsp;&nbsp;명이 팔로우함</span><br>
							<span>&nbsp;<i class="fa-solid fa-envelope fa-2x - 2em"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.user_email }</b>&nbsp;&nbsp;</span><br>
							<span>&nbsp;&nbsp;<i class="fa-solid fa-mobile-screen-button fa-2x - 2em"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.user_hp}</b>&nbsp;&nbsp;</span>
						</div>
					</div>
					
					<div class="galary">
						<b style="font-size: 16pt;">사진</b>
							<div class="galary-photoall">
								<c:forEach var="pdto" items="${postlist }" varStatus="i">
									<c:if test="${i.count <= 9 && pdto.post_file!='no'}">
										<c:forTokens items="${pdto.post_file }" delims="," var="file">
											<img  class="galary-photo" src="${root }/post_file/${file }">
										</c:forTokens>
									</c:if>
								</c:forEach>
							</div>
					</div>
					
					<div class="friend">
						<b style="font-size: 16pt;">친구</b><br>
						<span style="font-size: 12pt;">친구</span> <b>${followcount }</b>명
							<div class="friend-photoall">
								<c:forEach var="fdto" items="${tflist }" varStatus="i">
									<div style="margin: 1% 1% 0.25% 1%;">
										<div>							
											<c:if test="${ fdto.user_photo!=null }">
												<img  class="friend-photo" src="${root }/photo/${fdto.user_photo}">
											</c:if>
											<c:if test="${fdto.user_photo==null }">
												<img  class="friend-photo" src="${root }/image/noprofile.png">
											</c:if>
											<div>
												<span><b>${fdto.user_name }</b></span><br>
												<c:if test="${fdto.tf_count>0 }">
													<span>함께 아는 친구 ${fdto.tf_count }명</span>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
					</div>
				</div>
				
				<div class="right">
					<div class="write">
						<div class = "searcharea">
							<div style = "width: 700px; display: inline-flex; align-items: center; margin: 3%;">
							<c:if test="${sessionScope.user_num!=dto.user_num }">  
								<img alt="" src="${root }/photo/${sessionScope.user_photo}" style="width: 40px; height: 40px; border-radius: 20px;">
								&nbsp;&nbsp;&nbsp;
							</c:if>
							
							<c:if test="${sessionScope.user_num==dto.user_num }">  
								<img alt="" src="${root }/photo/${dto.user_photo}" style="width: 40px; height: 40px; border-radius: 20px;">
								&nbsp;&nbsp;&nbsp;
							</c:if>
							
							<c:if test="${sessionScope.user_num==dto.user_num }">  
								<div style="background-color: #F0F2F5; border-radius: 60px; padding-left: 2%">
									<input type = "button" data-toggle="modal" data-target="#contentwrite" name = "contentwirte" 
									style = "width:700px; border: none; text-align:left; background: none; outline: none; font-size: 15pt; padding: 10px;" value="무슨 생각을 하고 계신가요?">
								</div>
							</c:if>
							
							<c:if test="${sessionScope.user_num!=dto.user_num }">
								<div style="background-color: #F0F2F5; border-radius: 60px; padding-left: 2%">
									<input type = "button" data-toggle="modal" data-target="#contentwrite" name = "contentwirte" 
									style = "width:700px; border: none; text-align:left; background: none; outline: none; font-size: 15pt; padding: 10px;" value="${dto.user_name } 님에게 글을 남겨보세요...">
								</div>
							</c:if>
							
							</div>	
						</div> 
					</div>
					
					<c:forEach var="adto" items="${alllist }">
						<div class="content">
								<div class="divmain">
									<div class="top">
										<div class="top-user">
											<c:if test="${adto.type=='post' }">
												<img alt="" src="${root }/photo/${dto.user_photo}" style="width:40px; height: 40px; border-radius: 20px; margin: 10px;">
											</c:if>
											
											<c:if test="${adto.type=='guest' }">
												<img alt="" src="${root }/photo/${adto.dto.user_photo}" style="width:40px; height: 40px; border-radius: 20px; margin: 10px;">
											</c:if>
												<div class="top-writeday">
													<span><b>${dto.user_name }
													<c:if test="${adto.post_access =='follower'}">
														<i class="fa-solid fa-user-group"></i>
													</c:if>
													
													<c:if test="${adto.post_access =='all'}">
														<i class="fa-solid fa-earth-americas"></i>
													</c:if>
													
													<c:if test="${adto.post_access =='onlyme'}">
														<i class="fa-solid fa-lock"></i>
													</c:if>
													</b></span>
													<span>${adto.post_time }</span>		
												</div>
												<c:if test="${sessionScope.user_num==dto.user_num }">
													<div class="dropdown" style="margin-left: 70%;">
														<i class="fa-solid fa-ellipsis fa-2x - 2em" data-toggle="dropdown" style=" cursor: pointer;"></i>
														<ul class="dropdown-menu dropdown-menu-right">
													      <li><a href="#" class="delpost" post_num=${adto.post_num }>게시글 삭제</a></li>
													      <li><a href="#" class="modpost" id="updatepost" data-toggle="modal" data-target="#updatepost" post_num=${adto.post_num }>게시글 수정</a></li>
													    </ul>
													</div>
												</c:if>
										</div>
									</div>
									
									<div class="center">
										<div class="center-up">${adto.post_content }</div>
											<c:if test="${adto.post_file!='no' }">
												<div class="center-down" id="slider" >
													<c:forTokens items="${adto.post_file }" delims="," var="file">
														<img src="/post_file/${file }" style="width: 100%;height: 500px;">
													</c:forTokens>
												</div>
											</c:if>
									</div>	

									<div class="bottom">
									<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
									
										<div class="bottom-up">
											<div class="like">
												<c:if test="${adto.likecheck ==0 }">
													<span><i class=" img_like fa-regular fa-thumbs-up fa-2x - 2em" user_num="${dto.user_num }" post_num=${adto.post_num }
													style="cursor: pointer;"></i>&nbsp;&nbsp;좋아요&nbsp;${adto.like_count}명</span>
												</c:if>
												
												<c:if test="${adto.likecheck !=0 }">
													<span><i class="img_dlike fa-solid fa-thumbs-up fa-2x - 2em" style="color: #3578E5; cursor: pointer;" user_num="${dto.user_num }" post_num=${adto.post_num }
													></i>&nbsp;&nbsp;좋아요&nbsp;${adto.like_count}명</span>
												</c:if>
											</div>
											<div class="comment">
												<span><i class="fa-regular fa-comment fa-2x - 2em" id="img_comment"></i>&nbsp;&nbsp;댓글달기</span>
											</div>
										</div>
										
										<div class="bottom-down">
											<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
												<div class="searcharea">
														<div style="width: 700px; display: inline-flex; align-items: center;">
															<div>
																<img alt="" src="${root }/photo/${dto.user_photo}" style="width:40px; height: 40px; border-radius: 20px; margin: 10px;">
															</div>
															<div style="background-color: #F0F2F5; border-radius: 60px; display: inline-flex; align-items: center; padding-left: 2%"> 
																	<input type="text" name="commentwrite" style="width: 700px; border: none; background: none; outline: none; font-size: 15pt; padding: 10px;"
																	placeholder="댓글을 입력하세요...">
																	<img alt="" src="${root }/image/submit.png" style="width: 30px; height: 30px; margin-right: 3%;">
															</div>
														</div>
												</div>
										</div>
									</div>
									
								</div>
							</div>
					</c:forEach>
				</div>
			</div>
			
		</div>

</body>
</html>