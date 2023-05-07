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
		overflow-y:hidden;
		overflow-x: hidden;
	}
	
	.mmllisttop{
		margin-bottom: 20px;
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
	
	.messagememberphoto{
		width: 65px;
		height: 65px;	
		overflow: hidden;
		border-radius: 100px;
	}
	
	.messagememberphoto img{
		width: 65px;
	}
	
	/* 채팅했던 멤버 */
	.messagmember{
		padding-left: 15px;
		padding: 15px;
		width: 350px;
		height: 100%;
		position: fixed;
		overflow-y:hidden;
		overflow-x: hidden;
	}
	
	.onemember{
		display: inline-flex;
		width: 100%;
		margin-bottom: 10px;
		cursor: pointer;
	}
	
	.messagememberinfo{
		width: 250px;
		margin-left: 10px;
		margin-top: 10px;
		display: inline-flex;
		flex-direction: column;
	}
	
	.membername{
		font-size: 13pt;
		margin-bottom: 5px;
	}
	
	.chatdetail{
		width: 95%;
		display: inline-flex;
		justify-content: space-between;
	}
	
	.chatdetaildate{
		margin-right: 5px;
	}
	
	.chatinfo{
		width: 100%;
		height: 70px;
		background-color: white;
		box-shadow: 5px 2px 3px lightgray;
		display: inline-flex;
		align-items: center;
		font-weight: bold;
		font-size: 12pt;
		position: inherit;
		top: 0;
		margin-top: 80px;
	}
	
	.chatinfophoto{
		width: 45px;
		height: 45px;
		overflow: hidden;
		border-radius: 100px;
		margin-left: 15px;
		margin-right: 10px;
	}
	
	.chatinfophoto img{
		width: 45px;
	}
	
	.chatlist{
		position: fixed;
		margin-top: 70px;
		margin-bottom: 55px;
		overflow-y:scroll;
		overflow-x: hidden;
	}
	
	.messagefooter{
		background: white;
		height: 55px;
		position: inherit;
		bottom: 0;
		display: inline-flex;
		align-items: center;
		padding-left: 10px;
	}
	
	.chatinputbox{
		width: 82%;
		height: 35px;
		line-height: 35px;
		background-color: lightgray;
		border-radius: 60px;
		text-align: center;
		margin-left: 10px;
		margin-right: 10px;
	}
	
	.chatinputbox input{
		width: 95%;
		background: none;
		border: none;
		outline: none;
	}
</style>

<script type="text/javascript">
	$(function(){
		wsOpen();
		listWidthChange();
		memberListOut();
		getChatting('${recentgroup}');
		
		//상단의 채팅중인 사람 이름 변경
		$(".chatinfo span").text('${otherinfo.user_name}');
		//상단의 채팅중인 사람 이미지 변경
		if('${otherinfo.user_photo}'==null||'${otherinfo.user_photo}'==''){
			$(".chatinfophoto img").attr("src",'/image/noimg.png');
		}else{
			$(".chatinfophoto img").attr("src",'/사진업로드경로/'+'${otherinfo.user_photo}');	
		}
		
		$( window ).resize(function() {
			//창크기 변화 감지
			listWidthChange();
		});
		
	})
	
	function getChatting(group) {		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"chatting",
			data:{"mess_group":group},
			success:function(res){
				var chatContent="";
				
				$.each(res,function(i,ele){
					if(ele.sender_num=='${user_num}'){
						chatContent+="<p style='text-align:right'>" + ele.mess_content + "</p>";
					}else{
						chatContent+="<p style='text-align:left'>" + ele.mess_content + "</p>";
					}
				})
				
				$("#chatShow").html(chatContent);
			}
		})
	}
	
	function listWidthChange() {
		var windowWidth = $( window ).width();
		var windowHeight = $( window ).height();
		var listWidht=((windowWidth-350)/windowWidth)*100;
		
		var chatlistheight=$(".messagechatlist").css("height");
		chatlistheight=chatlistheight.substring(0,chatlistheight.length-2);
		var chatHeight=(chatlistheight-125);
		
		if(windowWidth<600){
			$(".messagememberlist").hide();
			$(".messagechatlist").css("left","0px");
			$(".messagefooter").css("left","0px");
			listWidht=100;
		}else{
			$(".messagememberlist").show();
			$(".messagechatlist").css("left","350px");
			$(".messagefooter").css("left","350px");
		}
		
		$(".messagechatlist").css("width",listWidht+"%");
		$(".messagefooter").css("width",listWidht+"%");
		$(".chatlist").css("width",listWidht+"%");
		$(".chatlist").css("height",chatHeight+"px");
	}
	
	//chatMember -> [[member_photo,member_name,content,writeday],[...],...]
	function memberListOut() {
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"memberlist",
			success:function(chatMember){
				var out="";
				
				$.each(chatMember,function(i,chat){
					out+='<div class="onemember" mess_group='+chat.group+' member_num='+chat.member_num+'>';
					out+='<div class="messagememberphotobox">';
					out+='<div class="messagememberphoto">';
					if(chat.member_photo==null||'${otherinfo.user_photo}'==''){
						out+='<img alt="사용자사진(없음)" src="/image/noimg.png">';
					}else{
						out+='<img alt="사용자사진" src="/사진업로드경로/'+chat.member_photo+'">';
					}
					out+='</div>';
					out+='</div>';
					out+='<div class="messagememberinfo">';
					out+='<span class="membername">'+chat.member_name+'</span>';
					out+='<div class="chatdetail">';
					out+='<span class="recentchat">'+chat.content+'</span>';
					out+='<span class="chatdetaildate">'+chat.writeday+'</span>';
					out+='</div></div></div>'
				})
				
				$(".messagmember").html(out);
				
				//왼쪽의 채팅방 목록(멤버 목록)을 클릭하면 오른쪽의 채팅화면이 바뀐다.
				$(".onemember").on("click",function(){
					var mess_group=$(this).attr("mess_group");
					var user_name=$(this).find(".membername").text();
					var user_photo=$(this).find(".messagememberphoto img").attr("src");
					
					//받는 사람 변경
					$("#receivernum").val($(this).attr("member_num"));
					//그룹 변경
					$("#chatgroup").val(mess_group);
					
					//상단의 채팅중인 사람 이름 변경
					$(".chatinfo span").text(user_name);
					//상단의 채팅중인 사람 이미지 변경
					$(".chatinfophoto img").attr("src",user_photo);
					//우측의 채팅중인 화면 변경(대화내용 변경)
					getChatting(mess_group);
				})
			}
		})
	}
	
	var ws;
	 
    function wsOpen(){
        ws = new WebSocket("ws://" + location.host + "/chating");
        wsEvt();
    }
        
    function wsEvt() {
        ws.onopen = function(data){
            //소켓이 열리면 초기화 세팅하기
        }
        
        ws.onmessage = function(data) {
            var msg = data.data;
            msgArr=msg.split(":"); //<<----이거 분해 ---------------------------------------------
            //msg=msg.substring(1,msg.lenght-1);
            var message=msgArr[1]; //메시지 내용
            var receiver=msgArr[2].trim(); //받는 사람 num
            var group=msgArr[3].trim(); // 메시지 그룹
            
            var nowGroup=$("#chatgroup").val(); //현재 선택된 채팅방 그룹
            
            if(msg != null && msg.trim() != '' && '${user_num}'==receiver && group==nowGroup){
               /*  $("#chatShow").append("<p>" + msg + "</p>"); */
               	$("#chatShow").append("<p style='text-align:left'>" + message + "</p>");
                memberListOut();
                
                //내 번호
                var user_num="${user_num}";
                //받는 사람 번호
                var reciever=$("#receivernum").val();
                
                //받은 또는 보낸 상대이며 접속한 채팅방 그룹일 경우
                if(reciever=""){
                	
                }
                //메시지 잘 들어왔을 때 실행하는 내용
            }
        }
 
        document.addEventListener("keypress", function(e){
            if(e.keyCode == 13){ //enter press
                send();
            }
        });
    }
 
    function chatName(){
        var userName = $("#userName").val();
        if(userName == null || userName.trim() == ""){
            alert("사용자 이름을 입력해주세요.");
            $("#userName").focus();
        }else{
            wsOpen();
            $("#yourName").hide();
            $("#yourMsg").show();
        }
    }
 
    function send() {
        var myid = '${sessionScope.myid}';
        var msg = $("#chatting").val();
        ws.send(myid+" : "+msg+" : "+$("#receivernum").val()+" : "+$("#chatgroup").val());
        $('#chatting').val("");
        $("#chatShow").append("<p style='text-align:right'>" + msg + "</p>");
    }
</script>
</head>
<body>
<div class="messagecontainer">
	<div class="messagememberlist">
		<div class="mmllisttop">
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
		<div class="messagmember">
		</div>
	</div>
	
	<div class="messagechatlist">
		<div class="chatinfo">
			<div class="chatinfophoto">
				<img alt="" src="/image/noimg.png">
			</div>
			<span>사람이름</span>
		</div>
		<div class="chatlist">
			<h1>채팅</h1>
		    <div id="chatShow" class="chatShow">
		    </div>
		</div>
		
		<div class="messagefooter">
			<span>채팅 보내기</span>
			<div class="chatinputbox">
				<input type="text" id="chatting" placeholder="채팅 입력">
				<input type="hidden" id="receivernum" value="${otherinfo.user_num }">
				<input type="hidden" id="chatgroup" value="${recentgroup }">
			</div>
			<button class="btn btn-sm btn-primary" onclick="send()" id="sendBtn">보내기</button>
		</div>
	</div>
</div>
</body>
</html>