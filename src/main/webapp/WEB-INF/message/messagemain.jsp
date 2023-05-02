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
	.messagecontainer{
		width: 100%;
		height: 100%;
		display: inline-flex;
	}
	
	.messagememberlist{
		width: 25%;
		height: 100%;
		background-color: pink;
		position: fixed;
		overflow-y:scroll;
	}
	
	.messagechatlist{
		width: 75%;
		height: 100%;
		background-color: orange;
		position: fixed;
		left: 25%;
		overflow-y:scroll;
	}
	
	.mmltitle{
		width: 100%;
		padding: 15px;
		display: inline-flex;
		align-items: center;
		justify-content: space-between;
		font-size: 15pt;
	}
	
	.mmlbtnbox{
		display: inline-flex;
		margin-bottom: 5px;
	}
	
	.mmlbtn{
		width: 35px;
		height: 35px;
		background-color: lightgray;
		border-radius: 100px;
		line-height: 40px;
		text-align: center;
		margin-left: 10px;
	}
	
	.messagesearch{
		margin: 0 auto;
		background-color: lightgray;
		border-radius: 100px;
		width: 95%;
		height: 35px;
		line-height: 35px;
		padding-left: 15px;
	}
	
	.messagesearch input{
		height: 90%;
		width: 90%;
		background: none;
		border: none;
		outline: none;
	}
</style>
</head>
<body>
<div class="messagecontainer">
	<div class="messagememberlist">
		<div class="mmltitle">
			<span style="font-size: 20pt"><b>채팅</b></span>
			<div class="mmlbtnbox">
				<div class="mmlbtn">
					<span class="glyphicon glyphicon-option-horizontal"></span>
				</div>
				<div class="mmlbtn">
					<span class="glyphicon glyphicon-edit"></span>
				</div>
			</div>
		</div>
		<div class="messagesearch">
			<span class="glyphicon glyphicon-search"></span>
			<input type="text" placeholder="Messenger 검색">
		</div>
	</div>
	
	<div class="messagechatlist">
		이건 대화 표시
	</div>
</div>
</body>
</html>