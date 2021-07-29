<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<h1>회원가입</h1>
<form action ="signUp.do" method="post" id=signUpform>
	<table>
		<tr>
			<th>*닉네임</th>
			<td><input type="text" name="nickname" required></td>
		</tr>
		<tr>
			<th>*ID</th>
			<td><input type="text" name="userId" required></td>
		</tr>
		<tr>
			<th>*비밀번호</th>
			<td><input type="password" name="pwd" id="pwdInput" required></td>
		</tr>
		<tr>
			<th>*비밀번호 확인</th>
			<td><input type="password" name="pwd" id="pwdCheckInput" required></td>
		</tr>
		<tr>
			<th>*종족</th>
			<td>
				<select name="speciesNm" required>
					<c:forEach items="${species}" var="item">
						<option value="${item.speciesNm}"><c:out value="${item.speciesShow}"/></option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>직업</th>
			<td><input type="text" name="job"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="userEmail"></td>
		</tr>			
	</table>
	<div>
		<button type="button" id="okbutton">등록</button>
		<button type="reset">초기화</button>
		<button type="button" id="backPage" onclick="window.history.go(-1)">이전</button>
	</div>

</form>
</body>

<script>
	window.onload = function(){
		var okbutton = document.getElementById('okbutton');
		
		okbutton.onclick = function() {
			var pwd = document.getElementById("pwdInput").value;
			var pwdCheck = document.getElementById("pwdCheckInput").value;
			
			if (pwd == pwdCheck){
				document.getElementById("signUpform").submit();
			} else{
				alert("비밀번호를 확인하세요");
			}
		}	
	}
</script>
</html>