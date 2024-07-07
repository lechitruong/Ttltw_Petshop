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
List<Log> logs = (List<Log>) request.getAttribute("logs");
%>
<!-- Start header section -->
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Hoạt động người dùng</h5>
						<table id="example" class="display" style="width: 100%">
							<thead>
								<tr>
									<th>#</th>
									<th>Id người dùng</th>
									<th>Ip</th>
									<th>Cấp độ</th>
									<th>Quốc gia</th>
									<th>Thời gian</th>
									<th>Giá trị trước</th>
									<th>Giá trị sau</th>
								</tr>
							</thead>
							<tbody>
							<%
							for (Log log : logs) {
							%>
								<tr>
									<td><%=log.getId()%></td>
									<td><%=log.getUserId()%></td>
									<td><%=log.getIp()%></td>
									<td><%=log.getLevel()%></td>
									<td><%=log.getNational()%></td>
									<td><%=log.getTime()%></td>
									<td><%=log.getBeforeValue()%></td>
									<td><%=log.getAfterValue()%></td>
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