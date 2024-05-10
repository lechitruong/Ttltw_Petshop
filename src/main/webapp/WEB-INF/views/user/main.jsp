<%@page import="com.demo.entities.Categorys"%>
<%@page import="com.demo.models.CatalogModel"%>
<%@page import="com.demo.models.CategoryModel"%>
<%@page import="com.demo.models.PetModel"%>
<%@page import="com.demo.entities.Pets"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%
    CategoryModel categoryModel = new CategoryModel();
    CatalogModel catalogModel = new CatalogModel();
    PetModel petModel = new PetModel();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="js">
<!-- Slider Area -->
	<!-- Slider Area -->
    <section class="hero-slider">
      <!-- Single Slider -->
      <div class="single-slider">
        <div class="container">
          <div class="row no-gutters">
            <div class="col-lg-9 offset-lg-3 col-12">
              <div class="text-inner">
                <div class="row">
                  <div class="col-lg-7 col-12">
                    <div class="hero-text">
                      <h1><span>GIẢM TỚI 50% </span>Chó Alaska</h1>
                      <p>
                        Một trong những loài được yêu thích nhất <br />
                        Có lông rậm, kích thước to lớn <br />
                        và mạnh mẽ .
                      </p>
                      <div class="button">
                        <a href="#" class="btn">Mua ngay!</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/ End Single Slider -->
    </section>
    <!--/ End Slider Area -->

    <!-- Start Small Banner  -->
    <section class="small-banner section">
      <div class="container-fluid">
        <div class="row">
          <!-- Single Banner  -->
          <div class="col-lg-4 col-md-6 col-12">
            <div class="single-banner">
              <img src="https://via.placeholder.com/600x370" alt="#" />
              <div class="content">
                <p>Danh sách chó</p>
                <h3>
                  Được xem <br />
                  nhiều nhất
                </h3>
                <a href="#">Khám phá ngay</a>
              </div>
            </div>
          </div>
          <!-- /End Single Banner  -->
          <!-- Single Banner  -->
          <div class="col-lg-4 col-md-6 col-12">
            <div class="single-banner">
              <img src="https://via.placeholder.com/600x370" alt="#" />
              <div class="content">
                <p>Danh mục thú cưng</p>
                <h3>
                  Mới nhất <br />
                  2023
                </h3>
                <a href="#">Khám phá ngay</a>
              </div>
            </div>
          </div>
          <!-- /End Single Banner  -->
          <!-- Single Banner  -->
          <div class="col-lg-4 col-12">
            <div class="single-banner tab-height">
              <img src="https://via.placeholder.com/600x370" alt="#" />
              <div class="content">
                <p>Giảm thần tốc</p>
                <h3>
                  Mùa hè <br />
                  Giảm tới <span>40%</span>
                </h3>
                <a href="#">Khám phá ngay</a>
              </div>
            </div>
          </div>
          <!-- /End Single Banner  -->
        </div>
      </div>
    </section>
    <!-- End Small Banner -->

    <!-- Start Product Area -->
    <div class="product-area section">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="section-title">
              <h2>Thú cưng hot</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="product-info">
              <div class="nav-main">
                <!-- Tab Nav -->
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                <% 
                for(Categorys category : categoryModel.findAll()){
                %>
                  <li class="nav-item">
                    <input type="button" class="filterByCategory" value="<%= category.getName() %>" id="<%= category.getId() %>"></li>
                  </li> 
                  <%
                  }
                  %>
                </ul>
                <!--/ End Tab Nav -->
              </div>
              <script>
              $(document).ready(function() {
      			$('.filterByCategory').click(function() {
      				var idcategory = $(this).attr('id');
      				console.log(idcategory);
      				var s = '';
      				$.ajax({
      					type: 'GET',
      					url: '${pageContext.request.contextPath}/home',
      					dataType: 'json',
      					contentType: 'application/json; charset=utf-8',
      					data: {
      						action: 'filterByCategory',
      						idcategory : idcategory
      					},
      					success: function(pet) {
      						for(var i = 0; i < pet.length ;i++) {
      							if(pet[i].categoryId == 1) {
      								categoryName = 'Chó';
      							} else if(pet[i].categoryId == 2) {
      								categoryName = 'Mèo';
      							} else if(pet[i].categoryId == 3) {
      								categoryName = 'Thú cưng khác';
      							} 	
      							s+= '<div class="col-xl-3 col-lg-4 col-md-4 col-12">';
      							s+= '<div class="single-product">';
      							s+= '<div class="product-img">';
      							s+= '<a href="${pageContext.request.contextPath }/petdetail?id='+pet[i].id+'">';
      							s+= '<img class="default-img" src="${pageContext.request.contextPath}/assets/user/images/anhcho/'+ pet[i].image+'" alt="#" />';
      							s+= '<img class="hover-img" src="${pageContext.request.contextPath}/assets/user/images/anhcho/'+ pet[i].image+'" alt="#" />';
      							s+= '<span class="new">New</span>';
      							s+= '</a>';
      							s+= '<div class="button-head">';
      							s+= '<div class="product-action">';
      							s+= '<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class="ti-eye"></i><span>Xem chi tiết</span></a>';
      							s+= '<a title="Wishlist" href="#"><i class="ti-heart"></i><span>Thêm vào yêu thích</span></a>';
      							s+= '</div>';
      							s+= '<div class="product-action-2">';
      							s+= '<a title="Add to cart" href="${pageContext.request.contextPath}/cart?action=addToCart&id='+pet[i].id+'">Thêm vào giỏ hàng</a>';
      							s+= '</div>';
      							s+= '</div>';
      							s+= '</div>';	
      							s+= '<div class="product-content">';
      							s+= '<h3>';
      							s+= '<a href="${pageContext.request.contextPath}/petdetail">'+pet[i].petName+'</a>';
      							s+= '</h3>';	
      							s+= '<div class="product-price">';	
      							s+= '<span>'+pet[i].money+' triệu đồng</span>';
      							s+= '</div>';
      							s+= '</div>';
      							s+= '</div>';
      							s+= '</div>';
      						}	
      						$('.tab-single .row').html(s);
      					}
      				});
      			});
      		});
              </script>
              <div class="tab-content" id="myTabContent">
                <!-- Start Single Tab -->
                <!-- Cho -->
                <div class="tab-pane fade show active" id="man" role="tabpanel">
                  <div class="tab-single">
                    <div class="row">
                    <% for(Pets pet: petModel.findAllByCategory(1)){ 
                    %>
                      <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                        <div class="single-product">
                          <div class="product-img">
                            <a href="${pageContext.request.contextPath }/petdetail?id=<%=pet.getId() %>">
                              <img class="default-img" src="${pageContext.request.contextPath}/assets/user/images/anhcho/<%= pet.getImage() %>" alt="#" />
                              <img class="hover-img" src="${pageContext.request.contextPath}/assets/user/images/anhcho/<%= pet.getImage() %>" alt="#" />
                              <span class="new">New</span>
                            </a>
                            <div class="button-head">
                              <div class="product-action">
                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class="ti-eye"></i><span>Xem chi tiết</span></a>
                                <a title="Wishlist" href="#"><i class="ti-heart"></i><span>Thêm vào yêu thích</span></a>
                              </div>
                              <div class="product-action-2">
                                <a title="Add to cart" href="${pageContext.request.contextPath }/cart?action=addToCart&id=<%= pet.getId() %>">Thêm vào giỏ hàng</a>
                              </div>
                            </div>
                          </div>
                          <div class="product-content">
                            <h3>
                              <a href="product-details.html"><%= pet.getPetName() %></a>
                            </h3>
                            <div class="product-price">
                              <span><%= pet.getMoney() %> triệu đồng</span>
                            </div>
                          </div>
                        </div>
                      </div>
   <%
                    }
   %>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ End Single Tab -->
                
              </div>
            </div>
          </div>
        </div>
      </div>
    <!-- End Product Area -->

    <!-- Start Midium Banner  -->
    <section class="midium-banner">
      <div class="container">
        <div class="row">
          <!-- Single Banner  -->
          <div class="col-lg-6 col-md-6 col-12">
            <div class="single-banner">
              <img src="https://via.placeholder.com/600x370" alt="#" />
              <div class="content">
                <p>Man's Collectons</p>
                <h3>Man's items <br />Up to<span> 50%</span></h3>
                <a href="#">Shop Now</a>
              </div>
            </div>
          </div>
          <!-- /End Single Banner  -->
          <!-- Single Banner  -->
          <div class="col-lg-6 col-md-6 col-12">
            <div class="single-banner">
              <img src="https://via.placeholder.com/600x370" alt="#" />
              <div class="content">
                <p>shoes women</p>
                <h3>
                  mid season <br />
                  up to <span>70%</span>
                </h3>
                <a href="#" class="btn">Shop Now</a>
              </div>
            </div>
          </div>
          <!-- /End Single Banner  -->
        </div>
      </div>
    </section>
    <!-- End Midium Banner -->

    <!-- Start Most Popular -->
    <div class="product-area most-popular section">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="section-title">
              <h2>Thú cưng hot</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="owl-carousel popular-slider">
              <!-- Start Single Product -->
              <div class="single-product">
                <div class="product-img">
                  <a href="product-details.html">
                    <img
                      class="default-img"
                      src="https://via.placeholder.com/550x750"
                      alt="#"
                    />
                    <img
                      class="hover-img"
                      src="https://via.placeholder.com/550x750"
                      alt="#"
                    />
                    <span class="out-of-stock">Hot</span>
                  </a>
                  <div class="button-head">
                    <div class="product-action">
                      <a
                        data-toggle="modal"
                        data-target="#exampleModal"
                        title="Quick View"
                        href="#"
                        ><i class="ti-eye"></i><span>Theo dõi</span></a
                      >
                      <a title="Wishlist" href="#"
                        ><i class="ti-heart"></i><span>Yêu thích</span></a
                      >
                    </div>
                    <div class="product-action-2">
                      <a title="Add to cart" href="#">Thêm vào giỏ hàng</a>
                    </div>
                  </div>
                </div>
                <div class="product-content">
                  <h3>
                    <a href="product-details.html">Pet đẳng cấp</a>
                  </h3>
                  <div class="product-price">
                    <span class="old">Giá cũ</span>
                    <span>Giá mới</span>
                  </div>
                </div>
              </div>
              <!-- End Single Product -->
              <!-- Start Single Product -->
              <div class="single-product">
                <div class="product-img">
                  <a href="product-details.html">
                    <img
                      class="default-img"
                      src="https://via.placeholder.com/550x750"
                      alt="#"
                    />
                    <img
                      class="hover-img"
                      src="https://via.placeholder.com/550x750"
                      alt="#"
                    />
                  </a>
                  <div class="button-head">
                    <div class="product-action">
                      <a
                        data-toggle="modal"
                        data-target="#exampleModal"
                        title="Quick View"
                        href="#"
                        ><i class="ti-eye"></i><span>Quick Shop</span></a
                      >
                      <a title="Wishlist" href="#"
                        ><i class="ti-heart"></i><span>Add to Wishlist</span></a
                      >
                      <a title="Compare" href="#"
                        ><i class="ti-bar-chart-alt"></i
                        ><span>Add to Compare</span></a
                      >
                    </div>
                    <div class="product-action-2">
                      <a title="Add to cart" href="#">Add to cart</a>
                    </div>
                  </div>
                </div>
                <div class="product-content">
                  <h3>
                    <a href="product-details.html">Women Hot Collection</a>
                  </h3>
                  <div class="product-price">
                    <span>$50.00</span>
                  </div>
                </div>
              </div>
              <!-- End Single Product -->
              <!-- Start Single Product -->
              <div class="single-product">
                <div class="product-img">
                  <a href="product-details.html">
                    <img
                      class="default-img"
                      src="https://via.placeholder.com/550x750"
                      alt="#"
                    />
                    <img
                      class="hover-img"
                      src="https://via.placeholder.com/550x750"
                      alt="#"
                    />
                    <span class="new">New</span>
                  </a>
                  <div class="button-head">
                    <div class="product-action">
                      <a
                        data-toggle="modal"
                        data-target="#exampleModal"
                        title="Quick View"
                        href="#"
                        ><i class="ti-eye"></i><span>Quick Shop</span></a
                      >
                      <a title="Wishlist" href="#"
                        ><i class="ti-heart"></i><span>Add to Wishlist</span></a
                      >
                      <a title="Compare" href="#"
                        ><i class="ti-bar-chart-alt"></i
                        ><span>Add to Compare</span></a
                      >
                    </div>
                    <div class="product-action-2">
                      <a title="Add to cart" href="#">Add to cart</a>
                    </div>
                  </div>
                </div>
                <div class="product-content">
                  <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                  <div class="product-price">
                    <span>$50.00</span>
                  </div>
                </div>
              </div>
              <!-- End Single Product -->
              <!-- Start Single Product -->
              <div class="single-product">
                <div class="product-img">
                  <a href="product-details.html">
                    <img
                      class="default-img"
                      src="https://via.placeholder.com/550x750"
                      alt="#"
                    />
                    <img
                      class="hover-img"
                      src="https://via.placeholder.com/550x750"
                      alt="#"
                    />
                  </a>
                  <div class="button-head">
                    <div class="product-action">
                      <a
                        data-toggle="modal"
                        data-target="#exampleModal"
                        title="Quick View"
                        href="#"
                        ><i class="ti-eye"></i><span>Quick Shop</span></a
                      >
                      <a title="Wishlist" href="#"
                        ><i class="ti-heart"></i><span>Add to Wishlist</span></a
                      >
                      <a title="Compare" href="#"
                        ><i class="ti-bar-chart-alt"></i
                        ><span>Add to Compare</span></a
                      >
                    </div>
                    <div class="product-action-2">
                      <a title="Add to cart" href="#">Add to cart</a>
                    </div>
                  </div>
                </div>
                <div class="product-content">
                  <h3>
                    <a href="product-details.html">Awesome Bags Collection</a>
                  </h3>
                  <div class="product-price">
                    <span>$50.00</span>
                  </div>
                </div>
              </div>
              <!-- End Single Product -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Most Popular Area -->

    <!-- Start Shop Home List  -->
    <section class="shop-home-list section">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6 col-12">
            <div class="row">
              <div class="col-12">
                <div class="shop-section-title">
                  <h1>Đang giảm giá</h1>
                </div>
              </div>
            </div>
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h4 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h4>
                    <p class="price with-discount">$59</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h5 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h5>
                    <p class="price with-discount">$44</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h5 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h5>
                    <p class="price with-discount">$89</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
          </div>
          <div class="col-lg-4 col-md-6 col-12">
            <div class="row">
              <div class="col-12">
                <div class="shop-section-title">
                  <h1>Bán chạy</h1>
                </div>
              </div>
            </div>
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h5 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h5>
                    <p class="price with-discount">$65</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h5 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h5>
                    <p class="price with-discount">$33</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h5 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h5>
                    <p class="price with-discount">$77</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
          </div>
          <div class="col-lg-4 col-md-6 col-12">
            <div class="row">
              <div class="col-12">
                <div class="shop-section-title">
                  <h1>Theo dõi nhiều nhất</h1>
                </div>
              </div>
            </div>
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h5 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h5>
                    <p class="price with-discount">$22</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h5 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h5>
                    <p class="price with-discount">$35</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
            <!-- Start Single List  -->
            <div class="single-list">
              <div class="row">
                <div class="col-lg-6 col-md-6 col-12">
                  <div class="list-image overlay">
                    <img src="https://via.placeholder.com/115x140" alt="#" />
                    <a href="#" class="buy"
                      ><i class="fa fa-shopping-bag"></i
                    ></a>
                  </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12 no-padding">
                  <div class="content">
                    <h5 class="title">
                      <a href="#">Licity jelly leg flat Sandals</a>
                    </h5>
                    <p class="price with-discount">$99</p>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Single List  -->
          </div>
        </div>
      </div>
    </section>
    <!-- End Shop Home List  -->

    <!-- Start Cowndown Area -->
    <section class="cown-down">
      <div class="section-inner">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-6 col-12 padding-right">
              <div class="image">
                <img src="https://via.placeholder.com/750x590" alt="#" />
              </div>
            </div>
            <div class="col-lg-6 col-12 padding-left">
              <div class="content">
                <div class="heading-block">
                  <p class="small-title">Giao dịch trong ngày</p>
                  <h3 class="title">Beatutyful dress for women</h3>
                  <p class="text">
                    Suspendisse massa leo, vestibulum cursus nulla sit amet,
                    frungilla placerat lorem. Cars fermentum, sapien.
                  </p>
                  <h1 class="price">$1200 <s>$1890</s></h1>
                  <div class="coming-time">
                    <div class="clearfix" data-countdown="2021/02/30"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /End Cowndown Area -->
    <!-- Start Shop Services Area -->
    <section class="shop-services section home">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="ti-rocket"></i>
              <h4>Miễn phí giao hàng</h4>
              <p>Đơn hàng trên 3 triệu</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="ti-reload"></i>
              <h4>Miễn phí hoàn trả hàng</h4>
              <p>Trong 10 ngày</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="ti-lock"></i>
              <h4>Thanh toán an toàn</h4>
              <p>100% thanh toán thành công</p>
            </div>
            <!-- End Single Service -->
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <!-- Start Single Service -->
            <div class="single-service">
              <i class="ti-tag"></i>
              <h4>Giá tốt nhất</h4>
              <p>Đảm bảo giá</p>
            </div>
            <!-- End Single Service -->
          </div>
        </div>
      </div>
    </section>
    <!-- End Shop Services Area -->

    <!-- Start Shop Newsletter  -->
    <section class="shop-newsletter section">
      <div class="container">
        <div class="inner-top">
          <div class="row">
            <div class="col-lg-8 offset-lg-2 col-12">
              <!-- Start Newsletter Inner -->
              <div class="inner">
                <h4>Bản tin</h4>
                <p>
                  Đăng ký nhận bản tin của chúng tôi và nhận được
                  <span>10%</span> giảm giá trong lần mua đầu tiên
                </p>
                <form
                  action="mail/mail.php"
                  method="get"
                  target="_blank"
                  class="newsletter-inner"
                >
                  <input
                    name="EMAIL"
                    placeholder="Nhập địa chỉ Email"
                    required=""
                    type="email"
                  />
                  <button class="btn">Đăng ký</button>
                </form>
              </div>
              <!-- End Newsletter Inner -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- End Shop Newsletter -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span class="ti-close" aria-hidden="true"></span>
            </button>
          </div>
          <div class="modal-body">
            <div class="row no-gutters">
              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <!-- Product Slider -->
                <div class="product-gallery">
                  <div class="quickview-slider-active">
                    <div class="single-slider">
                      <img src="https://via.placeholder.com/569x528" alt="#" />
                    </div>
                    <div class="single-slider">
                      <img src="https://via.placeholder.com/569x528" alt="#" />
                    </div>
                    <div class="single-slider">
                      <img src="https://via.placeholder.com/569x528" alt="#" />
                    </div>
                    <div class="single-slider">
                      <img src="https://via.placeholder.com/569x528" alt="#" />
                    </div>
                  </div>
                </div>
                <!-- End Product slider -->
              </div>
              <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                <div class="quickview-content">
                  <h2>Flared Shift Dress</h2>
                  <div class="quickview-ratting-review">
                    <div class="quickview-ratting-wrap">
                      <div class="quickview-ratting">
                        <i class="yellow fa fa-star"></i>
                        <i class="yellow fa fa-star"></i>
                        <i class="yellow fa fa-star"></i>
                        <i class="yellow fa fa-star"></i>
                        <i class="fa fa-star"></i>
                      </div>
                      <a href="#"> (1 customer review)</a>
                    </div>
                    <div class="quickview-stock">
                      <span><i class="fa fa-check-circle-o"></i> in stock</span>
                    </div>
                  </div>
                  <h3>$29.00</h3>
                  <div class="quickview-peragraph">
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                      Mollitia iste laborum ad impedit pariatur esse optio
                      tempora sint ullam autem deleniti nam in quos qui nemo
                      ipsum numquam.
                    </p>
                  </div>
                  <div class="size">
                    <div class="row">
                      <div class="col-lg-6 col-12">
                        <h5 class="title">Size</h5>
                        <select>
                          <option selected="selected">s</option>
                          <option>m</option>
                          <option>l</option>
                          <option>xl</option>
                        </select>
                      </div>
                      <div class="col-lg-6 col-12">
                        <h5 class="title">Color</h5>
                        <select>
                          <option selected="selected">orange</option>
                          <option>purple</option>
                          <option>black</option>
                          <option>pink</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="quantity">
                    <!-- Input Order -->
                    <div class="input-group">
                      <div class="button minus">
                        <button
                          type="button"
                          class="btn btn-primary btn-number"
                          disabled="disabled"
                          data-type="minus"
                          data-field="quant[1]"
                        >
                          <i class="ti-minus"></i>
                        </button>
                      </div>
                      <input
                        type="text"
                        name="quant[1]"
                        class="input-number"
                        data-min="1"
                        data-max="1000"
                        value="1"
                      />
                      <div class="button plus">
                        <button
                          type="button"
                          class="btn btn-primary btn-number"
                          data-type="plus"
                          data-field="quant[1]"
                        >
                          <i class="ti-plus"></i>
                        </button>
                      </div>
                    </div>
                    <!--/ End Input Order -->
                  </div>
                  <div class="add-to-cart">
                    <a href="#" class="btn">Add to cart</a>
                    <a href="#" class="btn min"><i class="ti-heart"></i></a>
                    <a href="#" class="btn min"
                      ><i class="fa fa-compress"></i
                    ></a>
                  </div>
                  <div class="default-social">
                    <h4 class="share-now">Share:</h4>
                    <ul>
                      <li>
                        <a class="facebook" href="#"
                          ><i class="fa fa-facebook"></i
                        ></a>
                      </li>
                      <li>
                        <a class="twitter" href="#"
                          ><i class="fa fa-twitter"></i
                        ></a>
                      </li>
                      <li>
                        <a class="youtube" href="#"
                          ><i class="fa fa-pinterest-p"></i
                        ></a>
                      </li>
                      <li>
                        <a class="dribbble" href="#"
                          ><i class="fa fa-google-plus"></i
                        ></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal end -->
	
</body>
</html>