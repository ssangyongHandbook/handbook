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
	}
	
	.messagememberlist{
		width: 350px;
		min-width: 0px;
		height: 100%;
		background-color: pink;
		position: fixed;
		overflow-y:scroll;
		overflow-x: hidden;
	}
	
	.messagechatlist{
		height: 100%;
		background-color: orange;
		position: fixed;
		left: 350px;
		overflow-y:scroll;
		overflow-x: hidden;
	}
	
	.mmltitle{
		padding: 15px;
		display: inline-flex;
		align-items: center;
		justify-content: space-between;
		font-size: 15pt;
		width: 100%;
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
	
	.messagememberphotobox{
		
	}
	
	.messagememberphoto{
		max-width: 65px;
		min-width: 30px;
		max-height: 65px;
		min-height: 30px;	
		overflow: hidden;
		border-radius: 100px;
	}
	
	.messagememberphoto img{
		width: 65px;
	}
	
	.messagmember{
		padding-left: 15px;
		padding: 15px;
		width: 100%;
	}
	
	.onemember{
		display: inline-flex;
		width: 100%:
	}
	
	.messagememberinfo{
		width: 250px;
		margin-left: 10px;
		margin-top: 10px;
		display: inline-flex;
		flex-direction: column;
	}
	
	#membername{
		font-size: 13pt;
		margin-bottom: 5px;
	}
	
	#chatdetail{
		width: 95%;
		display: inline-flex;
		justify-content: space-between;
	}
	
	#chatdetaildate{
		margin-right: 15px;
	}
</style>

<script type="text/javascript">
	$(function(){
		listWidthChange();
		
		$( window ).resize(function() {
			//창크기 변화 감지
			listWidthChange();
		});
		
	})
	
	function listWidthChange() {
		var windowWidth = $( window ).width();
		var listWidht=((windowWidth-350)/windowWidth)*100;
		
		if(windowWidth<600){
			$(".messagememberlist").hide();
			$(".messagechatlist").css("left","0px");
			listWidht=100;
		}else{
			$(".messagememberlist").show();
			$(".messagechatlist").css("left","350px");
		}
		
		$(".messagechatlist").css("width",listWidht+"%");
	}
</script>
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
		<div class="messagmember">
			<c:forEach items="${chatMember }" var="chat">
				<div class="onemember">
					<div class="messagememberphotobox">
						<div class="messagememberphoto">
							<c:if test="${chat.member_photo==null }">
								<img alt="사용자사진(없음)" src="/image/noimg.png">
							</c:if>
							<c:if test="${chat.member_photo!=null }">
								<img alt="사용자사진" src="/사진업로드경로/${chat.member_photo }">
							</c:if>
						</div>
					</div>
					<div class="messagememberinfo">
						<span id="membername">${chat.member_name }</span>
						<div id="chatdetail">
							<span id="recentchat">${chat.content }</span>
							<span id="chatdetaildate">${chat.writeday }</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="messagechatlist">
		이건 대화 표시
	</div>
</div>
</body>
</html>