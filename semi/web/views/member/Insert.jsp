<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert member</title>
<link rel="stylesheet" href="../../css/loginstyle2.css">
</head>


<body>

	<h1 align="center"
		style="margin-top: 50px; font-size: 60pt; color: white;">
		<a href="../../index.jsp" style="color: white; text-decoration: none;">다재다능</a>
	</h1>
	<hr>



	<div class="login-page">
		<div class="form">

			<form class="login-form" action="/semi/minsert" method="post">
				<input type="text" placeholder="아이디" name="memberid" />
				<button onclick="">중복확인</button>
				<input type="text" placeholder="이름" name="membername" /> 
				<input type="text" placeholder="주민번호(-제외)" name="memberno" />
				<input
					type="password" placeholder="비밀번호" name="memberpwd1" /> <input
					type="password" placeholder="비밀번호 확인" name="memberpwd2" /> <input
					type="text" placeholder="닉네임" name="membernik" />
				<button onclick="">중복확인</button>
				<input type="text" placeholder="주소" name="memberaddress1" /> <input
					type="text" placeholder="상세주소" name="memberaddress2" /> <input
					type="text" placeholder="이메일" name="memberemail" /> <input
					type="text" placeholder="전화번호" name="memberphone" />
					
				<table>
					<tr>
						<td><input type="checkbox" name="talent" value="특기1"
							style="width: 50px;">특기1</td>
						<td><input type="checkbox" name="talent" value="특기2"
							style="width: 50px;">특기2</td>
						<td><input type="checkbox" name="talent" value="특기3"
							style="width: 50px;">특기3</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="talent" value="특기4"
							style="width: 50px;">특기4</td>
						<td><input type="checkbox" name="talent" value="특기5"
							style="width: 50px;">특기5</td>
						<td><input type="checkbox" name="talent" value="특기6"
							style="width: 50px;">특기6</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="talent" value="특기7"
							style="width: 50px;">특기7</td>
						<td><input type="checkbox" name="talent" value="특기8"
							style="width: 50px;">특기8</td>
						<td><input type="checkbox" name="talent" value="특기9"
							style="width: 50px;">특기9</td>
					</tr>
				</table>
				<button>create</button>

			</form>

		</div>
		<div></div>
	</div>
	<script src="../../js/loginjs.js"></script>

</body>
</html>