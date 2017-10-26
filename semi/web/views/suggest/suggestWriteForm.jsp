<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>suggestWriteForm</title>

<%@ include file="../../header.jsp" %>
<%@ include file="../../headerbar.jsp" %>

<style type="text/css">
	#sugwrite {
		background: skyblue;
		width: 600px;
		margin-left: 500px;
	}
</style>

</head>
<body>

<hr>
<br>
<h2 align="center">글쓰기 페이지</h2>
<br>
<section id="sugwrite" align="center">
	<form action="/semi/sugsend" method="post" enctype="multipart/form-data">
	<table align="center" width="600">
	<tr>
		<th width="150"	>제목</th>
		<td align="left"><input type="text" name="title"></td>
	</tr>
	<tr>
		<th width="150">기간</th>
		<td align="left"><input type="text" name="preoid"></td>
	</tr>
	<tr>
		<th width="150">내용</th>
		<td align="left"><textarea rows="5" cols="50" name="content"></textarea></td>
	</tr>
	<tr>
		<th width="150">작성자</th>
		<td align="left"><input type="text" name="writer" value="<%= member.getMemberId() %>" readonly></td>
	</tr>
	<tr>
		<th width="150">수신자</th>
		<td align="left"><input type="text" name="reciver"></td>
	</tr>
	<tr>
		<th width="150">첨부파일</th>
	    <td align="left"><input type="file" name="file"></td>
	</tr>
	<tr>
		<th width="150" colspan="2">
			<input type="submit" value="등록하기"> &nbsp;
			<input type="reset" value="취소하기">
		</th>
	</tr>
	</table>
	</form>
	<br>
	<a href="/semi/suglist">목록으로 이동</a>
</section>

<br>
<hr>

</body>
</html>