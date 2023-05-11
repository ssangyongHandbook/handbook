<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript" src="/messagejscss/emoji_jk.js"></script>
<script src="https://kit.fontawesome.com/16085d762f.js"
	crossorigin="anonymous"></script>
<link href="/messagejscss/emoji_jk.css" type="text/css" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap"
	rel="stylesheet">

<style type="text/css">
.messagecontainer {
	width: 100%;
	height: 100%;
}

.messagememberlist {
	width: 350px;
	min-width: 0px;
	height: 100%;
	position: fixed;
	overflow-y: scroll;
	overflow-x: hidden;
}

.messagechatlist {
	height: 100%;
	position: fixed;
	left: 350px;
	overflow-y: hidden;
	overflow-x: hidden;
}

.mmllisttop {
	margin-bottom: 20px;
}

.mmltitle {
	padding: 15px;
	display: inline-flex;
	align-items: center;
	justify-content: space-between;
	font-size: 15pt;
	width: 100%;
}

.mmlbtnbox {
	display: inline-flex;
	margin-bottom: 5px;
}

.mmlbtn {
	width: 35px;
	height: 35px;
	background-color: #F0F2F5;
	border-radius: 100px;
	line-height: 40px;
	text-align: center;
	margin-left: 10px;
	cursor: pointer;
}

.messagesearch {
	margin: 0 auto;
	background-color: #F0F2F5;
	border-radius: 100px;
	width: 95%;
	height: 35px;
	line-height: 35px;
	padding-left: 15px;
}

.messagesearch input {
	height: 90%;
	width: 90%;
	background: none;
	border: none;
	outline: none;
}

.messagememberphoto {
	width: 65px;
	height: 65px;
	overflow: hidden;
	border-radius: 100px;
}

.messagememberphoto img {
	height: 65px;
}

/* 채팅했던 멤버 */
.messagmember {
	padding-left: 15px;
	padding: 15px;
	width: 350px;
	height: 100%;
	position: fixed;
	overflow-y: hidden;
	overflow-x: hidden;
}

.onemember {
	display: inline-flex;
	width: 98%;
	margin-bottom: 10px;
	cursor: pointer;
	padding: 5px;
}

.messageactive {
	background-color: #DFEFFF;
	border-radius: 5px;
}

.messagememberinfo {
	width: 250px;
	margin-left: 10px;
	margin-top: 10px;
	display: inline-flex;
	flex-direction: column;
}

.membername {
	font-size: 13pt;
	margin-bottom: 5px;
}

.chatdetail {
	width: 95%;
	display: inline-flex;
	justify-content: space-between;
}

.chatdetaildate {
	margin-right: 5px;
}

.chatinfo {
	width: 100%;
	height: 70px;
	background-color: white;
	box-shadow: 5px 2px 3px #F0F2F5;
	display: inline-flex;
	align-items: center;
	font-weight: bold;
	font-size: 12pt;
	position: inherit;
	top: 0;
	margin-top: 80px;
}

.chatinfophoto {
	width: 45px;
	height: 45px;
	overflow: hidden;
	border-radius: 100px;
	margin-left: 15px;
	margin-right: 10px;
}

.chatinfophoto img {
	height: 45px;
}

.chatlist {
	position: fixed;
	margin-top: 70px;
	margin-bottom: 55px;
	overflow: scroll;
	overflow-x: hidden;
	display: inline-flex;
	flex-direction: column;
	align-items: center;
}

.messagefooter {
	background: white;
	height: 55px;
	position: inherit;
	bottom: 0;
	display: inline-flex;
	align-items: center;
	padding-left: 10px;
}

.chatinputbox {
	width: 88%;
	height: 35px;
	line-height: 35px;
	background-color: #F0F2F5;
	border-radius: 60px;
	text-align: center;
	margin-left: 10px;
	margin-right: 10px;
}

.chatinputbox input {
	width: 95%;
	background: none;
	border: none;
	outline: none;
}

.chatShow {
	display: inline-flex;
	flex-direction: column;
	width: 98%;
	align-items: center;
}

.messagebubble {
	padding: 10px 15px 10px 15px;
	margin: 10px;
	border-radius: 90px;
	max-width: 400px;
}

