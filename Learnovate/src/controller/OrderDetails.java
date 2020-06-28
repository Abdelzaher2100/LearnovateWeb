package controller;

public class OrderDetails {
	private String service;
	private String subtotal = "0.00";
	private String total;
	private String tax = "0.00";
	private String shipping = "0.00";
	
	public OrderDetails(String service, String total) {
		this.service = service;
		this.total = total;
		this.tax = tax;
	}//constructor
	
	String getShipping() {
		return shipping;
	}//getShipping
	
	String getSubtotal() {
		return subtotal;
	}//getSubtotal
	
	void setService(String service) {
		this.service = service;
	}//setService
	
	String getService() {
		return service;
	}//getService
	
	void setTotal(String total) {
		this.total = total;
	}//setTotal
	
	String getTotal() {
		return total;
	}//setTotal
	
	void setTax(String tax) {
		this.tax = tax;
	}//setTax
	
	String getTax() {
		return tax;
	}//getTax
	
}//OrderDetails
