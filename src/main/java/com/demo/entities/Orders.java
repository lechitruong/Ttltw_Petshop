package com.demo.entities;

public class Orders {
private int id;
private String note;
private String orderDate;
private double totalMoney;
public Orders(int id, String note, String orderDate, double totalMoney) {
	super();
	this.id = id;
	this.note = note;
	this.orderDate = orderDate;
	this.totalMoney = totalMoney;
}
public Orders() {
	super();
}
@Override
public String toString() {
	return "Orders [id=" + id + ", note=" + note + ", orderDate=" + orderDate + ", totalMoney=" + totalMoney + "]";
}

}
