<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DTO.Productbean"%>
<%@ page import="DAO.ProductDAO"%>
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

ProductDAO pdao = new ProductDAO();

ArrayList<Productbean> list = pdao.productList(pageNum,limit,search);

int total_record = pdao.getListCount(search);
pagecount=(total_record-1)/limit+1; 
startpage=pageNum-((pageNum-1)%pagesize);
endpage= startpage+pagesize-1;
%>
<script>
function del(num , filename){

	var delmsg = confirm("정말 삭제하시겠습니까?")
	if(delmsg) {
		var URL="delete_product.jsp?pro_num="+num+"&pro_imgName="+filename; 
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
					<li><a href="admin_menu3.jsp">상품리스트</a></li>
					<li><a href="upload_product.jsp">상품추가</a></li>
				</ol>
			</div>
		</div>
		<div class = "article">
			<form>
			이름검색 : <input type="text" name="search"><input type="submit" value="검색">
			</form>
			<table class = "productlist">
					<tr>
						<th>상품번호	</th>
						<th>상품명</th>
						<th>가격</th>
						<th>재고</th>
						<th>첨부사진</th>
						<th>설명</th>
						<th>인기상품</th>
						<th>신상품</th>
						<th>화면표시</th>
						<th>상품등록일</th>
						<th>상품관리</th>
					</tr>
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
				<tr>
					<td><%=pro_num%></td>
					<td><%=pro_name%></td>
					<td><%=pro_price%></td>
					<td><%=pro_stock%></td>
					<td><img src="<%=request.getContextPath()%>/upfile/<%=pro_imgName%>" width="50" height="30"/></td>
					<td><%=pro_explain%></td>
					<td><%=pro_hot%></td>
					<td><%=pro_new%></td>
					<td><%=pro_display%></td>
					<td><%=pro_pdate%></td>
					<td><a href="#" onclick="del('<%=pbean.getPro_num()%>' , '<%=pbean.getPro_imgName()%>');">[삭제]</a>
						<a href="update_product_input.jsp?pro_num=<%=pro_num%>">[수정]</a>
					</td>			
				</tr>
				<%
				}
				%>
				</table>
				<div class = "pagebar">
					<%
					if(startpage-pagesize>0){  
					%>
					<a href="admin_menu3.jsp?pageNum=<%=pageNum-1%>&search=<%=search%>">[PERV]</a>
					<%
					}
					%>
					<%
					for(int i=startpage; i<=endpage; i++){
						
					%>
					<a href="admin_menu3.jsp?pageNum=<%=i%>&search=<%=search%>">
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
					<a href="admin_menu3.jsp?pageNum=<%=pageNum+1%>&search=<%=search%>">[next]</a>
					<%
					}
					%>
				</div>
		</div>
	</div>
</div>
<%@ include file="admin_footer.jsp"%>
