package DAO;

import java.util.Calendar;
import java.util.Random;



public class Orderutil {

public static String getOrderCode() {
		
		// 주문번호 생성
		Calendar now = Calendar.getInstance();
		String ordercode = null;
		String oyear = String.valueOf(now.get(Calendar.YEAR));
		String omonth = String.valueOf(now.get(Calendar.MONTH) +1);
		String oday = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
		String ohour = String.valueOf(now.get(Calendar.HOUR));
		String omin = String.valueOf(now.get(Calendar.MINUTE));
		String osec = String.valueOf(now.get(Calendar.SECOND));
		String otime = String.valueOf(now.getTimeInMillis());

		ordercode = oyear+omonth+oday+ohour+omin+osec+"-"+otime;
		
		return ordercode;
	}

public static String[] getOrderStatus() {
	
	String[] ostatus = new String[] {"주문완료", "결재완료", "배송중", "배송완료", "주문취소", "환불완료"};
	return ostatus;		

	}
	
}
