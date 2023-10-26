<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.MemberDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] ckid = request.getParameterValues("ckid");

for(String id : ckid){
	
	out.println(id);
	
}
MemberDAO mdao = new MemberDAO();

int rss = mdao.ckDeleteMem(ckid);
out.println(rss);
%>


</body>
</html>