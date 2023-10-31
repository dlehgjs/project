<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Orderbean"%>
<%@ page import="DAO.OrderDAO"%>
<%@ page import="DAO.Orderutil"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="obean" class="DTO.Orderbean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DODOHOUSE</title>
<link rel="stylesheet" type="text/css" href="style2.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<%
	String userID = (String) session.getAttribute("mem_id");
	int mem_num = Integer.parseInt(request.getParameter("mem_num"));
	int order_price = Integer.parseInt(request.getParameter("order_price"));

%>

<div class = "main_wrap">
<%if(userID == null){%>
<%@ include file="user_top1.jsp"%>
<%}else{ %>
<%@ include file="user_login_top1.jsp"%>
<%} %>    
<div class = "order_wrap">
<%
	Orderutil ou = new Orderutil();
	OrderDAO odao = new OrderDAO();
	ArrayList<Orderbean> olist = odao.userOrderList(mem_num);
	
	obean.setMem_num(mem_num);
	obean.setOrder_code(ou.getOrderCode());
	obean.setMem_num(mem_num);
	obean.setMem_num(mem_num);
	obean.setMem_num(mem_num);
	obean.setMem_num(mem_num);
	


%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>