<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Productbean"%>
<%@ page import="DAO.ProductDAO"%>
<%@ page import="DAO.Orderutil"%>
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

String mem_num = String.valueOf(session.getAttribute("mem_num"));
String userID = (String) session.getAttribute("mem_id");
String num = request.getParameter("pro_num");




ProductDAO pdao = new ProductDAO();

Productbean pbean = pdao.productInfo(num);

int pro_num=pbean.getPro_num();
String pro_name=pbean.getPro_name();
int pro_price=pbean.getPro_price();
int pro_stock=pbean.getPro_stock();
String pro_imgName=pbean.getPro_imgName();
String pro_explain=pbean.getPro_explain();
String pro_hot=pbean.getPro_hot();
String pro_new=pbean.getPro_new();
String pro_display=pbean.getPro_display();
String pro_pdate=pbean.getPro_pdate();

%>
<div class = "main_wrap">

<%if(userID == null){%>
<%@ include file="user_top1.jsp"%>
<%}else{ %>
<%@ include file="user_login_top1.jsp"%>
<%} %>
	<div class = "product-detail">
	<img src="<%=request.getContextPath()%>/upfile/<%=pro_imgName%> "width="500" height="600"/>
		<div class = "order-group">
		<h1><%=pro_num%></h1>
		<h1><%=pro_name%></h1>
		<h1><%=pro_price %></h1>
		<%if(pro_stock > 0){%>
		<form action="insert_cart.jsp" method="post">
			<%if(mem_num != null){ %>
			<input type="hidden" name="mem_num" value="<%=mem_num%>">
			<%} %>
			<input type="hidden" name="pro_num" value="<%=pro_num%>">
			<input type="number" name="cart_amount" min="1" max="100" value="1">
			<input type="submit" value="장바구니에 담기">
		</form>
		<%}else{ %>
			<span>품절</span>
		<%} %>
		</div>
	</div>

	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>