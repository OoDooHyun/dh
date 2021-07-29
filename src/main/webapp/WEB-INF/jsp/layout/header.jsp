<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.bundle.js"></script>
<meta charset="UTF-8">
</head>
<body>
	<div class="LogoDiv">
		<img alt="와우메인" src="${pageContext.request.contextPath}/images/WOWFONT2.png" onclick="window.location.href='mainPage.do'">
	</div>
	<div class="userInfoDiv">
		[<c:out value="${USER.nickname}"/>]님 반갑습니다
		<button type="button" style="right" class="btn btn-info" onclick="window.location.href='userInfoConfirmPage.do'">내정보</button>
		<button type="button" style="right" class="btn btn-outline-primary" onclick="window.location.href='logout.do'">로그아웃</button>		
	</div>
</body>
</html>