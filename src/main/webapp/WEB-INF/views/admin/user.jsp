<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.demo.models.UserModel"%>
<%@ page import="com.demo.models.AddressModel"%>
<%@ page import="com.demo.entities.Users"%>
<%@ page import="com.demo.entities.Address"%>
<%@ page import="java.util.*"%>

<%
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
UserModel userModel = new UserModel();
AddressModel addressModel = new AddressModel();
List<Users> users = (List<Users>) request.getAttribute("users");

if (session.getAttribute("admin-username") == null) {
    response.sendRedirect(request.getContextPath() + "/admin/login");
}

HttpSession session2 = request.getSession();
String message = (String) session2.getAttribute("message");
String msg1 = message;
session2.removeAttribute("message");
%>
<style>
.dataTables_wrapper .dataTables_paginate{
text-align:center;
margin: 10px;

}

    .dataTables_wrapper .dataTables_paginate .paginate_button {
        padding: 0.5rem 0.75rem;
        margin-left: 2px;
        border-radius: 0.25rem;
        font-size: 14px;
        line-height: 1.5;
        border: 1px solid #ccc;
        background-color: linear-gradient(45deg, #0c675e, #069e90);
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        background-color: green;
        color: #333;
        cursor: pointer;
    }

    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        background-color: #007bff;
        color: #fff;
        border-color: #007bff;
    }
</style>
<!-- Start header section -->
<div class="content-wrapper">
    <div class="container-fluid">
        <div class="row mt-3">
            <div class="col-lg-12">
                <button class="add-catalog">
                    <a href="${pageContext.request.contextPath}/admin/adduser">Thêm User</a>
                </button>
                <span style="color: red"> <%= msg1 == null ? "" : msg1 %></span>
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Danh sách User</h5>
                        <div class="table-responsive">
                            <table id="userTable" class="table table-striped">
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
                                    <% int count = 1;
                                    for (Users user : users) {
                                    %>
                                    <tr>
                                        <td><%=count++%></td>
                                        <td><%=user.getFullName()%></td>
                                        <td><%=user.getEmail()%></td>
                                        <td><%=user.getPhoneNumber()%></td>
                                        <td><%=addressModel.findAddressByIdUser(user.getId()) == null || addressModel.findAddressByIdUser(user.getId()).getCountry() == null || addressModel.findAddressByIdUser(user.getId()).getCountry() == "" ? "Chưa cập nhật" : addressModel.findAddressByIdUser(user.getId()).getAddress() + ", " + addressModel.findAddressByIdUser(user.getId()).getWard() + ", " + addressModel.findAddressByIdUser(user.getId()).getDistrict() + ", " + addressModel.findAddressByIdUser(user.getId()).getCountry() %></td>
                                        <td>
                                            <button class="btn btn-danger">
                                                <a href="${pageContext.request.contextPath}/admin/quanliuser?action=delete&id=<%= user.getId() %>">Xóa</a>
                                            </button>
                                            <button class="btn btn-success">
                                                <a href="${pageContext.request.contextPath}/admin/edituser?id=<%= user.getId() %>">Sửa</a>
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

<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        $('#userTable').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.25/i18n/Vietnamese.json"
            }
        });
    });
</script>
