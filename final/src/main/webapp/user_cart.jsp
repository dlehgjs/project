<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Cartbean"%>
<%@ page import="DAO.CartDAO"%>
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
<script>
function goOrder(){
	location.href="user_order.jsp";
}
</script>
<%
request.setCharacterEncoding("utf-8");

	String userID = (String) session.getAttribute("mem_id");
	int mnum = (int) session.getAttribute("mem_num");
	
	CartDAO cdao = new CartDAO();
	ArrayList<Cartbean> list = cdao.getCartList(mnum);
	
	int sum_price = 0;
	int order_price = 0;
%>

<div class = "main_wrap">
<%if(userID == null){%>
<%@ include file="user_top2.jsp"%>
<%}else{ %>
<%@ include file="user_login_top2.jsp"%>
<%} %>    
<div class = "cart_wrap">
	<div class = "sub_nav">
		<h3>마이페이지</h3>
		<ul>
			<li>1</li>
			<li>2</li>
			<li>3</li>
		</ul>
	</div>
	
	<div class = "cart_col">
		<h3>장바구니</h3>
		<div class = "cart_list">
			<ul>
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
			<li >
				<div class = "cart_product">
					<img src="<%=request.getContextPath()%>/upfile/<%=pro_imgName%>" width="100" height="70"/>
					<div class = "cart_product_detail">
						<p><%=pro_name %></p>
						<p>수량 : <%=cart_amount %></p>
					</div>
					<div class = "cart_price">
						<p><fmt:formatNumber type="currency" value="<%=sum_price%>" />원</p>
					</div>
					<div class = "delete_button">
					<a class="btn btn-danger" href="cart_del.jsp?cart_num=<%=cart_num %>" role="button">삭제</a>
					</div>
				</div>
			</li>
	
	<% 		
	}		
	%>
			</ul>
			<div class = "cart_order">
				<p>총 주문금액 : <fmt:formatNumber type="currency" value="<%=order_price%>" />원</p>
				<a class="btn btn-danger" href="user_order.jsp" role="button">주문하기</a>
				<a class="btn btn-danger" href="cart_del_all.jsp?mem_num=<%=mnum %>" role="button">장바구니 비우기</a>
			</div>
			<hr>				
		</div>
	</div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
</body>
</html>