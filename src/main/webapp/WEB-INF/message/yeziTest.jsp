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

<script type="text/javascript">


<!-- 파일이 있는 경우 -->
var s='';

if (dto.post_file != 'no') {

	s += "<div class='shows' id='divs" + dto.post_num + "'>";
	s += "<div class='showtext'>게시물을 숨겼습니다. 다시보려면 게시물을 눌러주세요.</div>";
	s += "<button type='button' class='showbtn' divpost_num='div" + dto.post_num + "' divspost_num='divs" + dto.post_num + "'>게시물보기</button></div>";
	
	s+='<div class="divmain" id="div'+dto.post_num+'">';
	s+='<div class="top">';
	s+='<div class="top-left">';
	s+='<div style="float: left;" class="userimgdiv">';
	s+='<img src="${root }/photo/'+dto.user_photo'+" class="userimg" user_num="'+dto.user_num+'">';
	s+='</div>';
	s+='<span style="float: left; padding: 3%; margin-right: 5px;">';
	s+='<div>';
	s+='<b>+'dto.user_name;
	
	if (dto.post_access == 'follower') {
	    s += "<i class='fa-solid fa-user-group'></i>";
	  }
	  if (dto.post_access == 'all') {
	    s += "<i class='fa-solid fa-earth-americas'></i>";
	  }
	  if (dto.post_access == 'onlyme') {
	    s += "<i class='fa-solid fa-lock'></i>";
	  }
	
	s+='</b></div>';
	s+='<div>'+dto.post_time+'</div></span></div>';
	s+='<span class="top-right">';
	
	if (dto.user_num != ${sessionScope.user_num} && dto.checkfollowing != 1){
		s += "<span class='follow' id='follow" + dto.post_num + "' followpost_num='follow" + dto.post_num + "' unfollowpost_num='unfollow" + dto.user_num + "' from_user='${sessionScope.user_num}' to_user='" + dto.user_num + "'>팔로우하기</span> ";
	    s += "<span class='unfollow' id='unfollow" + dto.post_num + "' followpost_num='follow" + dto.post_num + "' unfollowpost_num='unfollow" + dto.user_num + "' style='display:none;'>팔로우 끊기</span> ";
	}
	
	if (dto.user_num != ${sessionScope.user_num} && dto.checkfollowing == 1) {
	    s += "<span class='unfollow' id='unfollow" + dto.post_num + "' followpost_num='follow" + dto.post_num + "' unfollowpost_num='unfollow" + dto.user_num + "'>팔로우 끊기</span> ";
	    s += "<span class='follow' id='follow" + dto.post_num + "' followpost_num='follow" + dto.post_num + "' unfollowpost_num='unfollow" + dto.user_num + "' from_user='${sessionScope.user_num}' to_user='" + dto.user_num + "' style='display:none;'>팔로우 하기</span> ";
	}
	
	s+='<span class="postmenu dropdown" post_num="'+{dto.post_num }+'"';
	s+='user_num="${sessionScope.user_num }" dtouser_num="'+${dto.user_num}+'">';
	s+='<i class="fa-solid fa-ellipsis"></i>';
	
	if (dto.checklogin == 1) {
	    s += "<ul id='" + dto.post_num + "' class='dropdown-menu dropdown-menu-right postsubmenu' style='font-size: 20pt; line-height: 1.5em; display: none;'>";
	    s += "<li id='postupdate' class='postdetail' data-toggle='modal' data-target='#updatepost' post_num='" + dto.post_num + "' user_num='" + dto.user_num + "'>게시물 수정</li>";
	    s += "<li id='postdelete' class='postdetail' user_num='" + dto.user_num + "' post_num='" + dto.post_num + "'>게시물 삭제</li></ul>";
	}
	
	if (dto.checklogin != 1) {
	    s += "<ul id='" + dto.post_num + "' class='dropdown-menu dropdown-menu-right postsubmenu' style='font-size: 25px; line-height:1.5em;display:none;'>";
	    s += "<li class='postdetail posthide' divpost_num='div" + dto.post_num + "' divspost_num='divs" + dto.post_num + "'>게시물 숨김</li></ul>";
	
	}
	
	s += "</span></span></div>";
	
	s+='<div class="center">';
	s+='<div class="center-up">'+dto.post_content+'</div>';
	s+='<div class="center-down sliders" id="dto-'+dto.post_num+'">';
						<!-- 예지: 파일이 사진인지 영상인지 확인 -->
	if((dto.post_file).includes('.mp4')){
		s+='<div class="fileimg">';
		s+='<video src="/post_file/'+dto.post_file+'" controls="controls" muted="muted"></video>';
		s+='</div>';
	}else{
		var files = dto.post_file.split(',');
		
		for(var i = 0; i < files.length; i++){
			var file = files[i].trim();
			s+='<div class="fileimg">';
			s+='<a href="/post_file/+'file+'" target="_new" style="text-decoration: none; outline: none;">';
			s+='<img src="/post_file/'+file+'"></a></div>';
		}
	}
			
	s+="</div></div>";
	
	s+='<div class="bottom">';
	s+='<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">';
	s+='<div class="bottom-up">';
	
	if (dto.likecheck == 0){
		s += "<span class='bottom-left liketoggle' style='cursor:pointer' user_num='${sessionScope.user_num}' likehide1_num='likehide1" + dto.post_num + "' likeshow1_num='likeshow1" + dto.post_num + "' post_num='" + dto.post_num + "'>";
	    s += "<span class='like' id='likehide1" + dto.post_num + "' user_num='${sessionScope.user_num}' likehide1_num='likehide1" + dto.post_num + "' likeshow1_num='likeshow1" + dto.post_num + "' post_num='" + dto.post_num + "'>";
	    s += "<span style='font-size: 1.2em; top: 3px; color: gray;'><i class='fa-regular fa-thumbs-up'></i></span>";
	
	    if (dto.like_count == 0) {
	      s += "&nbsp;좋아요 " + dto.like_count;
	    }
	    if (dto.like_count != 0) {
	      s += "&nbsp;좋아요 " + dto.like_count + "명";
	    }
	    s += "</span>";
	    s += "<span class='dlike' id='likeshow1" + dto.post_num + "' user_num='${sessionScope.user_num}'";
	    s += 'post_num="' + dto.post_num + '" style="display: none;">';
	    s += '<span style="font-size: 1.2em; top: 3px; color: blue;">';
	    s += '<i class="fa-solid fa-thumbs-up"></i>';
	    s += '</span>';
	    if (dto.like_count == 0) {
	      s += ' &nbsp;좋아요 회원님 ';
	    }
	
	    if (dto.like_count != 0) {
	      s += '&nbsp;좋아요 회원님 외' + dto.like_count + '명';
	    }
	
	    s += '</span></span>'
	}
	
	if (dto.likecheck != 0) {
	
	    s += '<span class="bottom-left liketoggle2" style="cursor: pointer" ';
	    s += 'likehide2_num="likehide2' + dto.post_num + '" likeshow2_num="likeshow2' + dto.post_num + '" ';
	    s += 'user_num="${sessionScope.user_num}" post_num="' + dto.post_num + '">';
	    s += '<span id="likehide2' + dto.post_num + '" class="dlike" user_num="${sessionScope.user_num}" ';
	    s += 'likehide1_num="likehide1' + dto.post_num + '" likeshow1_num="likeshow1' + dto.post_num + '" ';
	    s += 'post_num="' + dto.post_num + '">';
	    s += '<span style="font-size: 1.2em; top: 3px; color: blue;">';
	    s += '<i class="fa-solid fa-thumbs-up"></i>';
	    s += '</span>';
	
	
	    if (dto.like_count != 1) {
	      s += '&nbsp;좋아요 회원님 외 ' + (dto.like_count - 1) + '명';
	    }
	    if (dto.like_count == 1) {
	      s += '&nbsp;좋아요 회원님 ';
	    }
	    s += '</span>';
	    s += '<span user_num="${sessionScope.user_num}" id="likeshow2' + dto.post_num + '" class="like"';
	    s += 'post_num="' + dto.post_num + '" style="display: none;">';
	    s += '<span style="font-size: 1.2em; top: 3px; color: gray;">';
	    s += '<i class="fa-regular fa-thumbs-up"></i>';
	    if (dto.like_count == 1) {
	      s += '&nbsp;좋아요 회원님 ';
	      s += '&nbsp;좋아요 ' + (dto.like_count - 1) + '명';
	    }
	    s += '</span></span></span>';
	
	
	  }
	s += '<span class="bottom-right commentspan" style="cursor: pointer;" user_name="' + dto.user_name + '"';
	s += 'post_num="' + dto.post_num + '">';
	s += '<span style="font-size: 1.3em; color: gray;">';
	s += '<i class="fa-regular fa-comment"></i>';
	s += '</span>';
	s += '&nbsp;댓글 ' + dto.comment_count;
	s += '</span></div></div></div><br><br>';
	
}else{
	//파일이 없을 경우
	s += "<div class='shows' id='divs" + dto.post_num + "'>";
    s += "<div class='showtext'>게시물을 숨겼습니다. 다시보려면 게시물을 눌러주세요.</div>";
    s += "<button type='button' class='showbtn' divpost_num='div" + dto.post_num + "' divspost_num='divs" + dto.post_num + "'>게시물보기</button></div>";

    s+='<div class="divmain2" id="div'+dto.post_num+'">';
    s+='<div class="top2">';
    s+='<div class="top-left2">';
    s+='<span style="float: left;" class="userimgdiv">';
    s+='<img src="${root }/photo/'+dto.user_photo+'" class="userimg" user_num="'+dto.user_num+'"></span>';
    s+='<span style="float: left; padding: 3%; margin-right: 5px;">';
    s+='<div>';
    s+='<b>'+dto.user_name;
    
    if (dto.post_access == 'follower') {
        s += "<i class='fa-solid fa-user-group'></i>";
     }
    if (dto.post_access == 'all') {
        s += "<i class='fa-solid fa-earth-americas'></i>";
     }
    if (dto.post_access == 'onlyme') {
        s += "<i class='fa-solid fa-lock'></i>";
     }
    
    s+='</b></div>';

    s+='<div>'+dto.post_time+'</div></span></div>';
    s+='<span class="top-right2">';
    
    if (dto.user_num != ${sessionScope.user_num} && dto.checkfollowing != 1) {
        s += "<span class='follow' id='follow" + dto.post_num + "' followpost_num='follow" + dto.post_num + "' unfollowpost_num='unfollow" + dto.user_num + "' from_user='${sessionScope.user_num}' to_user='" + dto.user_num + "'>팔로우하기</span> ";
        s += "<span class='unfollow' id='unfollow" + dto.post_num + "' followpost_num='follow" + dto.post_num + "' unfollowpost_num='unfollow" + dto.user_num + "' style='display:none;'>팔로우 끊기</span> ";
      }
    
    if (dto.user_num != ${sessionScope.user_num} && dto.checkfollowing == 1) {
        s += "<span class='unfollow' id='unfollow" + dto.post_num + "' followpost_num='follow" + dto.post_num + "' unfollowpost_num='unfollow" + dto.user_num + "'>팔로우 끊기</span> ";
        s += "<span class='follow' id='follow" + dto.post_num + "' followpost_num='follow" + dto.post_num + "' unfollowpost_num='unfollow" + dto.user_num + "' from_user='${sessionScope.user_num}' to_user='" + dto.user_num + "' style='display:none;'>팔로우 하기</span> ";
      }
    
    s += "<span class='postmenu dropdown' post_num='" + dto.post_num + "' user_num='${sessionScope.user_num}' dtouser_num='" + dto.user_num + "'>";

    s += "<i class='fa-solid fa-ellipsis'></i>";

    if (dto.checklogin == 1) {
      s += "<ul id='" + dto.post_num + "' class='dropdown-menu dropdown-menu-right postsubmenu' style='font-size: 20pt; line-height: 1.5em; display: none;'>";
      s += "<li id='postupdate' class='postdetail' data-toggle='modal' data-target='#updatepost' post_num='" + dto.post_num + "' user_num='" + dto.user_num + "'>게시물 수정</li>";
      s += "<li id='postdelete' class='postdetail' user_num='" + dto.user_num + "' post_num='" + dto.post_num + "'>게시물 삭제</li></ul>";
    }
    if (dto.checklogin != 1) {
      s += "<ul id='" + dto.post_num + "' class='dropdown-menu dropdown-menu-right postsubmenu' style='font-size: 25px; line-height:1.5em;display:none;'>";
      s += "<li class='postdetail posthide' divpost_num='div" + dto.post_num + "' divspost_num='divs" + dto.post_num + "'>게시물 숨김</li></ul>";

    }
                   
    s += "</span></span></div>";

    s+='<div class="center2">';
    s+='<div class="center-up2">'+dto.post_content+'</div></div>';

    s+='<div class="bottom2">';
    s+='<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">';
    s+='<div class="bottom-up2">';

    if (dto.likecheck == 0) {
        s += "<span class='bottom-left2 liketoggle' style='cursor:pointer' user_num='${sessionScope.user_num}' likehide1_num='likehide1" + dto.post_num + "' likeshow1_num='likeshow1" + dto.post_num + "' post_num='" + dto.post_num + "'>";
        s += "<span class='like' id='likehide1" + dto.post_num + "' user_num='${sessionScope.user_num}' likehide1_num='likehide1" + dto.post_num + "' likeshow1_num='likeshow1" + dto.post_num + "' post_num='" + dto.post_num + "'>";
        s += "<span style='font-size: 1.2em; top: 3px; color: gray;'><i class='fa-regular fa-thumbs-up'></i></span>";

        if (dto.like_count == 0) {
          s += "&nbsp;좋아요 " + dto.like_count;
        }
        if (dto.like_count != 0) {
          s += "&nbsp;좋아요 " + dto.like_count + "명";
        }
        s += "</span>";
        s += "<span class='dlike' id='likeshow1" + dto.post_num + "' user_num='${sessionScope.user_num}'";                                   s += 'post_num="' + dto.post_num + '" style="display: none;">';
        s += '<span style="font-size: 1.2em; top: 3px; color: blue;">';
        s += '<i class="fa-solid fa-thumbs-up"></i>';
        s += '</span>';
        if (dto.like_count == 0) {
          s += ' &nbsp;좋아요 회원님 ';
        }

        if (dto.like_count != 0) {
          s += '&nbsp;좋아요 회원님 외' + dto.like_count + '명';
        }

        s += '</span></span>'

      }


      if (dto.likecheck != 0) {

        s += '<span class="bottom-left2 liketoggle2" style="cursor: pointer" ';
        s += 'likehide2_num="likehide2' + dto.post_num + '" likeshow2_num="likeshow2' + dto.post_num + '" ';
        s += 'user_num="${sessionScope.user_num}" post_num="' + dto.post_num + '">';
        s += '<span id="likehide2' + dto.post_num + '" class="dlike" user_num="${sessionScope.user_num}" ';
        s += 'likehide1_num="likehide1' + dto.post_num + '" likeshow1_num="likeshow1' + dto.post_num + '" ';
        s += 'post_num="' + dto.post_num + '">';
        s += '<span style="font-size: 1.2em; top: 3px; color: blue;">';
        s += '<i class="fa-solid fa-thumbs-up"></i>';
        s += '</span>';


        if (dto.like_count != 1) {
          s += '&nbsp;좋아요 회원님 외 ' + (dto.like_count - 1) + '명';
        }
        if (dto.like_count == 1) {
          s += '&nbsp;좋아요 회원님 ';
        }
        s += '</span>';
        s += '<span user_num="${sessionScope.user_num}" id="likeshow2' + dto.post_num + '" class="like"';
        s += 'post_num="' + dto.post_num + '" style="display: none;">';
        s += '<span style="font-size: 1.2em; top: 3px; color: gray;">';
        s += '<i class="fa-regular fa-thumbs-up"></i>';
        if (dto.like_count == 1) {
          s += '&nbsp;좋아요 회원님 ';
          s += '&nbsp;좋아요 ' + (dto.like_count - 1) + '명';
        }
        s += '</span></span></span>';


      }

      s += '<span class="bottom-right2 commentspan" style="cursor: pointer;" user_name="' + dto.user_name + '"';
      s += 'post_num="' + dto.post_num + '">';
      s += '<span style="font-size: 1.3em; color: gray;">';
      s += '<i class="fa-regular fa-comment"></i>';
      s += '</span>';
      s += '&nbsp;댓글 ' + dto.comment_count;
      s += '</span></div></div></div><br><br>';

}

</script>
</head>
<body>

</body>
</html>