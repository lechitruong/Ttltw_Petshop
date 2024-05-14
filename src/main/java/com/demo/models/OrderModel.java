package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Orders;
import com.demo.entities.Users;

import DB.ConnectDB;

public class OrderModel {
	// ham lay ra danh sach cac order
		public List<Orders> findAll() {
			List<Orders> orders = new ArrayList<>();
			try {
				PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from orders");
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					Orders order = new Orders();
					order.setId(resultSet.getInt("id"));
					order.setPhoneNumber(resultSet.getString("phoneNumber"));
					order.setEmail(resultSet.getString("email"));
					order.setNote(resultSet.getString("note"));
					order.setOrderDate(resultSet.getTimestamp("orderDate"));
					order.setTotalMoney(resultSet.getDouble("totalMoney"));
					order.setStatus(resultSet.getInt("status"));
					order.setUserId(resultSet.getInt("userId"));
					order.setAddressId(resultSet.getInt("addressId"));
					orders.add(order);

				}
			} catch (Exception e) {
				e.printStackTrace();
				orders = null;
			} finally {
				ConnectDB.disconnect();
			}
			return orders;
		}

	// ham dang ky
		public boolean create(Orders order) {
			boolean result = true;
			try {
				PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
						"insert into orders(phoneNumber, email,note,orderDate, totalMoney, status, userId, addressId) values (?,?,?,?,?,?,?,?)");
				preparedStatement.setString(1, order.getPhoneNumber());
				preparedStatement.setString(2, order.getEmail());
				preparedStatement.setString(3, order.getNote());
				preparedStatement.setTimestamp(4, new Timestamp(order.getOrderDate().getTime()));
				preparedStatement.setDouble(5, order.getTotalMoney());
				preparedStatement.setInt(6, order.getStatus());
				preparedStatement.setInt(7, order.getUserId());
				preparedStatement.setInt(8, order.getAddressId());
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
		public boolean update(Orders order) {
			boolean result = true;
			try {
				PreparedStatement preparedStatement = ConnectDB.connection()
						.prepareStatement("update orders set phoneNumber = ?, email = ?, "
								+ "note = ?, orderDate = ?, totalMoney = ?, status = ? ,userId = ?,address =?"
								+ " where id = ? ");
				preparedStatement.setString(1, order.getPhoneNumber());
				preparedStatement.setString(2, order.getEmail());
				preparedStatement.setString(3, order.getNote());
				preparedStatement.setTimestamp(4, new Timestamp(order.getOrderDate().getTime()));
				preparedStatement.setDouble(5, order.getTotalMoney());
				preparedStatement.setInt(6, order.getStatus());
				preparedStatement.setInt(7, order.getUserId());
				preparedStatement.setInt(8, order.getAddressId());
				preparedStatement.setInt(9, order.getId());
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
						.prepareStatement("delete from orders where id = ? ");
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

		// tim order dua vao id cua order
		public Orders findOrderById(int id) {
			Orders order = null;
			try {
				PreparedStatement preparedStatement = ConnectDB.connection()
						.prepareStatement("select * from orders where id = ? ");
				preparedStatement.setInt(1, id);
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					order = new Orders();
					order.setId(resultSet.getInt("id"));
					order.setPhoneNumber(resultSet.getString("phoneNumber"));
					order.setEmail(resultSet.getString("email"));
					order.setNote(resultSet.getString("note"));
					order.setOrderDate(resultSet.getTimestamp("orderDate"));
					order.setTotalMoney(resultSet.getDouble("totalMoney"));
					order.setStatus(resultSet.getInt("status"));
					order.setUserId(resultSet.getInt("userId"));
					order.setAddressId(resultSet.getInt("addressId"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				order = null;
			} finally {
				ConnectDB.disconnect();
			}
			return order;
		}
		// ham de lay ra order cuoi cung
		public Orders getLastOrder() {
			Orders order = new Orders();
			try {

				PreparedStatement ps = ConnectDB.connection().prepareStatement("SELECT * FROM orders order by id desc limit 1");


				ResultSet resultSet = ps.executeQuery();

				while (resultSet.next()) {
					order.setId(resultSet.getInt("id"));
					order.setPhoneNumber(resultSet.getString("phoneNumber"));
					order.setEmail(resultSet.getString("email"));
					order.setNote(resultSet.getString("note"));
					order.setOrderDate(resultSet.getTimestamp("orderDate"));
					order.setTotalMoney(resultSet.getDouble("totalMoney"));
					order.setStatus(resultSet.getInt("status"));
					order.setUserId(resultSet.getInt("userId"));
					order.setAddressId(resultSet.getInt("addressId"));
					return order;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		// ham lay ra danh sach order cua nguoi dung
		public List<Orders> findAllByUserId(int id) {
			List<Orders> orders = new ArrayList<>();
			try {
				PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from orders where userId = ?");
				preparedStatement.setInt(1, id);
				ResultSet resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					Orders order = new Orders();
					order.setId(resultSet.getInt("id"));
					order.setPhoneNumber(resultSet.getString("phoneNumber"));
					order.setEmail(resultSet.getString("email"));
					order.setNote(resultSet.getString("note"));
					order.setOrderDate(resultSet.getTimestamp("orderDate"));
					order.setTotalMoney(resultSet.getDouble("totalMoney"));
					order.setStatus(resultSet.getInt("status"));
					order.setUserId(resultSet.getInt("userId"));
					order.setAddressId(resultSet.getInt("addressId"));
					orders.add(order);
				}
			} catch (Exception e) {
				e.printStackTrace();
				orders = null;
			} finally {
				ConnectDB.disconnect();
			}
			return orders;
		}


}
