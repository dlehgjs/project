<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DODOHOUSE</title>
<link rel="stylesheet" type="text/css" href="style2.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<%
String userID = (String) session.getAttribute("mem_id");

%>
<div class = "main_wrap">

<%if(userID == null){%>
<%@ include file="user_top1.jsp"%>
<%}else{ %>
<%@ include file="user_login_top1.jsp"%>
<%} %>

	<nav class="nav nav-pills flex-column flex-sm-row">
		  <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="user_main1.jsp">전체상품</a>
		  <a class="flex-sm-fill text-sm-center nav-link" href="user_main2.jsp">인기상품</a>
		  <a class="flex-sm-fill text-sm-center nav-link" href="user_main3.jsp">신상품</a>
	</nav>
<%@ include file="user_cont1.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>