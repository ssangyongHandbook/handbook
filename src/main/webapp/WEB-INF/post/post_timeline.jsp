<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/2663817d27.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap"
   rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>

<script src="https://kit.fontawesome.com/2663817d27.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="post_css.css">


<script type="text/javascript">
   $(function() {

      offset = ${offset};
      commentoffset = ${commentoffset};

      $("#insertbtn").click(function() {

         var post_access = $("#post_access").val();
         var post_content = $("#post_content").val();
         var user_num = $("#user_num").val();
         var files = $("#post_file")[0].files;
         //var data="num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&addr="+updateaddr;
         //var data=$("#postInsert").serialize();

         /*        var form = new FormData();
               form.append("photo", $("#post_file")[0].files[0]);  */

         var form = new FormData();

         for (var i = 0; i < files.length; i++) {
            form.append("photo", files[i]);
         }

         form.append("post_access", post_access);
         form.append("post_content", post_content);
         form.append("user_num", user_num);

         $.ajax({

            type : "post",
            dataType : "text",
            processData : false,
            contentType : false,
            data : form,
            url : "insertpost",
            success : function() {
               location.reload();
            }
         });
      });

      $(document).on("click", ".postmenu", function() {
         var user_num = $(this).attr("user_num");
         var post_num = $(this).attr("post_num");

         $("#" + post_num).toggle();

      });

      $(document).on("click", ".posthide", function() {
         var divpost_num = $(this).attr("divpost_num");
         var divspost_num = $(this).attr("divspost_num")

         $("#" + divpost_num).hide();

         $("#" + divspost_num).show();

      });

      $(document).on("click", ".showbtn", function() {
         var divpost_num = $(this).attr("divpost_num");
         var divspost_num = $(this).attr("divspost_num")

         $("#" + divpost_num).show();

         $("#" + divspost_num).hide();

      });

      $(document).on("click", ".liketoggle", function() {

         var likeshow1_num = $(this).attr("likeshow1_num");
         var likehide1_num = $(this).attr("likehide1_num");

         $("#" + likeshow1_num).toggle();
         $("#" + likehide1_num).toggle();

      });

      $(document).on("click", ".liketoggle2", function() {

         var likeshow2_num = $(this).attr("likeshow2_num");
         var likehide2_num = $(this).attr("likehide2_num");

         /*       
               $(".likeshow2").toggle();
               $(".likehide2").toggle(); */

         $("#" + likeshow2_num).toggle();
         $("#" + likehide2_num).toggle();

      });

      $(document).on("click", ".userimg", function() {
         var num = $(this).attr("user_num");

         location.href = "/user/mypage?user_num=" + num;

      });

      $(document).on("click", "#postdelete", function() {
         delnum = $(this).attr("post_num");

         $.ajax({
            type : "get",
            dataType : "text",
            url : "delete",
            data : {
               "post_num" : delnum
            },
            success : function() {
               location.reload();
            }
         })
      })

      //수정버튼 클릭 시 모달에 데이터 넣기
      $(document).on("click", "#postupdate", function() {
         updatenum = $(this).attr("post_num");

         $.ajax({
            type : "get",
            dataType : "json",
            url : "updateform",
            data : {
               "post_num" : updatenum
            },
            success : function(res) {
               $("#update_access").val(res.post_access);
               $("#update_content").val(res.post_content);

            }
         })
      })

      $(document)
            .on(
                  "click",
                  "#updatetbtn",
                  function() {

                   /*   var update_access = $("#update_access").val();
                     var update_content = $("#update_content").val();

                     var data = "post_num=" + updatenum
                           + "&post_access=" + update_access
                           + "&post_content=" + update_content;

                     $.ajax({

                        type : "post",
                        dataType : "text",
                        data : data,
                        url : "update",
                        success : function() {
                           location.reload();
                        }
                     }); */
                     var update_access=$("#update_access").val();
                     var update_content=$("#update_content").val();
                     
                     var form = new FormData();

                     var files=$("#update_file")[0].files;
                     
                     for (var i = 0; i < files.length; i++) {
                          form.append("photo", files[i]);
                      }
                     form.append("post_num",updatenum);
                     form.append("post_access",update_access);
                     form.append("post_content",update_content);
                     
                     $.ajax({
                        type: "post",
                        dataType: "text",
                        url: "update",
                        processData: false,
                        contentType: false,
                        data: form,
                        success: function(){
                           location.reload();
                        }
                     });
                  });

      $(document).on("click", ".like", function() {
         var post_num = $(this).attr("post_num");
         var user_num = $(this).attr("user_num");

         $.ajax({
            type : "get",
            dataType : "text",
            url : "likeinsert",
            data : {
               "post_num" : post_num,
               "user_num" : user_num
            },
            success : function() {
            }
         })
      })

      $(document).on("click", ".dlike", function() {
         var post_num = $(this).attr("post_num");
         var user_num = $(this).attr("user_num");

         $.ajax({
            type : "get",
            dataType : "text",
            url : "likedelete",
            data : {
               "post_num" : post_num,
               "user_num" : user_num
            },
            success : function() {
            }
         })
      });

      $(document).on("click", "#postfollow", function() {
         var from_user = $(this).attr("from_user");
         var to_user = $(this).attr("to_user");

         $.ajax({
            type : "get",
            dataType : "text",
            url : "followinginsert",
            data : {
               "from_user" : from_user,
               "to_user" : to_user
            },
            success : function() {
               location.reload();
            }
         })
      })

      $(document).on("click", "#postunfollow", function() {
         var to_user = $(this).attr("to_user");
         $.ajax({
            type : "get",
            dataType : "text",
            url : "followingdelete",
            data : {
               "to_user" : to_user
            },
            success : function() {
               location.reload();
            }
         })
      })

      //사진 넘기면서 보기
      $(document).ready(
            function() {

               $('.slider').slick({

                  prevArrow : '<img src="../image/left.png" class="prev">',
                  nextArrow : '<img src="../image/right.png" class="next">',
                  autoplay : false, // 자동 재생 여부
                  autoplaySpeed : 0, // 자동 재생 속도 (단위: ms)
                  dots : false, // 점 네비게이션 표시 여부
                  arrows : true, // 화살표 네비게이션 표시 여부
                  infinite : false, // 무한 슬라이드 여부
                  slidesToShow : 1, // 한 화면에 보여줄 슬라이드 수
                  slidesToScroll : 1
               // 한 번에 스크롤할 슬라이드 수

               });

               //마지막,처음 화살표 삭제
               $('.slider').on('afterChange',
                     function(event, slick, currentSlide) {
                        if (currentSlide == 0) {
                           $('.prev').css("visibility", "hidden");
                        } else {
                           $('.prev').css("visibility", "visible");
                        }
                        if (currentSlide == slick.slideCount - 1) {
                           $('.next').css("visibility", "hidden");
                        } else {
                           $('.next').css("visibility", "visible");
                        }
                     });
            });
      
      
      $("#btncontentphoto").click(function(){
      
      $("#post_file").trigger("click");
   });

      $("#post_file").change(function(){
          
          if($(this)[0].files[0]){
           var reader=new FileReader();
           reader.onload=function(e){
        	$("#showtext").hide();
        	   
        	//영상 선택했을 경우 추가
        	if((e.target.result).includes('video')){
        		$("#showvideo").show();
        		$("#showvideo").attr("src",e.target.result);
        		$("#showimg").attr("src","");
        		$("#showimg").hide();
        	}else{
        		$("#showimg").show();
        		$("#showimg").attr("src",e.target.result);	
        		$("#showvideo").attr("src","");
        		$("#showvideo").hide();
        	}
           }
           reader.readAsDataURL($(this)[0].files[0]);
          }
      });
  
  
  $("#btncontentphoto").click(function(){
         //$("#showimg").show();
         $("#showtext").show();
      });

      
  
  
  
  //강제 호출
  $("#btnmodcontentphoto").click(function(){
     
     $("#update_file").trigger("click");
  });
  
  //게시물 수정 시 사진 미리보기
  $("#update_file").change(function(){
     
      if($(this)[0].files[0]){
       var reader=new FileReader();
       reader.onload=function(e){
        $("#showmodimg").attr("src",e.target.result);
        $("#showtext").hide();
       }
       reader.readAsDataURL($(this)[0].files[0]);
      }
  });
  
  $(".modpost").click(function(){
      
      updatenum=$(this).attr("post_num");

      $.ajax({
         type : "get",
         dataType : "json",
         url : "updateform",
         data : {"post_num" : updatenum},      
         success : function(res) {
            $("#update_access").val(res.post_access);
            $("#update_content").val(res.post_content);
            $("#showmodimg").attr("src","/post_file/"+res.post_file);
         }
      })
   })
   
   //게시물 수정      
   $("#btnupdate2").click(function(){
      
      var update_access=$("#update_access").val();
      var update_content=$("#update_content").val();
      
      var form = new FormData();

      var files=$("#update_file")[0].files;
      
      for (var i = 0; i < files.length; i++) {
           form.append("photo", files[i]);
       }
      form.append("post_num",updatenum);
      form.append("post_access",update_access);
      form.append("post_content",update_content);
      
      $.ajax({
         type: "post",
         dataType: "text",
         url: "updatepost",
         processData: false,
         contentType: false,
         data: form,
         success: function(){
            location.reload();
         }
      });
      
   })
   
  
  
  
  
  
  
  
  
  
  
      
      
      

      /*  window.onscroll = function(e) {
              if((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
                 
                 offset=offset+2;
                 $.ajax({
                   type:"get",
                   dataType:"json",
                   url:"scroll",
                   data:{"offset":offset},
                   success:function(res){
                      $.each(res,function(i,item){
                      alert("hello");
                         
                         setTimeout(function(){
                                
                                  var addTimeline = document.createElement("div");
                                  addTimeline.classList.add("divmain");
                                 
                                  addTimeline.innerHTML =
                                   
                                   document.querySelector('section').appendChild(addTimeline);
                         }, 1000) 
                      })
                   }
                 });
                 
               
              }
            }  */

            
            
            
            
            
            
            
            
            
            
      
      /* comment */
      $('#commentinput').keydown(function() {
         if (event.keyCode === 13) {
            $("#insertcommentbtn").trigger("click");
         };
      });

      $(document).on("keydown", ".input", function() {

         if (event.keyCode === 13) {
            $(this).next().trigger("click");
         };
      });

      $(document).on("click", ".ulimg", function() {

         var comment_num = $(this).attr("comment_num");
         $("#ul" + comment_num).toggle();
      })

      $(document).on("click", ".cminsert", function() {

         var comment_num = $(this).attr("comment_num");
         var comment_content = $("#input" + comment_num).val();
         var post_num = $(this).attr("post_num");
         //alert(comment_num + comment_content + post_num);
         $.ajax({

            type : "post",
            dataType : "text",
            url : "cinsert",
            data : {
               "comment_num" : comment_num,
               "comment_content" : comment_content,
               "post_num" : post_num
            },
            success : function() {
               $("#commentsection").empty();
               $("#addcomment").hide();
               $("#input" + comment_num).val("");
               $("#input" + comment_num).hide();
               commentoffset = 0;
               scroll(commentoffset, post_num);
               $("#addcomment").show();
            }
         })

      })

      $("#insertcommentbtn").click(function() {

         var formdata = $("#form").serialize();
         var post_num=$("#inputhidden-post_num").val();
         //alert(formdata);
         $.ajax({

            type : "post",
            dataType : "text",
            url : "cinsert",
            data : formdata,
            success : function() {
               $("#commentsection").empty();
               $("#addcomment").hide();
               $("#commentinput").val("");
               commentoffset = 0;
               scroll(commentoffset, post_num);
               $("#addcomment").show();
            }
         })
      });

      $(document).on("click", "#addcomment", function() {
        var post_num=$("#inputhidden-post_num").val(); 
         commentoffset = commentoffset + 8;
         scroll(commentoffset, post_num);
      })

      $(document).on("click", ".recontent", function() {

         var comment_num = $(this).attr("comment_num");
         //alert(comment_num);
         $("#comment" + comment_num).toggle();
      })

      $(document).on("click", "span.nolike", function() {

         var comment_num = $(this).attr("comment_num");
         var post_num=$("#inputhidden-post_num").val();
         //alert(comment_num);
         $.ajax({
            type : "get",
            dataType : "text",
            url : "commentlikeinsert",
            data : {
               "comment_num" : comment_num
            },
            success : function() {
               commentoffset = 0;
               $("#commentsection").empty();
               $("#addcomment").hide();
               $("#input" + comment_num).val("");
               $("#input" + comment_num).hide();
               scroll(commentoffset, post_num);
               $("#addcomment").show();
            }
         });

      })

      $(document).on("click", "span.yeslike", function() {

         var comment_num = $(this).attr("comment_num");
         var post_num=$("#inputhidden-post_num").val();
         //alert(comment_num);
         $.ajax({
            type : "get",
            dataType : "text",
            url : "commentlikedelete",
            data : {
               "comment_num" : comment_num
            },
            success : function() {
               commentoffset = 0;
               $("#commentsection").empty();
               $("#addcomment").hide();
               $("#input" + comment_num).val("");
               $("#input" + comment_num).hide();
               scroll(commentoffset, post_num);
               $("#addcomment").show();
            }
         });

      })
      
      $(document).on("click",".commentdel",function(){
         
         var comment_num=$(this).attr("comment_num");
         var post_num=$("#inputhidden-post_num").val();
         $.ajax({
            type:"get",
            dataType:"text",
            url:"cdelete",
            data:{"comment_num":comment_num},
            success:function(){
               commentoffset=0;
               $("#commentsection").empty();
               $("#addcomment").hide();
               $("#input" + comment_num).val("");
               $("#input" + comment_num).hide();
               scroll(commentoffset, post_num);
               $("#addcomment").show();
            }
         })
      })
      
      
      $(document).on("click",".commentmod",function(){
         
         var comment_num=$(this).attr("comment_num");
         $("#div"+comment_num).hide();
         $("#commentmod"+comment_num).show();
      })
      
      $(document).on("keydown",".inputmod",function(){
         
         if (event.keyCode === 13) {
            var comment_num=$(this).attr("comment_num");
            var post_num=$("#inputhidden-post_num").val();
            var comment_content=$(this).val();
            //alert(comment_num + comment_content);
            $.ajax({
               type:"post",
               dataType:"text",
               url:"commentupdate",
               data:{"comment_num":comment_num,"comment_content":comment_content},
               success:function(){
                  commentoffset=0;
                  $("#commentsection").empty();
                  $("#addcomment").hide();
                  $("#input" + comment_num).val("");
                  $("#input" + comment_num).hide();
                  scroll(commentoffset, post_num);
                  $("#addcomment").show();
               }
            });
         };
      })
      
      
      $(document).on("click",".commentspan",function(){
         
         var post_num=$(this).attr("post_num");
         //alert(post_num);
         $("#inputhidden-post_num").val(post_num);
         $("#commentsection").empty();
         scroll(0,post_num);
        $(".cmmodalbtn").trigger("click");
        
         
      })
      
      //예지 비디오 부분 시작
      
      //처음 화면 로딩됐을 때 영상 위치 확인
      $(".fileimg video").each(function(i,ele){
    	  videoStatus($(ele));
      })
      
      //스크롤 할 때마다 영상 위치 확인
      $(window).scroll(function(){
    	  $(".fileimg video").each(function(i,ele){
        	  if(videoStatus($(ele))){
        		  return;
        	  }
          })
      })
      
      //예지 비디오 부분 끝
      
      
   })
   
   
   /* 예지: 영상 화면에 보일 시 자동재생 */
   function videoStatus(video){
	   var viewHeight=$(window).height();
	   var scrollTop=$(window).scrollTop();
	   var y=video.offset().top;
	   var elementHeight=video.height();
 	  
	   if(y<(viewHeight+scrollTop) && y>(scrollTop-elementHeight)){
		   if(video.attr("onwindow")!="true"){
			   video.get(0).play();
			   video.attr("onwindow","true");    
		   }
		   
		   return true;
		}
	   else if(y<(viewHeight+scrollTop) && video.attr("onwindow")!="true"){
		   if(video.attr("onwindow")!="true"){
			   video.get(0).play();
			   video.attr("onwindow","true");  
		   }  
		   
		   return true;
		}
	   else{
		   video.get(0).pause();
		   video.attr("onwindow","false"); 
		   
		   return false;
		}
	}
   /* 예지 자동재생 끝 */
   
   /* 댓글 무한스크롤 */
   function scroll(commentoffset, post_num) {

      $.ajax({
         type : "get",
         dataType : "json",
         url : "scrollcomment",
         data : {
            "commentoffset" : commentoffset,
            "post_num" : post_num
         },
         success : function(res) {

            $.each(res, function(i, item) {

               var s = "";
               var addContent = document.createElement("div");
               s += "<div class='allcomment' style='margin-left:"+item.comment_level*50+"px;'>";
               if (item.comment_level > 0) {
                  s += "<div style='position: relative; left: -50px; top: 30px; height: 0;' >";
                  s += "<img src='../image/re.png' style='width: 30px;\'>";
                  s += "</div>";
               }
               
               if(item.post_user_num ==${sessionScope.user_num} || item.user_num == ${sessionScope.user_num}){
                  
                  s += '<div style="height: 0; width: 450px; position: relative; left: -30px; top: 30px;">';
                  s += '<img src="../image/add.png" class="ulimg" style="width: 20px; float: right;" comment_num="'+item.comment_num+'">';
                  s += '<ul class="list-group commentul" id="ul'+item.comment_num+'">';
                  s += '<li class="list-group-item list-group-item-success commentmod" comment_num="'+item.comment_num+'">수정</li>';
                  s += '<li class="list-group-item list-group-item-danger commentdel" comment_num="'+item.comment_num+'">삭제</li>';
                  s += '</ul>';
                  s += '<div class="comment" id="commentmod'+item.comment_num+'" style="display: none; width: 447px; position: relative; left: 31px; bottom: 31px;">';
                  s += '<img src="/photo/'+item.user_photo+'" class="profile">';
                  s += '<b class="user_name">'+item.user_name+'</b>';
                  s += '<br>';
                  s += '<input type="text" class="inputmod" style="width: 200px;" comment_num="'+item.comment_num+'" value="'+item.comment_content+'">';
                  s += '</div>';
                  s += '</div>';
               }
               
               s += "<div class='comment' id='div"+item.comment_num+"'>";
               s += "<img src='/photo/"+item.user_photo+"' class='profile'>";
               s += "<b class='user_name'>" + item.user_name + "</b><br>";
               s += "<span class='spancontent'>" + item.comment_content + "</span></div>";
               s += "<div class='cmlike'>";

               if (item.like_check == 0) {
                  s += '<span class="glyphicon glyphicon-heart-empty nolike" style="color: red;" comment_num="'+item.comment_num+'">' + item.like_count + '</span>';
               } else {
                  s += '<span class="glyphicon glyphicon-heart yeslike" style="color: red;" comment_num="'+item.comment_num+'">' + item.like_count + '</span>';
               }
               
               s += "<span class='recontent' comment_num='"+item.comment_num+"'>답글달기</span>";
               s += "<span class='comment_writeday'>" + item.perTime + "</span></div>";
               s += '<form method="post" class="form-inline" id="comment'+item.comment_num+'" style="display: none;">';
               s += '<div id="commentaddform">';
               s += '<img src="/photo/${sessionScope.user_photo }" id="commentprofile">';
               s += '<input hidden="hidden" /> ';
               s += '<input type="text" class="input" name="comment_content" placeholder="댓글을 입력하세요" id="input'+item.comment_num+'">';
               s += '<button type="button" class="btn btn-info cminsert" comment_num="'+item.comment_num+'" post_num="'+item.post_num+'"  style="margin-right: 20px;">답글입력</button>';
               s += '</div>';
               s += '</form></div>';
               console.log(s);
               addContent.innerHTML = s;
               document.querySelector('section1').appendChild(addContent);

               var brcontent = document.createElement("div");
               brcontent.innerHTML = "<br>";
               document.querySelector('section1').appendChild(brcontent);

            })
         }
      });
   }
  
