<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
<!--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>환영합니다</title>
	<style>
	body{
	font-size: 50px;
	background-image:url(https://file.thisisgame.com/upload/nboard/news/2020/08/28/20200828103028_8784.jpg);
	background-position:center;
	background-attachment: fixed;
    background-size: cover;
    
	}
	#centered { position:absolute; top:50%; height:50%;  }
    .centeredV { position: absolute; left: 50%; transform: translateX(-50%); text-align:center }
	</style>
</head>
<body>
	
	<h1 style=' padding: 150 ; text-align: center; color :#BDBDBD; '><strong>WOW PARTY FINDER</strong></h1>
	<form action="login.do" method="post">
	<div id="centered" class="centeredV">
	<table style='margin: auto; '>
            <tr style='text-align: center;'>
               <th>ID</th>
               <td><input type="text" id="user_id" name="userId" placeholder="ID를 입력해주세요"></td>
            </tr>
            <tr>
               <th>PW</th>
               <td><input type="password" id="user_pw" name="pwd" placeholder="비밀번호를 입력해주세요"></td>
            </tr>
<!--            <button type="button" onclick="window.location.href='signUpPage.do'">회원가입</button> -->
<!--            <button type="submit">로그인</button> -->
            
         </table>
         <button type="button" onclick="window.location.href='signUpPage.do'">회원가입</button>
           <button type="submit">로그인</button>
        </div>
<!--          <div style='display:flex; position:absolute; top:59%; left:50.7%; transform: translate(-50%,-50%);'> -->
<!--             <button type="button" onclick="window.location.href='signUpPage.do'">회원가입</button> -->
<!--             <button type="submit">로그인</button> -->
            
<!--          </div> -->
         </form>
</body>

</html>