<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Productbean"%>
<%@ page import="DAO.ProductDAO"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String pro_num = request.getParameter("pro_num");
	String filename = request.getParameter("pro_imgName");
	
	ServletContext context = getServletContext();
	String path1 = context.getRealPath("/upfile/"+filename);
	out.println(path1+"<br />");
	// 삭제 할 파일의 전체경로

	boolean isDel = false;

	File realFile = new File(path1); //파일객체 생성

	isDel = realFile.delete(); //boolean type 리턴
	
	ProductDAO pdao = new ProductDAO();

	int delete = pdao.deleteProduct(pro_num);
	
%>
<script>
location.href="admin_menu3.jsp"
</script>
</body>
</html>