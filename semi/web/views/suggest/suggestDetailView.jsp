<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="donation.suggest.model.vo.Suggest"%>
<%
	Suggest suggest = (Suggest)request.getAttribute("suggest");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>suggestDetailView</title>
</head>
<body>



	<session>
		<h2 align="center"><% suggest.getSuggestNo(); %>번 제안글 상세보기</h2>
		
		<table border="1" cellspacing="0" width="600" align="center">
			<tr><th>제목</th><td><%= suggest.getSuggestTitle() %></td></tr>
			<tr><th>작성자</th><td><%= suggest.getSuggestWriter() %></td></tr>
			<tr><th>작성날짜</th><td><%= suggest.getSuggestDate() %></td></tr>
			<tr><th>첨부파일</th>
				<td>
				<% if(suggest.getSuggestOriginalFileName() != null){ %>
					<a href="/semi/sugdown?oname=<%= suggest.getSuggestOriginalFileName() %>&rname=<%= suggest.getSuggestRenameFileName() %>"><%= suggest.getSuggestOriginalFileName() %></a>
				<% }else{ %>
					첨부파일 없음
				<% } %>
				</td>
			</tr>
		</table>
	</session>

</body>
</html>