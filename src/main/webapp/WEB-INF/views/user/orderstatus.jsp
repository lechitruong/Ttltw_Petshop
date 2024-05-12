<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tình trạng đơn hàng</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css">
</head>
<body>
<h3 style="text-align:center">Đơn hàng của bạn</h3>
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
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>63</td>
                <td>2011-07-25</td>
                <td>$170,750</td>
                <td>63</td>
                <td>2011-07-25</td>
                <td>$170,750</td>
            </tr>       
    </table>
    <script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
<script>
new DataTable('#example');
</script>
</body>
</html>