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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String mem_id = request.getParameter("mem_id");
String mem_pwd = request.getParameter("mem_pwd");
out.println(mem_id);
out.println(mem_pwd);
MemberDAO mdao = new MemberDAO();

Memberbean log = mdao.login(mem_id, mem_pwd);

if(log.getMem_id() != null && log.getMem_pwd() != null){
	
	out.println("감자칩");
	
}
%>
</body>
</html>