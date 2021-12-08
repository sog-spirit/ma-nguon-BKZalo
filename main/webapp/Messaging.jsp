<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/Messaging.css">
<title>BKZalo</title>
</head>
<body>
	<%
		User a = (User)request.getSession().getAttribute("User");
		if(a == null)
			response.sendRedirect("Login.jsp");
	%>
	<div class="header">
            <div class="menu-icons-left">
                <a href="">
                	<img src="icon/home.png">
                </a>
            </div>

            <form class="search-bar" method="post" action="SearchProcess">
                <input class="search-input" type="text" placeholder="Tìm kiếm cuộc trò chuyện..." />
                <button type="submit" class="search-button">
                    <img src="icon/magnify.svg">
                </button>
            </form>

            <div class="menu-icons-right">
                <a href="Messaging.jsp">
                	<img src="icon/people.png">
                </a>
                <a href="LogoutProcessing">
                	<img src="icon/logout.png">
                </a>
            </div>
        </div>
        <div class="conversation-list">
        	<c:forEach items="${UserList}" var="user">
        		<article class="chat">
        			<a href="Message?receiver=${user.username}" class="user-icon">
        				<img class="user-icon-image" src="icon/avatar.png">
        			</a>
        			
        			<div class="message-description">
        				<div class="user-alias">${user.useralias}</div>
        			</div>
        		</article>
        	</c:forEach>
        </div>
</body>
</html>