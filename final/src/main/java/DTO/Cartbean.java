package DTO;

public class Cartbean {
	
	private int cart_num;
	private int mem_num;
	private int pro_num;
	private int cart_amount;
	private String cart_date;
	private String pro_imgName;
	private String pro_name;
	private int pro_price;
	
	
	public String getPro_imgName() {
		return pro_imgName;
	}
	public String getPro_name() {
		return pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_imgName(String pro_imgName) {
		this.pro_imgName = pro_imgName;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getCart_num() {
		return cart_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public int getPro_num() {
		return pro_num;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public String getCart_date() {
		return cart_date;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}

}
