<%@page import="com.demo.models.OrderModel"%>
<%@page import="com.demo.models.BillModel"%>
<%@page import="com.demo.entities.Bills"%>
<%@page import="java.util.*"%>
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css">
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
List<Bills> bills = (List<Bills>) request.getAttribute("bills");
OrderModel orderModel = new OrderModel();
%>
<!-- Start header section -->
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Hoá đơn người dùng</h5>
						<table id="example" class="display" style="width: 100%">
							<thead>
								<tr>
									<th>#</th>
									<th>Id người dùng</th>
									<th>Id đơn hàng</th>
									<th>Chi tiết đơn hàng</th>
									<th>Tổng tiền</th>
									<th>Phương thức thanh toán</th>
									<th>Thời gian</th>
									<th>Trạng thái</th>
								</tr>
							</thead>
							<tbody>
							<%
							for (Bills bill : bills) {
							%>
								<tr>
									<td><%= bill.getId()%></td>
									<td><%= orderModel.findOrderById(bill.getOrderId()).getUserId()%></td>
									<td><%= bill.getOrderId()%></td>
									<td>
                         <button class="btn btn-danger">
												<a href="${pageContext.request.contextPath}/admin/donhang?id=<%= bill.getOrderId() %>">Chi tiết</a>
						</button>
                        </td> 
									<td><%= orderModel.findOrderById(bill.getOrderId()).getTotalMoney() %> triệu đồng</td>
									<td><%= bill.getPaymentMethod() == 0?"Thanh toán bằng ngân hàng":bill.getPaymentMethod() == 1?"Thanh toán khi nhận hàng":"Thanh toán bằng paypal"%></td>
									<td><%= bill.getCreateDate()%></td>
									<c:if test="<%= bill.isStatus() == true %>">
										<td>Đã thanh toán</td>
									</c:if>
						
						<c:if test="<%= bill.isStatus() == false %>">
										 <td>
                         <button class="btn btn-danger">
												<a href="${pageContext.request.contextPath}/admin/quanlibill?action=confirm&id=<%= bill.getId() %>">Chưa Xác nhận</a>
						</button>
                        </td>  
						</c:if> 	

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
=======
<body onload="window.print();">
<div id="page" class="page">
    <div class="header">
        <div class="logo"><img src="../images/logo.jpg"/></div>
        <div class="company">C.Ty TNHH PetShop</div>
    </div>
  <br/>
  <div class="title">
        HÓA ĐƠN THANH TOÁN
        <br/>
        -------oOo-------
  </div>
  <br/>
  <br/>
  <table class="TableData">
    <tr>
      <th>STT</th>
      <th>Tên</th>
      <th>Đơn giá</th>
      <th>Số</th>
      <th>Thành tiền</th>
    </tr>
    <tbody>
								<tr>
									<td>aaaaa</td>
									<td>
                        aaaaaa
                        </td> 
									<td>aaaaaa</td>
									<td>aaaaaa</td>
									<td>aaaa</td>
								%>
							<tbody>
    <tr>
      <td colspan="4" class="tong">Tổng cộng</td>
      <td class="cotSo">aaaa</td>
    </tr>
  </table>
  <div class="footer-left"> Tp.HCM, ngày 16 tháng 12 năm 2014<br/>
    Khách hàng </div>
  <div class="footer-right"> Tp.HCM, ngày 16 tháng 12 năm 2014<br/>
    Nhân viên </div>
</div>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #FAFAFA;
    font: 12pt "Tohoma";
}
* {
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
.page {
    width: 21cm;
    overflow:hidden;
    min-height:297mm;
    padding: 2.5cm;
    margin-left:auto;
    margin-right:auto;
    background: white;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}
.subpage {
    padding: 1cm;
    border: 5px red solid;
    height: 237mm;
    outline: 2cm #FFEAEA solid;
}
 @page {
 size: A4;
 margin: 0;
}
button {
    width:100px;
    height: 24px;
}
.header {
    overflow:hidden;
}
.logo {
    background-color:#FFFFFF;
    text-align:left;
    float:left;
}
.company {
    padding-top:24px;
    text-transform:uppercase;
    background-color:#FFFFFF;
    text-align:right;
    float:right;
    font-size:16px;
}
.title {
    text-align:center;
    position:relative;
    color:#0000FF;
    font-size: 24px;
    top:1px;
}
.footer-left {
    text-align:center;
    text-transform:uppercase;
    padding-top:24px;
    position:relative;
    height: 150px;
    width:50%;
    color:#000;
    float:left;
    font-size: 12px;
    bottom:1px;
}
.footer-right {
    text-align:center;
    text-transform:uppercase;
    padding-top:24px;
    position:relative;
    height: 150px;
    width:50%;
    color:#000;
    font-size: 12px;
    float:right;
    bottom:1px;
}
.TableData {
    background:#ffffff;
    font: 11px;
    width:100%;
    border-collapse:collapse;
    font-family:Verdana, Arial, Helvetica, sans-serif;
    font-size:12px;
    border:thin solid #d3d3d3;
}
.TableData TH {
    background: rgba(0,0,255,0.1);
    text-align: center;
    font-weight: bold;
    color: #000;
    border: solid 1px #ccc;
    height: 24px;
}
.TableData TR {
    height: 24px;
    border:thin solid #d3d3d3;
}
.TableData TR TD {
    padding-right: 2px;
    padding-left: 2px;
    border:thin solid #d3d3d3;
}
.TableData TR:hover {
    background: rgba(0,0,0,0.05);
}
.TableData .cotSTT {
    text-align:center;
    width: 10%;
}
.TableData .cotTenSanPham {
    text-align:left;
    width: 40%;
}
.TableData .cotHangSanXuat {
    text-align:left;
    width: 20%;
}
.TableData .cotGia {
    text-align:right;
    width: 120px;
}
.TableData .cotSoLuong {
    text-align: center;
    width: 50px;
}
.TableData .cotSo {
    text-align: right;
    width: 120px;
}
.TableData .tong {
    text-align: right;
    font-weight:bold;
    text-transform:uppercase;
    padding-right: 4px;
}
.TableData .cotSoLuong input {
    text-align: center;
}
@media print {
 @page {
 margin: 0;
 border: initial;
 border-radius: initial;
 width: initial;
 min-height: initial;
 box-shadow: initial;
 background: initial;
 page-break-after: always;
}
}
</style>
</body>
