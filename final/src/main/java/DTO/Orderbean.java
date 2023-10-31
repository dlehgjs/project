package DTO;

public class Orderbean {

	private int order_num;
	private String order_code;
	private int mem_num;
	private String order_name;
	private String order_phoneNum;
	private String order_addr;
	private String order_type;
	private String order_parcel;
	private int order_postCode;
	private String order_addr2;
	
	public int getOrder_num() {
		return order_num;
	}
	public String getOrder_code() {
		return order_code;
	}
	public int getMem_num() {
		return mem_num;
	}
	public String getOrder_name() {
		return order_name;
	}
	public String getOrder_phoneNum() {
		return order_phoneNum;
	}
	public String getOrder_addr() {
		return order_addr;
	}
	public String getOrder_addr2() {
		return order_addr2;
	}
	public String getOrder_type() {
		return order_type;
	}
	public String getOrder_parcel() {
		return order_parcel;
	}
	public int getOrder_postCode() {
		return order_postCode;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public void setOrder_phoneNum(String order_phoneNum) {
		this.order_phoneNum = order_phoneNum;
	}
	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}
	
	public void setOrder_addr2(String order_addr2) {
		this.order_addr2 = order_addr2;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public void setOrder_parcel(String order_parcel) {
		this.order_parcel = order_parcel;
	}
	public void setOrder_postCode(int order_postCode) {
		this.order_postCode = order_postCode;
	}
}
