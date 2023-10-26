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
String ocode = request.getParameter("ordercode");

Cookie cart = new Cookie("ocode",ocode);

cart.setMaxAge(60*60);

response.addCookie(cart);


%>
</body>
</html>