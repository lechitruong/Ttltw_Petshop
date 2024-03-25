package com.demo.entities;

import java.util.Date;

public class Bills {
private int id;
private int orderId;
private String paymentMethod;
private boolean status;
private Date createDate;
public Bills(int id, int orderId, String paymentMethod, boolean status, Date createDate) {
	super();
	this.id = id;
	this.orderId = orderId;
	this.paymentMethod = paymentMethod;
	this.status = status;
	this.createDate = createDate;
}
public Bills() {
	super();
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}
public String getPaymentMethod() {
	return paymentMethod;
}
public void setPaymentMethod(String paymentMethod) {
	this.paymentMethod = paymentMethod;
}
public boolean isStatus() {
	return status;
}
public void setStatus(boolean status) {
	this.status = status;
}
public Date getCreateDate() {
	return createDate;
}
public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}
@Override
public String toString() {
	return "Bills [id=" + id + ", orderId=" + orderId + ", paymentMethod=" + paymentMethod + ", status=" + status
			+ ", createDate=" + createDate + "]";
}

}
