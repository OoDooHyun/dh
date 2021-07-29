<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>
	<header><jsp:include page="/WEB-INF/jsp/layout/header.jsp"></jsp:include></header>
	
	<section>
			<form action="${contextPath}/boardWrite.do" method="post" enctype="multipart/form-data" >
				<table class="table table-light" style="width: 50%;">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" style="width: 100%;" required/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea style="width: 100%; height: 100px;" name="content" required></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="attFile" /></td>
					</tr>
				</table>
				<button type="submit" class="btn btn-primary">등록</button>
			</form>
		</section>
</body>
</html>