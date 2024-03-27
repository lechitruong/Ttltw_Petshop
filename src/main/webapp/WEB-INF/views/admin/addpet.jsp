<%@ page import="java.util.List" %>
<%@ page import="com.demo.entities.*" %>
<%@ page import="com.demo.models.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
CategoryModel categoryModel = new CategoryModel();
List<CategoryPets> categoryPets = categoryModel.findAll();
CatalogModel catalogModel = new CatalogModel();
List<Catalogs> catalogs = catalogModel.findAll();
%>

  <!-- Start header section -->


    <div class="content-wrapper">
      <div class="container-fluid">
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Thêm sản phẩm</div>
                <hr>
                <form method="post" action="${pageContext.request.contextPath}/admin/addsanpham?action=addpet">


                  <div class="form-group">
                    <label for="input-1">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Tên sản phẩm" name="petName">
                  </div>
                  <div class="form-group">
                    <label for="input-2">Kích thước</label>
                   <div>
                            <select class="form-control valid" id="input-2" name="petType" required aria-invalid="false">
                                <option value="Lớn">Lớn</option>
                                <option value="Nhỏ">Nhỏ</option>
                            </select>
                        </div>
                  </div>
                  <div class="form-group">
                    <label for="input-3">Giới tính</label>
                   <div>
                            <select class="form-control valid" id="input-8" name="petGender" required aria-invalid="false">
                                <option value="Đực">Đực</option>
                                <option value="Cái">Cái</option>
                            </select>
                        </div>
                  </div>
                  <div class="form-group">
                    <label for="input-4">Thông tin cơ bản</label>
                    <input type="text" class="form-control" id="input-4" placeholder="Thông tin cơ bản" name="description">
                  </div>
                  <div class="form-group">
                    <label for="input-5">Thông tin cụ thể</label>
                    <input type="text" class="form-control" id="input-5" placeholder="Thông tin cụ thể" name="detail">
                  </div>
                  <div class="form-group">
                    <label for="input-6">Xuất xứ</label>
                    <input type="text" class="form-control" id="input-6" placeholder="Xuất xứ" name="made">
                  </div>
                  <div class="form-group">
                    <label for="input-1">Số lượng</label>
                    <input type="text" class="form-control" id="input-7" placeholder="Số lượng" name="amount">
                  </div>
                  <div class="form-group">
                    <label for="input-1">Giá (triệu đồng)</label>
                    <input type="text" class="form-control" id="input-8" placeholder="Giá" name="money">
                  </div>
                  <div class="form-group">
                    <label for="input-1">Ngày sinh</label>
                    <input type="text" class="form-control" id="createDate" placeholder="Ngày sinh" name="createDate">
                  </div>
                  <div class="form-group">
                    <label for="input-1">Ảnh</label>
                    <input type="text" class="form-control" id="input-9" placeholder="Ảnh" name="image">
                  </div>
                    <div class="form-group">
                        <label for="input-2">Loại</label>
                         <div>
	                    <select class="form-control valid" id="input-10" name="categoryname" required aria-invalid="false">
	                    <% for(CategoryPets categoryPet: categoryPets){ %>
                            <option value="<%=categoryPet.getId()%>"><%= categoryPet.getName() %></option>
                            <% } %>                           
	                    </select>
	                  </div>
                    </div>
                    <div class="form-group">
                        <label for="input-2">Chuyên mục</label>
                        <div>
                            <select class="form-control valid" id="input-11" name="catalogname" aria-invalid="false">
                                 <% for(Catalogs catalog: catalogs){ %>
                            <option value="<%=catalog.getId()%>"><%= catalog.getName() %></option>
                            <% } %> 
                            </select>
                        </div>
                    </div>

               <div class="form-footer">
                    <button class="btn btn-danger"><i class="fa fa-times"></i><a href="${pageContext.request.contextPath}/admin/danhsachsanpham">Hủy</a></button>
                    <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Thêm</button>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>
<script>
		var date = new Date();

		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();

		if (month < 10) month = "0" + month;
		if (day < 10) day = "0" + day;

		var today = year + "-" + month + "-" + day;


		document.getElementById('the-date').value = today;
