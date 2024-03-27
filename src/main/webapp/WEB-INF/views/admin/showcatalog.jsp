<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.demo.entities.*" %>
<%@ page import="com.demo.models.*" %>
<%@ page import="java.util.*" %>
<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
List<Catalogs> catalogs = (List<Catalogs>) request.getAttribute("catalogs");
CategoryModel categoryModel = new CategoryModel();

if (session.getAttribute("admin-username") == null) {
	response.sendRedirect(request.getContextPath() + "/admin/login");
}
%>
<!-- Start header section -->
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->


		<div class="row">
			<div class="col-lg-12">
				<button class="add-catalog">
					<a
						href="${pageContext.request.contextPath}/admin/addcatalog">Thêm
						chuyên mục</a>
				</button>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách chuyên mục</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Tên chuyên mục</th>
										<th scope="col">phân loại</th>
										<th scope="col">Hành động</th>

									</tr>
								</thead>
								<tbody>
								<% for(Catalogs catalog : catalogs){ %>
										<tr>
											<td scope="row"><%= catalog.getId() %></td>
											<td><%= catalog.getName() %></td>
											<td><%= categoryModel.findCategoryById(catalog.getCategoryId()).getName() %></td>
											<td>
												<button class="btn btn-danger">
													<a
														href="${pageContext.request.contextPath}/admin/chuyenmuc?action=delete&id=<%= catalog.getId() %>">Xóa</a>
												</button>

												<button class="btn btn-success">
													<a
														href="${pageContext.request.contextPath}/admin/editcatalog?id=<%= catalog.getId() %>">Sửa</a>
												</button>
											</td>
										</tr>
										<% } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>