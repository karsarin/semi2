<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert member</title>
</head>
<body>
	
	<a><h1>메인로고</h1></a>
	<h2 align="center">회원가입</h2>
	<br><br>
	<form action="/semi/minsert" method="post">
		<table align="center" width="600" height="350">
			<tr>
				<th width="150px">아이디</th>
				<td width="500px">
					<input type="text" name="memberid" vlaue=""placeholder="영문+숫자 (8~15자리)"> &nbsp;
					<input type="button" name="checkid"value="중복확인">
				</td>
			</tr>
			<tr>
				<th width="150px">이 름</th>
				<td width="500px">
					<input type="text" name="membername" vlaue="">
				</td>
			</tr>
			<tr>
				<th width="150px">비밀번호</th>
				<td width="500px">
					<input type="password" name="memberpwd1" vlaue=""placeholder="영문+숫자 (8 자리 이상)">
				</td>
			</tr>
			<tr>
				<th width="150px">비밀번호 확인</th>
				<td width="500px">
					<input type="password" name="memberpwd2" vlaue=""placeholder="영문+숫자 (8 자리 이상)">
				</td>
			</tr>
			<tr>
				<th width="150px">닉네임</th>
				<td width="500px">
					<input type="text" name="membernik" vlaue="">
				</td>
			</tr>
			<tr>
				<th width="150px">주 소</th>
				<td width="500px">
					<input type="text" name="memberaddress1" vlaue=""placeholder="ex)xx도xx시xx구xx동 xxx-xx">
				</td>
			</tr>
			<tr>
				<th width="150px">상세주소</th>
				<td width="500px">
					<input type="text" name="memberaddress2" vlaue=""placeholder="나머지 주소">
				</td>
			</tr>
			<tr>
				<th width="150px">이메일</th>
				<td width="500px">
					<input type="email" name="memberemail" vlaue=""placeholder="ex)korea@naver.com">
				</td>
			</tr>
			<tr>
				<th width="150px">전화번호</th>
				<td width="500px">
					<input type="text" name="memberphone1" vlaue="" size="3">-
					<input type="text" name="memberphone2" vlaue="" size="4">-
					<input type="text" name="memberphone3" vlaue="" size="4">
				</td>
			</tr>
			<tr>
				<th width="150px">특기</th>
				<td width="500px">
					<table>
						<tr>
							<td><input type="checkbox" name="talent"value="특기1">특기1</td>
							<td><input type="checkbox" name="talent"value="특기2">특기2</td>
							<td><input type="checkbox" name="talent"value="특기3">특기3</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="talent"value="특기4">특기4</td>
							<td><input type="checkbox" name="talent"value="특기5">특기5</td>
							<td><input type="checkbox" name="talent"value="특기6">특기6</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="talent"value="특기7">특기7</td>
							<td><input type="checkbox" name="talent"value="특기8">특기8</td>
							<td><input type="checkbox" name="talent"value="특기9">특기9</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="500px" colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>


	</form>
</body>	
</html>