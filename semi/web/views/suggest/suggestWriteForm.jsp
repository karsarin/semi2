<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>suggestWriteForm</title>

<%@ include file="../../header.jsp" %>
<%@ include file="../../headerbar.jsp" %>

</head>
<body>

<hr>
<br>
<h2 align="center">글쓰기 페이지</h2>
<br>
<section align="center">
	<form action="/semi/sugsend" method="post" enctype="multipart/form-data">
	<table align="center" width="600">
	<tr><th width="150" bgcolor="gray">제목</th>
		<td align="left"><input type="text" name="title"></td>
	</tr>
<<<<<<< HEAD
	<tr><th width="150" bgcolor="gray">작성자</th>
		<td align="left"><input type="text" name="writer" value="" readonly></td>
=======
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
>>>>>>> refs/remotes/origin/yeojin
	</tr>
	<tr><th width="150" bgcolor="gray">첨부파일</th>
	    <td align="left"><input type="file" name="file"></td>
<<<<<<< HEAD
	</tr>
	<tr><th width="150" bgcolor="gray">내용</th>
		<td align="left"><textarea rows="5" cols="50" name="content"></textarea></td>
=======
>>>>>>> refs/remotes/origin/yeojin
	</tr>
	<tr><th width="150" bgcolor="gray" colspan="2">
		<input type="submit" value="등록하기"> &nbsp;
		<input type="reset" value="취소하기">
	</th></tr>
	</table>
	</form>
	<br>
	<a href="/first/nlist">목록으로 이동</a>
</section>

<br>
<hr>

</body>
</html>