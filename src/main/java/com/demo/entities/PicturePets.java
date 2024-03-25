package com.demo.entities;

public class PicturePets {
private int id;
private String image;
private int petId;
public PicturePets(int id, String image, int petId) {
	super();
	this.id = id;
	this.image = image;
	this.petId = petId;
}
public PicturePets() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public int getPetId() {
	return petId;
}
public void setPetId(int petId) {
	this.petId = petId;
}
@Override
public String toString() {
	return "PicturePets [id=" + id + ", image=" + image + ", petId=" + petId + "]";
}

}
