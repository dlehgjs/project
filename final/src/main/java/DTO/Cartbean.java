package DTO;

public class Cartbean {
	
	private int cart_num;
	private int mem_num;
	private int pro_num;
	private int cart_amount;
	private String cart_date;
	
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
