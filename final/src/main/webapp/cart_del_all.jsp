<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Cartbean"%>
<%@ page import="DAO.CartDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
//한글 처리
%>

<jsp:useBean id="cbean" class="DTO.Cartbean" />
<!-- bean 객체 생성 -->
<jsp:setProperty name="cbean" property="*" />

<%

	String mem_num = request.getParameter("mem_num");

	CartDAO cdao = new CartDAO();
	
	int del = cdao.deleteAllCart(mem_num);

%>
<script >
	location.href="user_cart.jsp";
</script>
</body>
</html>