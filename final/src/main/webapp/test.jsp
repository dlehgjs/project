<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for (int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals("ocode")){
				
				out.println(cookies[i].getName()); // 쿠키 이름을 받아옴
				out.println(cookies[i].getValue()); // 쿠키 데이터를 받아옴
		
			}
		}
	}
%>

</body>
</html>