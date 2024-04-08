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
<title>Thông tin cá nhân</title>
<link
      rel="stylesheet"
      href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"
    />
    <style>
      .ui-datepicker {
        width: 300px;
      }
    </style>
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
                  <a href="blog-single.html">Thông tin cá nhân</a>
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
          <div class="col-12">
            <div class="checkout-form">
              <h2 style="margin: 20px 10px">Thông tin của bạn</h2>
              <!-- Form -->
              <form style="display: flex" class="form" method="post" action="#">
                <div class="row col-8">
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Họ và tên<span>*</span></label>
                      <input
                        id="inputUsername"
                        type="text"
                        placeholder="Nhập họ và tên"
                        required
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Ngày sinh<span>*</span></label>
                      <input
                        id="datepicker"
                        type="text"
                        name="birthday"
                        placeholder="Nhập ngày sinh"
                        required
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label for="gender">Giới tính<span>*</span></label>
                      <select
                        style="padding-left: 10px; outline: none"
                        class="select_option"
                        name="gender_name"
                        id="gender"
                      >
                        <option value="" disabled selected>
                          Chọn giới tính
                        </option>
                        <option id="male" value="">Nam</option>
                        <option id="male" value="">Nữ</option>
                        <option id="male" value="">Khác</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Email<span>*</span></label>
                      <input
                        class=""
                        pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$"
                        id="inputEmailAddress"
                        type="email"
                        placeholder="Nhập email"
                        required
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label>Số điện thoại<span>*</span></label>
                      <input
                        type="number"
                        name="number"
                        placeholder=""
                        required="required"
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label for="country">Tỉnh/Thành Phố<span>*</span></label>
                      <select
                        class="select_option"
                        name="country_name"
                        id="country"
                      >
                        <option id="" value=""></option>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label for="district">Quận/Huyện<span>*</span></label>
                      <select
                        class="select_option"
                        name="district_name"
                        id="district"
                      >
                        <option id="" value=""></option>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6 col-12">
                    <div class="form-group">
                      <label for="ward">Xã/Phường<span>*</span></label>
                      <select class="select_option" name="ward_name" id="ward">
                        <option id="" value=""></option>
                      </select>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-group">
                      <label
                        >Địa chỉ cụ thể(Số nhà/Ấp/Thôn)<span>*</span></label
                      >
                      <input
                        type="text"
                        name="address"
                        placeholder=""
                        required="required"
                      />
                    </div>
                  </div>

                  <div class="col-12">
                    <div class="form-group button">
                      <button type="submit" class="btn">Lưu thông tin</button>
                    </div>
                  </div>
                </div>
                <div style="margin-left: 20px" class="row col-4">
                  <div class="card mb-4 mb-xl-0">
                    <div class="card-header">Ảnh đại diện</div>
                    <div class="card-body text-center">
                      <!-- Profile picture image-->
                      <img
                        id="imgAvatar"
                        style="width: 324px; height: 324px; object-fit: contain"
                        class="img-account-profile rounded-circle mb-2"
                        src="http://bootdey.com/img/Content/avatar/avatar2.png"
                        alt=""
                      />
                      <!-- Profile picture help block-->
                      <div class="small font-italic text-muted mb-4"></div>
                      <!-- Profile picture upload button-->
                      <input
                        type="file"
                        name=""
                        required
                        accept="image/*"
                        id="inputAvatar"
                        multiple
                      />
                      <label
                        style="cursor: pointer"
                        for="inputAvatar"
                        class="btn"
                        ><i class="fa-solid fa-arrow-up-from-bracket"></i>
                        &nbsp;Tải lên</label
                      >
                    </div>
                  </div>
                </div>
              </form>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
              <script>
                var countries = document.getElementById("country");
                var districts = document.getElementById("district");
                var wards = document.getElementById("ward");

                axios
                  .get(
                    "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json"
                  )
                  .then(function (response) {
                    renderCity(response.data);
                  })
                  .catch(function (error) {
                    console.log(error);
                  });

                function renderCity(data) {
                  for (const city of data) {
                    countries.options[countries.options.length] = new Option(
                      city.Name,
                      city.Id
                    );
                  }
                  countries.onchange = function () {
                    districts.length = 1;
                    wards.length = 1;
                    const selectedCityId = this.value;
                    if (selectedCityId) {
                      const selectedCity = data.find(
                        (city) => city.Id == selectedCityId
                      );
                      if (selectedCity) {
                        for (const district of selectedCity.Districts) {
                          districts.options[districts.options.length] =
                            new Option(district.Name, district.Id);
                        }
                      }
                    }
                  };

                  districts.onchange = function () {
                    wards.length = 1;
                    const selectedCityId = countries.value;
                    const selectedDistrictId = this.value;
                    if (selectedCityId && selectedDistrictId) {
                      const selectedCity = data.find(
                        (city) => city.Id == selectedCityId
                      );
                      if (selectedCity) {
                        const selectedDistrict = selectedCity.Districts.find(
                          (district) => district.Id == selectedDistrictId
                        );
                        if (selectedDistrict) {
                          for (const ward of selectedDistrict.Wards) {
                            wards.options[wards.options.length] = new Option(
                              ward.Name,
                              ward.Id
                            );
                          }
                        }
                      }
                    }
                  };
                }
              </script>
              <!--/ End Form -->
              <style>
                /* Ẩn "No file chosen" */
                input[type="file"] {
                  display: none;
                }
              </style>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--/ End Checkout -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
      $(function () {
        $("#datepicker").datepicker({
          dateFormat: "dd/mm/yy",
        });
      });
    </script>
    <script>
      $(document).ready(function () {
        $("#inputAvatar").change(function () {
          var tmppath = URL.createObjectURL(event.target.files[0]);

          $("#imgAvatar").attr("src", tmppath);
        });
      });
    </script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js"
      integrity="sha512-bPh3uwgU5qEMipS/VOmRqynnMXGGSRv+72H/N260MQeXZIK4PG48401Bsby9Nq5P5fz7hy5UGNmC/W1Z51h2GQ=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>	
</body>
</html>