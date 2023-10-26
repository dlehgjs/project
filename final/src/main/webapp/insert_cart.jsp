<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Cartbean"%>
<%@ page import="DAO.CartDAO"%>
<jsp:useBean id="cbean" class="DTO.Cartbean"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
//한글 처리
int mem_num = Integer.parseInt(request.getParameter("mem_num"));
int pro_num = Integer.parseInt(request.getParameter("pro_num"));
int cart_amount = Integer.parseInt(request.getParameter("cart_amount"));

String ocode = request.getParameter("ordercode");

Cookie cart = new Cookie("ocode",ocode);

cart.setMaxAge(60*60);

response.addCookie(cart);

cbean.setMem_num(mem_num);
cbean.setPro_num(pro_num);
cbean.setCart_amount(cart_amount);

CartDAO cdao = new CartDAO();

int getCart = cdao.insertCart(cbean);
%>
<script>
location.href="admin_menu1.jsp"
</script>
</body>
</html>
</body>
</html>