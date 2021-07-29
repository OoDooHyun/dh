<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>내정보</title>
</head>
<body>

<form action="userModify.do" method="post" id="userInfoForm">
	<table class="table" style="width:60% ; height:100px ; margin:auto;">
	<thead>
		<tr>
			<th colspan="2">내 정보</th>
		</tr>
		</thead>
		<tbody>
			<tr>
				<th class="table-secondary">아이디</th>
				<td class="table-secondary">
				<c:out value="${USER.userId}"/>
				<input type="hidden" name="userId" value="${USER.userId}"/>
				
				</td>
			</tr>
			<tr>
				<th>*비밀번호</th>
				<td><input type="password" name="pwd" id="pwdInput"/></td>
			</tr>
			<tr>
				<th>*비밀번호 확인</th>
				<td><input type="password" id="pwdCheckInput"/></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname" value="${USER.nickname}"/></td>
			</tr>
			<tr>
				<th>종족</th>
				<td>
				<select name="speciesNm">
					<c:forEach items="${species}" var="item">
						<option value="${item.speciesNm}"><c:out value="${item.speciesShow}"/></option>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>전문화</th>
				<td><input type="text" name="job" value="${USER.job}"/></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="${USER.phone}"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="userEmail" value="${USER.userEmail}"/></td>
				</tr>
				</tbody>
		</table>
<div>
	<button type="button" id="ok">수정</button>
	<button type="button" onclick="window.history.go(-1)">이전</button>
	<button type="button" id="bye">회원탈퇴</button>
</div>
</form>
</body>
<script>
	window.onload = function(){
		var ok = document.getElementById('ok');
		var bye = document.getElementById('bye');
		
		ok.onclick = function(){
			var pwd = document.getElementById("pwdInput").value;
			var pwdCheck = document.getElementById("pwdCheckInput").value;
			
			if (pwd == pwdCheck){
				document.getElementById("userInfoForm").submit();
			} else{
				alert("비밀번호를 확인하세요.");
			}
		}
		
		bye.onclick = function() {
			window.location.href = 'userDelete.do';
		}
	}
</script>
</html>