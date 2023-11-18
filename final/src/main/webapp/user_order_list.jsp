<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Orderbean"%>
<%@ page import="DTO.Hisbean"%>
<%@ page import="DAO.OrderDAO"%>
<%@ page import="DAO.Orderutil"%>
<%@ page import="java.util.ArrayList"%>
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
	int mem_num = (int) session.getAttribute("mem_num");

	
	Orderutil ou = new Orderutil();
	OrderDAO odao = new OrderDAO();
	
	ArrayList<Orderbean> olist = odao.userOrderList(mem_num);
	
	
%>

<div class = "main_wrap">
<%if(userID == null){%>
<%@ include file="user_top2.jsp"%>
<%}else{ %>
<%@ include file="user_login_top2.jsp"%>
<%} %>    
<div class = "order_wrap">
<div class = "order_cont_wrap">
		<table class = "table table-bordered">
			<tr>
				<th>상품정보</th>
				<th>주문일자</th>
				<th>주문번호</th>
				<th>주문금액</th>
				<th>주문상태</th>
			</tr>
		
<%
	for(Orderbean obean : olist){
		
		String order_code = obean.getOrder_code();
		String order_name = obean.getOrder_name();
		String order_phoneNum = obean.getOrder_phoneNum();
		String order_addr = obean.getOrder_addr();
		String order_addr2 = obean.getOrder_addr2();
		String order_type = obean.getOrder_type();
		String order_parcel = obean.getOrder_parcel();
		int order_postCode = obean.getOrder_postCode();
%>
			<tr>
				<td><%=order_name%></td>
				<td><%=order_phoneNum%></td>
				<td><%=order_code%></td>
				<td><%=order_parcel%></td>	
				<td><%=order_type%></td>
			</tr>


<% 
	}
%>
	</table>	
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>