<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBcon.DBcon"%>
<%@ page import="DTO.Productbean"%>
<%@ page import="DAO.ProductDAO"%>
<%@ include file="admin_top.jsp"%>
<% 
	String pro_num = request.getParameter("pro_num");
	ProductDAO pdao = new ProductDAO();
	
	Productbean before = pdao.goUpdate(pro_num);
	
%>
<div class = "main-wrap">
	<div class = "display">
		<div class = "aside">
			<ol>
				<li><a href="admin_menu1.jsp">회원리스트</a></li>
				<li><a href="insert_mem.jsp">회원추가</a></li>
			</ol>
			<ol>
				<li>주문관리</li>
			</ol>
			<ol>
				<li>상품관리</li>
			</ol>
		</div>
		<div class = "article">
			<form method="post" enctype="multipart/form-data" action="update_product.jsp">
			상품번호 : <%=before.getPro_num()%><input type="hidden" name="pro_num" value="<%=before.getPro_num()%>"></br>
			상품명:<input type="text" name="pro_name" value="<%=before.getPro_name()%>"></br>
			가격:<input type="text" name="pro_price" value="<%=before.getPro_price()%>"></br>
			재고:<input type="text" name="pro_stock" value="<%=before.getPro_stock()%>"></br>
			기존상품 :<%=before.getPro_imgName()%><input type="hidden" name="pro_imgName" value="<%=before.getPro_imgName()%>"></br>
			상품사진:<input type="file" name="filename"></br>
			상품설명:<input type="text" name="pro_explain" value="<%=before.getPro_explain()%>"></br>
			<input type="checkbox"  id="hot" name="pro_hot" value="Yes">
			<label for="new">인기상품</label>
			<input type="checkbox"  id="new"name="pro_new" value="Yes">
			<label for="new">신상품</label>
			<input type="checkbox"  id="dis"name="pro_display" value="Yes">
			<label for="new">화면표시</label>
			<input type="submit" value="수정하기">			
			</form>
		</div>
	</div>
</div>
<%@ include file="admin_footer.jsp"%>