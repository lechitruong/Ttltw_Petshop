<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Đăng nhập</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/user/css/login__register.css">
</head>
<body>
	<div class="container">
		<div class="login form">
			<header>Đăng nhập</header>
			<%
			HttpSession session2 = request.getSession();
			String msg = (String)(session2.getAttribute("msg"));
			String msg1 = msg;
			session2.removeAttribute("msg");
			%>
			<form action="${pageContext.request.contextPath}/login?action=login"
				method="post" class="login">
				<span style="color: red"> <%= msg1 == null ? "" : msg1 %>
				</span> <input type="text" name="username"
					placeholder="Vui lòng nhập Username"> <input
					type="password" name="password"
					placeholder="Vui lòng nhập Mật khẩu">
				<div style="display: flex; justify-content: space-between;">
					<a href="${pageContext.request.contextPath}/forgotpassword?action=sendotp">Quên mật khẩu</a> 
				</div>
				<input type="submit" class="button" value="Đăng nhập">
			</form>
			<div class="signup">
				<span class="signup">Chưa có tài khoản? <a
					href="${pageContext.request.contextPath}/login?action=register">Đăng ký</a>
				</span>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/assets/user/javascript/style_javascript.js"></script>
</body>
</html>