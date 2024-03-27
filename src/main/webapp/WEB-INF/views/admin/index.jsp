<%@page import="java.text.NumberFormat"%>
<%@page import="com.demo.entities.Orders"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxCrud.Order"%>
<%@page import="com.demo.models.UserModel"%>
<%@page import="com.demo.models.OrderDetailsModel"%>
<%@page import="com.demo.models.OrderModel"%>
<%@page import="com.google.api.client.http.HttpRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%
  response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma" , "no-cache");
  response.setHeader("Expires" , "0");
 
  
  if (session.getAttribute("admin-username") == null){
	  response.sendRedirect(request.getContextPath() + "/admin/login"); 
  }
  OrderModel orderModel = new OrderModel();
  int total = 0;
  for(Orders order : orderModel.getAll()){
	  if(order.isStatus()){
	  total += order.getTotalMoney();		  
	  }
  }
  NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new java.util.Locale("vi", "VN"));

  // Định dạng số
  String formattedNumber = currencyFormatter.format(total);
  
  %>
  <script>

  $(function() {
	    "use strict";
			
	    // chart 2

			var ctx = document.getElementById("chart2").getContext('2d');
				var myChart = new Chart(ctx, {
					type: 'doughnut',
					data: {
						labels: ["chó", "mèo", "thú cưng khác"],
						datasets: [{
							backgroundColor: [
								"#ffffff",
								"rgba(255, 255, 255, 0.70)",
								"rgba(255, 255, 255, 0.50)",
								"rgba(255, 255, 255, 0.20)"
							],
							data: [${dog}, ${cat}, ${other}],
							borderWidth: [0, 0, 0, 0]
						}]
					},
				options: {
					maintainAspectRatio: false,
				   legend: {
					 position :"bottom",	
					 display: false,
					    labels: {
						  fontColor: '#ddd',  
						  boxWidth:15
					   }
					}
					,
					tooltips: {
					  displayColors:false
					}
				   }
				});
			

			
			
	   });	
  </script>
  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid">
        <div class="card mt-3">
          <div class="card-content">
            <div class="row row-group m-0">
              <div class="col-12 col-lg-6 col-xl-3 border-light">
                <div class="card-body">
                  <h5 class="text-white mb-0"><%= new OrderModel().getAll().size() %> <span class="float-right"><i class="fa fa-shopping-cart"></i></span>
                  </h5>
                  <div class="progress my-3" style="height:3px;">
                    <div class="progress-bar" style="width:100%"></div>
                  </div>
                  <p class="mb-0 text-white small-font">Đơn hàng (theo tuần)</p>
                </div>
              </div>
              <div class="col-12 col-lg-6 col-xl-3 border-light">
              
                <div class="card-body">
                  <h5 class="text-white mb-0"><%= formattedNumber %></h5>
                  <div class="progress my-3" style="height:3px;">
                    <div class="progress-bar" style="width:100%"></div>
                  </div>
                  <p class="mb-0 text-white small-font">Lợi nhuận (theo tuần)</p>
                </div>
              </div>
              <div class="col-12 col-lg-6 col-xl-3 border-light">
                <div class="card-body">
                  <h5 class="text-white mb-0"><%= (new UserModel().findAll().size()) - 1	 %> <span class="float-right"><i class="fa fa-user"></i></span></h5>
                  <div class="progress my-3" style="height:3px;">
                    <div class="progress-bar" style="width:100%"></div>
                  </div>
                  <p class="mb-0 text-white small-font">Người dùng</p>
                </div>
              </div>
              <div class="col-12 col-lg-6 col-xl-3 border-light">
                <div class="card-body">
                  <h5 class="text-white mb-0"><%= new OrderDetailsModel().quantity1() %> <span class="float-right"><i class="fa fa-envira"></i></span></h5>
                  <div class="progress my-3" style="height:3px;">
                    <div class="progress-bar" style="width:100%"></div>
                  </div>
                  <p class="mb-0 text-white small-font">Bán ra (theo tuần)</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12 col-lg-4 col-xl-4">
            <div class="card">
              <div class="card-header">Danh mục bán chạy
              </div>
              <div class="card-body">
                <div class="chart-container-2">
                  <canvas id="chart2"></canvas>
                </div>
              </div>
              <div class="table-responsive">
                <table class="table align-items-center">
                  <tbody>
                    <tr>
                      <td><i class="fa fa-circle text-white mr-2"></i>Chó</td>
                      <td>${dog}</td>
                      <td>${dog / (dog + cat + other) * 100 } %</td>
                    </tr>
                     <tr>
                      <td><i class="fa fa-circle text-light-1 mr-2"></i>Mèo</td>
                      <td>${cat}</td>
                      <td>${cat / (dog + cat + other) * 100 } %</td>
                    </tr>
                    <tr>
                      <td><i class="fa fa-circle text-light-1 mr-2"></i>thú cưng khác</td>
                      <td>${other }</td>
                      <td>${other / (dog + cat + other) * 100 } %</td>
                    </tr>
<%--                    <tr>--%>
<%--                      <td><i class="fa fa-circle text-light-2 mr-2"></i>Hạt</td>--%>
<%--                      <td>215.500 VNĐ</td>--%>
<%--                      <td>+15%</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                      <td><i class="fa fa-circle text-light-3 mr-2"></i>Mật ong</td>--%>
<%--                      <td>310.000 VNĐ</td>--%>
<%--                      <td>+5%</td>--%>
<%--                    </tr>--%>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <div class="right-sidebar">
      <div class="switcher-icon">
        <i class="zmdi zmdi-settings zmdi-hc-spin"></i>
      </div>
      <div class="right-sidebar-content">
        <p class="mb-0">Màu nền admin</p>
        <hr>
        <ul class="switcher">
          <li id="theme1"></li>
          <li id="theme2"></li>
          <li id="theme3"></li>
          <li id="theme4"></li>
          <li id="theme5"></li>
          <li id="theme6"></li>
        </ul>
        <p class="mb-0">Màu nền gradient</p>
        <hr>
        <ul class="switcher">
          <li id="theme7"></li>
          <li id="theme8"></li>
          <li id="theme9"></li>
          <li id="theme10"></li>
          <li id="theme11"></li>
          <li id="theme12"></li>
          <li id="theme13"></li>
          <li id="theme14"></li>
          <li id="theme15"></li>
        </ul>
      </div>
    </div>
  </div>