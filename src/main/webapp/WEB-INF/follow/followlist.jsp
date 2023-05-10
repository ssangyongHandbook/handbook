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
.addbtn img {
	width: 25px;
}

.userbox {
	width: 400px;
	height: 200px;
	border: 1px solid gray;
	border-radius: 5px;
	margin-right: 10px;
	margin-bottom: 10px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
}

.up{
	border: none;
	border-radius: 100px;
	margin-left: 15px;
	margin-right: 10px;
	width: 80px;
	height: 80px;
	overflow: hidden;
	text-align: center;
}

.userphoto {
	border-radius: 100px;
	float: left;
	height: 80px;
}

.un {
	width: 200px;
	float: left;
	/* line-height:50px;
	display: inline-block; */
	display: flex;
	flex-direction: column;
	font-size:24px;
	font-weight:bold;
	padding-left: 15px;
	justify-content: center;
	margin-right: 20px;
}

.btndiv {
	width: 10%;
	float:right;
	align-self: flex-end;
	line-height:140px;
}

.addbtn {
	width: 30px;
	background-color:#fff;
	border:none;
}

.tf{
	font-size: 9px;
}

.friendmenu{
	position : relative;
	width: 200px;
	height: 60px;
	top: -20px;
	border: 4px solid gray;
	border-radius: 10px;
	border : none;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	background-color: white;
	
}

.followcancel button{
	border: none;
	background: none;
	outline: none;
	font-size: 9px;
}

.followbookmark button{
	border: none;
	background: none;
	outline: none;
	font-size: 9px;
}
.section{
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}
</style>
</head>
<body>
	<section class = "section">
		<c:forEach var = "dto" items = "${list }">
			<div class="userbox">

				<c:if test="${dto.user_photo!=null}">
					<div class="up">
						<img src="/photo/${dto.user_photo }" class="userphoto">
					</div>
				</c:if>

				<c:if test="${dto.user_photo==null}">
					<div class="up">
						<img src="../image/noimg.png" class="userphoto">
					</div>
				</c:if>
				<div class="un">
					<span>${dto.user_name }</span> 
					<span class="tf" style="font-size: 11px;">함께아는친구: ${dto.tf_count }</span>
				</div>
				<div class="btndiv" style="margin: auto 0;">
					<button type="button" class="addbtn" fing_num = ${dto.fing_num }><img src="../image/add.png"></button>
					
					<ul class="friendmenu" id="${dto.fing_num }" style="float: left; margin: auto 0; padding: 0; display: none;">
						
								<li class = "followbookmark">
								<button><span class="glyphicon glyphicon-star-empty" style="font-size: 15pt;">&nbsp;즐겨찾기</span></button></li>
								<li class = "followcancel">
								<button type = "button" to_user = ${dto.to_user }><span class="glyphicon glyphicon-remove" style="font-size: 15pt;">&nbsp;팔로우취소</span></button></li>
					</ul>
					</div>
				</div>
		
		</c:forEach>
		
		
		
	</section>
	<script type="text/javascript">
		
		offset = ${offset};
		
		$(".friendmenu").hide();

		$(document).on("click",".addbtn",function(){

			var fing_num = $(this).attr("fing_num");
			
			$("#"+fing_num).toggle();
		});
		
		
		
		$(".followcancel button").click(function(){
			$.ajax({
				dataType:"text",
				url:"deletefollowing",
				type:"get",
				data:{"to_user":$(this).attr("to_user")},
				success:function(){
					location.reload();
				}
			});
		});
		
		window.onscroll = function(e) {
			 console.log(window.innerHeight , window.scrollY,document.body.offsetHeight,document.body.scrollHeight);
		      if((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
		    	  
		    	  
		    	  offset=offset+8;
		    	  $.ajax({
		    		 type:"get",
		    		 dataType:"json",
		    		 url:"followlistscroll",
		    		 data:{"offset":offset,"from_user":${from_user}},
		    		 success:function(res){
		    			 $.each(res,function(i,item){
		    				 setTimeout(function(){
		    					
		    		        		var s = "";
		    		        		if(item.user_photo != null){
		    		        			s += "<div class='up'><img src='/photo/"+item.user_photo+"' class='userphoto'></div>";
		    		        		}else{
		    		        			
		    		        			s += "<div class='up'><img src='../image/noimg.png' class='userphoto'></div>";
		    		        		}
		    		        		s += "<div class='un'><span>"+item.user_name+"</span>";
		    		        		s += "<span class='tf' style='font-size: 11px;'>함께아는친구: "+item.tf_count+"</span></div>";
		    		        		s += "<div class='btndiv' style='margin: auto 0;'><button type='button' class='addbtn' fing_num = "+item.fing_num+"><img src='../image/add.png'></button></div>";
		    		        		s += "<ul class='friendmenu' id="+item.fing_num+" style='float: left; margin: auto 0; padding: 0; display:none;'>";
		    		        		s += "<li class = 'followbookmark'><button><span class='glyphicon glyphicon-star-empty' style='font-size: 17pt;'>&nbsp;즐겨찾기</span></button></li>"
		    		       			s += "<li class = 'followcancel'><button type = 'button' to_user = "+item.to_user+"><span class='glyphicon glyphicon-remove' style='font-size: 17pt;'>&nbsp;팔로우취소</span></button></li></ul></div></div>"
		    		        		
		    		        		
		    		             	var addContent = document.createElement("div");
		    		                addContent.classList.add("userbox");
		    		                addContent.innerHTML = s;
		    		                document.querySelector('section').appendChild(addContent);
		    		              	
		    		         }, 1000)  
		    			 })
		    		 }
		    	  });
		    	  
		       
		      }
		    }
		
	</script>
</body>
</html>