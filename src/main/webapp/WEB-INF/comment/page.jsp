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
<style>
    html, body{ margin: 0; }
    h1 {position: fixed; top: 0; width: 100%; height: 60px; text-align: center; background: white; margin: 0; line-height: 60px;}
    section .box {height: 500px; background: red;}
    section .box p {margin: 0; color: white; padding: 80px 20px;}
    section .box:nth-child(2n) {background: blue;}
    .abcd{
    	font-size: 2em;
    }
  </style>
</head>
<body>
  <section>
    <div class="box">
      <p>
        1번째 블록
      </p>
    </div>
    <div class="box">
      <p>
        2번째 블록
      </p>
    </div>
  </section>
  <script>
    window.onscroll = function(e) {
      console.log(window.innerHeight , window.scrollY,document.body.offsetHeight,document.body.scrollHeight)
      if((window.innerHeight + window.scrollY) >= document.body.scrollHeight) { 
        setTimeout(function(){
        	
        	
          var addContent = document.createElement("div");
          addContent.classList.add("box")
          addContent.innerHTML = '<p class="abcd">${count}번째 블록</p>';
          document.querySelector('section').appendChild(addContent);
        }, 1000)  
      }
    }
  </script>
  <!-- 희수01 -->
</body>
</html>