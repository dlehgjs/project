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

request.setCharacterEncoding("utf-8");

	String userID = (String) session.getAttribute("mem_id");
	int order_price = Integer.parseInt(request.getParameter("order_price"));
	
	int mem_num = Integer.parseInt(request.getParameter("mem_num"));
	String order_name = request.getParameter("order_name");
	String order_phoneNum = request.getParameter("order_phoneNum");
	String order_addr = request.getParameter("order_addr");
	String order_addr2 = request.getParameter("order_addr2");
	int order_postCode = Integer.parseInt(request.getParameter("order_postCode"));
	
	
	Orderutil ou = new Orderutil();
	OrderDAO odao = new OrderDAO();
	
	String order_code = ou.getOrderCode();
	String order_type[] = ou.getOrderStatus();

	obean.setOrder_code(order_code);
	obean.setMem_num(mem_num);
	obean.setOrder_name(order_name);
	obean.setOrder_postCode(order_postCode);	
	obean.setOrder_phoneNum(order_phoneNum);
	obean.setOrder_addr(order_addr);
	obean.setOrder_addr2(order_addr2);
	obean.setOrder_type(order_type[0]);

	
	int rs1 = odao.OrderOk(obean);
	
	int rs2 = 0;
	
	if(rs1 > 0){
		
		rs2 = odao.insertOrderList(mem_num, order_code);		
		
	}
	
%>

<div class = "main_wrap">
<%if(userID == null){%>
<%@ include file="user_top1.jsp"%>
<%}else{ %>
<%@ include file="user_login_top1.jsp"%>
<%} %>    
<div class = "order_wrap">
<%


%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>