<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	font-size: 1.3em;
	font-family: 'Jua';
}

div.layout div {
	
}

div.layout div.title {
	position: fixed;
	width: 100%;
	height: 80px;
	background-color: white;
	z-index: 1;
}

/* div.layout div.menu {
	position: fixed;
	margin-top: 80px;
	width: 200px;
	height: 100%;
	background-color: pink;
} */

div.layout div.main {
	max-width: 100%;
	min-width: 400px;

	height: 100%;
	background-color: skyblue;

	margin: 0 auto;
	padding-top: 65px;
}

/* div.layout div.sideinfo {
	position: fixed;
	right: 0px;
	margin-top: 80px;
	width: 200px;
	height: 100%;
	background-color: lightgray;
} */
</style>

<script type="text/javascript">
	$(function() {
		side_change();

		$(window).resize(function() {
			side_change();
		});
	})

	/* function side_change() {
		var windowWidth = $(window).width();
		if (windowWidth < 900) {
			$("div.menu").hide();
			$("div.sideinfo").hide();
		} else {
			$("div.menu").show();
			$("div.sideinfo").show();
		}
	} */
</script>
</head>
<body>
	<div class="layout">
		<div class="title">
			<tiles:insertAttribute name="title" />
		</div>
		<%-- <div class="menu">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="sideinfo">
			<tiles:insertAttribute name="sideinfo" />
		</div> --%>
		<div class="main">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</body>
</html>