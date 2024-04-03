<%@page import="java.util.ArrayList"%>
<%@page import="com.demo.entities.Item"%>
<%@page import="com.demo.models.ItemModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="js">
		 <!-- Breadcrumbs -->
    <div class="breadcrumbs">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="bread-inner">
              <ul class="bread-list">
                <li>
                  <a href="index1.html"
                    >Trang chủ<i class="ti-arrow-right"></i
                  ></a>
                </li>
                <li class="active">
                  <a href="blog-single.html">Thanh toán</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Checkout -->
    <section class="shop checkout section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-12">
            <div class="checkout-form">
              <h2>Thanh toán của bạn</h2>
              <p>Vui lòng điền thông tin</p>
              <!-- Form -->
              <form class="form" method="post" action="#">
                <div class="row">
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Họ<span>*</span></label>
                      <input
                        type="text"
                        name="name"
                        placeholder=""
                        required="required"
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Tên<span>*</span></label>
                      <input
                        type="text"
                        name="name"
                        placeholder=""
                        required="required"
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Email<span>*</span></label>
                      <input class="form-control" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" id="inputEmailAddress" type="email" placeholder="Nhập email">
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Số điện thoại<span>*</span></label>
                      <input class="form-control" value="" name="phoneNumber" id="inputPhone" pattern="(\(\+[0-9]{2}\)|0)([0-9]{9,10})" type="tel" placeholder="Nhập số điện thoại của bạn" required>
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Tỉnh/Thành Phố<span>*</span></label>
                      <select name="country_name" id="country">
                        <option value="AF">Afghanistan</option>
                        <option value="AX">Åland Islands</option>
                        <option value="AL">Albania</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Quận/Huyện<span>*</span></label>
                      <select name="state-province" id="state-province">
                        <option value="divition" selected="selected">
                          New Yourk
                        </option>
                        <option>Los Angeles</option>
                        <option>Chicago</option>
                        <option>Houston</option>
                        <option>San Diego</option>
                        <option>Dallas</option>
                        <option>Charlotte</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Địa chỉ 1<span>*</span></label>
                      <input
                        type="text"
                        name="address"
                        placeholder=""
                        required="required"
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Địa chỉ 2<span>*</span></label>
                      <input
                        type="text"
                        name="address"
                        placeholder=""
                        required="required"
                      />
                    </div>
                  </div>
                  <!-- <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Postal Code<span>*</span></label>
                      <input
                        type="text"
                        name="post"
                        placeholder=""
                        required="required"
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Company<span>*</span></label>
                      <select name="company_name" id="company">
                        <option value="company" selected="selected">
                          Microsoft
                        </option>
                        <option>Apple</option>
                        <option>Xaiomi</option>
                        <option>Huawer</option>
                        <option>Wpthemesgrid</option>
                        <option>Samsung</option>
                        <option>Motorola</option>
                      </select>
                    </div>
                  </div> -->
                  <div class="col-12">
                    <div class="form-group create-account">
                      <input id="cbox" type="checkbox" />
                      <label>Chưa có tài khoản?</label>
                    </div>
                  </div>
                </div>
              </form>
              <!--/ End Form -->
            </div>
          </div>
          <%
          HttpSession session2 = request.getSession();
          List<Item> cart =(List<Item>) session2.getAttribute("cart");
          
          %>
          <div class="col-lg-4 col-12">
            <div class="order-details">
              <!-- Order Widget -->
              <div class="single-widget">
                <h2>Tổng giỏ hàng</h2>
                <div class="content">
                  <ul>
                    <li>Tổng hàng<span><%= ItemModel.total(cart) %> triệu đồng</span></li>
                    <li>(+) Giao hàng<span>0.1 triệu đồng</span></li>
                    <li class="last">Tổng<span><%= ItemModel.total(cart) + 0.1 %> triệu đồng</span></li>
                  </ul>
                </div>
              </div>
              <!--/ End Order Widget -->
              <!-- Order Widget -->
              <div class="single-widget">
                <h2>Phương thức thanh toán</h2>
                <div class="content">
                  <div class="checkbox">
                    <label class="checkbox-inline" for="1"
                      ><input name="updates" id="1" type="checkbox" />Quét mã
                      QR</label
                    >
                    <label class="checkbox-inline" for="2"
                      ><input name="news" id="2" type="checkbox" />Thanh toán
                      khi nhận hàng</label
                    >
                    <label class="checkbox-inline" for="3"
                      ><input name="news" id="3" type="checkbox" />Thanh toán
                      PayPal</label
                    >
                  </div>
                </div>
              </div>
              <!--/ End Order Widget -->
              <!-- Payment Method Widget -->
              <div class="single-widget payement">
                <div class="content">
                  <img src="images/payment-method.png" alt="#" />
                </div>
              </div>
              <!--/ End Payment Method Widget -->
              <!-- Button Widget -->
              <div class="single-widget get-button">
                <div class="content">
                  <div class="button">
                    <a href="#" class="btn">Kiểm tra thanh toán</a>
                  </div>
                </div>
              </div>
              <!--/ End Button Widget -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--/ End Checkout -->

    <!-- Start Shop Services Area  -->
    <section class="shop-services section home">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="ti-rocket"></i>
              <h4>Free shiping</h4>
              <p>Orders over $100</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="ti-reload"></i>
              <h4>Free Return</h4>
              <p>Within 30 days returns</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="ti-lock"></i>
              <h4>Sucure Payment</h4>
              <p>100% secure payment</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="ti-tag"></i>
              <h4>Best Peice</h4>
              <p>Guaranteed price</p>
            </div>
            <!-- End Single Service -->
          </div>
        </div>
      </div>
    </section>
    <!-- End Shop Services -->

    <!-- Start Shop Newsletter  -->
    <section class="shop-newsletter section">
      <div class="container">
        <div class="inner-top">
          <div class="row">
            <div class="col-lg-8 offset-lg-2 col-12">
              <!-- Start Newsletter Inner -->
              <div class="inner">
                <h4>Newsletter</h4>
                <p>
                  Subscribe to our newsletter and get <span>10%</span> off your
                  first purchase
                </p>
                <form
                  action="mail/mail.php"
                  method="get"
                  target="_blank"
                  class="newsletter-inner"
                >
                  <input
                    name="EMAIL"
                    placeholder="Your email address"
                    required=""
                    type="email"
                  />
                  <button class="btn">Subscribe</button>
                </form>
              </div>
              <!-- End Newsletter Inner -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- End Shop Newsletter -->
    <script>
</script>
</body>
</html>