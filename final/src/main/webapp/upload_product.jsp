<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>
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
			<form method="post" enctype="multipart/form-data" action="insert_product.jsp">
			상품명:<input type="text" name="pro_name"></br>
			가격:<input type="text" name="pro_price"></br>
			재고:<input type="text" name="pro_stock"></br>
			상품사진:<input type="file" name="filename"></br>
			상품설명:<input type="text" name="pro_explain"></br>
			<input type="checkbox"  id="hot" name="pro_hot" value="Yes">
			<label for="new">인기상품</label>
			<input type="checkbox"  id="new"name="pro_new" value="Yes">
			<label for="new">신상품</label>
			<input type="checkbox"  id="dis"name="pro_display" value="Yes">
			<label for="new">화면표시</label>
			<input type="submit">			
			</form>
		</div>
	</div>
</div>
<%@ include file="admin_footer.jsp"%>