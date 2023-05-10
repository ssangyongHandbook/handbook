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
<style type="text/css">

.modal-content{
overflow-y: initial !important
}
.modal-body{
height: 900px;
overflow-y: auto;
}

.comment{
	width: 650px;	
	border: 1px solid gray;
	border-radius: 40px;
	background-color: #EEEEEE;
	padding-left: 85px;
}

/* 사용자 프로필  */
.profile{
	width: 80px;
	margin-left: -85px;
	border: 1px solid gray;
	border-radius: 100px;
	margin-right: 20px;
	
}

/* 좋아요,댓글,날짜 */
.cmlike{
	width: 650px;
	display: flex;
	justify-content: space-between;
	align-content: center;
}

/* 사용자 이름  */
b{
	font-size: 2em;
}

/* 사용자 댓글  */
span{
	font-size: 1.4em;
	
}

#commentaddform{

	margin-top: 10px;	
	height: 60px;
	display: flex;
	justify-content: space-between;
	align-content: center;
	
}

#commentprofile{
	width: 60px;
	border: 1px solid gray;
	border-radius: 100px;
	
}

#commentinput{
	width: 700px;
	border: 1px solid gray;
	border-radius: 40px;
	background-color: #EEEEEE;
}

.recontent{
	cursor: pointer;
	
}
</style>
</head>
<script type="text/javascript">

	$(function(){
		offset=${offset};
		
		$('#commentinput').keydown(function() {
			  if (event.keyCode === 13) {
			    $("#insertbtn").trigger("click");
			  };	
			});
		
		
		
		
		$("#insertbtn").click(function(){
			
			var formdata=$("#form").serialize();
			//alert(formdata);
			$.ajax({
				
				type:"post",
				dataType:"text",
				url:"cinsert",
				data:formdata,
				success:function(){
					$("#commentsection").empty();
					$("#addcomment").hide();
					$("#commentinput").val("");
					$.ajax({
			    		 type:"get",
			    		 dataType:"json",
			    		 url:"scroll",
			    		 data:{"offset":offset,"post_num":"9"},
			    		 success:function(res){
			    			 
			    			 $.each(res,function(i,item){
			    				 var s="";
		    		             	var addContent = document.createElement("div");
		    		                s += "<div class='allcomment' style='margin-left:"+item.comment_level*50+"px;'>";
		    		                if(item.comment_level>0){
		    		                	s += "<div style='position: relative; left: -50px; top: 40px; height: 0;' >";
										s += "<img src='../image/re.png' style='width: 30px;\'>";
					    				s += "</div>";
		    		                }
		    		                s += "<div class='comment'>";
		    		                s += "<img src='/photo/"+item.user_photo+"' class='profile'>";
		    		                s += "<b class='name'>"+item.user_name+"</b><br>";
		    		                s += "<span class='content'>"+item.comment_content+"</span></div>";
		    		                s += "<div class='cmlike'><span class='glyphicon glyphicon-heart'>좋아요</span>";
		    		                s += "<span class='recontent' id='comment"+item.comment_num+"' comment_num='"+item.comment_num+"'>답글달기</span>";
		    		                s += "<span class='comment_writeday'>"+item.perTime+"</span></div></div>";
		    		                console.log(s);
		    		                addContent.innerHTML=s;
		    		                document.querySelector('section').appendChild(addContent);
		    		               
		    		                var brcontent = document.createElement("div");
		    		                brcontent.innerHTML = "<br>";
		    		                document.querySelector('section').appendChild(brcontent);
			    				 
			    			 })
			    			 $("#addcomment").show();
			    		 }
			    	  });
				}
			})
		});
		
		

		$(document).on("click","#addcomment",function(){
			offset=offset+8;
	    	  $.ajax({
	    		 type:"get",
	    		 dataType:"json",
	    		 url:"scroll",
	    		 data:{"offset":offset,"post_num":"9"},
	    		 success:function(res){
	    			 
	    			 $.each(res,function(i,item){
	    				 
	    				 setTimeout(function(){
	    		        		var s="";
	    		             	var addContent = document.createElement("div");
	    		                s += "<div class='allcomment' style='margin-left:"+item.comment_level*50+"px;'>";
	    		                if(item.comment_level>0){
	    		                	s += "<div style='position: relative; left: -50px; top: 40px; height: 0;' >";
									s += "<img src='../image/re.png' style='width: 30px;\'>";
				    				s += "</div>";
	    		                }
	    		                s += "<div class='comment'>";
	    		                s += "<img src='/photo/"+item.user_photo+"' class='profile'>";
	    		                s += "<b class='name'>"+item.user_name+"</b><br>";
	    		                s += "<span class='content'>"+item.comment_content+"</span></div>";
	    		                s += "<div class='cmlike'><span class='glyphicon glyphicon-heart'>좋아요</span>";
	    		                s += "<span class='recontent' id='comment"+item.comment_num+"' comment_num='"+item.comment_num+"'>답글달기</span>";
	    		                s += "<span class='comment_writeday'>"+item.perTime+"</span></div></div>";
	    		                console.log(s);
	    		                addContent.innerHTML=s;
	    		                document.querySelector('section').appendChild(addContent);
	    		               
	    		                var brcontent = document.createElement("div");
	    		                brcontent.innerHTML = "<br>";
	    		                document.querySelector('section').appendChild(brcontent);
	    		                
	    		                
	    		                
	    		              	
	    		              }, 1000)  
	    			 })
	    		 }
	    	  });
		})
		
		
		$(".recontent").click(function(){
			
			comment_num=$(this).attr("comment_num");
			//alert(comment_num);
			$("#comment"+comment_num).toggle();
		})
		
		
		/* 스크롤 이벤트 */
		window.onscroll = function(e) {
		      console.log(window.innerHeight , window.scrollY,document.body.offsetHeight,document.body.scrollHeight)
		      if((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
		    	  
		    	  
		    	  offset=offset+4;
		    	  $.ajax({
		    		 type:"get",
		    		 dataType:"json",
		    		 url:"scroll",
		    		 data:{"offset":offset,"post_num":"9"},
		    		 success:function(res){
		    			 
		    			 $.each(res,function(i,item){
		    				 
		    				 setTimeout(function(){
		    		        		
		    		             	var addContent = document.createElement("div");
		    		                addContent.classList.add("comment");
		    		                addContent.innerHTML = "<p>회원번호:"+item.user_num+"  댓글: "+item.comment_content+"</p>";
		    		                document.querySelector('section').appendChild(addContent);

		    		              }, 1000)  
		    			 })
		    		 }
		    	  });
		    	  
		       
		      }
		    }
		
	})
</script>
<body>

	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#commentmodal">Open Modal</button>
	
	<!-- Modal -->
	<div id="commentmodal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${dto.user_name }의 게시물</h4>
	      </div>
	      <div class="modal-body" style="max-height: 800px;">
	      <!-- 타임라인 -->
	     <br>
	     <hr>
	      	<section id="commentsection">
				<c:forEach var="dto" items="${list }">
			    	<div class="allcomment" style="margin-left: ${dto.comment_level*50}px;">
			    			<c:if test="${dto.comment_level>0 }">
			    				<div style="position: relative; left: -50px; top: 40px; height: 0;">
									<img src="../image/re.png" style=" width: 30px;">
			    				</div>
			    			</c:if>
			    		<div class="comment">
							<img src="/photo/${dto.user_photo }" class="profile">
							<b>${dto.user_name }</b><br>
							<span>${dto.comment_content }</span>
				    	</div>
				    	<div class="cmlike">
				    		<span class="glyphicon glyphicon-heart">좋아요</span>
				    		<span class="recontent" comment_num="${dto.comment_num }">답글달기</span>
				    		<span class="comment_writeday">${dto.perTime}</span>
				    	</div>
				    		<form method="post" class="form-inline" id="comment${dto.comment_num }" style="display: none;">
								<input type="hidden" name="comment_num" value="75">
								<input type="hidden" name="post_num" value="9">

								<div id="commentaddform">
									<img src="photo/${sessionScope.user_photo }" id="commentprofile">			
									<input hidden="hidden" /> 
									<input type="text" name="comment_content" placeholder="댓글을 입력하세요" id="commentinput">
									<button type="button" id="btn${dto.comment_num}" class="btn btn-info" style="margin-right: 20px;">입력</button>
								</div>
							</form>
			    	</div>
			    	<br>
				</c:forEach>
			</section>
			
			<button type="button" class="btn btn-success" id="addcomment">댓글 더보기</button>
	      </div>
	      <div class="modal-footer" style="height: 80px; padding: 0;">
	      	 <form method="post" class="form-inline" id="form">
				<input type="hidden" name="comment_num" value="75">
				<input type="hidden" name="post_num" value="9">

				
				<div id="commentaddform">
					<img src="photo/${sessionScope.user_photo }" id="commentprofile">			
					<input hidden="hidden" /> 
					<input type="text" name="comment_content" placeholder="댓글을 입력하세요" id="commentinput">
					<button type="button" id="insertbtn" class="btn btn-info" style="margin-right: 20px;">입력</button>
				</div>
			</form>
		</div>
	    </div>
		
	  </div>
	</div>
	
	
	
</body>
</html>