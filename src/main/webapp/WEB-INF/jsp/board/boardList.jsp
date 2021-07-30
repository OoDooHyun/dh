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
<meta charset="UTF-8">
<title>파티찾기</title>
</head>
<body>
	<header><jsp:include page="/WEB-INF/jsp/layout/header.jsp"></jsp:include></header>
<div id="filterDiv">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" id="searchTitle" placeholder="제목을 검색하세요"
					value="${title }"></td>
				<td><button type="button" id="searchBtn" class="btn btn-danger">검색</button></td>
			</tr>
				
		</table>
		
		<button type="button" class="btn btn-success" 
		onclick="window.location.href='boardWritePage.do'">게시글 등록</button>
		
	</div>
	
	<table class="table table-stiped table-hover" id="dataList">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${boardList }" var="item" varStatus="status">
				<tr ondblclick="trDblClick('${item.idx}');">
					<td><c:out value="${status.count + pagination.startList}"/></td>
					<td><c:out value="${item.title }"/></td>
					<td><c:out value="${item.writerName }"/></td>
					<td><c:out value="${item.registDate }"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div id="paginationBox" >
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
				</c:forEach>
					
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
						'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
					
				</c:if>
<!-- 				<button type="button" class="page-link" onclick="window.history.go(-1)">이전</button> -->
			</ul>
			
		</div>
		
</body>

<script>
	window.onload = function(){
		var searchTitle = document.getElementById("searchTitle");
		var searchBtn = document.getElementById("searchBtn");
		
		searchTitle.addEventListener("keydown", function(event){
			if(event.keyCode === 13){
				searchBtn.click();
			}
		})
		
		searchBtn.onclick = function(){
// 			 var tr = document.querySelectorAll("#dataList tbody tr");
			
			
// 			console.log(tr.length);
			
// 			 for(var i = 0; i < tr.length; i++){
// 				console.log(tr[i].getElementsByTagName('td')[1].innerHTML);
// 			} 
			
// 			for (var item of tr){
// 				var title = (item.getElementsByTagName('td')[1].innerHTML);
				
// 				if(title.includes(searchTitle.value)){
// 					console.log(title, searchTitle.value);
// 					item.style.display = ""; //아무것도 없이 검색하였을때 초기화
// 				} else {
// 					item.style.display = "none";
// 				}
// 			}
			var url = "boardListPage.do";
			url =url + "?title=" + searchTitle.value;
			
			location.href = url;
			
		}
	}
			
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize){
		var page = parseInt(((range - 1) * rangeSize)); //설명 이해하기 !!
		var range = range - 1;
// 		var searchTitle = document.getElementById("searchTitle");		
		
		
		var url = "boardListPage.do";
		url = url +"?page=" + page;
		url = url +"&range=" + range;
		url =url + "&title=" + searchTitle.value;
		location.href = url;
	}
		
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize){
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
// 		var searchTitle = document.getElementById("searchTitle");
		
		var url = "boardListPage.do";
		url = url +"?page=" + page;
		url = url +"&range=" + range;
		url = url + "&title=" + searchTitle.value;
		
		location.href = url;
	}
	
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "boardListPage.do";
// 		var searchTitle = document.getElementById("searchTitle");
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&title=" + searchTitle.value;
		
		location.href = url;
	}
	
	function trDblClick(idx){
		var url = "boardInfoPage/"+idx+".do"
		
		location.href = url;
	}
		
	
</script>

</html>