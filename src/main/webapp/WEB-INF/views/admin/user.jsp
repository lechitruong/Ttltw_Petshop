<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.demo.models.UserModel"%>
<%@page import="com.demo.entities.Users"%>
<%@page import="java.util.*"%>

<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
UserModel userModel = new UserModel();
List<Users> users = (List<Users>) request.getAttribute("users");

if (session.getAttribute("admin-username") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login");
}
%>
<!-- Start header section -->
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<button class="add-catalog">
					<a href="${pageContext.request.contextPath}/admin/adduser">Thêm
						User</a>
				</button>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách User</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Tên</th>
										<th scope="col">Email</th>
										<th scope="col">Số điện thoại</th>
										<th scope="col">Địa chỉ</th>
										<th scope="col">Hành động</th>

									</tr>
								</thead>
								<tbody>
									<%
									for (Users user : users) {
									%>
									<tr>
										<td scope="row"><%=user.getId()%></td>
										<td><%=user.getFullName()%></td>
										<td><%=user.getEmail()%></td>
										<td><%=user.getPhoneNumber()%></td>
										<td><%=user.getAddress()%></td>
										<td>
											<button class="btn btn-danger">
												<a
													href="${pageContext.request.contextPath}/admin/quanliuser?action=delete&id=<%= user.getId() %>">Xóa</a>
											</button>

											<button class="btn btn-success">
												<a
													href="${pageContext.request.contextPath}/admin/edituser?id=<%= user.getId() %>">Sửa</a>
											</button>
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>