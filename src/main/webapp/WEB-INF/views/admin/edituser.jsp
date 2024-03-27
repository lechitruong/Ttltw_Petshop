<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.demo.models.UserModel"%>
<%@page import="com.demo.entities.Users"%>
<!-- Start header section -->
<%
Users user = (Users) request.getAttribute("user");
%>
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">Sửa User</div>
						<hr>
						<form
							action="${pageContext.request.contextPath}/admin/edituser?action=edituser&id=<%= user.getId() %>"
							method="post">
							<div class="form-group">
								<label for="input-1">ID</label> <input type="text"
									class="form-control" id="input-1" readonly="readonly"
									placeholder="ID" value="<%=user.getId()%>" name="id">
							</div>
							<div class="form-group">
								<label for="input-1">Họ tên</label> <input type="text"
									class="form-control" id="input-2" placeholder="Họ tên"
									value="<%=user.getFullName()%>" name="fullname">
							</div>
							<div class="form-group">
								<label for="input-3">Số điện thoại</label> <input type="text"
									class="form-control" id="input-4" placeholder="Số điện thoại"
									value="<%=user.getPhoneNumber()%>" name="phonenumber">
							</div>
							<div class="form-group">
								<label for="input-3">UserName</label> <input type="text"
									class="form-control" id="input-5" placeholder="Username"
									value="<%=user.getUserName()%>" name="username">
							</div>
							<div class="form-group">
								<label for="input-5">Address</label> <input type="date"
									class="form-control" id="input-6" placeholder="Ngày tạo"
									value="<%=user.getAddress()%>" name="address">
							</div>

							<div class="form-group">
								<button class="btn btn-danger">
									<a href="${pageContext.request.contextPath}/admin/user/list">Hủy</a>
								</button>

								<button type="submit" class="btn btn-success">Cập nhật</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>