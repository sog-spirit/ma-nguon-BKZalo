<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nhắn tin | BKZalo</title>
<link rel="stylesheet" href="css/MessageBox.css">
</head>
<body>
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

        <div class="message-content">
        	<c:forEach items="${messageList}" var="message">
        		<c:choose>
	        		<c:when test="${message.sender.equals(senderName)}" >
	        			<div class="right-message">
	        				<p>${message.content }</p>
	        			</div>	
	        		</c:when>
	        		
	        		<c:otherwise>
	        				<div class="left-message">
	        					<p>${message.content }</p>
	        				</div>	
	        		</c:otherwise>
        		</c:choose>
        	</c:forEach>
        </div>

        <div class="footer">
            <div class="icons-left">
                <a href="#">
                    <img src="icon/camera.png">
                </a>
            </div>

            <form class="message-bar" method="get" action="MessageSend">
                <input class="message-input" name="message-input" type="text" placeholder="Nhập tin nhắn tại đây..." />
                <button type="submit" class="search-button">Gửi</button>
            </form>
        </div>
</body>
</html>