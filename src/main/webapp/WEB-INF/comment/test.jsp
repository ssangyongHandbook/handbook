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
	.comment{
		font-size: 2em;
		background-color: yellow;
		width: 80%;
		height:900px;
	}
</style>
</head>
<script type="text/javascript">

	$(function(){
		offset=${offset};
		
		$("#insertbtn").click(function(){
			
			var formdata=$("#form").serialize();
			//alert(formdata);
			$.ajax({
				
				type:"post",
				dataType:"text",
				url:"cinsert",
				data:formdata,
				success:function(){
					
					location.reload();
				}
			})
		});
		
		
		window.onscroll = function(e) {
		      console.log(window.innerHeight , window.scrollY,document.body.offsetHeight,document.body.scrollHeight)
		      if((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
		    	  
		    	  
		    	  offset=offset+1;
		    	  $.ajax({
		    		 type:"get",
		    		 dataType:"json",
		    		 url:"scroll",
		    		 data:{"offset":offset,"post_num":"12"},
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

	

	<section>
		<c:forEach var="dto" items="${list }">
	    	<div class="comment">
				<p>회원번호: ${dto.user_num} 댓글: ${dto.comment_content } </p>
	    	</div>
		</c:forEach>
    		
	</section>

	<form method="post" class="form-inline" id="form">
		<input type="hidden" name="comment_num" value="${comment_num}">
		<input type="hidden" name="user_num" value="1">
		<input type="hidden" name="post_num" value="12">
   		<input type="hidden" name="comment_group" value="${comment_group}">
   		<input type="hidden" name="comment_step" value="${comment_step}">
   		<input type="hidden" name="comment_level" value="${comment_level}">
		
		<input type="text" name="comment_content" placeholder="댓글을 입력하세요"> &nbsp;&nbsp;&nbsp;
		<button type="button" id="insertbtn" class="btn btn-info">입력</button>
	</form>
	
	
	
</body>
</html>