</script>



<style type="text/css">
body {
   background-color: #F0F2F5;
}

.allmain {
   width: 1000px;
   height: 100%;
   background-color: #F0F2F5;
}

.divmain {
   margin: 0 auto;
   max-width: 750px;
   min-width: 650px;
   height: 600px;
   border-radius: 10px 10px;
   background-color: white;
}

.top {
   width: 100%;
   height: 10%;
}

.top-left {
   float: left;
   width: 50%;
   height: 100%;
}

.top-right {
   text-align: right;
   float: right;
   width: 50%;
   height: 100%;
}

.center {
   width: 100%;
   height: 78.5%;
}

.center-up {
   width: 100%;
   height: 20%;
}

.center-down {
   text-align: center;
   width: 100%;
   height: 80%;
   overflow: hidden;
}

.bottom {
   width: 100%;
   height: 6.5%;
}

.bottom-up {
   width: 100%;
   height: 10%;
}

.bottom-left {
   text-align: center;
   font-size: 1.2em;
   float: left;
   width: 50%;
   height: 100%;
}

.bottom-right {
   text-align: center;
   font-size: 1.2em;
   float: right;
   width: 50%;
   height: 100%;
}

.bottom-down {
   width: 100%;
   height: 10%;
}

/* 파일 없을 경우  */
.divmain2 {
   margin: 0 auto;
   max-width: 750px;
   min-width: 550px;
   height: 300px;
   border-radius: 10px 10px;
   background-color: white;
}

