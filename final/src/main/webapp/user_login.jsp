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
<div class = "main_wrap">
<%@ include file="user_top1.jsp"%>
<div class = "login_wrap">
	<div class ="loginlogo">
		<span class = "logo_1">DODO</span>
		<span class = "logo_2">HOUSE</span>
	</div>
	<form action="user_login_ok.jsp" class = "login_form">
		<span>아이디</span>
		<input class="form-control" type="text" name="mem_id">
		<span>비밀번호</span>
		<input class="form-control" type="password" name="mem_pwd">
		<input class="form-control" type="submit" value="로그인">
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>