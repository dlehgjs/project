<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<%@ include file="admin_top.jsp"%>
<div class = "main-wrap">
	<div class = "display">
		<div class = "aside">
			<div class = "side_nav">
				<h3>회원관리</h3>
				<ol>
					<li><a href="admin_menu1.jsp">회원리스트</a></li>
					<li><a href="insert_mem.jsp">회원추가</a></li>
				</ol>
				<h3>주문관리</h3>
				<ol>
					<li><a href="admin_menu2.jsp">주문리스트</a></li>
					<li><a href="insert_mem.jsp">회원추가</a></li>
				</ol>
				<h3>상품관리</h3>
				<ol>
					<li><a href="admin_menu3.jsp">주문리스트</a></li>
					<li><a href="insert_product.jsp">상품추가</a></li>
				</ol>
			</div>
		</div>
		<div class = "article">
		</div>
	</div>
</div>
<%@ include file="admin_footer.jsp"%>
</body>
</html>