.top2 {
   width: 100%;
   height: 20%;
}

.top-left2 {
   float: left;
   width: 50%;
   height: 100%;
}

.top-right2 {
   text-align: right;
   float: right;
   width: 50%;
   height: 100%;
}

.center2 {
   width: 100%;
   height: 57%;
}

.center-up2 {
   width: 100%;
   height: 100%;
}

.bottom2 {
   width: 100%;
   height: 13%;
}

.bottom-up2 {
   width: 100%;
   height: 10%;
}

.bottom-left2 {
   text-align: center;
   font-size: 1.2em;
   float: left;
   width: 50%;
   height: 100%;
}

.bottom-right2 {
   text-align: center;
   font-size: 1.2em;
   float: right;
   width: 50%;
   height: 100%;
}

.bottom-down2 {
   width: 100%;
   height: 90%;
}

.postmenu {
   cursor: pointer;
   font-size: 2.5em;
   margin-right: 3%;
   color: gray;
}

.postsubmenu {
   font-size: 1.5em;
}

.postdetail:hover {
   text-decoration: underline;
}

.postdetail {
   font-size: 0.8em;
   color: black;
}

.userimg {
   cursor: pointer;
   width: 40px;
   height: 40px;
   border: 1px solid gray;
   border-radius: 20px;
   margin: 10px;
}

