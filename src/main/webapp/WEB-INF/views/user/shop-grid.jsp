<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Lọc sản phẩm</title>
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
            <li class="active"><a href="blog-single.html">Lọc</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- End Breadcrumbs -->

<!-- Product Style -->
<section class="product-area shop-sidebar shop section">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-4 col-12">
        <div class="shop-sidebar">
          <!-- Single Widget -->
          <form action="shopgrid" method="get">
            <!-- Danh mục -->
            <div class="single-widget category">
              <h3 class="title">Danh mục</h3>
              <div class="categor-list">
                <label><input type="radio" name="category" value="all" checked> Tất cả</label><br>
                <label><input type="radio" name="category" value="dogs"> Chó</label><br>
                <label><input type="radio" name="category" value="cats"> Mèo</label><br>
                <label><input type="radio" name="category" value="others"> Thú cưng khác</label>
              </div>
            </div>

            <!-- Mức giá -->
            <div class="single-widget range">
              <h3 class="title">Mức giá</h3>
              <ul class="check-box-list">
                <li>
                  <a href="index1.html">Trang chủ<i class="ti-arrow-right"></i></a>
                  <label class="radio-inline" for="price1">
                    <input name="price" id="price1" type="radio" value="below_2" /> Dưới 2 triệu
                  </label>
                </li>
                <li>
                  <label class="radio-inline" for="price2">
                    <input name="price" id="price2" type="radio" value="2_3_5" /> 2 triệu - 3.5 triệu
                  </label>
                </li>
                <li>
                  <label class="radio-inline" for="price3">
                    <input name="price" id="price3" type="radio" value="above_3_5" /> Hơn 3.5 triệu
                  </label>
                </li>
                <li>
                  <label class="radio-inline" for="priceNone">
                    <input name="price" id="priceNone" type="radio" value="" checked /> Mọi mức giá
                  </label>
                </li>
              </ul>
            </div>

            <!-- Nút lọc -->
            <button type="submit" class="btn" style="margin: 10px; text-align:center;">Lọc</button>
          </form>

        </div>
      </div>
      <div class="col-lg-9 col-md-8 col-12">
        <div class="row">
          <div class="col-lg-3 col-md-4 col-12">
            <div class="shop-sidebar">
              <!-- Single Widget -->
            <form action="shopgrid" method="get">
  <!-- Danh mục -->
  <div class="single-widget category">
    <h3 class="title">Danh mục</h3>
    <div class="categor-list">
      <label><input type="radio" name="category" value="all" checked> Tất cả</label><br>
      <label><input type="radio" name="category" value="dogs"> Chó</label><br>
      <label><input type="radio" name="category" value="cats"> Mèo</label><br>
      <label><input type="radio" name="category" value="others"> Thú cưng khác</label>
    </div>
  </div>
  
  <!-- Mức giá -->
  <div class="single-widget range">
    <h3 class="title">Mức giá</h3>
    <ul class="check-box-list">
      <li>
        <label class="radio-inline" for="price1">
          <input name="price" id="price1" type="radio" value="below_2" /> Dưới 2 triệu
        </label>
      </li>
      <li>
        <label class="radio-inline" for="price2">
          <input name="price" id="price2" type="radio" value="2_3_5" /> 2 triệu - 3.5 triệu
        </label>
      </li>
      <li>
        <label class="radio-inline" for="price3">
          <input name="price" id="price3" type="radio" value="above_3_5" /> Hơn 3.5 triệu
        </label>
      </li>
      <li>
        <label class="radio-inline" for="priceNone">
          <input name="price" id="priceNone" type="radio" value="" checked /> Mọi mức giá
        </label>
      </li>
    </ul>
  </div>
  
  <!-- Số lượng sản phẩm -->
  <div class="single-widget">
    <h3 class="title">Số lượng sản phẩm</h3>
    <select name="limit">
      <option value="9" selected="selected">09</option>
      <option value="15">15</option>
      <option value="25">25</option>
      <option value="30">30</option>
    </select>
  </div>
  
  <!-- Nút lọc -->
  <button type="submit" class="btn" style="margin: 10px; text-align:center;">Lọc</button>
</form>


            </div>
          </div>
          <div class="col-lg-9 col-md-8 col-12">
            <div class="row">
  <c:forEach var="pet" items="${pets}">
    <div class="col-lg-4 col-md-6 col-12">
      <div class="single-product">
        <div class="product-img">
          <a href="${pageContext.request.contextPath }/petdetail?id=${pet.id}">
            <img class="default-img" src="${pageContext.request.contextPath}/assets/user/images/pet/${pet.image}" alt="${pet.petName}" />
            <img class="hover-img" src="${pageContext.request.contextPath}/assets/user/images/pet/${pet.image}" alt="${pet.petName}" />
          </a>
          <div class="button-head">
            <div class="product-action">
              <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="${pageContext.request.contextPath }/petdetail?id=${pet.id}"><i class="ti-eye"></i><span>Xem chi tiết</span></a>
              <a title="Wishlist" href="${pageContext.request.contextPath }/wishlistpet?action=wishlist&id=${pet.id}"><i class="ti-heart"></i><span>Thêm vào yêu thích</span></a>
            </div>
            <div class="product-action-2">
              <a title="Add to cart" href="${pageContext.request.contextPath }/cart?action=addToCart&id=${pet.id}">Thêm giỏ hàng</a>
          <div class="col-12">
            <!-- Shop Top -->
            <div class="shop-top">
              <div class="shop-shorter">
                <div class="single-shorter">
                  <label>Hiển thị :</label>
                  <select>
                    <option selected="selected">09</option>
                    <option>15</option>
                    <option>25</option>
                    <option>30</option>
                  </select>
                </div>
                <div class="single-shorter">
                  <label>Sắp xếp theo :</label>
                  <select>
                    <option selected="selected">Tên</option>
                    <option>Giá</option>
                    <option>Kích thước</option>
                  </select>
                </div>
              </div>
              <ul class="view-mode">
                <li class="active">
                  <a href="shop-grid.html"
                  ><i class="fa fa-th-large"></i
                  ></a>
                </li>
                <li>
                  <a href="shop-list.html"><i class="fa fa-th-list"></i></a>
                </li>
              </ul>
            </div>
            <!--/ End Shop Top -->
          </div>
        </div>
        <div class="product-content">
          <h3><a href="product-details.html?id=${pet.id}">${pet.petName}</a></h3>
          <div class="product-price">
            <span>${pet.money} triệu đồng</span>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</div>

          </div>
        </div>
      </div>
    </section>
    <!--/ End Product Style 1  -->

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
   
<!--/ End Product Style 1  -->

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
<!-- Modal end -->
</body>
</html>
