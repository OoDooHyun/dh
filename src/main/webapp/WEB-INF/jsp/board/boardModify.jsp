<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/main.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/layout/header.jsp"></jsp:include>
	</header>
	
	<form action="${pageContext.request.contextPath }/boardModify.do" method="post" id="modifyForm" enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${board.idx }"/>
		<input type="hidden" name="attIdx" value="${board.attIdx }"/>
	
		<table class="table table-light" style="width: 50%;">
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" style="width: 100%;" value="${board.title }" required></td>
				<th style="width: 13%;">작성자</th>
				<td style="width: 13%;"><c:out value="${board.writerName }"></c:out></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td colspan="3" style="width: 90%;">
					<textarea style="width: 100%; height: 100px;" name="content" required><c:out value="${board.content }"></c:out></textarea>
				</td>
			</tr>
			
			<tr>
				<th rowspan="3">첨부파일</th>
				<td>${board.attFilename }</td>
			</tr>
			<tr>
				<td>
					<input type="radio" name="handleType" value="fix" checked="checked" /> 
					<c:out value="고정" />
					<input type="radio" name="handleType" value="chg" /> 
					<c:out value="변경" />
					<input type="radio" name="handleType" value="del" /> 
					<c:out value="삭제" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" name="attFile" />
				</td>
			</tr>
		</table>
		
		<button type="button" class="btn btn-secondary" onclick="history.back(); return false;">
			이전</button>
		<button type="submit" class="btn btn-primary">수정</button>
	</form>
</body>
</html>