.contentmodal {
   /* background: #F0F2F5; */
   border-radius: 60px;
   margin: 0 auto;
   max-width: 750px;
   min-width: 550px;
}

#writeinput {
   width: 100%;
   border-radius: 30px;
   text-align: left;
   outline: none;
   border: none;
   font-size: 15pt;
   background: #F0F2F5;
   padding: 1.2%;
}

#coverinput {
   background: white;
   height: 65px;
   width: 100%;
   border-radius: 10px;
   padding: 1.5%;
   padding-top: 2%;
}

.writeimg {
   width: 35px;
   height: 35px;
   border: 1px solid gray;
   border-radius: 20px;
}

.postimg {
   width: 35px;
   height: 35px;
   border: 1px solid gray;
   border-radius: 20px;
}

.shows {
   display: none;
   background-color: white;
   margin: 0 auto;
   max-width: 750px;
   min-width: 650px;
   height: 50px;
   border-radius: 10px 10px;
   padding: 0.6%;
   font-size: 18px;
   text-align: center;
}

.showtext {
   float: left;
   padding: 1%;
   margin-left: 10%;
}

.showbtn {
   border-radius: 5px 5px;
   background-color: #F0F2F5;
   border: 0.5px solid gray;
   float: right;
   height: 37px;
}

.commentarrow {
   width: 30px;
   height: 30px;
   margin-right: 3%;
   cursor: pointer;
}

