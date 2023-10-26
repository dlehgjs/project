package DTO;

public class Productbean {

	private int pro_num;
	private String pro_name;
	private int pro_price;
	private int pro_stock;
	private String pro_imgName;
	private String pro_explain;
	private String pro_hot;
	private String pro_new;
	private String pro_display;
	private String pro_pdate;
	
	public int getPro_num() {
		return pro_num;
	}
	public String getPro_name() {
		return pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public int getPro_stock() {
		return pro_stock;
	}
	public String getPro_imgName() {
		return pro_imgName;
	}
	public String getPro_explain() {
		return pro_explain;
	}

	public String getPro_pdate() {
		return pro_pdate;
	}
	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public void setPro_stock(int pro_stock) {
		this.pro_stock = pro_stock;
	}
	public void setPro_imgName(String pro_imgName) {
		this.pro_imgName = pro_imgName;
	}
	public void setPro_explain(String pro_explain) {
		this.pro_explain = pro_explain;
	}

	public String getPro_hot() {
		return pro_hot;
	}
	public String getPro_new() {
		return pro_new;
	}
	public String getPro_display() {
		return pro_display;
	}
	public void setPro_hot(String pro_hot) {
		this.pro_hot = pro_hot;
	}
	public void setPro_new(String pro_new) {
		this.pro_new = pro_new;
	}
	public void setPro_display(String pro_display) {
		this.pro_display = pro_display;
	}
	public void setPro_pdate(String pro_pdate) {
		this.pro_pdate = pro_pdate;
	}
}
