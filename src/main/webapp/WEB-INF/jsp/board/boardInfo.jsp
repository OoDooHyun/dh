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
		<table class="table table-light" style="width: 100%;">
		<tr>
			<th>제목</th>
			<td style=" height: 50px;"><c:out value="${board.title }"></c:out></td>
			<th style= "width: 15%;">작성자</th>
			<td style= "width: 15%;"><c:out value="${board.writerName }"></c:out></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td colspan="3" style="width: 90%; height: 100px;"><c:out value="${board.content }"></c:out></td>
			
		</tr>
		
		<tr>
			<th style="width: 20%;">첨부파일</th>
			<td colspan="3" >
				<a href="#" onclick="downloadFile(); return false;">${board.attFilename }</a>
			</td>
		</tr>
		
	</table>
	
	
	<form id="fileDownload" action="${pageContext.request.contextPath}/download/boardAttFile.do" method="post">
		<input type="hidden" name="boardIdx" value="${board.idx }"/>
		<input type="hidden" name="idx" value="${board.attIdx }"/>
	</form>


	<form id="postForm">
		
	</form>
	
	
	<div id="replyDiv" style="margin-top: 30px;">
		<form action="${pageContext.request.contextPath}/replyWrite.do" method="post">
			<table class="table table-light" style="width: 100%;">
				<tr>
					<th style="width: 10%;">댓글</th>
					<td>
						<input type="text" name="content" style="width: 90%;"/>
						<button type="submit" class="btn btn-success">등록</button>
					</td>
				</tr>
				
				<c:forEach items="${replyList }" var="item" varStatus="status">
					<tr>
						<th style="width: 10%;"><c:out value="${item.writerName }"/></th>
						<td data-idx="${item.idx }">
							<span><c:out value="${item.content }"/></span>
						
							<c:if test="${USER.userId == item.writerId}">
							
							
							<button type="button" style="float: right; margin-left: 5px;" class="btn btn-secondary"
								onclick="deleteReply('${item.idx}')">삭제</button>
								
							<button type="button" style="float: right;" 
								class="btn btn-primary replyModifyBtn" >수정</button>
							
							</c:if>
							
							<c:choose>
								<c:when test="${item.modifyDate != null }">
									<fmt:parseDate value="${item.modifyDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"/>
									<br>(<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss"/>)
								</c:when>
								<c:otherwise>
									<fmt:parseDate value="${item.registDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="date"/>
									<br>(<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm:ss"/>)
									
								</c:otherwise>
								
							</c:choose>
							
						</td>
					</tr>
				
				</c:forEach>
				
				
				
			</table>
			<button type="button" class="btn btn-secondary"
		onclick="window.history.go(-1)">이전</button>
		
<%-- 	${board.writerId } == ${USER.userId } --%>
	<c:if test="${board.writerId == USER.userId }">
		<button type="button" class="btn btn-secondary" 
			id="deleteBtn">삭제</button>
		
		<button type="button" class="btn btn-primary"
			id="modifyBtn">수정</button>
	</c:if>
			<input type="hidden" name="boardIdx" value="${board.idx }"/>
		</form>
	</div>


	<form action="${pageContext.request.contextPath}/replyModify.do" 
		id="hiddenForm" style="display: none;" method="post">
		<input type="text" name="content" style="width: 80%; margin-right: 6px;"/>
		<input type="hidden" name="idx" />
		<input type="hidden" name="boardIdx" value="${board.idx }"/>
		<button type="submit" class="btn btn-primary">확인</button>
	</form>
</body>

<script>
	window.onload = function(){
		
		var deleteBtn = document.getElementById("deleteBtn");
		
		deleteBtn.onclick = function(){
			if(confirm("삭제하시겠습니까?") == true){
				var path = "${pageContext.request.contextPath }/boardDelete.do";
				var params = {
						"idx" : "${board.idx}",
						"attIdx" : "${board.attIdx}"
				}
				
				post(path, params);
				
			} else{
				return;
			}
		}
		
		var modifyBtn = document.getElementById("modifyBtn");
		
		modifyBtn.onclick = function(){
			var path = '${pageContext.request.contextPath}/boardModifyPage.do';
			var params = {
					"idx" : "${board.idx}"
			}
			post(path, params);
		}
	}
	
	function deleteReply(idx){
		if(confirm("댓글을 삭제하시겠습니까? ") == true){
			var path = "${pageContext.request.contextPath }/replyDelete.do"
			var parms = {
					"idx" : idx,
					"boardIdx" : "${board.idx}"
			};
			post(path, parms);
		}
		else {
			return;
		}
	}
	
	var replyModifyBtns =  document.querySelectorAll(".replyModifyBtn");
	
	replyModifyBtns.forEach(el => el.addEventListener('click', event => {
		
		var td = el.parentNode;
		var content = td.getElementsByTagName('span')[0].innerHTML;
		
		td.innerHTML = '';
		td.append(makeReplyUpdateForm(td.getAttribute('data-idx'), content));
		
	}));
	
	function makeReplyUpdateForm(idx, content){
		
		var form = document.getElementById('hiddenForm').cloneNode(true);
		form.style.display = '';
		
		var contentInput = form.getElementsByTagName("input")[0];
		contentInput.value = content;
		
		var idxInput = form.getElementsByTagName("input")[1];
		idxInput.value = idx;
		
		return form;
		
	}
	
	
	
	function post(path, params){
		const form = document.createElement('form');
		form.method = 'post';
		form.action = path;
		
		for(const key in params){
			if(params.hasOwnProperty(key)){
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
	
	function downloadFile(){
		var inputIdx = document.querySelector('#fileDownload > input[name="idx"]');
		
		if(inputIdx.value){
			document.forms["fileDownload"].submit();
		}
	}
	
	
	
	
</script>
</html>