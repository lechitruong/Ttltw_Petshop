package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.Roles;
import com.demo.entities.Users;

import DB.ConnectDB;

public class UserModel {
	// ham lay ra danh sach cac user
	public List<Users> findAll() {
		List<Users> users = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from users");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Users user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setRoleId(resultSet.getInt("roleId"));
				user.setStatus(resultSet.getBoolean("status"));
				user.setGender(resultSet.getString("gender"));
				user.setBirthday(resultSet.getDate("birthday"));
				users.add(user);

			}
		} catch (Exception e) {
			e.printStackTrace();
			users = null;
		} finally {
			ConnectDB.disconnect();
		}
		return users;
	}
	// lay ra danh sach user co comment con pet do
	 public List<Users> findUsersByPetId(int petId) {
	        List<Users> users = new ArrayList<>();
	        try {
	        	PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("SELECT DISTINCT u.* " +
                        "FROM users u " +
                        "JOIN comments c ON u.id = c.userId " +
                        "WHERE c.petId = ?");
	            preparedStatement.setInt(1, petId);
	            ResultSet resultSet = preparedStatement.executeQuery();
	            while (resultSet.next()) {
	                Users user = new Users();
	                user.setId(resultSet.getInt("id"));
	                user.setUserName(resultSet.getString("userName"));
	                user.setFullName(resultSet.getString("fullName"));
	                user.setEmail(resultSet.getString("email"));
	                user.setPhoneNumber(resultSet.getString("phoneNumber"));
	                user.setImage(resultSet.getString("image"));
	                user.setPassword(resultSet.getString("password"));
	                user.setRoleId(resultSet.getInt("roleId"));
	                user.setStatus(resultSet.getBoolean("status"));
	                user.setGender(resultSet.getString("gender"));
	                user.setBirthday(resultSet.getDate("birthday"));
	                users.add(user);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            users = null;
	        } finally {
	            ConnectDB.disconnect();
	        }

	        return users;
	    }

	public List<Users> findAllRole(int roleId) {
		List<Users> users = new ArrayList<>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from users where roleId = ?");
			preparedStatement.setInt(1, roleId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Users user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setRoleId(resultSet.getInt("roleId"));
				user.setStatus(resultSet.getBoolean("status"));
				user.setGender(resultSet.getString("gender"));
				user.setBirthday(resultSet.getDate("birthday"));
				users.add(user);

			}
		} catch (Exception e) {
			e.printStackTrace();
			users = null;
		} finally {
			ConnectDB.disconnect();
		}
		return users;
	}

// ham dang ky
	public boolean create(Users user) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
					"insert into users(userName, fullName,email,phoneNumber, image, password, roleId, status,gender,birthday,securityCode) values (?,?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getFullName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPhoneNumber());
			preparedStatement.setString(5, user.getImage());
			preparedStatement.setString(6, user.getPassword());
			preparedStatement.setInt(7, user.getRoleId());
			preparedStatement.setBoolean(8, user.isStatus());
			preparedStatement.setString(9, user.getGender());
			preparedStatement.setDate(10, new java.sql.Date(user.getBirthday().getTime()));
			preparedStatement.setString(11, user.getSecurityCode());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}

// ham update
	public boolean update(Users user) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("update users set username = ?, fullname = ?, "
							+ "email = ?, phoneNumber = ?, image = ?, password = ? ,roleId = ?,status =?,gender =?, birthday=?, securityCode=?"
							+ " where id = ? ");
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getFullName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPhoneNumber());
			preparedStatement.setString(5, user.getImage());
			preparedStatement.setString(6, user.getPassword());
			preparedStatement.setInt(7, user.getRoleId());
			preparedStatement.setBoolean(8, user.isStatus());
			preparedStatement.setString(9, user.getGender());
			preparedStatement.setDate(10, new java.sql.Date(user.getBirthday().getTime()));
			preparedStatement.setString(11, user.getSecurityCode());
			preparedStatement.setInt(12, user.getId());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}

// ham xoa user
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("delete from users where id = ? ");
			preparedStatement.setInt(1, id);
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}

	// tim user dua vao id
	public Users findUserById(int id) {
		Users user = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from users where id = ? ");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setImage(resultSet.getString("image"));
				user.setRoleId(resultSet.getInt("roleId"));
				user.setStatus(resultSet.getBoolean("status"));
				user.setGender(resultSet.getString("gender"));
				user.setBirthday(resultSet.getDate("birthday"));
				user.setSecurityCode(resultSet.getString("securityCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		} finally {
			ConnectDB.disconnect();
		}
		return user;
	}

// ham tim ra user dua vao username
	public Users findUserByUserName(String userName) {
		Users user = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from users where userName = ? ");
			preparedStatement.setString(1, userName);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setRoleId(resultSet.getInt("roleId"));
				user.setStatus(resultSet.getBoolean("status"));
				user.setGender(resultSet.getString("gender"));
				user.setBirthday(resultSet.getDate("birthday"));
				user.setSecurityCode(resultSet.getString("securityCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		} finally {
			ConnectDB.disconnect();
		}
		return user;
	}

	// phuong thuc tra ve user dua vao email
	public Users findUserByEmail(String email) {
		Users user = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from users where email = ? ");
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user = new Users();
				user.setId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("userName"));
				user.setFullName(resultSet.getString("fullName"));
				user.setEmail(resultSet.getString("email"));
				user.setPhoneNumber(resultSet.getString("phoneNumber"));
				user.setImage(resultSet.getString("image"));
				user.setPassword(resultSet.getString("password"));
				user.setRoleId(resultSet.getInt("roleId"));
				user.setStatus(resultSet.getBoolean("status"));
				user.setGender(resultSet.getString("gender"));
				user.setBirthday(resultSet.getDate("birthday"));
				user.setSecurityCode(resultSet.getString("securityCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		} finally {
			ConnectDB.disconnect();
		}
		return user;
	}

// ham dang nhap
	public boolean checkLogin(String userName, String password) {
		Users user = findUserByUserName(userName);
		if (user != null) {
			if (user.isStatus() == true) {
				return BCrypt.checkpw(password, user.getPassword());
			}
		}
		return false;
	}
	public static void main(String[] args) {
		UserModel userModel = new UserModel();
//		System.out.println(userModel.delete(3));
//		System.out.println(userModel.findAll());
//	    System.out.println(userModel.findUserById(2));
//		System.out.println(userModel.findUserByUserName("admin1"));
//		System.out.println(userModel.checkLogin("admin1", "123"));
//		System.out.println(userModel.findAllAdmin(true));
//		System.out.println(BCrypt.checkpw("123", "$2a$10$GQtaPy7y2Q3gsPhA.QlJueoo0wGjy.hNK5/U/GTqqxXMGEjtDnkRi"));
//		System.out.println(userModel.create(new Users("username1", "fullName1","email1","phoneNumber1", "address1", "image1", "password1", 2, false,"gender1", new java.util.Date(),"123456")));
//	System.out.println(userModel.update(new Users(6, "username2", "fullName1","email1","phoneNumber1", "image1", "password1", 2, true,"gender1", new java.util.Date(),"123456")));
//		System.out.println(BCrypt.hashpw("123", BCrypt.gensalt()));
//		System.out.println(userModel.findUsersByPetId(1));
int i =10;
if(i++ == i++) {
	System.out.println("E"+ i);
}else {
	System.out.println("N"+ i);

}

	}
}
