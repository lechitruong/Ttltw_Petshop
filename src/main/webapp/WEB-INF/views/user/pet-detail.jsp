<%@page import="com.demo.models.CatalogModel"%>
<%@page import="com.demo.models.CategoryModel"%>
<%@page import="com.demo.models.PetModel"%>
<%@page import="com.demo.entities.Pets"%>
<%@page import="com.demo.entities.Categorys"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết thú cưng</title>
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
                  <a href="pet-detail.html">Chi tiết thú cưng</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Blog Single -->
    <section class="blog-single section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-12">
            <div class="blog-single-main">
            <%
            Pets pet = (Pets) request.getAttribute("pet");
            PetModel petModel = new PetModel();
            CatalogModel catalogModel = new CatalogModel();
            CategoryModel categoryModel = new CategoryModel();
            
            %>
              <div class="row">
                <div class="col-12">
                  <div class="image">
                    <img
                      src="${pageContext.request.contextPath}/assets/user/images/anhcho/<%= pet.getImage() %>"
                      alt="#"
                      id="mainImage"
                    />
                    <div class="image-thumbnail">
                      <div class="image">
                        <img
                          src="images/payment-method.png"
                          alt=""
                          onclick="changeImage(this)"
                        />
                      </div>
                      <div class="image">
                        <img
                          src="images/payment-method.png"
                          alt=""
                          onclick="changeImage(this)"
                        />
                      </div>
                      <div class="image">
                        <img
                          src="images/payment-method.png"
                          alt=""
                          onclick="changeImage(this)"
                        />
                      </div>
                      <div class="image">
                        <img
                          src="images/payment-method.png"
                          alt=""
                          onclick="changeImage(this)"
                        />
                      </div>
                    </div>
                  </div>
                  <div class="blog-detail">
                    <h2 class="blog-title"><%= pet.getPetName() %></h2>
                    <div class="blog-meta">
                      <span class="author">
                        <a href="#"><i class="fa fa-user"></i>Số lượng: <%= pet.getAmount() %></a
                        ><a href="#"><i class="fa fa-user"></i>Lượt xem: 1</a
                        ><a href="#"><i class="fa fa-calendar"></i><%= petModel.ageByPet(pet.getPetBirthday().toString())  %></a
                        ><a href="#"
                          ><i class="fa fa-comments"></i>Bình luận (15)</a
                        ></span
                      >
                      <a href="${pageContext.request.contextPath }/cart?action=addToCart&id=<%= pet.getId() %>" class="blog-meta-buy" type="button">
                        <i class="ti-bag"></i>
                        Thêm vào giỏ hàng
                      </a>
                    </div>
                    <div class="content">
                      <div class="content-infomation">
                        <div class="content-infomation-child">
                          <span>Giới tính: <%= pet.getPetGender() %> </span>
                          <span>Kích thước: <%= pet.getPetType() %> </span>
                        </div>
                        <div class="content-infomation-child">
                          <span>Xuất xứ: <%= pet.getMade() %> </span>
                          <span>Chủng loại: <%= catalogModel.findCatalogById(pet.getCatalogId()).getName() %>  </span>
                        </div>
                      </div>
                      <blockquote>
                        <i class="fa fa-quote-left"></i> Mô tả: <%= pet.getDetail() %>
                      </blockquote>
                    </div>
                  </div>
                  <div class="share-social">
                    <div class="row">
                      <div class="col-12">
                        <div class="content-tags">
                          <h4>Thẻ:</h4>
                          <ul class="tag-inner">
                          <% 
                     for(Categorys category : categoryModel.findAll()){
                     %>
                            <li><a href="#"><%= category.getName() %></a></li>
                            <%
                   }
                            %>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="comments">
                    <h3 class="comment-title">Bình luận (3)</h3>
                    <!-- Single Comment -->
                    <div class="single-comment">
                      <img src="https://via.placeholder.com/80x80" alt="#" />
                      <div class="content">
                        <h4>
                          Alisa harm <span>At 8:59 pm On Feb 28, 2018</span>
                        </h4>
                        <p>
                          Enthusiastically leverage existing premium quality
                          vectors with enterprise-wide innovation collaboration
                          Phosfluorescently leverage others enterprisee
                          Phosfluorescently leverage.
                        </p>
                        <div class="button">
                          <a href="#" class="btn"
                            ><i class="fa fa-reply" aria-hidden="true"></i>Phản
                            hồi</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- End Single Comment -->
                    <!-- Single Comment -->
                    <div class="single-comment left">
                      <img src="https://via.placeholder.com/80x80" alt="#" />
                      <div class="content">
                        <h4>Lê Chí Trường <span>19:19:19 28/03/2023</span></h4>
                        <p>
                          Enthusiastically leverage existing premium quality
                          vectors with enterprise-wide innovation collaboration
                          Phosfluorescently leverage others enterprisee
                          Phosfluorescently leverage.
                        </p>
                        <div class="button">
                          <a href="#" class="btn"
                            ><i class="fa fa-reply" aria-hidden="true"></i>Phản
                            hồi</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- End Single Comment -->
                    <!-- Single Comment -->
                    <div class="single-comment">
                      <img src="https://via.placeholder.com/80x80" alt="#" />
                      <div class="content">
                        <h4>megan mart <span>Feb 28, 2018 at 8:59 pm</span></h4>
                        <p>
                          Enthusiastically leverage existing premium quality
                          vectors with enterprise-wide innovation collaboration
                          Phosfluorescently leverage others enterprisee
                          Phosfluorescently leverage.
                        </p>
                        <div class="button">
                          <a href="#" class="btn"
                            ><i class="fa fa-reply" aria-hidden="true"></i>Phản
                            hồi</a
                          >
                        </div>
                      </div>
                    </div>
                    <!-- End Single Comment -->
                  </div>
                </div>
                <div class="col-12">
                  <div class="reply">
                    <div class="reply-head">
                      <h2 class="reply-title">Để lại bình luận</h2>
                      <!-- Comment Form -->
                      <form class="form" action="${pageContext.request.contextPath }/petdetail?action=addcomment" method="post">
                        <div class="row">
                        <c:if test="${sessionScope.user != null}")>
                          <input type="text">                      
                          <div class="col-12">
                            <div class="form-group">
                              <label>Bình luận của bạn<span>*</span></label>
                              <textarea
                                name="message"
                                placeholder=""
                              ></textarea>
                            </div>
                          </div>
                          <div class="col-12">
                            <div class="form-group button">
                              <button type="submit" class="btn">
                                Đăng bình luận
                              </button>
                            </div>
                          </div>
                          </c:if>
                          <c:if test="${sessionScope.user == null }">
                          <span>Bạn chưa đăng nhập, vui lòng đăng nhập để gửi bình luận!</span>
                          </c:if>
                        </div>
                      </form>
                      <!-- End Comment Form -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-12">
            <div class="main-sidebar">
              <!-- Single Widget -->
              <div class="single-widget search">
                <div class="form">
                  <input type="email" placeholder="Tìm kiếm..." />
                  <a class="button" href="#"><i class="fa fa-search"></i></a>
                </div>
              </div>
              <!--/ End Single Widget -->
              <!-- Single Widget -->
              <div class="single-widget category">
                <h3 class="title">Danh mục thú cưng</h3>
                <ul class="categor-list">
                 <% 
                     for(Categorys category : categoryModel.findAll()){
                     %>
                  <li><a href=""><%= category.getName() %></a></li>
                   <% 
                     }
                     %>
                </ul>
              </div>
              <!--/ End Single Widget -->
              <!-- Single Widget -->
              <div class="single-widget recent-post">
                <h3 class="title">Bài đăng gần đây</h3>
                <!-- Single Post -->
                <div class="single-post">
                  <div class="image">
                    <img src="https://via.placeholder.com/100x100" alt="#" />
                  </div>
                  <div class="content">
                    <h5>
                      <a href="#">Top 10 Beautyful Women Dress in the world</a>
                    </h5>
                    <ul class="comment">
                      <li>
                        <i class="fa fa-calendar" aria-hidden="true"></i>Jan 11,
                        2020
                      </li>
                      <li>
                        <i class="fa fa-commenting-o" aria-hidden="true"></i>35
                      </li>
                    </ul>
                  </div>
                </div>
                <!-- End Single Post -->
                <!-- Single Post -->
                <div class="single-post">
                  <div class="image">
                    <img src="https://via.placeholder.com/100x100" alt="#" />
                  </div>
                  <div class="content">
                    <h5>
                      <a href="#">Top 10 Beautyful Women Dress in the world</a>
                    </h5>
                    <ul class="comment">
                      <li>
                        <i class="fa fa-calendar" aria-hidden="true"></i>Mar 05,
                        2019
                      </li>
                      <li>
                        <i class="fa fa-commenting-o" aria-hidden="true"></i>59
                      </li>
                    </ul>
                  </div>
                </div>
                <!-- End Single Post -->
                <!-- Single Post -->
                <div class="single-post">
                  <div class="image">
                    <img src="https://via.placeholder.com/100x100" alt="#" />
                  </div>
                  <div class="content">
                    <h5>
                      <a href="#">Top 10 Beautyful Women Dress in the world</a>
                    </h5>
                    <ul class="comment">
                      <li>
                        <i class="fa fa-calendar" aria-hidden="true"></i>June
                        09, 2019
                      </li>
                      <li>
                        <i class="fa fa-commenting-o" aria-hidden="true"></i>44
                      </li>
                    </ul>
                  </div>
                </div>
                <!-- End Single Post -->
              </div>
              <!--/ End Single Widget -->
              <!-- Single Widget -->
              <!--/ End Single Widget -->
              <!-- Single Widget -->
              <div class="single-widget side-tags">
                <h3 class="title">Tags</h3>
                <ul class="tag">
                  <li><a href="#">business</a></li>
                  <li><a href="#">wordpress</a></li>
                  <li><a href="#">html</a></li>
                  <li><a href="#">multipurpose</a></li>
                  <li><a href="#">education</a></li>
                  <li><a href="#">template</a></li>
                  <li><a href="#">Ecommerce</a></li>
                </ul>
              </div>
              <!--/ End Single Widget -->
              <!-- Single Widget -->
              <div class="single-widget newsletter">
                <h3 class="title">Newslatter</h3>
                <div class="letter-inner">
                  <h4>
                    Subscribe & get news <br />
                    latest updates.
                  </h4>
                  <div class="form-inner">
                    <input type="email" placeholder="Enter your email" />
                    <a href="#">Submit</a>
                  </div>
                </div>
              </div>
              <!--/ End Single Widget -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--/ End Blog Single -->
</body>
</html>