<%@page import="com.demo.models.OrderDetailModel"%>
<%@page import="com.demo.entities.OrderDetails"%>
<%@page import="com.demo.models.AddressModel"%>
<%@page import="com.demo.models.OrderModel"%>
<%@page import="com.demo.entities.Users"%>
<%@page import="com.demo.entities.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tình trạng đơn hàng</title>
<link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css">
</head>
<body>
<section class="container_status">
<h3 style="text-align:center; position: relative;">Đơn hàng của bạn</h3>
<% 
OrderDetailModel orderDetailModel = new OrderDetailModel();
OrderModel orderModel = new OrderModel();
AddressModel addressModel = new AddressModel();
Users user = (Users) request.getSession().getAttribute(("user"));
List<Orders> orders =(List<Orders>) orderModel.findAllByUserId(user.getId());
int z =0;
int w =0;
%>
<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>STT</th>
                <th>Tên</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Ghi chú</th>
                <th>Tổng tiền</th>
                <th>Địa chỉ</th>
                <th>Thời gian đặt</th>
                <th>Trạng thái</th>
                <th>Hoá đơn</th>
            </tr>
        </thead>
        <tbody>
            <% for(int i=0; i< orders.size(); i++){ 
            	++z;
            %>
            <tr data-id="<%= orders.get(i).getId() %>" style="cursor: pointer;" class="clickTR">
                <td><%= z %></td>
                <td>${sessionScope.user.fullName }</td>
                <td><%= orders.get(i).getPhoneNumber() %></td>
                <td><%= orders.get(i).getEmail() %></td>
                <td><%= orders.get(i).getNote() %></td>
                <td><%= orders.get(i).getTotalMoney() %> triệu đồng</td>
                <td><%= addressModel.findAddressById(orders.get(i).getAddressId()).getAddress()+", "+ addressModel.findAddressById(orders.get(i).getAddressId()).getWard()+", "+addressModel.findAddressById(orders.get(i).getAddressId()).getDistrict()+", "+addressModel.findAddressById(orders.get(i).getAddressId()).getCountry() %></td>
                <td><%= orders.get(i).getOrderDate() %></td>
                <td><%= orders.get(i).getStatus() == 0? "Đang xác nhận": orders.get(i).getStatus() == 1? "Đang giao": "Đã giao"%></td>
                <td><%= orders.get(i).getStatus() == 0? "Đang xác nhận": orders.get(i).getStatus() == 1? "Đang giao": "Đã giao"%></td>
            </tr>       
                <% } %>
                </tbody>
    </table>
     <div id="dialog-message" title="Download complete" style="display: none; margin:50px 200px; z-index:999;">
     <div class="order-form" style="height: 300px; width: 720px;">
				<h3>Chi tiết đơn hàng</h3>	
			<table id="table" class="display" style="width:100%">
        <thead>
            <tr>
                <th>STT</th>
                <th>Tên thú cưng</th>
                <th>Kích thước</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Tổng tiền</th>
            </tr>
        </thead>
        <tbody>

            <tr>
                <td>STT</td>
                <td>Tên thú cưng</td>
                <td>Kích thước</td>
                <td>Số lượng </td>
                <td>Đơn giá (triệu đồng)</td>
                <td>Tổng tiền (triệu đồng)</td>
            </tr>    

          </tbody> 
            </table>
			</div>
</div>
<script>
$(document).ready(function () {
	$('#example tbody .clickTR').click(function(){
		$('#dialog-message').css('display','block');
	var orderId = $(this).attr('data-id');
	$.ajax({
		type:'GET',
		url: '${pageContext.request.contextPath}/dialogmessage',
		data:{ 
			orderId: orderId
		},
		success: function(data){
			var s= '';
			var orderdetails = data.orderdetails;
			var pets = data.pets;
				for (var i = 0; i < orderdetails.length; i++) {
					s+= '<tr>';
				 	s+= '<td>'+ (i+1) +'</td>'; 
					s+= '<td>'+pets[i].petName +'</td>';
					s+= '<td>'+pets[i].petType+'</td>';
					s+= '<td>'+orderdetails[i].quantity +'</td>';
					s+= '<td>'+orderdetails[i].money +' (triệu đồng)</td>';
					s+= '<td>'+orderdetails[i].money * orderdetails[i].quantity+' (triệu đồng)</td>';
				    s+= '</tr>';
				}
				$('#table tbody').html(s);
			}
			
	
		});
		
		
	
	});
	});

</script>
</section>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}
#dialog-message{
position:absolute;
top: 224px;
left:324px;
}

.order-form {
	width: 80%;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h3 {
	text-align: center;
}

.product-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.quantity {
	width: 40px;
	text-align: center;
}

.total {
	font-weight: bold;
}

.discount-code {
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.payment-options {
	margin-top: 20px;
}

.checkout-button {
	background-color: red;
	padding: 10px;
	cursor: pointer;
	color: white;
	border: none;
	border-radius: 5px;
}

@media ( max-width : 768px) {
	.order-form {
		width: 80%;
	}
}

.payment-options {
	margin-top: 20px;
	text-align: center;
}

.payment-options button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 10px;
	margin: 10px 10px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 16px;
}

.payment-options button:hover {
	background-color: #45a049;
}

.discount-code {
	margin-top: 20px;
	text-align: center;
}

.checkout-button {
	background-color: #e74c3c;
	color: white;
	padding: 15px 30px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
	transition: background-color 0.3s ease;
}

.checkout-button:hover {
	background-color: #c0392b;
}

.container {
	max-width: 1080px;
	margin: 0 auto;
	text-align: center;
}

form {
	margin-bottom: 100px;
}

select {
	padding: 10px;
	margin: 3px;
	width: 100%;
	box-sizing: border-box;
}

#result {
	font-size: 18px;
	color: #333;
}

/* General Styles */
.checkout-form-list {
	margin-bottom: 20px;
}

.checkout-form-list label {
	display: block;
	font-weight: bold;
	margin-bottom: 8px;
}

.checkout-form-list input, .checkout-form-list select,
	.checkout-form-list textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* Different Address Section */
.different-address {
	margin-top: 30px;
}

#ship-box-info {
	display: none;
	/* Hide the different address section initially */
}

/* Buttons and Additional Styles */
.checkout-button {
	background-color: #e74c3c;
	color: white;
	padding: 15px 30px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
	transition: background-color 0.3s ease;
}

.checkout-button:hover {
	background-color: #c0392b;
}

/* Responsive Styles */
@media screen and (max-width: 768px) {
	.row {
		flex-direction: column;
	}
	.checkout-form-list {
		width: 100%;
	}
}
.checkout-area {
            padding-top: 60px;
            padding-bottom: 30px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .col-lg-6 {
            width: 48%; 
            margin-bottom: 20px; 
        }
</style>
    <script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
<script>
new DataTable('#example');
new DataTable('#example2');
</script>
</body>
</html>