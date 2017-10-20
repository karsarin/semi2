<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="donation.question.model.vo.Question" %>

<% Question question = (Question)request.getAttribute("question");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdateView</title>
</head>
<body>
<%@ include file="../../header.jsp"%>
	<hr style="clear:both;">
	<br>
	<h2><%= question.getQuestionNum() %>번글 수정페이지</h2>
	
	<%
		//원글일 때 
		if(question.getQuestionLevel() == 0){	%>
		<form action="/semi/qupdate0" method="post" enctype="multipart/form-data">
			<input type="hidden" name="qnum" value="<%=question.getQuestionNum() %>">
			<input type="hidden" name="ofile" value="<%=question.getQuestionOriginalFileName() %>">
			<input type="hidden" name="rfile" value="<%=question.getQuestionRenameFileName()%>">
			<input type="hidden" name="page" value="<%=currentPage %>">
		
			<table align="center" border="1" cellspacing="0" width="700">
				<tr><th>제목</th><td><input type="text" name="qtitle" value="<%=question.getQuestionTitle()%>"></td></tr>
				<tr><th>작성자</th><td><input type="text" name="qwriter" value="<%=question.getQuestionWriter() %>" readonly></td></tr>
				<tr><th>첨부파일</th><td>
				<%if(question.getQuestionOriginalFileName() != null){ %>
					<%= question.getQuestionOriginalFileName() %>
				<%}else{ %>							
				<input type="file" name="upfile">
				<%} %>
				</td>
				</tr>
		
		
				<tr><th>내용</th><td><textarea cols="50" rows="7" name="qcontent"><%=question.getQuestionContent() %></textarea></td></tr>
				<tr><td colspan="2" align="center"><input type="submit" value="수정하기"> &nbsp;
				<a href="/semi/qlist?page=1">목록</a>		
				</td></tr>
	
			</table>
		</form>
	<%}else{   //댓글일 때%> 
		<form action ="/semi/qupdate1" method="post">
			<input type="hidden" name="qnum" value="<%=question.getQuestionNum() %>">
			<input type="hidden" name="page" value="<%=currentPage %>">
			<table align = "center" cellspacing="0" border="1" width=500">
				<tr><th>제목</th><td><input type="text" name="qtitle" value="<%=question.getQuestionTitle()%>"></td></tr>
				<tr><th>작성자</th><td><input type="text" name="qwriter" readonly value=<%=question.getQuestionWriter() %>></td></tr>
				<tr><th>내용</th><td><textarea name="qcontent" rows="7" cols="50"  ><%=question.getQuestionContent() %></textarea></td></tr>
				<tr><th colspan="2"><input type="submit" value ="댓글수정">
					<a href="javascript:history.go(-1);">이전 페이지로</a>
				</th></tr>
			</table>
		</form>
	<%} %>
	
	
	<br>
	
	<div align = "center">
	<a href="/semi/qlist?page=<%=currentPage%>">목록</a>
	
	</div>

</body>
</html>






















