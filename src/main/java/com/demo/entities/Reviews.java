package com.demo.entities;

import java.util.Date;

public class Reviews {
private int id;
private int starRating;
private String note;
private int petId;
private int userId;
private boolean status;
private Date createDate;

public Reviews(int id, int starRating, String note, int petId, int userId, boolean status, Date createDate) {
	super();
	this.id = id;
	this.starRating = starRating;
	this.note = note;
	this.petId = petId;
	this.userId = userId;
	this.status = status;
	this.createDate = createDate;
}
public Reviews() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getStarRating() {
	return starRating;
}
public void setStarRating(int starRating) {
	this.starRating = starRating;
}
public String getNote() {
	return note;
}
public void setNote(String note) {
	this.note = note;
}
public int getPetId() {
	return petId;
}
public void setPetId(int petId) {
	this.petId = petId;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
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
	return "Reviews [id=" + id + ", starRating=" + starRating + ", note=" + note + ", petId=" + petId + ", userId="
			+ userId + ", status=" + status + ", createDate=" + createDate + "]";
}


}
