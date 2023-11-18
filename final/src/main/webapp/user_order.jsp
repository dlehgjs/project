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
<div class = "order_wrap">
	<div class = "order_head">
		<h1>주문하기</h1>
	</div>
	<hr>
	<div class = "order_list">
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
				</div>
			</li>
	
	<% 		
	}		
	%>
		</ul>
	</div>
	<div class = "order_group">
		<h2>총 주문금액 : <fmt:formatNumber type="currency" value="<%=order_price%>" />원</h2>
	</div>
	<hr>
	<div class = "order_addr">
		<h2>주문자 정보</h2>
		<form action="user_orderOk.jsp" method="post">
		<input type="hidden" name="order_price" value="<%=order_price %>">
		<input type="hidden" name="mem_num" value="<%=mnum%>">
		이름 : <input type="text" name="order_name" value="배송자명"></br>
		전화번호 : <input type="text" name="order_phoneNum" value="배송자전화번호">
		<h2>배송지</h2>
		<input type="text" name="order_postCode" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="order_addr" id="sample6_address" placeholder="주소"><br>
		<input type="text" name="order_addr2" id="sample6_detailAddress" placeholder="주소"><br>
		<input class="btn btn-danger" type="submit" value="주문하기" onclick=goOrder()>
	</form>
	</div>	
	

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</div>
</body>
</html>