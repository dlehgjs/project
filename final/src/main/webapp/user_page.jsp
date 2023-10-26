<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String userID = (String) session.getAttribute("mem_id");
String name = (String) session.getAttribute("mem_pwd");

out.println(userID);
out.println(name);
%>
</body>
</html>