package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.OrderDetails;
import com.demo.entities.Orders;

import DB.ConnectDB;

public class OrderDetailModel {
	// ham lay ra danh sach cac order
			public List<OrderDetails> findAll() {
				List<OrderDetails> orderDetails = new ArrayList<>();
				try {
					PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from orderdetails");
					ResultSet resultSet = preparedStatement.executeQuery();
					while (resultSet.next()) {
						OrderDetails orderDetail = new OrderDetails();
						orderDetail.setId(resultSet.getInt("id"));
						orderDetail.setQuantity(resultSet.getInt("quantity"));
						orderDetail.setOrderId(resultSet.getInt("orderId"));
						orderDetail.setPetId(resultSet.getInt("petId"));
						orderDetail.setMoney(resultSet.getDouble("money"));
						orderDetails.add(orderDetail);
					}
				} catch (Exception e) {
					e.printStackTrace();
					orderDetails = null;
				} finally {
					ConnectDB.disconnect();
				}
				return orderDetails;
			}

		// ham dang ky
			public boolean create(OrderDetails orderDetail) {
				boolean result = true;
				try {
					PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
							"insert into orderdetails(quantity, orderId,petId,money) values (?,?,?,?)");
					preparedStatement.setInt(1, orderDetail.getQuantity());
					preparedStatement.setDouble(2, orderDetail.getOrderId());
					preparedStatement.setInt(3, orderDetail.getPetId());
					preparedStatement.setDouble(4, orderDetail.getMoney());
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
			public boolean update(OrderDetails orderDetail) {
				boolean result = true;
				try {
					PreparedStatement preparedStatement = ConnectDB.connection()
							.prepareStatement("update orderdetails set quantity = ?, orderId = ?, "
									+ "petId = ?, money = ?"
									+ " where id = ? ");
					preparedStatement.setInt(1, orderDetail.getQuantity());
					preparedStatement.setDouble(2, orderDetail.getOrderId());
					preparedStatement.setInt(3, orderDetail.getPetId());
					preparedStatement.setDouble(4, orderDetail.getMoney());
					preparedStatement.setInt(5, orderDetail.getId());
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
							.prepareStatement("delete from orderdetails where id = ? ");
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

			// tim order dua vao id cua orderdetail
			public OrderDetails findOrderById(int id) {
				OrderDetails orderDetail = null;
				try {
					PreparedStatement preparedStatement = ConnectDB.connection()
							.prepareStatement("select * from orderdetails where id = ? ");
					preparedStatement.setInt(1, id);
					ResultSet resultSet = preparedStatement.executeQuery();
					while (resultSet.next()) {
						orderDetail = new OrderDetails();
						orderDetail.setId(resultSet.getInt("id"));
						orderDetail.setQuantity(resultSet.getInt("quantity"));
						orderDetail.setOrderId(resultSet.getInt("orderId"));
						orderDetail.setPetId(resultSet.getInt("petId"));
						orderDetail.setMoney(resultSet.getDouble("money"));
					}
				} catch (Exception e) {
					e.printStackTrace();
					orderDetail = null;
				} finally {
					ConnectDB.disconnect();
				}
				return orderDetail;
			}
			// lay ra danh sach orderdetails cua order dua vao id order
			public List<OrderDetails> findAllByOrderId(int orderId) {
				List<OrderDetails> orderDetails = new ArrayList<>();
				try {
					PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from orderdetails where orderId = ?");
					preparedStatement.setInt(1, orderId);
					ResultSet resultSet = preparedStatement.executeQuery();
					while (resultSet.next()) {
						OrderDetails orderDetail = new OrderDetails();
						orderDetail.setId(resultSet.getInt("id"));
						orderDetail.setQuantity(resultSet.getInt("quantity"));
						orderDetail.setOrderId(resultSet.getInt("orderId"));
						orderDetail.setPetId(resultSet.getInt("petId"));
						orderDetail.setMoney(resultSet.getDouble("money"));
						orderDetails.add(orderDetail);
					}
				} catch (Exception e) {
					e.printStackTrace();
					orderDetails = null;
				} finally {
					ConnectDB.disconnect();
				}
				return orderDetails;
			}
}
