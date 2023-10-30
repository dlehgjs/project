<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Cartbean"%>
<%@ page import="DAO.CartDAO"%>
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
	int mnum = (int) session.getAttribute("mem_num");
	
	CartDAO cdao = new CartDAO();
	ArrayList<Cartbean> list = cdao.getCartList(mnum);
	
	int sum_price = 0;
	int order_price = 0;
%>

<div class = "main_wrap">
<%if(userID == null){%>
<%@ include file="user_top1.jsp"%>
<%}else{ %>
<%@ include file="user_login_top1.jsp"%>
<%} %>    
<div class = "cart_wrap">

	<table class="table table-striped">
	<tr>
 		<th>상품이미지</th>
 		<th>상품명</th>
 		<th>가격</th>
 		<th>수량</th>
 		<th>합계가격</th>
 		<th>삭제</th>
 	</tr>
	<%
	for(Cartbean cbean : list){
		
		int cart_num = cbean.getCart_num();
		int mem_num = cbean.getMem_num();
		int pro_num = cbean.getPro_num();
		int cart_amount = cbean.getCart_amount();
		String pro_imgName = cbean.getPro_imgName();
		String pro_name = cbean.getPro_name();
		int pro_price = cbean.getPro_price();
		String cart_date = cbean.getCart_date();
		
		sum_price = pro_price * cart_amount;
		order_price += sum_price;
	%>
	<tr>
 		<td><img src="<%=request.getContextPath()%>/upfile/<%=pro_imgName%>" width="50" height="30"/></td>
 		<td><%=pro_name %></td>
 		<td><%=pro_price %></td>
 		<td><input type="number" name="cart_amount" min="1" max="100" value="<%=cart_amount %>"></td>
 		<td><%=sum_price %></td>
 		<td><a href="cart_del.jsp?cart_num=<%=cart_num%>">삭제</a></td>
 	</tr>
	<% 		
	}		
	%>
	</table>
	<h3><%=order_price %></h3>
	<button type="button" class="btn btn-dark">주문하기</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>