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
<title>게시글 내용</title>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/jsp/layout/header.jsp"></jsp:include>
</header>
<section>
		<table class="table table-light" style="width: 50%;">
			<tr>
				<th>제목</th>
				<td><c:out value="${board.title }"></c:out></td>
				<th style="width: 10%">작성자</th>
				<td style="width: 10%"><c:out value="${board.writerName}"></c:out></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" style="width: 90%; height: 100px;"><c:out value="${board.content }"></c:out></td>
			</tr>
		</table>
		<button type="button" class="btn btn-secondary" onclick="history.back(); return false;"> 
			이전 </button>
			

			<button type="button" class="btn btn-secondary" id="deleteBtn">삭제</button>
			<button type="button" class="btn btn-primary" id="modifyBtn">수정 </button>

	</section>
</body>

<script>

	window.onload = function(){
		
		var deleteBtn = document.getElementById("deleteBtn");
		
		deleteBtn.onclick = function() {
			if(confirm("삭제하시겠습니까?") == true){
				var path = "${pageContext.request.contextPath}/boardDelete.do";
				var params = {
						"idx": "${board.idx}"
				}
				post(path, params);
			}
			else{
				return;
			}
		}
		
		var modifyBtn = document.getElementById("modifyBtn");
		
		modifyBtn.onclick = function() {
			var path = "${pageContext.request.contextPath}/boardModifyPage.do";
			var params = {
					"idx": "${board.idx}"
			}
			post(path, params);
		}
		
	}
	
	function post(path, params) {
		
		const form = document.createElement('form');
		form.method = "post";
		form.action = path;
		
		for (const key in params) {
		  if (params.hasOwnProperty(key)) {
		    const hiddenField = document.createElement('input');
		    hiddenField.type = 'hidden';
		    hiddenField.name = key;
		    hiddenField.value = params[key];
		    form.appendChild(hiddenField);
		  }
		}
		
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>