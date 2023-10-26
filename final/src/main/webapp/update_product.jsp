<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBcon.DBcon"%>
<%@page import="DAO.ProductDAO"%>
<%@ page import="DTO.Productbean"%>
<%@ include file="admin_top.jsp"%>    
			
<jsp:useBean id="pbean" class="DTO.Productbean"/>							
<%
ServletContext context = getServletContext();
String realFolder = context.getRealPath("/upfile");
String encType = "utf-8"; //인코딩 타입
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

Enumeration files = multi.getFileNames();
//열거형 객체로 저장
String filename = null;
String bfilename = multi.getParameter("pro_imgName");



// 입력 양식에서 input type=file 여러개일 경우
// while
if(files.hasMoreElements()) {
	
	String name = (String) files.nextElement();
	filename = multi.getFilesystemName(name);
	//서버에 저장된 파일명
	File file = multi.getFile(name);
	
	
	out.println(name);
	if(file !=null) {
		
		String uploadedFileName =  realFolder+"/" + bfilename;
		File realFile = new File(uploadedFileName);  //기존 파일객체 생성
		
		boolean isDel = false;
		isDel = realFile.delete(); //boolean type 리턴
		
		out.println(uploadedFileName);
	
	}
	
	filename = multi.getFilesystemName(name);
	
	String original = multi.getOriginalFileName(name);
	// 사용자가 업로드한 파일명

%>
<img src="<%=request.getContextPath()%>/upfile/<%=filename%>" />
<%
}
// request 아니므로 setProperty 사용불가==> 하나씩 set 메소드 호출
int pro_num = Integer.parseInt(multi.getParameter("pro_num"));
String pro_name = multi.getParameter("pro_name");
int pro_price = Integer.parseInt(multi.getParameter("pro_price"));
int pro_stock = Integer.parseInt(multi.getParameter("pro_stock"));
String pro_explain = multi.getParameter("pro_explain");
String pro_hot = multi.getParameter("pro_hot");
String pro_new = multi.getParameter("pro_new");
String pro_display = multi.getParameter("pro_display");

pbean.setPro_num(pro_num);
pbean.setPro_name(pro_name);
pbean.setPro_price(pro_price);
pbean.setPro_stock(pro_stock);
pbean.setPro_imgName(filename);
pbean.setPro_explain(pro_explain);
pbean.setPro_hot(pro_hot);
pbean.setPro_new(pro_new);
pbean.setPro_display(pro_display);


ProductDAO pdao = new ProductDAO();
int rss = pdao.updateProduct(pbean);
out.println(rss+ "개의 상품이 정상적으로 등록되었습니다.");

%>


<%@ include file="admin_footer.jsp"%>