<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int qnum = Integer.parseInt(request.getParameter("qnum"));
	int currentPage = Integer.parseInt(request.getParameter("page"));
	
%>    
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>boardReplyForm</title>
</head>
<body>
<%@ include file="../../header.jsp" %>
<hr style="clear:both;">
<h2><%= qnum %>번글 댓글달기</h2>
<br>
<form action="/semi/qreply" method="post">
	<input type="hidden" name="page" value="<%=currentPage%>">  <%-- currentPage도 form태그 안에 숨겨서 값 post로 넘기기위해서  --%>
	<input type="hidden" name="qnum" value="<%=qnum %>">
	<table align = "center" cellspacing="0" border="1" width=500">
	<tr><th>제목</th><td><input type="text" name="qtitle"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="qwriter" readonly value=<%=member.getMemberId() %>></td></tr>
	<tr><th>내용</th><td><textarea name="qcontent" rows="7" cols="50"  ></textarea></td></tr>
	<tr><th colspan="2"><input type="submit" value ="댓글등록">
		<a href="javascript:history.go(-1);">이전 페이지로</a>
	</th></tr>
	</table>
</form>
<h4 align="center"><a href="/semi/qlist?page=<%=currentPage%>">목록</a></h4>

<br>

</body>
</html>



























