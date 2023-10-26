<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<script>
	function idck() {

		var pp = document.getElementById("mem_id").value;
		var oPen = window.open("idcheck.jsp?mem_id="+pp, "", 
		"width=500, height=300");
 
		// 부모창의 이름값
		//oPen.document.getElementById("ckid").value = pp;
		// 새창으로 전달

	}
</script>
<%@ include file="admin_top.jsp"%>
<div class = "main-wrap">
	<div class = "display">
		<div class = "aside">
			<ol>
				<li><a href="admin_menu1.jsp">회원관리</a></li>
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
			<form method="get" action="insert_mem_ok.jsp">
				아이디 : <input type="text" name="mem_id" id="mem_id"> <input type="button" value="아이디 중복확인"  onclick="idck();"><br />
				비밀번호 : <input type="password" name="mem_pwd" id="mem_pwd"><br />
				이 름 : <input type="text" name="mem_name"><br />
				연락처 : <input type="text" name="mem_phoneNum"><br />
				주소 : <input type="text" name="mem_postCode" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="mem_addr" id="sample6_address" placeholder="주소"><br>
				<input type="text" name="mem_detailaddr" id="sample6_detailAddress" placeholder="주소"><br>
				<input type="submit">
			</form>
		</div>
	</div>
</div>
<%@ include file="admin_footer.jsp"%>
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
</body>
</html>