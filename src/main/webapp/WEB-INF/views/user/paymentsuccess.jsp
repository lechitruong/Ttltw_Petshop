<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<!-- Add Bootstrap CSS if needed -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
</head>
<body class="js">
	<div class="vh-100 d-flex justify-content-center align-items-center">
        <div class="col-md-6">
            <div class="border border-3 border-success"></div>
            <div class="card  bg-white shadow p-5">
                <div class="mb-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-success bi bi-check-circle" width="75"
                         height="75"
                         fill="currentColor" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                </div>
                <div class="text-center">
                    <h1>Lịch Hẹn đã được xác nhận</h1>
                    <p> Lịch Hẹn của bạn đã được xác nhận. Bạn sẽ nhận được email/SMS xác nhận Lịch Hẹn trong thời gian sớm nhất,
                        cùng với ngày dự kiến chuẩn bị hàng của sản phẩm
                    </p>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-success">Trang chủ</a>
                    <a style="color: #fff;background-color: #198754;" href="${pageContext.request.contextPath}/shopgrid"
                       class="btn btn-outline-success c-shopping">Tiếp tục mua sắp</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
