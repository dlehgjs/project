<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <div class ="top_wrap">
        <nav class = "navbar">
                <div class = "logo" onclick='window.location.href="user_main1.jsp"'>
                    <span class = "logo_1">DODO</span>
                    <span class = "logo_2">HOUSE</span>
                </div>
                <div class = "search_area">
                    <form>
                        <input type="search" name="search" class="search" placeholder="Search">
                        <button type="submit" class="btn btn-dark"><i class="bi bi-search"></i></button>
                    </form>
                </div>
                <ul class = "h_group">
        			   <span><%=userID%></span>    	
					   <li class = "h_button">
                        <a class="btn btn-outline-dark" href="user_logout.jsp" role="button">로그아웃</a>
                    </li>
                    <li class = "h_button">
                        <a class="btn btn-outline-dark" href="user_cart.jsp" role="button">장바구니</a>
                    </li>
                      <li class = "h_button">
                        <a class="btn btn-outline-dark" href="user_order_list.jsp" role="button">주문목록</a>                     
                    </li>
                </ul>
        </nav>
    </div>

