<%@page import="com.demo.models.CatalogModel"%>
<%@page import="com.demo.models.CategoryModel"%>
<%@ page import="java.util.List"%>
<%@page import="com.demo.models.PetModel"%>
<%@page import="com.demo.entities.Pets"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
List<Pets> pets = (List<Pets>) request.getAttribute("pets");
CategoryModel categoryModel = new CategoryModel();
CatalogModel catalogModel = new CatalogModel();

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
					<a href="${pageContext.request.contextPath}/admin/addsanpham">Thêm
						thú cưng</a>
				</button>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách thú cưng</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Tên thú cưng</th>
										<th scope="col">kích thước</th>
										<th scope="col">Giới tính</th>
										<th scope="col">Thông tin cơ bản</th>
										<th scope="col">Thông tin cụ thể</th>
										<th scope="col">Xuất xứ</th>
										<th scope="col">Số lượng</th>
										<th scope="col">Giá</th>
										<th scope="col">Ngày sinh</th>
										<th scope="col">Ảnh</th>
										<th scope="col">Loại</th>
										<th scope="col">Chuyên mục</th>
										<th scope="col">Hành động</th>
									</tr>
								</thead>
								<%
								for (Pets pet : pets) {
								%>

								<tbody>
									<tr>
										<th scope="row"><%=pet.getId()%></th>
										<td><%=pet.getPetName()%></td>
										<td><%=pet.getPetType()%></td>
										<td><%=pet.getPetGender()%></td>
										<td><%=pet.getDescription()%></td>
										<td><%=pet.getDetail()%></td>
										<td><%=pet.getMade()%></td>
										<td><%=pet.getAmount()%></td>
										<td><%=pet.getMoney()%></td>
										<td><%=pet.getCreateDate()%></td>
										<td><%=categoryModel.findCategoryById(pet.getCategoryPetId()).getName()%></td>
										<td><%=catalogModel.findCatalogById(pet.getCatalogId()).getName()%></td>
										<td>
											<button class="btn btn-danger">
												<a
													href="${pageContext.request.contextPath}/admin/danhsachsanpham?action=delete&id=<%= pet.getId() %>">Xóa</a>
											</button>

											<button class="btn btn-success">
												<a
													href="${pageContext.request.contextPath}/admin/editsanpham?id=<%= pet.getId() %>">Sửa</a>
											</button>
										</td>
									</tr>
							       </tbody>
								<%
								}
								%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>