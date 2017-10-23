<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>boardWriteForm</title>
</head>
<body>
<%@ include file="../../header.jsp" %>  <%-- 절대경로 사용 불가 --%>
<hr style="clear:both">
<h1 align="center">Board 서비스 : 글 등록하기</h1>

<br>
<form action ="/semi/qinsert" method="post" enctype="multipart/form-data">
	<table align="center" border="1" cellspacing="0" width="700">
		<tr><th>제목</th><td><input type="text" name="qtitle"></td></tr>
		<tr><th>작성자</th><td><input type="text" name="qwriter" value="<%=member.getMemberId() %>" readonly></td></tr>
		<tr><th>첨부파일</th><td><input type="file" name="upfile"></td></tr>
		<tr><th>내용</th><td><textarea cols="50" rows="7" name="qcontent"></textarea></td></tr>
		
		<tr><td colspan="2" align="center"><input type="submit" value="등록하기"> &nbsp;
		<a href="/semi/qlist?page=1">목록</a>		
		</td></tr>
	
	</table>
</form>
<br>
</body>
</html>