.msgright {
	align-self: flex-end;
	display: inline-flex;
	align-items: center;
}

.messageright {
	background-color: #3582D3;
	color: white;
}

.msgleft {
	align-self: flex-start;
	display: inline-flex;
	align-items: center;
	margin-left: 15px;
}

.messageleft {
	background-color: #F0F2F5;
}

.msgdel {
	font-size: 10pt;
	color: gray;
	margin-top: 10%;
}

.leftreceiverphoto {
	height: 40px;
	border-radius: 100px;
}

.chatlistinfo {
	display: inline-flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 60px 0px 60px 0px;
}

.chatlistinfo div {
	width: 60px;
	height: 60px;
	border-radius: 100px;
	overflow: hidden;
}

.chatlistinfo img {
	height: 60px;
}

.chatlistinfoname {
	font-weight: bold;
	font-size: 14pt;
	margin-top: 10px;
}

.chatlistinfoid {
	font-size: 13pt;
	margin-top: 5px;
	color: lightgray;
}

.msgdel {
	visibility: hidden;
	cursor: pointer;
}

.chatupload {
	font-size: 18pt;
	display: flex;
	align-items: center;
}

.chatuploadicon {
	cursor: pointer;
	color: #3582D3;
}

span.msgaddname {
	margin-left: 15px;
}

input.msgaddname {
	margin-left: 10px;
	width: 50%;
	outline: none;
	border: none;
	background: none;
}

div.msgsearchuser {
	position: absolute;
	z-index: 10;
	width: 300px;
	height: 500px;
	overflow: auto;
	box-shadow: 0px 0px 10px lightgray;
	background-color: white;
	display: none;
	flex-direction: column;
}

.msgserachuserone {
	margin-left: 15px;
	width: 250px;
	display: inline-flex;
	align-items: center;
	margin-top: 10px;
	cursor: pointer;
	padding: 3px;
	border-radius: 10px;
}

.msgserachuserone:hover {
	background-color: #DFEFFF;
}

.msgserachuserone span {
	margin-left: 5px;
}

.searchuid {
	color: gray;
	font-size: 8pt;
}

.searchuphoto {
	width: 40px;
	height: 40px;
	border: none;
	border-radius: 100px;
	overflow: hidden;
	text-align: center;
}

.searchuphoto img {
	height: 40px;
}

#sendBtn {
	border: none;
	outline: none;
	background: none;
	font-size: 15pt;
	color: #3582D3;
	margin-right: 5px;
}

.messagefilepreview{
	position: inherit;
	background: white;
	box-shadow: 0px 0px 10px lightgray;
	border-bottom: 1px solid lightgray;
	width: 100%;
	height: 100px;
	bottom: 0;
	margin-bottom: 55px;
	z-index: 5p;
	/* display: none; */
}
</style>

