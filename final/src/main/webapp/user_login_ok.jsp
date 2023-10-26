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


MemberDAO mdao = new MemberDAO();

Memberbean log = mdao.login(mem_id, mem_pwd);

if(log.getMem_id() != null && log.getMem_pwd() != null){
	
	session.setAttribute("mem_num", log.getMem_num());
	session.setAttribute("mem_id", mem_id);
	session.setAttribute("mem_pwd", mem_pwd);

	%>
	<script>location.href="user_main1.jsp";</script>
	<%
	}
	else{
	%>
	<script>
		alert("로그인 정보가 올바르지 않습니다.")
		history.go(-1);	
	</script>
	 <%	
	}
	%>
</body>
</html>