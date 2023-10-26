<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Productbean"%>
<%@ page import="DAO.ProductDAO"%>
<%@ page import="java.util.ArrayList"%>
<%
String search = "";
if(request.getParameter("search")!=null)
	search = request.getParameter("search");

ProductDAO pdao = new ProductDAO();
ArrayList<Productbean> list = pdao.userHotList(search);

%>

<div class="container text-center">
	
	<div class="row row-cols-5">
   		<%
				
				
		for(Productbean pbean : list) {
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
		
		<div class="col">	
			<div class="card" style="width: 11rem;" onclick='window.location.href="product_info.jsp"'>
			  <img src="<%=request.getContextPath()%>/upfile/<%=pro_imgName%>" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title"><%=pro_name%></h5>
			    <p class="card-text"><%=pro_price%></p>
			  </div>
			</div>
		</div>	<%
				}
		%>		
  </div>
</div>