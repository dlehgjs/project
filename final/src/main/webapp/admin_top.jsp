<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<script>
	function goHome(){
		
		location.href="admin_main.jsp"
		
	}
</script>
	<div class="top-wrap">
		<div class="header">
			<div class="logo">
				<img alt="123" src="image/logo.png" onclick="goHome()">
			</div>
			<div class="searchArea">
			</div>
			<div class="rightDiv">
				<div class="userinfo">
					<form method="get" action="login_ok.jsp">
						<input type="text" name="mem_id">
						<input type="text" name="mem_pwd">
						<input type="submit">
					</form>
				</div>
				<ul class="nav">
					<li><a href="admin_menu1.jsp">회원관리</a></li>
					<li><a href="admin_menu2.jsp">주문관리</a></li>
					<li><a href="admin_menu3.jsp">상품관리</a></li>
					<li><a href="#">배송관리</a></li>
				</ul>
			</div>
		</div>
	</div>	
</body>
</html>