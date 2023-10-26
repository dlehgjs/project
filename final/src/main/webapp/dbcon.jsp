<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>    
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
try {
	String url = "jdbc:mysql://localhost:3306/projectDB";
	String user = "root";
	String password = "5637";

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	out.println("데이터베이스 연결이 성공되었습니다.");
} catch (ClassNotFoundException cnfe) {
	out.println("DBConnection:ClassNotFoundException<br />");
	out.println("DBConnection: " + cnfe.getMessage());
} catch (SQLException ex) {
	out.println("데이터베이스 연결이 실패되었습니다.<br />");
	out.println("SQLException: " + ex.getMessage());
}
%>
</body>
</html>