.prev {
   float: left;
   position: relative;
   z-index: 1;
   border: none;
   width: 10%;
   height: 10%;
   cursor: pointer;
   visibility: hidden;
}

.next {
   float: right;
   border: none;
   position: relative;
   z-index: 1;
   width: 10%;
   height: 10%;
   cursor: pointer;
}

.fileimg {
   text-align: center;
   width: 60%;
   height: 350px;
}

.fileimg img {
   width: 100%;
   height: 100%;
   obejct-fit: cover;
}

.fileimg video {
   width: 100%;
   height: 100%;
   obejct-fit: cover;
}

.slider {
   width: 100%;
   margin: 0 auto;
   display: inline-flex;
   justify-content: center;
   align-items: center;
}

.slick-list {
   float: left;
   width: 500px;
}





















/* comment */
.commentmodal-content{
   overflow-y: initial !important
}

.commentmodal-body{
   height: 740px;
   overflow-y: auto;
}

.comment {
   width: 450px;
   border: 1px solid gray;
   border-radius: 40px;
   background-color: #EEEEEE;
   padding-left: 85px;
}

/* 사용자 프로필  */
.profile {
   width: 60px;
   margin-left: -75px;
   border-radius: 100px;
   margin-right: 20px;
   position: relative;
   top: 10px;
}

/* 좋아요,댓글,날짜 */
.cmlike {
   width: 450px;
   margin-top: 10px;
   display: flex;
   justify-content: space-around;
   align-content: center;
}

/* 사용자 이름  */
b.user_name {
   font-size: 1.4em;
}

/* 사용자 댓글  */
span.content {
   font-size: 1.1em;
}

#commentaddform {
   margin-top: 7px;
   height: 60px;
   display: flex;
   justify-content: space-between;
   align-content: center;
}

#commentprofile {
   width: 60px;
   border: 1px solid gray;
   border-radius: 100px;
}

.input {
   width: 700px;
   border: 1px solid gray;
   border-radius: 40px;
   background-color: #EEEEEE;
}

.mominput {
   width: 700px;
   border: 1px solid gray;
   border-radius: 40px;
   background-color: #EEEEEE;
}

.recontent {
   cursor: pointer;
}

.nolike {
   cursor: pointer;
}

.yeslike {
   cursor: pointer;
}

.ulimg {
   cursor: pointer;
}

.commentul {
   float: right;
   list-style: none;
   display: none;
   font-size: 0.7em;
   height: 70px;
}

li{
   cursor:  pointer;
}
</style>
</head>



