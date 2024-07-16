<%@page import="com.demo.models.*"%>
<%@page import="com.demo.entities.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet"
<<<<<<< HEAD
    href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css">
=======
	href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css">
>>>>>>> 310c0d33e599b5b2aec630d97f4cd21442fb83ef
<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
List<Pets> pets = (List<Pets>) request.getAttribute("petinventory");
CategoryModel categoryModel = new CategoryModel();
List<Categorys> categorys = categoryModel.findAll();
CatalogModel catalogModel = new CatalogModel();
int i =0;
%>
<!-- Start header section -->
<div class="content-wrapper">
<<<<<<< HEAD
    <div class="container-fluid">
        <div class="row mt-3">
            <div class="col-lg-12">
            <span></span>
                <form action="${pageContext.request.contextPath}/admin/quanlitonkho" method="get">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate">
                    <button type="submit">Lọc sản phẩm không xuất hiện đơn hàng</button>
                </form>
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Danh sách sản phẩm còn trong kho</h5>
                        <table id="example" class="display" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên thú cưng</th>
                                    <th>Kích thước</th>
                                    <th>Giới tính</th>
                                    <th>Thông tin cơ bản</th>
                                    <th>Thông tin cụ thể</th>
                                    <th>Xuất xứ</th>
                                    <th>Số lượng</th>
                                    <th>Giá (triệu đồng)</th>
                                    <th>Ngày sinh</th>
                                    <th>Ảnh</th>
                                    <th>Loại</th>
                                    <th>Chuyên mục</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                for (Pets pet : pets) {
                                    
                                %>
                                <tr>
                                    <td><%=++i%></td>
                                    <td><%=pet.getPetName()%></td>
                                    <td><%=pet.getPetType()%></td>
                                    <td><%=pet.getPetGender()%></td>
                                    <td><%=pet.getDescription()%></td>
                                    <td><%=pet.getDetail()%></td>
                                    <td><%=pet.getMade()%></td>
                                    <td><%=pet.getAmount()%></td>
                                    <td><%=pet.getMoney()%></td>
                                    <td><%=pet.getPetBirthday()%></td>
                                    <td>
                                        <img alt="Ảnh thú cưng" src="${pageContext.request.contextPath}/assets/user/images/pet/<%=pet.getImage() %>" width="100" height="100">
                                    </td>
                                    <td><%=categoryModel.findCategoryById(pet.getCategoryId()).getName()%></td>
                                    <td><%=catalogModel.findCatalogById(pet.getCatalogId()).getName()%></td>
                                    
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
        <div class="overlay toggle-menu"></div>
    </div>
</div>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script>
$(function() {
    $("#startDate, #endDate").datepicker({
        dateFormat: "yy-mm-dd"
    });
});
    new DataTable('#example');
</script>
=======
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<button class="add-catalog">
					<a
						href="${pageContext.request.contextPath}/admin/addwarehouseinvoice">Lọc theo yêu cầu
				</button>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách sản phẩm còn trong kho</h5>
						<table id="example" class="display" style="width: 100%">
							<thead>
								<tr>
									<th>#</th>
									<th>Tên thú cưng</th>
									<th>kích thước</th>
									<th>Giới tính</th>
									<th>Thông tin cơ bản</th>
									<th>Thông tin cụ thể</th>
									<th>Xuất xứ</th>
									<th>Số lượng</th>
									<th>Giá (triệu đồng)</th>
									<th>Ngày sinh</th>
									<th>Ảnh</th>
									<th>Loại</th>
									<th>Chuyên mục</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Pets pet : pets) {
									
								%>
								<tr>
									<td><%=++i%></td>
									<td><%=pet.getPetName()%></td>
									<td><%=pet.getPetType()%></td>
									<td><%=pet.getPetGender()%></td>
									<td><%=pet.getDescription()%></td>
									<td><%=pet.getDetail()%></td>
									<td><%=pet.getMade()%></td>
									<td><%=pet.getAmount()%></td>
									<td><%=pet.getMoney()%></td>
									<td><%=pet.getPetBirthday()%></td>
									<td>
									<img alt="${pageContext.request.contextPath }/assets/user/image/pet/<%=pet.getImage() %>" src="Ảnh thú cưng">
									</td>
									<td><%=categoryModel.findCategoryById(pet.getCategoryId())%></td>
									<td><%=catalogModel.findCatalogById(pet.getCatalogId())%></td>
									
								</tr>
								<%
								}
								%>
							
							<tbody>
							
						
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>
  <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script>
	new DataTable('#example');
</script>
>>>>>>> 310c0d33e599b5b2aec630d97f4cd21442fb83ef
