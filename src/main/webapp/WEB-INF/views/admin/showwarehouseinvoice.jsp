<%@page import="com.demo.entities.WarehouseInvoice"%>
<%@page import="com.demo.models.LogModel"%>
<%@page import="com.demo.entities.Log"%>
<%@page import="java.util.*"%>
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css">
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
List<WarehouseInvoice> warehouseInvoices = (List<WarehouseInvoice>) request.getAttribute("warehouseInvoices");
%>
<!-- Start header section -->
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Hoạt động nhập hàng</h5>
						<table id="example" class="display" style="width: 100%">
							<thead>
								<tr>
									<th>#</th>
									<th>Id thú cưng</th>
									<th>Số lượng</th>
									<th>Đơn giá</th>
									<th>Tổng </th>
									<th>Ngày nhập</th>
									<th>Trạng thái</th>
									<th>Hành động</th>
								</tr>
							</thead>
							<tbody>
							<%
							for (WarehouseInvoice warehouseInvoice : warehouseInvoices) {
							%>
								<tr>
									<td><%=warehouseInvoice.getId()%></td>
									<td><%=warehouseInvoice.getPetId()%></td>
									<td><%=warehouseInvoice.getQuantity()%></td>
									<td><%=warehouseInvoice.getPrice()%></td>
									<td><%=warehouseInvoice.getQuantity() * warehouseInvoice.getPrice()%></td>
									<td><%=warehouseInvoice.isStatus()%></td>
									<td>
									<button class="btn btn-danger">
												<a
													href="${pageContext.request.contextPath}/admin/danhsachnhaphang?action=confirm&id=<%= warehouseInvoice.getId() %>">Xác nhận</a>
											</button>

											<button class="btn btn-success">
												<a
													href="${pageContext.request.contextPath}/admin/danhsachnhaphang?action=remove&id=<%= warehouseInvoice.getId() %>">Xoá</a>
									</button>
									</td>
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