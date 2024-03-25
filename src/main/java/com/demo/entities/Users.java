package com.demo.entities;

import java.util.Date;

public class Users {
private int id;
private String fullName;
private String userName;
private String password;
private String gender;
private Date birthday;
private String email;
private String phoneNumber;
private String address;
private String image;
private String securityCode;
private boolean status;
private int roleId;

public Users(int id, String fullName, String userName, String password, String gender, Date birthday, String email,
		String phoneNumber, String address, String image, String securityCode, boolean status, int roleId) {
	super();
	this.id = id;
	this.fullName = fullName;
	this.userName = userName;
	this.password = password;
	this.gender = gender;
	this.birthday = birthday;
	this.email = email;
	this.phoneNumber = phoneNumber;
	this.address = address;
	this.image = image;
	this.securityCode = securityCode;
	this.status = status;
	this.roleId = roleId;
}
public Users() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFullName() {
	return fullName;
}
public void setFullName(String fullName) {
	this.fullName = fullName;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public String getSecurityCode() {
	return securityCode;
}
public void setSecurityCode(String securityCode) {
	this.securityCode = securityCode;
}
public boolean isStatus() {
	return status;
}
public void setStatus(boolean status) {
	this.status = status;
}
public int getRoleId() {
	return roleId;
}
public void setRoleId(int roleId) {
	this.roleId = roleId;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public Date getBirthday() {
	return birthday;
}
public void setBirthday(Date birthday) {
	this.birthday = birthday;
}
@Override
public String toString() {
	return "Users [id=" + id + ", fullName=" + fullName + ", userName=" + userName + ", password=" + password
			+ ", gender=" + gender + ", birthday=" + birthday + ", email=" + email + ", phoneNumber=" + phoneNumber
			+ ", address=" + address + ", image=" + image + ", securityCode=" + securityCode + ", status=" + status
			+ ", roleId=" + roleId + "]";
}



}
