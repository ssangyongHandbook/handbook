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
<body>
<div style="width:800px;height:800px; background-color:green; text-align: center; margin: auto;">
<form action="insert" method="post" enctype="multipart/form-data">
	<table class="table-table-bordered" style="margin:100px;100px; width:500px;margin: auto;">
		<caption><b>게시글</b></caption>	
		<tr>
		 <td>
		 <input type="text" name="post_content" class="form-control "
		 required="required" autofocus="autofocus">
		 </td>
		</tr>
		
		<tr>
		 <td>
		 	<select class="form-control"><option>전체공개</option><option>팔로워 공개</option><option>나만보기</option></select>
		 </td>
		</tr>
		
		<tr>
		 <td>
		 <input type="file" name="post_file" class="form-control">
		 </td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
			<textarea style="width:490px; height:150px;" name="content"
			class="form-control" required="required"></textarea>
		</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
			<button type="submit" class="btn btn-default">게시하기</button>		
			<button type="button" class="btn btn-default"
			onclick="location.href='timeline'">목록</button>		
		</td>
		</tr>
	</table>
</div>
	
	</form>
</body>
</html>