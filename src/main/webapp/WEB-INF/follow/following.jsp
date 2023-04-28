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
		//히히히힛
		//팔로우하기
		$("#btn1").click(function(){
			
			$.ajax({
				type:"get",
				dataType:"text",
				url:"${root}/following/insertfollowing",
				data:{"from_user":"1","to_user":"2"},
				success:function(){
					
					location.reload();
				}
			})
		});
		
		$("#btn1-1").click(function(){
			
			$.ajax({
				type:"get",
				dataType:"text",
				url:"${root}/following/insertfollowing",
				data:{"from_user":"2","to_user":"1"},
				success:function(){
					
					location.reload();
				}
			})
		});
		
		//팔로우삭제하기
		$("#btn3").click(function(){
			
			$.ajax({
				type:"get",
				dataType:"text",
				url:"${root}/following/deletefollowing",
				data:{"to_user":"2"},
				success:function(){
					
					location.reload();
				}
			})
		})
		
		$("#btn3-1").click(function(){
			
			$.ajax({
				type:"get",
				dataType:"text",
				url:"${root}/following/deletefollowing",
				data:{"to_user":"1"},
				success:function(){
					
					location.reload();
				}
			})
		})		
		
		//상대와 나 팔로우 확인
		$("#btn2").click(function(){
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"${root}/following/followcheck",
				data:{"from_user":"1","to_user":"2"},
				success:function(res){
					
					if(res.fwercheck==0 && res.fingcheck==0)
						alert("둘다 팔로우 안함!!!!");
					else if(res.fwercheck==0 && res.fingcheck==1)
						alert("나만 팔로우함!!!");
					else if(res.fwercheck==1 && res.fingcheck==0)
						alert("상대만 팔로우함!!!");
					else
						alert("맞팔함!!!");
					
				}
			})
		})
	})
</script>

<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	내가 팔로우한 사람의 수:${totalCount}  <br>
	나를 팔로우한 사람의 수:${totalCount2} 
	<button type="button" id="btn1">내가팔로우하기</button>
	<button type="button" id="btn1-1">상대가 나 팔로우하기</button>
	<button type="button" id="btn3">팔로우삭제</button>
	<button type="button" id="btn3-1">상대가 나 팔로우삭제</button>
	<br><br>
	<button type="button" id="btn2">팔로우확인</button>
	
	
	수정할거지롱~~
</body>
</html>