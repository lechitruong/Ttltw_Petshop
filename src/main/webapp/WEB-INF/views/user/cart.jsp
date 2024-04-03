<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
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
                                <a href="index1.html">Trang chủ<i class="ti-arrow-right"></i></a>
                            </li>
                            <li class="active"><a href="blog-single.html">Giỏ hàng</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Shopping Cart -->
    <div class="shopping-cart section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Shopping Summery -->
                    <table class="table shopping-summery">
                        <thead>
                            <tr class="main-hading">
                                <th>Thú cưng</th>
                                <th>Tên</th>
                                <th class="text-center">Giá</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-center">Tổng</th>
                                <th class="text-center">
                                    <i class="ti-trash remove-icon"></i>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="total" value="0"></c:set>
                            <c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
                                <c:set var="total" value="${total + item.pet.money * item.quantity }"></c:set>
                                <tr>
                                    <td class="image" data-title="No">
                                        <img src="${pageContext.request.contextPath}/assets/user/images/anhcho/${item.pet.image}" alt="#" />
                                    </td>
                                    <td class="product-des" data-title="Description">
                                        <p class="product-name"><a href="#">${item.pet.petName}</a></p>
                                        <p class="product-des">${item.pet.description}</p>
                                    </td>
                                    <td class="price" data-title="Price">
                                        <span>${item.pet.money} triệu đồng</span>
                                    </td>
                                    <td class="qty" data-title="Qty" style="text-align:center;  font-size: 14px;">
                                        <!-- Input Order -->
                                        <div class="input-group">
                                            <span><a style="padding: 0 10px; margin:0 5px;" href="${pageContext.request.contextPath}/cart?action=minus&index=${i.index}"><i class="fa-solid fa-minus"></i></a>
                                              ${item.quantity }  
                                             <a style="padding: 0 10px; margin:0 5px;" href="${pageContext.request.contextPath}/cart?action=plus&index=${i.index}"><i class="fa-solid fa-plus"></i></a></span> 
                                        </div>
                                        <!--/ End Input Order -->
                                    </td>
                                    <td class="total-amount" data-title="Total">
                                        <span id="">${item.pet.money * item.quantity} triệu đồng </span>
                                    </td>
                                    <td class="action" data-title="Remove">
                                        <a href="${pageContext.request.contextPath }/cart?action=removeToCart&index=${i.index}"><i class="ti-trash remove-icon"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!--/ End Shopping Summery -->
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!-- Total Amount -->
                    <div class="total-amount">
                        <div class="row">
                            <div class="col-lg-8 col-md-5 col-12">
                                <div class="left">
                                    <div class="coupon">
                                        <form action="#" target="_blank">
                                            <input name="Coupon" placeholder="Nhập mã giảm giá" />
                                            <button class="btn">Áp dụng</button>
                                        </form>
                                    </div>
                                    <div class="checkbox">
                                        <label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox" /> Giao hàng (+100 nghìn đồng)</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-7 col-12">
                                <div class="right">
                                    <ul>
                                        <li >Tổng giỏ hàng<span id="totalAmount">${total } triệu đồng</span></li>
                                        <li class="last">Tổng<span id="totalAmount-discount">${total } triệu đồng</span></li>
                                    </ul>
                                    <div class="button5">
                                        <a href="${pageContext.request.contextPath }/checkout" class="btn">Thanh toán</a>
                                        <a href="${pageContext.request.contextPath }/home" class="btn">Tiếp tục mua hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/ End Total Amount -->
                </div>
            </div>
        </div>
    </div>
    <!--/ End Shopping Cart -->

    <!-- Start Shop Services Area  -->
    <section class="shop-services section">
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
    <!-- End Shop Newsletter -->

    <!-- Start Shop Newsletter  -->
    <section class="shop-newsletter section">
        <div class="container">
            <div class="inner-top">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 col-12">
                        <!-- Start Newsletter Inner -->
                        <div class="inner">
                            <h4>Newsletter</h4>
                            <p>Subscribe to our newsletter and get <span>10%</span> off your first purchase</p>
                            <form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
                                <input name="EMAIL" placeholder="Your email address" required="" type="email" />
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
</body>
</html>
