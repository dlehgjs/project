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

public static String ranCookie() {
	
    int leftLimit = 48; // numeral '0'
    int rightLimit = 122; // letter 'z'
    int targetStringLength = 10;
    Random random = new Random();
    String generatedString = random.ints(leftLimit, rightLimit + 1)
                                   .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                                   .limit(targetStringLength)
                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                                   .toString();
    
    
    return generatedString;
  }
	
}
