<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.Orderutil"%>
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
String mem_num = String.valueOf(session.getAttribute("mem_num"));
%>
<div class = "main_wrap">

<%if(userID == null){%>
<%@ include file="user_top1.jsp"%>
<%}else{ %>
<%@ include file="user_login_top1.jsp"%>
<%} %>
	<div class = "regi_wrap">
		<form method="get" action="insert_mem_ok.jsp">
				아이디 : <input type="text" name="mem_id" id="mem_id"> <input type="button" value="아이디 중복확인"  onclick="idck();"><br />
				비밀번호 : <input type="password" name="mem_pwd" id="mem_pwd"><br />
				이 름 : <input type="text" name="mem_name"><br />
				연락처 : <input type="text" name="mem_phoneNum"><br />
				주소 : <input type="text" name="mem_postCode" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="mem_addr" id="sample6_address" placeholder="주소"><br>
				<input type="text" name="mem_detailaddr" id="sample6_detailAddress" placeholder="주소"><br>
				<input type="submit">
			</form>
	
	
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>