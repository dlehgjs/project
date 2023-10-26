<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="DBcon.DBcon"%>
<%@ page import="DTO.Memberbean"%>
<%@ page import="DAO.MemberDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
//한글 처리
%>

<jsp:useBean id="mbean" class="DTO.Memberbean" />
<!-- bean 객체 생성 -->
<jsp:setProperty name="mbean" property="*" />

<% 
String mem_num = request.getParameter("mem_num");
MemberDAO mdao = new MemberDAO();

int user = mdao.deleteUser(mem_num);

%>
<script>
location.href="admin_menu1.jsp"
</script>
</body>
</html>