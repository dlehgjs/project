<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Memberbean"%>
<%@ page import="DAO.MemberDAO"%>
<%@ page import="java.util.ArrayList"%>
<%

int pageNum=1; // 페이지 번호
int limit=10; // 1페지에 출력될 레코드 갯수
int pagesize=5; // 출력될 페이지 갯수 [1][2]
int startpage=1; //시작페이지 
int endpage=1;  //끝페이지
int pagecount=0; //총 페이지 갯수

if(request.getParameter("pageNum")!=null)
	pageNum=Integer.parseInt(request.getParameter("pageNum"));

String search = "";
if(request.getParameter("search")!=null)
	search = request.getParameter("search");

MemberDAO mdao = new MemberDAO();

ArrayList<Memberbean> list = mdao.selectMember(pageNum,limit,search);

int total_record = mdao.getListCount(search);
pagecount=(total_record-1)/limit+1; 
startpage=pageNum-((pageNum-1)%pagesize);
endpage= startpage+pagesize-1;


%>
<script>
function del(num){

	var delmsg = confirm("정말 삭제하시겠습니까?")
	if(delmsg) {
		var URL="delete_mem.jsp?mem_num="+num; 
		location.href=URL;
	}

}
</script>
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
			<form action="admin_menu1.jsp">
				이름 검색 : <input type="text" name="search"> <input type="submit" value="검 색"></br>
				전체 회원수 : <span><%= total_record %></span>
				</form>
			<form method="post" action="ck_delete_mem.jsp">
			<table class = "userlist">
					<tr>
						<th>선택</th>
						<th>아이디</th>
						<th>이름</th>
						<th>연락처</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>가입일</th>
						<th>회원관리</th>
					</tr>
				<%
				for(Memberbean mbean : list) {
					int mem_num=mbean.getMem_num();
					String mem_id=mbean.getMem_id();
					String mem_name=mbean.getMem_name();
					String mem_phoneNum=mbean.getMem_phoneNum();
					String mem_postCode=mbean.getMem_postCode();
					String mem_addr=mbean.getMem_addr();
					String mem_detailaddr=mbean.getMem_detailaddr();
					String mem_mdate=mbean.getMem_mdate();

				%>
				<tr>
					
					<td><input type="checkbox" name="ckid" value="<%=mem_id%>"></td>
					<td><%=mem_id%></td>
					<td><%=mem_name%></td>
					<td><%=mem_phoneNum%></td>
					<td><%=mem_postCode%></td>
					<td><%=mem_addr%></td>
					<td><%=mem_detailaddr%></td>
					<td><%=mem_mdate%></td>
					<td><a href="#" onclick="del('<%=mbean.getMem_num()%>');">[삭제하기]</a></td>
					
				</tr>
				<%
				}
				%>
				</table>
				<input class="asd" type="submit" value="일괄삭제">
				</form>
				<div class = "pagebar">
					<%
					if(startpage-pagesize>0){  
					%>
					<a href="admin_menu1.jsp?pageNum=<%=pageNum-1%>&search=<%=search%>">[PERV]</a>
					<%
					}
					%>
					<%
					for(int i=startpage; i<=endpage; i++){
						
					%>
					<a href="admin_menu1.jsp?pageNum=<%=i%>&search=<%=search%>">
					<%
						if(pageNum == i) {
					%>
						<span class="linka">[<%=i%>]</span></a>
					<%
						}else{
					%>
						<span class="linkb">[<%=i%>]</span></a>
					
					<%
						}
						if(i==pagecount) break;
					}
					%>
					<%
					if(startpage+pagesize<=pagecount){
					%>
					<a href="admin_menu1.jsp?pageNum=<%=pageNum+1%>&search=<%=search%>">[next]</a>
					<%
					}
					%>
				</div>
		</div>
	</div>
</div>
<%@ include file="admin_footer.jsp"%>