<script type="text/javascript">
	$(function() {
		wsOpen();
		listWidthChange();
		memberListOut();
		getChatting('${recentgroup}');

		//상단의 채팅중인 사람 이름 변경
		$(".chatinfo span").text('${otherinfo.user_name}');
		//상단의 채팅중인 사람 아이디 변경
		$(".chatinfo span").attr("memeber_id", '${otherinfo.user_id}');
		//상단의 채팅중인 사람 이미지 변경
		if ('${otherinfo.user_photo}' == null
				|| '${otherinfo.user_photo}' == '') {
			$(".chatinfophoto img").attr("src", '/image/noimg.png');
		} else {
			$(".chatinfophoto img").attr("src",
					'/photo/' + '${otherinfo.user_photo}');
		}

		$(window).resize(function() {
			//창크기 변화 감지
			listWidthChange();
		});

		//메신저 검색
		$(".messagesearch input").keyup(
				function() {
					setTimeout(function() {
						//메신저 검색이 입력됐을 때 현재 other_name에 저장된 이름과 같으면 실앵하지 않는다
						if (other_name != ''
								&& other_name == $(".messagesearch input")
										.val()) {
							return;
							consol.log($(this).val());
						} else {
							memberListOut();
						}
					}, 500);
				});

		//왼쪽의 채팅방 목록(멤버 목록)을 클릭하면 오른쪽의 채팅화면이 바뀐다.
		$(document).on(
				"click",
				".onemember",
				function() {
					//선택된 채팅방 변경
					$(".onemember").each(function(i, ele) {
						$(ele).removeClass("messageactive");
					})
					$(this).addClass("messageactive");

					var mess_group = $(this).attr("mess_group");
					var user_name = $(this).find(".membername").text();
					var user_photo = $(this).find(".messagememberphoto img")
							.attr("src");
					var member_id = $(this).find(".membername").attr(
							"member_id");

					if ($(this).hasClass("newmsg")) {
						var img = $(this).find("img").attr("src");
						var name = $(this).find(".membername").attr("uname");
						var id = $(this).find(".membername").attr("uid");

						$("#chatShow").html("");
						$(".chatlistinfo img").attr("src", img);
						$(".chatlistinfoname").text(name);
						$(".chatlistinfoid").text(id);

						setUserInfo(img, id, name);

						//받는 사람 변경
						$("#receivernum").val($(this).attr("member_num"));
						//그룹 변경
						$("#chatgroup").val(0);
					} else {
						//받는 사람 변경
						$("#receivernum").val($(this).attr("member_num"));
						//그룹 변경
						$("#chatgroup").val(mess_group);

						//상단의 채팅중인 사람 이름 변경
						$(".chatinfo span").text(user_name);
						//상단의 채팅중인 사람 아이디 변경
						$(".chatinfo span").attr("memeber_id", member_id);
						//상단의 채팅중인 사람 이미지 변경
						$(".chatinfophoto img").attr("src", user_photo);
						//우측의 채팅중인 화면 변경(대화내용 변경)
						getChatting(mess_group);
					}
				})

		$(document).on('mouseover', '.msgone', function() {
			$(this).find(".msgdel").css("visibility", "visible");
		})
		$(document).on('mouseout', '.msgone', function() {
			$(this).find(".msgdel").css("visibility", "hidden");
		})

		//채팅 삭제
		$(document).on('click', '.msgdel', function() {
			$.ajax({
				type : "get",
				dataType : "text",
				url : "delete",
				data : {
					"mess_num" : $(this).attr("del")
				},
				success : function() {
					var group = $("#chatgroup").val();
					var scrollPos = $(".chatlist")[0].scrollTop; //삭제 눌렀을 시점의 스크롤 위치

					getChatting(group, scrollPos); //채팅 다시 불러오기(삭제된 거 적용)
				}
			})
		})

		//사진 업로드
		$(".chatuploadicon").click(function() {
			$(".chatupload input").trigger("click");
		})

		//사진 선택 <--여기서부터~!
		$(".chatupload input").change(function() {
			var input=$(this);
			
			var out="";
			//미리보기 띄우기
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					out="<div><img src='"+e.target.result+"'></div>"
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				out="";
			}
			
			$(".messagefilepreview").html(out);
		})

		//채팅방 추가(받는 사람 입력창 띄우기)
		$(".msgadd")
				.click(
						function() {
							s = "<span class='msgaddname'>받는 사람:</span><input type='text' class='msgaddname'>"
							$(".chatinfo").html(s);
							var position = $('.msgaddname').position();
							$('.msgsearchuser').css("left", position.left + 60);
							$('.msgsearchuser').css("top", position.top + 30);
							$('.msgsearchuser').css("display", "inline-flex");
						})

		//->창 외부 클릭시 숨기기
		$('body').click(
				function(e) {
					var container = $(".msgsearchuser");

					if (container.css("display") != "none") {
						if (!$(e.target).hasClass('msgsearchuser')
								&& !$(e.target).hasClass('msgadd')
								&& !$(e.target).hasClass('msgaddicon')
								&& !$(e.target).hasClass('msgaddname')
								&& !$(e.target).hasClass('msgsearchuser')
								&& !$(e.target).hasClass('msgsearchuserone')) {

							container.css("display", "none");

							var img = $(".onemember").eq(0).find("img").attr(
									"src");
							var id = $(".onemember").eq(0).find(".membername")
									.attr("member_id");
							var name = $(".onemember").eq(0)
									.find(".membername").text();

							setUserInfo(img, id, name);
						}
					}
				})

		//->채팅방 추가에서 받는 사람 입력창 이벤트
		$(document)
				.on(
						'keyup',
						'input.msgaddname',
						function(e) {
							var addName = $(this).val(); //검색한 (추가할)사람 이름

							$
									.ajax({
										type : "get",
										dataType : "json",
										data : {
											"user_name" : addName
										},
										url : "searchuser",
										success : function(res) {
											var users = "";
											$
													.each(
															res,
															function(i, ele) {
																users += "<div class='msgserachuserone'><div class='searchuphoto'>";
																if (ele.user_photo == null) {
																	users += "<img src='/image/noimg.png'>";
																} else {
																	users += "<img src='/photo/"+ele.user_photo+"'>";
																}
																users += "</div><span class='searchuname'>"
																		+ ele.user_name
																		+ "</span>";
																users += "<span class='searchuid'>"
																		+ ele.user_id
																		+ "</span>"
																users += "<input type='hidden' value="+ele.user_num+">"
																users += "</div>";
															})
											$('.msgsearchuser').html(users);
										}
									})
						})

		//-->검색한 사람 클릭했을 때 받는 사람에 넣기
		$(document)
				.on(
						"click",
						".msgserachuserone",
						function() {
							var name = $(this).find(".searchuname").text();
							var id = $(this).find(".searchuid").text();
							$("input.msgaddname").val(name + "(" + id + ")");

							var img = $(this).find("img").attr("src");
							var name = $(this).find(".searchuname").text();
							var id = $(this).find(".searchuid").text();
							var num = $(this).find("input").val();

							if (!$(".messagmember").find(".onemember")
									.hasClass("newmsg")) {

								$(".messagmember").find(".messageactive")
										.removeClass("messageactive");

								var out = "";
								var msgmember = $(".messagmember").html();

								out += '<div class="onemember messageactive newmsg" member_num='+num+'>';
								out += '<div class="messagememberphotobox">';
								out += '<div class="messagememberphoto">';
								out += '<img alt="사용자사진(없음)" src="' + img
										+ '">';
								out += '</div>';
								out += '</div>';
								out += '<div class="messagememberinfo">';
								out += '<span class="membername" uname='+name+' uid='+id+'>새메시지 입력</span>';
								out += '<div class="chatdetail">';
								out += '<span class="recentchat"></span>';
								out += '<span class="chatdetaildate"></span>';
								out += '</div></div></div>'

								$(".messagmember").html(out + msgmember);
							} else {
								$(".newmsg").find("img").attr("src", img);
								$(".newmsg").attr("member_num", num);
								$(".newmsg").find(".membername").attr("uname",
										name);
								$(".newmsg").find(".membername")
										.attr("uid", id);
							}

							$("#chatShow").html("");
							$(".chatlistinfo img").attr("src", img);
							$(".chatlistinfoname").text(name);
							$(".chatlistinfoid").text(id);

							setUserInfo(img, id, name);

							//받는 사람 변경
							$("#receivernum").val(num);
							//그룹 변경
							$("#chatgroup").val(0);
						})

	})

	//상단의 사용자 정보 재출력
	function setUserInfo(img, id, name) {
		var info = ""

		info += '<div class="chatinfophoto">';
		info += '<img alt="" src="'+img+'">';
		info += '</div>';
		info += '<span member_id="'+id+'">' + name + '</span>';

		$(".chatinfo").html(info);
	}

	//상대방과 해던 채팅 가져오기
	function getChatting(group, scrollPos) {

		if ('${recentgroup}' == 0) {
			return;
		}

		$
				.ajax({
					type : "get",
					dataType : "json",
					url : "chatting",
					data : {
						"mess_group" : group
					},
					success : function(res) {
						var chatContent = "";
						//현재 선택한 대화 상대의 사진 가져오기
						var otherImg = $(".chatinfophoto img").attr("src");

						$
								.each(
										res,
										function(i, ele) {
											if (ele.sender_num == '${user_num}') {
												chatContent += "<div class='msgright msgone'><div class='msgdel' del="+ele.mess_num+">삭제</div><div class='messageright messagebubble'>"
														+ ele.mess_content
														+ "</div></div>";
											} else {
												chatContent += "<div class='msgleft msgone'><img src='"+otherImg+"' class='leftreceiverphoto'><div class='messageleft messagebubble'>"
														+ ele.mess_content
														+ "</div><div class='msgdel' del="+ele.mess_num+">삭제</div></div>";
											}
										})

						$(".chatlistinfo img").attr("src", otherImg);
						$(".chatlistinfoname").text($(".chatinfo span").text());
						$(".chatlistinfoid").text(
								$(".chatinfo span").attr("memeber_id"));

						$("#chatShow").html(chatContent);

						if (scrollPos == null) {
							$(".chatlist").scrollTop(
									$(".chatlist")[0].scrollHeight); //스크롤 맨 아래로 내리기	
						} else {
							$(".chatlist").scrollTop(scrollPos);
						}

					}
				})
	}

	//반응형 웹사이트
	function listWidthChange() {
		var windowWidth = $(window).width();
		var windowHeight = $(window).height();
		var listWidht = ((windowWidth - 350) / windowWidth) * 100;

		var chatlistheight = $(".messagechatlist").css("height");
		chatlistheight = chatlistheight.substring(0, chatlistheight.length - 2);
		var chatHeight = (chatlistheight - 205);

		if (windowWidth < 600) {
			$(".messagememberlist").hide();
			$(".messagechatlist").css("left", "0px");
			$(".messagefooter").css("left", "0px");
			listWidht = 100;
		} else {
			$(".messagememberlist").show();
			$(".messagechatlist").css("left", "350px");
			$(".messagefooter").css("left", "350px");
		}

		$(".messagechatlist").css("width", listWidht + "%");
		$(".messagefooter").css("width", listWidht + "%");
		$(".chatlist").css("width", listWidht + "%");
		$(".chatlist").css("height", chatHeight + "px");
	}

	var other_name = ''; //메신저 검색에 입력되는 사용자 이름(저장변수)

	//나와 채팅했던 사용자 목록 출력
	function memberListOut() {

		if ('${recentgroup}' == 0) {
			return;
		}

		other_name = $(".messagesearch input").val();

		$
				.ajax({
					type : "get",
					dataType : "json",
					url : "memberlist",
					data : {
						"other_name" : other_name
					},
					success : function(chatMember) {
						var out = "";

						$
								.each(
										chatMember,
										function(i, chat) {
											if ($("#chatgroup").val() == chat.group) {
												//선택된 채팅방이면 messageactive class를 추가한다.
												out += '<div class="onemember messageactive" mess_group='+chat.group+' member_num='+chat.member_num+'>';
											} else {
												//선택되지 않은 채팅방
												out += '<div class="onemember" mess_group='+chat.group+' member_num='+chat.member_num+'>';
											}
											out += '<div class="messagememberphotobox">';
											out += '<div class="messagememberphoto">';
											if (chat.member_photo == null
													|| chat.member_photo == '') {
												out += '<img alt="사용자사진(없음)" src="/image/noimg.png">';
											} else {
												out += '<img alt="사용자사진" src="/photo/'+chat.member_photo+'">';
											}
											out += '</div>';
											out += '</div>';
											out += '<div class="messagememberinfo">';
											out += '<span class="membername" member_id='+chat.member_id+'>'
													+ chat.member_name
													+ '</span>';
											out += '<div class="chatdetail">';
											out += '<span class="recentchat">'
													+ chat.content + '</span>';
											out += '<span class="chatdetaildate">'
													+ chat.writeday + '</span>';
											out += '</div></div></div>'
										})

						if (out == "") {
							out = "<span>검색결과가 없습니다</sapn>"
						}

						$(".messagmember").html(out);

						//왼쪽의 채팅방 목록(멤버 목록)을 클릭하면 오른쪽의 채팅화면이 바뀐다.
					}
				})
	}

	var ws;

	//웹소켓 오픈
	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 초기화 세팅하기
		}

		ws.onmessage = function(data) {
			var msg = data.data;
			msgArr = msg.split(":"); //분해(보내는사람:내용:받는사람:그룹)
			//msg=msg.substring(1,msg.lenght-1);
			var message = msgArr[1]; //메시지 내용
			var receiver = msgArr[2].trim(); //받는 사람 num
			var group = msgArr[3].trim(); // 메시지 그룹

			var nowGroup = $("#chatgroup").val(); //현재 선택된 채팅방 그룹

			if (msg != null && msg.trim() != '' && '${user_num}' == receiver) {

				if (group == nowGroup) {
					//현재 선택한 대화 상대의 사진 가져오기
					//var otherImg=$(".chatinfophoto img").attr("src");	
					/* $("#chatShow").append("<div class='msgleft msgone'><img src='"+otherImg+"' class='leftreceiverphoto'><div class='messageleft messagebubble'>" + message + "</div><div class='msgdel' del="+ele.mess_num+">삭제</div></div>");
					$(".chatlist").scrollTop($(".chatlist")[0].scrollHeight); //스크롤 맨 아래로 내리기 */
					var group = $("#chatgroup").val();
					getChatting(group);
				}

				memberListOut();//멤버 리스트 다시 불러오기

				//내 번호
				var user_num = "${user_num}";
				//받는 사람 번호
				var reciever = $("#receivernum").val();

				//받은 또는 보낸 상대이며 접속한 채팅방 그룹일 경우
				if (reciever = "") {

				}
				//메시지 잘 들어왔을 때 실행하는 내용
			}
		}

		//채팅 입력창에서 엔터 누르면 채팅 보내짐
		$("#chatting").keyup(function(e) {
			if (e.keyCode == 13) { //enter press
				if ($("#chatting").val() != '') {
					send();
				}
			}
		});
	}

	//메시지 보내면 동작하는 코드
	function send() {
		var myid = '${sessionScope.myid}';
		var msg = $("#chatting").val();
		ws.send(myid + " : " + msg + " : " + $("#receivernum").val() + " : "
				+ $("#chatgroup").val());

		$('#chatting').val("");
		var group = $("#chatgroup").val();

		if (group == 0) {
			$.ajax({
				type : "get",
				dataTyep : "json",
				url : "newgroup",
				success : function(res) {
					group = res.group;
					$("#chatgroup").val(group);
					getChatting(group);
				}
			})
		} else {
			getChatting(group);
		}

		memberListOut(); //멤버 리스트 다시 불러오기
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
						<div class="mmlbtn msgadd">
							<span class="glyphicon glyphicon-edit msgaddicon"></span>
						</div>
					</div>
				</div>
				<div class="messagesearch">
					<span class="glyphicon glyphicon-search"></span> <input type="text"
						placeholder="Messenger 검색">
				</div>
			</div>
			<div class="messagmember"></div>
		</div>

		<div class="messagechatlist">
			<div class="chatinfo">
				<c:if test="${recentgroup!=0 }">
					<div class="chatinfophoto">
						<c:if test="${otherInfo.user_photo==null }">
							<img alt="" src="/image/noimg.png">
						</c:if>
						<c:if test="${otherInfo.user_photo!=null }">
							<img alt="" src="/photo/${otherInfo.user_photo }">
						</c:if>
					</div>
					<span member_id="${otherInfo.user_id }">${otherInfo.user_name }</span>
				</c:if>
			</div>

			<div class="msgsearchuser"></div>

			<div class="chatlist">
				<div class="chatlistinfo">
					<c:if test="${recentgroup!=0 }">
						<div>
							<img alt="상대방 사진" src="">
						</div>
						<span class="chatlistinfoname"></span>
						<span class="chatlistinfoid"></span>
						<p class="chatlistinfofollow"></p>
					</c:if>
				</div>
				<div id="chatShow" class="chatShow">
					<!-- 채팅 보이는 구간 -->
				</div>
			</div>

			<div class="messagefilepreview">
			</div>

			<div class="messagefooter">
				<!-- 이모지 시작-->
				<div class="chatemoji">
					<img class="emoji_pickup" id="emoji_pickup_before"
						src="/messagejscss/img/emoji/1f642.png"> <img
						class="emoji_pickup" id="emoji_pickup_after"
						src="/messagejscss/img/emoji/1f600.png">

					<div id="emoji_popup">
						<!-- emoji popup div start -->
						<div id="people">
							<h5>People</h5>
						</div>
						<span class="emoji_list" id="&#x1F601;">&#x1F601;</span> <span
							class="emoji_list" id="&#x1F602;">&#x1F602;</span> <span
							class="emoji_list" id="&#x1F603;">&#x1F603;</span> <span
							class="emoji_list" id="&#x1F604;">&#x1F604;</span> <span
							class="emoji_list" id="&#x1F605;">&#x1F605;</span> <span
							class="emoji_list" id="&#x1F606;">&#x1F606;</span> <span
							class="emoji_list" id="&#x1F609;">&#x1F609;</span> <span
							class="emoji_list" id="&#x1F60A;">&#x1F60A;</span> <span
							class="emoji_list" id="&#x1F60B;">&#x1F60B;</span> <span
							class="emoji_list" id="&#x1F60C;">&#x1F60C;</span> <span
							class="emoji_list" id="&#x1F60D;">&#x1F60D;</span> <span
							class="emoji_list" id="&#x1F60F;">&#x1F60F;</span> <span
							class="emoji_list" id="&#x1F612;">&#x1F612;</span> <span
							class="emoji_list" id="&#x1F613;">&#x1F613;</span> <span
							class="emoji_list" id="&#x1F614;">&#x1F614;</span> <span
							class="emoji_list" id="&#x1F616;">&#x1F616;</span> <span
							class="emoji_list" id="&#x1F618;">&#x1F618;</span> <span
							class="emoji_list" id="&#x1F61A;">&#x1F61A;</span> <span
							class="emoji_list" id="&#x1F61C;">&#x1F61C;</span> <span
							class="emoji_list" id="&#x1F61D;">&#x1F61D;</span> <span
							class="emoji_list" id="&#x1F61E;">&#x1F61E;</span> <span
							class="emoji_list" id="&#x1F620;">&#x1F620;</span> <span
							class="emoji_list" id="&#x1F621;">&#x1F621;</span> <span
							class="emoji_list" id="&#x1F622;">&#x1F622;</span> <span
							class="emoji_list" id="&#x1F623;">&#x1F623;</span> <span
							class="emoji_list" id="&#x1F624;">&#x1F624;</span> <span
							class="emoji_list" id="&#x1F625;">&#x1F625;</span> <span
							class="emoji_list" id="&#x1F628;">&#x1F628;</span> <span
							class="emoji_list" id="&#x1F629;">&#x1F629;</span> <span
							class="emoji_list" id="&#x1F62A;">&#x1F62A;</span> <span
							class="emoji_list" id="&#x1F62B;">&#x1F62B;</span> <span
							class="emoji_list" id="&#x1F62D;">&#x1F62D;</span> <span
							class="emoji_list" id="&#x1F630;">&#x1F630;</span> <span
							class="emoji_list" id="&#x1F631;">&#x1F631;</span> <span
							class="emoji_list" id="&#x1F632;">&#x1F632;</span> <span
							class="emoji_list" id="&#x1F633;">&#x1F633;</span> <span
							class="emoji_list" id="&#x1F635;">&#x1F635;</span> <span
							class="emoji_list" id="&#x1F637;">&#x1F637;</span>
						<!-- emoji popup div end -->
					</div>
				</div>
				<!-- 이모지 끝 -->
				<!-- 사진 올리기 -->
				<div class="chatupload">
					<input type="file" style="display: none;"> <i
						class="fa-regular fa-images chatuploadicon"></i>
				</div>
				<div class="chatinputbox">
					<input type="text" id="chatting" placeholder="채팅 입력"> <input
						type="hidden" id="receivernum" value="${otherinfo.user_num }">
					<input type="hidden" id="chatgroup" value="${recentgroup }">
				</div>
				<button onclick="send()" id="sendBtn">
					<i class="fa-regular fa-paper-plane"></i>
				</button>
			</div>
		</div>
	</div>
</body>
</html>