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
	width: 450px;	
	border: 1px solid gray;
	border-radius: 40px;
	background-color: #EEEEEE;
	padding-left: 85px;
}

/* 사용자 프로필  */
.profile{
	width: 60px;
	margin-left: -75px;
	border-radius: 100px;
	margin-right: 20px;
	position: relative;
	top: 10px;
	
}

/* 좋아요,댓글,날짜 */
.cmlike{
	width: 450px;
	margin-top: 10px;
	display: flex;
	justify-content: space-around;
	align-content: center;
}

/* 사용자 이름  */
b{
	font-size: 1.4em;
}

/* 사용자 댓글  */
span{
	font-size: 1.1em;
	
}

#commentaddform{

	margin-top: 7px;	
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

.input{
	width: 700px;
	border: 1px solid gray;
	border-radius: 40px;
	background-color: #EEEEEE;
}

.mominput{
	width: 700px;
	border: 1px solid gray;
	border-radius: 40px;
	background-color: #EEEEEE;
}

.recontent{
	cursor: pointer;
	
}

.nolike{
	cursor: pointer;
}

.yeslike{
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


		$(document).on("keydown",".input",function(){

			  if (event.keyCode === 13) {
			   $(this).next().trigger("click"); 
			  };	
			});
		
		
		$(document).on("click",".cminsert",function(){
						
			var comment_num=$(this).attr("comment_num");
			var comment_content=$("#input"+comment_num).val();
			var post_num=$(this).attr("post_num");
			//alert(comment_num + comment_content + post_num);
			$.ajax({
				
				type:"post",
				dataType:"text",
				url:"cinsert",
				data:{"comment_num":comment_num,"comment_content":comment_content,"post_num":post_num},
				success:function(){
					$("#commentsection").empty();
					$("#addcomment").hide();
					$("#input"+comment_num).val("");
					$("#input"+comment_num).hide();
					offset=0;
					scroll(offset,"9");
			    	$("#addcomment").show();
				}
			})
			
		})
		
		
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
					offset=0;
					scroll(offset,"9");
			    	$("#addcomment").show();
				}
			})
		});
		

		$(document).on("click","#addcomment",function(){
			offset=offset+8;
			scroll(offset,"9");
		})
		

		$(document).on("click",".recontent",function(){

			var comment_num=$(this).attr("comment_num");
			//alert(comment_num);
			$("#comment"+comment_num).toggle();
		})
		
		$(document).on("click","span.nolike",function(){
			
			var comment_num=$(this).attr("comment_num");
			//alert(comment_num);
			$.ajax({
				type:"get",
				dataType:"text",
				url:"likeinsert",
				data:{"comment_num":comment_num},
				success:function(){
					offset=0;
					$("#commentsection").empty();
					$("#addcomment").hide();
					$("#input"+comment_num).val("");
					$("#input"+comment_num).hide();
					scroll(offset,"9");
					$("#addcomment").show();
				}
			});
			
		})
		
		
		$(document).on("click","span.yeslike",function(){
			
			var comment_num=$(this).attr("comment_num");
			//alert(comment_num);
			$.ajax({
				type:"get",
				dataType:"text",
				url:"likedelete",
				data:{"comment_num":comment_num},
				success:function(){
					offset=0;
					$("#commentsection").empty();
					$("#addcomment").hide();
					$("#input"+comment_num).val("");
					$("#input"+comment_num).hide();
					scroll(offset,"9");
					$("#addcomment").show();
				}
			});
			
		})	
	})
	
	
		/* 무한스크롤 함수 */
		function scroll(offset,post_num){
				
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
		    		                	s += "<div style='position: relative; left: -50px; top: 30px; height: 0;' >";
										s += "<img src='../image/re.png' style='width: 30px;\'>";
					    				s += "</div>";
		    		                }
		    		                s += "<div class='comment'>";
		    		                s += "<img src='/photo/"+item.user_photo+"' class='profile'>";
		    		                s += "<b class='name'>"+item.user_name+"</b><br>";
		    		                s += "<span class='content'>"+item.comment_content+"</span></div>";
		    		                s += "<div class='cmlike'>";
		    		             
					    			if(item.like_check==0){
					    				s+='<span class="glyphicon glyphicon-heart-empty nolike" style="color: red;" comment_num="'+item.comment_num+'">'+item.like_count+'</span>';
					    			}else{
					    				s+='<span class="glyphicon glyphicon-heart yeslike" style="color: red;" comment_num="'+item.comment_num+'">'+item.like_count+'</span>';
					    			}
		    		                
		    		                s += "<span class='recontent' comment_num='"+item.comment_num+"'>답글달기</span>";
		    		                s += "<span class='comment_writeday'>"+item.perTime+"</span></div>";
		    		                s += '<form method="post" class="form-inline" id="comment'+item.comment_num+'" style="display: none;">';
									s += '<input type="hidden" name="comment_num" value="75">';
									s += '<input type="hidden" name="post_num" value="9">';
									s += '<div id="commentaddform">';
									s += '<img src="/photo/${sessionScope.user_photo }" id="commentprofile">';			
									s += '<input hidden="hidden" /> ';
									s += '<input type="text" class="input" name="comment_content" placeholder="댓글을 입력하세요" id="input'+item.comment_num+'">';
									s += '<button type="button" class="btn btn-info cminsert" comment_num="'+item.comment_num+'" post_num="9"  style="margin-right: 20px;">답글입력</button>';
									s += '</div>';
									s += '</form></div>';
		    		                console.log(s);
		    		                addContent.innerHTML=s;
		    		                document.querySelector('section').appendChild(addContent);
		    		               
		    		                var brcontent = document.createElement("div");
		    		                brcontent.innerHTML = "<br>";
		    		                document.querySelector('section').appendChild(brcontent);
		    		               
		    			 })
		    		 }
		    	  });
			}	
	
	
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
			    				<div style="position: relative; left: -50px; top: 30px; height: 0;">
									<img src="../image/re.png" style=" width: 30px;">
			    				</div>
			    			</c:if>
			    			<c:if test="${dto.post_user_num.equals(sessionScope.user_num) or dto.user_num.equals(sessionScope.user_num) }">
			    				안녕
			    			</c:if>
			    		<div class="comment">
							<img src="/photo/${dto.user_photo }" class="profile">
							<b>${dto.user_name }</b><br>
							<span class="spancontent">${dto.comment_content }</span>
				    	</div>
				    	<div class="cmlike">
				    		
				    		<c:if test="${dto.like_check==0 }">
				    			<span class="glyphicon glyphicon-heart-empty nolike" style="color: red;" comment_num="${dto.comment_num }">${dto.like_count }</span>
				    		</c:if>
				    		
				    		<c:if test="${dto.like_check!=0 }">
				    			<span class="glyphicon glyphicon-heart yeslike" style="color: red;" comment_num="${dto.comment_num }">${dto.like_count }</span>
				    		</c:if>			    		
				    		<span class="recontent" comment_num="${dto.comment_num }">답글달기</span>
				    		<span class="comment_writeday">${dto.perTime}</span>
				    	</div>
				    		<form method="post" class="form-inline" id="comment${dto.comment_num }" style="display: none;">
								<div id="commentaddform">
									<img src="/photo/${sessionScope.user_photo }" id="commentprofile">			
									<input hidden="hidden" /> 
									<input type="text" class="input" name="comment_content" placeholder="답글을 입력하세요" id="input${dto.comment_num }">
									<button type="button" class="btn btn-info cminsert" comment_num="${dto.comment_num }" post_num="9" style="margin-right: 20px;">답글입력</button>
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
				<input type="hidden" name="comment_num" value="0">
				<input type="hidden" name="post_num" value="9">			
				<div id="commentaddform">
					<img src="/photo/${sessionScope.user_photo }" id="commentprofile">			
					<input hidden="hidden" /> 
					<input type="text" class="mominput" name="comment_content" placeholder="댓글을 입력하세요" id="commentinput">
					<button type="button" id="insertbtn" class="btn btn-info" style="margin-right: 20px;">입력</button>
				</div>
			</form>
		</div>
	    </div>
		
	  </div>
	</div>
	
	
	
</body>
</html>