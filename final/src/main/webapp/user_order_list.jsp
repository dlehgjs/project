<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Orderbean"%>
<%@ page import="DTO.Hisbean"%>
<%@ page import="DAO.OrderDAO"%>
<%@ page import="DAO.Orderutil"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div class = "olist_wrap">
	<div class = "sub_nav">
		<h3>마이페이지</h3>
		<ul>
			<li>1</li>
			<li>2</li>
			<li>3</li>
		</ul>
	</div>
	
	<div class = "olist_col">
		<h3>주문목록</h3>
		<div class = "order_list">

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
		String order_date = obean.getOrder_date();
		
		String odate = order_date.substring(0,10);
	%>
		<div class = "order_card">
			<div class = "order_code">
				<p><%=odate %></p>
				<p>주문번호 <%= order_code %></p>
			</div>
			<div class = "order_product">
				<div class="order_product_list">
				<%
				ArrayList<Hisbean> hlist = odao.userOrderItemList(order_code);	
				
				for(Hisbean hbean : hlist){
					
					int pro_num=hbean.getPro_num();
					String pro_name=hbean.getPro_name();
					String pro_imgName=hbean.getPro_imgName();
					int his_price=hbean.getHis_price();
					int his_amount=hbean.getHis_amount();
				%>
					<ul>
						<li><img src="<%=request.getContextPath()%>/upfile/<%=pro_imgName%>" width="120" height="90" class="img-thumbnail"/>
							<div class ="order_product_name"><%=pro_name%></div>
							<div class ="order_product_price"><fmt:formatNumber type="currency" value="<%=his_price%>" />원</div>
						</li>
					</ul>

				<%
				}
				%>
				</div>
				<div class = "order_list_button">
					<button type="button" class="btn btn-outline-primary" >배송조회</button>
					<button type="button" class="btn btn-outline-secondary" >주문상세정보</button>
				
				</div>
			</div>

		</div>
	
	<% 		
	}		
	%>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</div>
</body>
</html>