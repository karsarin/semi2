<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="donation.member.model.vo.MyWriteList,java.util.ArrayList,java.sql.Date" %>
    <% MyWriteList donate = (MyWriteList)request.getAttribute("MyWriteList"); 
    
    ArrayList<MyWriteList> list = (ArrayList<MyWriteList>)request.getAttribute("list");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
    int startPage = ((Integer)request.getAttribute("startPage")).intValue();
    int endPage = ((Integer)request.getAttribute("endPage")).intValue();
    int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
    int listCount = ((Integer)request.getAttribute("listCount")).intValue();
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../../header.jsp" %>
내가 쓴 글
<table align="center">
<tr><th width = "50pt">No</th><th>구 분</th><th width="400pt">제 목</th><th width="100pt">작성자</th><th>조회수</th><th width = "100pt">날짜</th>
<% if(listCount != 0){ %>
	<% for(MyWriteList d : list){ %>
	<tr>
	<td align="center"><%=  %></td>
	<td></td>
	<td><a href = "#"><%=  %></a></td>
	<td></td>
	<td><%=  %></td>
	<td><%= %></td>
	</tr>
	<% } %>
<% }else{ %>
	<tr>
		<td colspan="4" align="center" style="font-size:10pt; color:gray;">게시글이 없습니다</td>
	</tr>
<% } %>
</table>
<div align ="center">
<% if(currentPage <=1){ %>
	[이전] &nbsp;
	<%}else{ %>
	<a href="/semi/dselect?page=<%= currentPage -1%>&memberid=<%= member.getMemberId() %>">[이전]</a>
	<% } %>
	<% for(int p = startPage;p<=endPage;p++){
		if(p==currentPage){
	%>
	<b><font size="4"color="red">[<%= p %>]</font></b>
	<%}else{ %>
	<a href="/semi/dselect?page=<%= p %>&memberid=<%= member.getMemberId() %>"><%= p %></a>
	<% }} %>
	<% if(currentPage >= maxPage){ %>
	[다음]
	<%}else{ %>
	<a href="/semi/dselect?page=<%= currentPage+1 %>&memberid=<%= member.getMemberId() %>">[다음]</a>
	<% } %>
</body>
</html>