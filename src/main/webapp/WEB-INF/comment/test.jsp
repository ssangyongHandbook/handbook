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
</head>
<script type="text/javascript">

	$(function(){
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
		
	})
</script>
<body>
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