<body>

   <c:set var="root" value="<%=request.getContextPath()%>" />

   <div class="allmain">
      <br>
      <!-- writemodal -->

      <div class="contentmodal">
         <div id="coverinput">
            <div>
               <span style="float: left; width: 8%; top: 50%;">
                  <img src="${root }/photo/${user_photo}" class="writeimg">
               </span>
               <span style="float: right; width: 92%;">
                  <input type="button" data-toggle="modal" data-target="#contentwrite" name="contentwirte"
                     id="writeinput" value="무슨 생각을 하고 계신가요?">
               </span>
            </div>
         </div>
      </div>

      <br>
       <!-- Modal -->
      <div class="modal fade" id="contentwrite" role="dialog">
         <div class="modal-dialog">

            <!-- Modal content-->
            <form method="post" enctype="multipart/form-data" id="postInsert">

               <input type="hidden" name="user_num" id="user_num" value="${sessionScope.user_num }">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">게시글 만들기</h4>
                  </div>
                  <div class="modal-body">
                     <div class="form-group" style="width: 500px;">
                        <img alt="" src="${root }/photo/${user_photo}"
                           style="width: 40px; height: 40px; border-radius: 20px;">
                        <span>${login_name}</span>
                     </div>
                      <select class="form-control" name="post_access" style="width: 150px;"
                        id="post_access">
                        <option value="all">전체공개</option>
                        <option value="follower">팔로워 공개</option>
                        <option value="onlyme">나만보기</option>
                     </select>
                     
                     <div class="form-group">
                        <textarea style="width: 550px; height: 150px;" name="post_content" class="form-control"
                           required="required" id="post_content" placeholder="내용을 입력해주세요"></textarea>
                           
                     </div>
                     
                     <div class="show" id="show" style="position: relative;">
                 <img id="showimg" style="display:none; width: 500px; height: 150px; border: 1px solid gray; border-radius: 10px;"><br>
                 <video id="showvideo" style="display:none; width: 500px; height: 150px; border: 1px solid gray; border-radius: 10px;" controls="controls"></video>
                 <p id="showtext" style="display:none; position: absolute; top: 65px; left: 190px; font-weight: bold;">사진/동영상 추가</p>
              </div>
                     
                     
                     <input type="file" multiple="multiple" id="post_file" name="post_file"  style="display: none;">
              <button type="button" id="btncontentphoto"style="margin-top: 1%;">사진 선택</button>
                  </div>
                  
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default" data-dismiss="modal" id="insertbtn">게시</button>
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                  </div>
               </div>
            </form>

         </div>
      </div>

      <!-- 수정 Modal -->


      <div class="modal fade" id="updatepost" role="dialog">
         <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">게시글 수정</h4>
               </div>



               <div class="modal-body">
                  <div class="form-group" style="width: 150px;">
                     <select class="form-control" name="update_access" id="update_access" required="required">
                        <option value="all">전체공개</option>
                        <option value="follower">팔로워 공개</option>
                        <option value="onlyme">나만보기</option>
                     </select>
                  </div>
                  <div class="form-group" style="width: 500px;">
                     <input type="file" name="update_file" class="form-control" required="required"
                        multiple="multiple" id="update_file">
                  </div>
                  <div class="form-group">
                     <textarea style="width: 550px; height: 150px;" name="update_content" class="form-control"
                        required="required" id="update_content" placeholder="내용을 입력해주세요"></textarea>
                  </div>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="updatetbtn">수정</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

               </div>
            </div>

         </div>
      </div>


      <section>
         <!-- 파일이 있을경우0 -->
         <!--  동영상일 경우와 사진이 1장만 있을 경우도 .해주어야함   -->

         <c:forEach var="dto" items="${list }" varStatus="i">
            <c:if test="${dto.post_file!='no' }">

               <div class="shows" id="divs${dto.post_num }">
                  <div class="showtext">게시물을 숨겼습니다. 다시 보려면 게시물 보기를 눌러주세요.</div>
                  <button type="button" class="showbtn" divpost_num="div${dto.post_num }"
                     divspost_num="divs${dto.post_num }">게시물 보기</button>
               </div>
               <div class="divmain" id="div${dto.post_num }">
                  <div class="top">
                     <div class="top-left">
                        <span style="float: left;">
                           <img src="${root }/photo/${dto.user_photo}" class="userimg" user_num="${dto.user_num }">
                        </span>
                        <span style="float: left; padding: 3%; margin-right: 5px;">
                           <div>
                              <b>${dto.user_name }
                                 <c:if test="${dto.post_access =='follower'}">
                                    <i class="fa-solid fa-user-group"></i>
                                 </c:if>
                                 <c:if test="${dto.post_access =='all'}">
                                    <i class="fa-solid fa-earth-americas"></i>
                                 </c:if>
                                 <c:if test="${dto.post_access =='onlyme'}">
                                    <i class="fa-solid fa-lock"></i>
                                 </c:if>

                              </b>
                           </div>

                           <div>${dto.post_time }</div>
                        </span>
                     </div>
                     <span class="top-right">
                        <span class="postmenu dropdown" post_num="${dto.post_num }"
                           user_num="${sessionScope.user_num }" dtouser_num="${dto.user_num}">
                           <i class="fa-solid fa-ellipsis"></i>
                           <c:if test="${dto.checklogin ==1 }">

                              <ul id="${dto.post_num }" class="dropdown-menu dropdown-menu-right postsubmenu "
                                 style="font-size: 20pt; line-height: 1.5em; display: none;">


                                 <li id="postupdate" class="postdetail" data-toggle="modal" data-target="#updatepost"
                                    post_num="${dto.post_num }" user_num="${dto.user_num }">게시물 수정</li>
                                 <li id="postdelete" class="postdetail" user_num="${dto.user_num }"
                                    post_num="${dto.post_num }">게시물 삭제</li>
                              </ul>
                           </c:if>
                           <c:if test="${dto.checklogin !=1 }">
                              <ul id="${dto.post_num }" class="dropdown-menu dropdown-menu-right postsubmenu"
                                 style="font-size: 25pt; line-height: 1.5em; display: none;">
                                 <li class="postdetail posthide" divpost_num="div${dto.post_num }"
                                    divspost_num="divs${dto.post_num }">게시물 숨김</li>
                                 <!--  이부분 팔로일땐 팔로우하기 or 팔로우 하고 있을 땐 팔로우 끊기 -->
                                 <c:if test="${dto.checkfollowing !=1 }">
                                    <li class="postdetail" id="postfollow" from_user="${sessionScope.user_num }"
                                       to_user="${dto.user_num }">팔로우 하기</li>
                                 </c:if>
                                 <c:if test="${dto.checkfollowing ==1 }">
                                    <li class="postdetail" id="postunfollow" to_user="${dto.user_num }">팔로우 끊기</li>
                                 </c:if>
                              </ul>
                           </c:if>
                        </span>
                     </span>

                  </div>




                  <div class="center">
                     <div class="center-up">${dto.post_content }</div>

                     <div class="center-down slider" >
                     	<c:forTokens items="${dto.post_file }" delims="." var="filetype" begin="1">
                     	
                     	<!-- 예지: 파일이 사진인지 영상인지 확인 -->
                     		<c:if test="${filetype=='mp4' || filetype=='avi'}">
                     			<div class="fileimg">
                     				<video src="/post_file/${dto.post_file }" controls="controls" muted="muted"></video>
                     			</div>
                     		</c:if>
                     		<c:if test="${filetype!='mp4' }">
                     			<c:forTokens items="${dto.post_file }" delims="," var="file">
		                           <div class="fileimg">
		                              <img src="/post_file/${file }">
		                           </div>
		                        </c:forTokens>
                     		</c:if>
                     	</c:forTokens>
                     	
                     	<!-- 예지 끝 -->

                        <%-- <img src="/post_file/${dto.post_file }" class="fileimg"> --%>

                     </div>
                  </div>


                  <div class="bottom">
                     <hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
                     <div class="bottom-up">

                        <!-- 체크 안했으면 보이는거 -->
                        <c:if test="${dto.likecheck ==0 }">
                           <span class="bottom-left liketoggle" style="cursor: pointer"
                              user_num="${sessionScope.user_num}" likehide1_num="likehide1${dto.post_num}"
                              likeshow1_num="likeshow1${dto.post_num}" post_num="${dto.post_num }">
                              <span class="like" id="likehide1${dto.post_num}" user_num="${sessionScope.user_num}"
                                 likehide1_num="likehide1${dto.post_num}" likeshow1_num="likeshow1${dto.post_num}"
                                 post_num="${dto.post_num }">
                                 <span style="font-size: 1.2em; top: 3px; color: gray;">
                                    <i class="fa-regular fa-thumbs-up"></i>
                                 </span>
                                 <c:if test="${dto.like_count==0 }">
                                 &nbsp;좋아요 ${dto.like_count}
                                 </c:if>
                                 <c:if test="${dto.like_count !=0 }">
                                 &nbsp;좋아요 ${dto.like_count}명
                                 </c:if>
                              </span>
                              <span class="dlike" id="likeshow1${dto.post_num}" user_num="${sessionScope.user_num}"
                                 post_num="${dto.post_num }" style="display: none;">
                                 <span style="font-size: 1.2em; top: 3px; color: blue;">
                                    <i class="fa-solid fa-thumbs-up"></i>
                                 </span>
                                 <c:if test="${dto.like_count==0 }">
                                 &nbsp;좋아요 회원님 
                                 </c:if>
                                 <c:if test="${dto.like_count !=0 }">
                                 &nbsp;좋아요 회원님 외${dto.like_count}명
                                 </c:if>
                              </span>

                           </span>


                        </c:if>

                        <!-- 처음부터 체크되어있으면 보이는거  -->
                        <c:if test="${dto.likecheck !=0 }">
                           <span class="bottom-left liketoggle2" style="cursor: pointer"
                              likehide2_num="likehide2${dto.post_num}" likeshow2_num="likeshow2${dto.post_num}"
                              user_num="${sessionScope.user_num}" post_num="${dto.post_num }">
                              <span id="likehide2${dto.post_num}" class="dlike" user_num="${sessionScope.user_num}"
                                 likehide1_num="likehide1${dto.post_num}" likeshow1_num="likeshow1${dto.post_num}"
                                 post_num="${dto.post_num }">
                                 <span style="font-size: 1.2em; top: 3px; color: blue;">
                                    <i class="fa-solid fa-thumbs-up"></i>
                                 </span>

                                 <c:if test="${dto.like_count!= 1}">
                                 &nbsp;좋아요 회원님 외 ${dto.like_count-1}명
                                 </c:if>
                                 <c:if test="${dto.like_count ==1 }">
                                 &nbsp;좋아요 회원님 
                                 </c:if>
                              </span>
                              <span user_num="${sessionScope.user_num}" id="likeshow2${dto.post_num}" class="like"
                                 post_num="${dto.post_num }" style="display: none;">
                                 <span style="font-size: 1.2em; top: 3px; color: gray;">
                                    <i class="fa-regular fa-thumbs-up"></i>
                                    <c:if test="${dto.like_count== 1}">
                                 &nbsp;좋아요 0
                                 </c:if>
                                    <c:if test="${dto.like_count!= 1}">
                                 &nbsp;좋아요 ${dto.like_count -1 }
                                 </c:if>

                                 </span>
                              </span>


                           </span>
                        </c:if>



                        <!-- comment -->
                        <span class="bottom-right commentspan"  style="cursor: pointer;"  post_num="${dto.post_num }">
                           <span style="font-size: 1.3em; color: gray;">
                              <i class="fa-regular fa-comment"></i>
                           </span>
                           &nbsp;댓글
                        </span>

                     </div>

                  </div>

               </div>
               <br>
               <br>
            </c:if>

            <!-- 파일이 없을 경우 -->
            <c:if test="${dto.post_file=='no' }">
               <div class="shows" id="divs${dto.post_num }">
                  <div class="showtext">게시물을 숨겼습니다. 다시 보려면 게시물 보기를 눌러주세요.</div>
                  <button type="button" class="showbtn" divpost_num="div${dto.post_num }"
                     divspost_num="divs${dto.post_num }">게시물 보기</button>
               </div>
               <div class="divmain2" id="div${dto.post_num }">
                  <div class="top2">
                     <div class="top-left2">
                        <span style="float: left;">
                           <img src="${root }/photo/${dto.user_photo}" class="userimg" user_num="${dto.user_num }">
                        </span>
                        <span style="float: left; padding: 3%; margin-right: 5px;">
                           <div>
                              <b>${dto.user_name }
                                 <c:if test="${dto.post_access =='follower'}">
                                    <i class="fa-solid fa-user-group"></i>
                                 </c:if>
                                 <c:if test="${dto.post_access =='all'}">
                                    <i class="fa-solid fa-earth-americas"></i>
                                 </c:if>
                                 <c:if test="${dto.post_access =='onlyme'}">
                                    <i class="fa-solid fa-lock"></i>
                                 </c:if>


                              </b>
                           </div>

                           <div>${dto.post_time }</div>
                        </span>
                     </div>
                     <span class="top-right2">
                        <span class="postmenu dropdown" post_num="${dto.post_num }"
                           user_num="${sessionScope.user_num }" dtouser_num="${dto.user_num}">
                           <i class="fa-solid fa-ellipsis"></i>
                           <c:if test="${dto.checklogin ==1 }">

                              <ul id="${dto.post_num }" class="dropdown-menu dropdown-menu-right postsubmenu"
                                 style="font-size: 20pt; line-height: 1.5em; display: none;">


                                 <li id="postupdate" class="postdetail" data-toggle="modal" data-target="#updatepost"
                                    post_num="${dto.post_num }" user_num="${dto.user_num }">게시물 수정</li>
                                 <li id="postdelete" class="postdetail" user_num="${dto.user_num }"
                                    post_num="${dto.post_num }">게시물 삭제</li>
                              </ul>
                           </c:if>
                           <c:if test="${dto.checklogin !=1 }">
                              <ul id="${dto.post_num }" class="dropdown-menu dropdown-menu-right postsubmenu"
                                 style="font-size: 25pt; line-height: 1.5em; display: none;">
                                 <li class="postdetail posthide" divpost_num="div${dto.post_num }"
                                    divspost_num="divs${dto.post_num }">게시물 숨김</li>
                                 <c:if test="${dto.checkfollowing !=1 }">
                                    <li class="postdetail" id="postfollow" from_user="${sessionScope.user_num }"
                                       to_user="${dto.user_num }">팔로우 하기</li>
                                 </c:if>
                                 <c:if test="${dto.checkfollowing ==1 }">
                                    <li class="postdetail" id="postunfollow" to_user="${dto.user_num }">팔로우 끊기</li>
                                 </c:if>
                              </ul>
                           </c:if>
                        </span>

                     </span>
                  </div>
                  <div class="center2">
                     <div class="center-up2">${dto.post_content }</div>

                  </div>
                  <hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
                  <div class="bottom2">
                     <div class="bottom-up2">



                        <!-- 체크 안했으면 보이는거 -->
                        <c:if test="${dto.likecheck ==0 }">
                           <span class="bottom-left2 liketoggle" style="cursor: pointer"
                              user_num="${sessionScope.user_num}" likehide1_num="likehide1${dto.post_num}"
                              likeshow1_num="likeshow1${dto.post_num}" post_num="${dto.post_num }">
                              <span class="like" id="likehide1${dto.post_num}" user_num="${sessionScope.user_num}"
                                 likehide1_num="likehide1${dto.post_num}" likeshow1_num="likeshow1${dto.post_num}"
                                 post_num="${dto.post_num }">
                                 <span style="font-size: 1.2em; top: 3px; color: gray;">
                                    <i class="fa-regular fa-thumbs-up"></i>
                                 </span>
                                 <c:if test="${dto.like_count==0 }">
                                 &nbsp;좋아요 ${dto.like_count}
                                 </c:if>
                                 <c:if test="${dto.like_count !=0 }">
                                 &nbsp;좋아요 ${dto.like_count}명
                                 </c:if>
                              </span>
                              <span class="dlike" id="likeshow1${dto.post_num}" user_num="${sessionScope.user_num}"
                                 post_num="${dto.post_num }" style="display: none;">
                                 <span style="font-size: 1.2em; top: 3px; color: blue;">
                                    <i class="fa-solid fa-thumbs-up"></i>
                                 </span>
                                 <c:if test="${dto.like_count==0 }">
                                 &nbsp;좋아요 회원님 
                                 </c:if>
                                 <c:if test="${dto.like_count !=0 }">
                                 &nbsp;좋아요 회원님 외${dto.like_count}명
                                 </c:if>
                              </span>

                           </span>


                        </c:if>

                        <!-- 처음부터 체크되어있으면 보이는거  -->
                        <c:if test="${dto.likecheck !=0 }">
                           <span class="bottom-left2 liketoggle2" style="cursor: pointer"
                              likehide2_num="likehide2${dto.post_num}" likeshow2_num="likeshow2${dto.post_num}"
                              user_num="${sessionScope.user_num}" post_num="${dto.post_num }">
                              <span id="likehide2${dto.post_num}" class="dlike" user_num="${sessionScope.user_num}"
                                 likehide1_num="likehide1${dto.post_num}" likeshow1_num="likeshow1${dto.post_num}"
                                 post_num="${dto.post_num }">
                                 <span style="font-size: 1.2em; top: 3px; color: blue;">
                                    <i class="fa-solid fa-thumbs-up"></i>
                                 </span>

                                 <c:if test="${dto.like_count!= 1}">
                                 &nbsp;좋아요 회원님 외 ${dto.like_count-1}명
                                 </c:if>
                                 <c:if test="${dto.like_count ==1 }">
                                 &nbsp;좋아요 회원님 
                                 </c:if>
                              </span>
                              <span user_num="${sessionScope.user_num}" id="likeshow2${dto.post_num}" class="like"
                                 post_num="${dto.post_num }" style="display: none;">
                                 <span style="font-size: 1.2em; top: 3px; color: gray;">
                                    <i class="fa-regular fa-thumbs-up"></i>
                                    <c:if test="${dto.like_count== 1}">
                                 &nbsp;좋아요 0
                                 </c:if>
                                    <c:if test="${dto.like_count!= 1}">
                                 &nbsp;좋아요 ${dto.like_count -1 }
                                 </c:if>

                                 </span>
                              </span>


                           </span>
                        </c:if>




                        <!-- comment -->
                        <span class="bottom-right2 commentspan" style="cursor: pointer;" post_num="${dto.post_num }">
                           <span style="font-size: 1.2em; top: 3px; color: gray;">
                              <i class="fa-regular fa-comment"></i>
                           </span>
                           &nbsp;댓글
                        </span>

                     </div>


                  </div>


               </div>

               <br>
               <br>
            </c:if>
         </c:forEach>
      </section>















      

      

     <button type="button" class="btn btn-info btn-lg cmmodalbtn hide" data-toggle="modal" data-target="#commentmodal"></button>
      <!-- comment -->
      <div id="commentmodal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
               <!-- Modal content-->
               <div class="modal-content commentmodal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title commenth4">${dto.user_name }의게시물</h4>
                  </div>
                  <div class="modal-body commentmodal-body" style="max-height: 800px;">
                     <!-- 타임라인 -->
                     
                     <br>
                     <hr>
                     <section1 id="commentsection">
                        <!-- 댓글 나올 부분 -->
                     </section1>
                     <button type="button" class="btn btn-success" id="addcomment">댓글 더보기</button>
                  </div>
                  <div class="modal-footer" style="height: 80px; padding: 0;">
                     <form method="post" class="form-inline" id="form">
                        <input type="hidden" name="comment_num" value="0">
                        <input type="hidden" name="post_num" id="inputhidden-post_num">
                        <div id="commentaddform">
                           <img src="/photo/${sessionScope.user_photo }" id="commentprofile">
                           <input hidden="hidden" />
                           <input type="text" class="mominput" name="comment_content" placeholder="댓글을 입력하세요" id="commentinput">
                           <button type="button" id="insertcommentbtn" class="btn btn-info" style="margin-right: 20px;">입력</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
   </div>
</body>
</html>