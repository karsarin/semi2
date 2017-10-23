<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, donation.suggest.model.vo.Suggest"%>
<%		
	ArrayList<Suggest> list = (ArrayList<Suggest>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>suggestListView</title>
<script type="text/javascript">
	function insertPage(){
		location.href="views/suggest/suggestWriteForm.jsp";
	}
</script>
</head>
<body>

<h2 align="center">쪽지<h2>
<br><br>
<div align="center">
	<button onclick="insertPage();">글쓰기</button>
</div>

<br><br>
<table align="center" width="600" border="1" cellspacing="0">
<th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>첨부파일</th>
<th>조회수</th>
<% /* while(entryIter.hasNext()){
		Map.Entry<Integer, Notice> entry = entryIter.next();
		Integer key = entry.getKey();
		Notice notice = entry.getValue(); */
		
	for(Suggest suggest : list){
%>
	<tr height="30">
	<td align="center"><%= suggest.getSuggestNo() %></td>
	<td>
	<% if(member != null){ %>
		<a href="/semi/sugdetail?no=<%= suggest.getSuggestNo() %>">
			<%= suggest.getNoticeTitle() %>
		</a>
	<% }else{ %>
		<%= suggest.getSuggestTitle() %>
	<% } %>
	</td>
	<td align="center"><%= suggest.getSuggestWriter() %></td>
	<td align="center"><%= suggest.getSuggestDate() %></td>
	<td align="center">
	<% if(suggest.getOriginalFileName() != null){ %>
		◎
	<% }else{ %>
		&nbsp:
	<% } %>
	</td>
	<td align="center"><%= suggest.getReadCount() %></td>
	</tr>
<% } %>
</table>
<br><br>
<div align="center">
	<a href="/semi/index.jsp">시작페이지로 이동</a>
</div>
<br>
<hr>
</body>
</html>