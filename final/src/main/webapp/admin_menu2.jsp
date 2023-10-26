<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Orderbean"%>
<%@ page import="DAO.OrderDAO"%>
<%@ page import="java.util.ArrayList"%>
<%
OrderDAO odao = new OrderDAO();
String search = request.getParameter("search");
ArrayList<Orderbean> list = odao.orderList(search);
%>
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
			<form>
			이름검색 : <input type="text" name="search"><input type="submit" value="검색">
			</form>
			<table class = "orderlist">
					<tr>
						<th>주문번호</th>
						<th>회원번호</th>
						<th>이름</th>
						<th>연락처</th>
						<th>주소</th>
						<th>주문상태</th>
						<th>택배사</th>
						<th>운송장번호</th>
					</tr>
				<%
				for(Orderbean obean : list) {
					int order_num=obean.getOrder_num();
					int order_code=obean.getOrder_code();
					int mem_num=obean.getMem_num();
					String order_name=obean.getOrder_name();
					String order_phoneNum=obean.getOrder_phoneNum();
					String order_addr=obean.getOrder_addr();
					String order_type=obean.getOrder_type();
					String order_parcel=obean.getOrder_parcel();
					int order_postCode=obean.getOrder_postCode();

				%>
				<tr>
					<td><%=order_code%></td>
					<td><%=mem_num%></td>
					<td><%=order_name%></td>
					<td><%=order_phoneNum%></td>
					<td><%=order_addr%></td>
					<td><%=order_type%></td>
					<td><%=order_parcel%></td>
					<td><%=order_postCode%></td>
				
				</tr>
				<%
				}
				%>
				</table>
				
		</div>
	</div>
</div>
<%@ include file="admin_footer.jsp"%>
