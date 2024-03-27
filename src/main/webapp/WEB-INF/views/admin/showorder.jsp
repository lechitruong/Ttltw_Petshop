<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.demo.entities.*" %>
<%@ page import="com.demo.models.*" %>
<%@ page import="java.util.*" %>
<%
  response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma" , "no-cache");
  response.setHeader("Expires" , "0");
  
  
  if (session.getAttribute("admin-username") == null){
	  response.sendRedirect(request.getContextPath() + "/admin/login");
  }
  List<Orders> orders = (List<Orders>)request.getAttribute("orders");
  %>
  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
        <!--End Row-->


        <div class="row">
 
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Danh sách đơn hàng</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                       <th scope="col">Tài khoản User</th>
                        <th scope="col">Họ Tên</th>
                        <th scope="col">Email</th>
                        <th scope="col">SĐT</th>
                         <th scope="col">Địa chỉ</th>
                         <th scope="col">Ghi chú</th>
                         <th scope="col">Tổng tiền</th>
                          <th scope="col">Ngày tạo</th>
                          <th scope="col">Hành động</th>
                         <th scope="col">Trạng thái</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                    
                    <% for(Orders order: orders){ %>
                    <form method="post" action="${pageContext.request.contextPath }/admin/donhang?action=browser&id=<%= order.getId() %>">
                      <tr>
                        <td scope="row"><%= order.getId() %></td>
                         <td><%= order.getUserId() %></td>
                        <td><%= order.getFullName() %></td>
                        <td><%= order.getEmail() %></td>
                        <td><%= order.getPhoneNumber() %></td>
                        <td><%= order.getAddress() %></td>
                         <td><%= order.getNote() %></td>
                         <td><%= order.getTotalMoney() %></td>
                          <td><%= order.getOrderDate() %>  </td>
                          <td>
                        <button class="btn btn-success"><i class="fa"></i><a href="${pageContext.request.contextPath}/admin/chitietdonhang?action=chitietdonhang&id=<%= order.getId() %>">Chi tiết</a></button>
                        </td>  				
        				 <td>
                         <button class="btn btn-danger" type="submit"><%= order.isStatus()?"Đã duyệt":"Duyệt đơn hàng" %></button>
                        </td>
                     </tr>
                     </form>
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