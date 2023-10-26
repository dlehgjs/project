<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Cartbean"%>
<%@ page import="DAO.CartDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	CartDAO cdao = new CartDAO();
	ArrayList<Cartbean> list = cdao.getCartList();
	
	for(Cartbean cbean : list){
		
		int cart_num = cbean.getCart_num();
		int mem_num = cbean.getMem_num();
		int pro_num = cbean.getPro_num();
		int cart_amount = cbean.getCart_amount();
		String cart_date = cbean.getCart_date();
		
		out.println(cart_num);
		out.println(mem_num);
		out.println(pro_num);
		out.println(cart_amount);
		out.println(cart_date);
		
		
	}

%>
</body>
</html>