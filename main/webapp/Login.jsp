<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập | BKZalo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/Login.css">
</head>
<body>
	<%
		User a = (User)request.getSession().getAttribute("User");
		if(a != null)
			response.sendRedirect("Messaging.jsp");
	%>
	<div class="wrapper">
         <div class="title">
            BKZalo
         </div>
         <form action="LoginProcessing" method="post">
            <div class="field">
               <input type="text" name="username" required>
               <label>Tên đăng nhập</label>
            </div>
            <div class="field">
               <input type="password" name="password" required>
               <label>Mật khẩu</label>
            </div>
            <div class="content">
               <div class="checkbox">
                  <input type="checkbox" id="remember-me">
                  <label for="remember-me">Ghi nhớ đăng nhập</label>
               </div>
               <div class="pass-link">
                  <a href="#">Quên mật khẩu?</a>
               </div>
            </div>
            <div class="field">
               <input type="submit" value="Đăng nhập">
            </div>
            <div class="signup-link">
               Chưa có tài khoản? <a href="#">Đăng ký ngay</a>
            </div>
         </form>
      </div>
</body>
</html>