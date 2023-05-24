<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<div>
    <p style="margin-top:150px; font-size: 3em;"><b>비밀번호 수정</b></p><br>
    <form action="/user/updatePassword" method="post">
        <input type="hidden" id="user_num" name="user_num" value="${sessionScope.user_num}">
        <input type="password" class="form-control" id="user_pass" name="user_pass"
               placeholder="비밀번호 입력" required pattern=".{6,20}" title="6자리 이상 20자리 이하로 작성하세요."
               onchange="check_pw()"><br>
        <input type="password" class="form-control" id="user_pass_r" name="user_pass_r"
               placeholder="비밀번호 다시 입력" required onchange="check_pw()">
        <span id="check"></span>
        <button type="submit" class="btn btn-primary" style="text-align: center;">비밀번호 수정</button>
    </form>
</div>
</body>
<script>
    // 회원가입 시 비밀번호 유효성 검사. 비밀번호 다시입력 일치 판별
    function check_pw() {
        var pw = document.getElementById('user_pass').value;
        var SC = ["!", "@", "#", "$", "%"];
        var check_SC = 0; //특수문자 있는지 없는지 판별

        for (var i = 0; i < SC.length; i++) {
            if (pw.indexOf(SC[i]) != -1) { //일치하는 값이 없으면 -1반환
                check_SC = 1;
            }
        }
        if (check_SC == 0) {
            window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
            document.getElementById('user_pass').value = '';
            document.getElementById('user_pass_r').value = '';
        }
        if (document.getElementById('user_pass').value != '' && document.getElementById('user_pass_r').value != '') {
            if (document.getElementById('user_pass').value == document.getElementById('user_pass_r').value) {
                document.getElementById('check').innerHTML = '비밀번호가 일치합니다.'
                document.getElementById('check').style.color = 'blue';
            } else {
                document.getElementById('check').innerHTML = '비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color = 'red';
            }
        }
    } // 회원가입 버튼 눌렀을때, 유효성 검사 불통시 회원가입 안되게 막는다.
    function validateForm() {
        var password = document.getElementById("user_pass").value;
        var confirmPassword = document.getElementById("user_pass_r").value;

        if (password !== confirmPassword) {
            //alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        return true;
    }
</script>
</html>