</script>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!-- Start header section -->--%>
<%--<jsp:include page = "./header/header.jsp" flush = "true" />--%>

<%--<div class="content-wrapper">--%>
<%--    <div class="container-fluid">--%>
<%--        <div class="row mt-3">--%>
<%--            <div class="col-lg-12">--%>
<%--                <div class="card">--%>
<%--                    <div class="card-body">--%>
<%--                        <div class="card-title">Thêm thú cưng</div>--%>
<%--                        <hr>--%>
<%--                        <form method="post" action="${pageContext.request.contextPath}/admin/pet/add">--%>


<%--                            <div class="form-group">--%>
<%--                                <label for="input-1">Tên thú cưng</label>--%>
<%--                                <input type="text" class="form-control" id="input-1" placeholder="Tên thú cưng" name="pet-name">--%>
<%--                            </div>--%>


<%--                            <div class="form-group">--%>
<%--                                <label for="input-2">Chuyên mục</label>--%>
<%--                                <div>--%>
<%--                                    <select class="form-control valid" id="input-6" name="pet-cate" aria-invalid="false">--%>
<%--                                        <c:forEach items="${catelist}" var="cate">--%>
<%--                                            <option value="${cate.id }">${cate.name }</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="input-1">Ngày</label>--%>
<%--                                <input type="date" class="form-control" id="the-date" placeholder="Ngày đăng" name="pet-day">--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="input-1">Giá</label>--%>
<%--                                <input type="text" class="form-control" id="input-1" placeholder="Giá" name="pet-price">--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="input-2">Trạng thái</label>--%>
<%--                                <div>--%>
<%--                                    <select class="form-control valid" id="input-6" name="pet-status" required aria-invalid="false">--%>
<%--                                        <option value="1">Còn hàng</option>--%>
<%--                                        <option value="0">Hết hàng</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="input-2">kích thước</label>--%>
<%--                                <div>--%>
<%--                                    <select class="form-control valid" id="input-6" name="pet-status" required aria-invalid="false">--%>
<%--                                        <option value="1">Lớn</option>--%>
<%--                                        <option value="0">Nhỏ</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="input-2">Giới tính</label>--%>
<%--                                <div>--%>
<%--                                    <select class="form-control valid" id="input-6" name="pet-status" required aria-invalid="false">--%>
<%--                                        <option value="1">Đực</option>--%>
<%--                                        <option value="0">Cái</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="input-2">Giảm giá</label>--%>
<%--                                <div class="input-group">--%>
<%--                                    <input type="text" class="form-control" placeholder="Giảm ... %" name="pet-discount">--%>
<%--                                    <div class="input-group-append">--%>
<%--                                        <button class="btn btn-light" type="button">%</button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="input-2" class="col-form-label">Mô tả</label>--%>
<%--                                <div>--%>
<%--                                    <textarea class="form-control" rows="4" id="input-17" name="pet-desc"></textarea>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label for="input-2" class="col-form-label">Nội dung</label>--%>
<%--                                <div>--%>
<%--                                    <textarea class="form-control" rows="4" id="input-17" name="pet-content"></textarea>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form-group">--%>
<%--                                <label for="input-1">Ảnh đại diện</label>--%>
<%--                                <input type="text" class="form-control" id="input-1" placeholder="Tên hình" name="pet-image">--%>
<%--                            </div>--%>
<%--                            <div class="form-footer">--%>
<%--                                <button class="btn btn-danger"><i class="fa fa-times"></i><a href="${pageContext.request.contextPath}/admin/pet/list">Hủy</a></button>--%>
<%--                                <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Thêm</button>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="overlay toggle-menu"></div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<script>--%>
<%--    var date = new Date();--%>

<%--    var day = date.getDate();--%>
<%--    var month = date.getMonth() + 1;--%>
<%--    var year = date.getFullYear();--%>

<%--    if (month < 10) month = "0" + month;--%>
<%--    if (day < 10) day = "0" + day;--%>

<%--    var today = year + "-" + month + "-" + day;--%>


<%--    document.getElementById('the-date').value = today;--%>
<%--</script>--%>
<%--<jsp:include page = "./footer/footer.jsp" flush = "true" />--%>