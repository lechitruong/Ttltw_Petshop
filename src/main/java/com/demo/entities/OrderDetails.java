package com.demo.entities;

public class OrderDetails {
private int id;
private int quantity;
private int orderId;
private int petId;
public OrderDetails(int id, int quantity, int orderId, int petId) {
	super();
	this.id = id;
	this.quantity = quantity;
	this.orderId = orderId;
	this.petId = petId;
}
public OrderDetails() {
	super();
}
@Override
public String toString() {
	return "OrderDetails [id=" + id + ", quantity=" + quantity + ", orderId=" + orderId + ", petId=" + petId + "]";
}

}
