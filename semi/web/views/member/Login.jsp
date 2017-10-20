<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="donation.member.model.vo.Member" %>
    <% Member member = (Member)session.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#login{
	float : none;
	width : 200px;
	height : 100px;
	margin-right : 50px;
	font-size :10pt;
}

</style>
</head>
<body>
<div id="login">
	<form action="../../login" method="post">
	<label>ID</label>
	<input type="text" name="memberid" placeholder="아이디"><br>
	<label>PW</label>
	<input type="password" name="memberpwd" placeholder="비밀번호"><br>
	<input type="submit" value="로그인">
	</from>

</div>
</body>
</html>