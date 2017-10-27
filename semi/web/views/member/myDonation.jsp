<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="donation.donate.model.vo.Donate,java.util.ArrayList,java.sql.Date" %>
    <% Donate donate = (Donate)request.getAttribute("donate"); 
    int memberTotal = (int)request.getAttribute("memberTotal");
    int myDonation = (int)request.getAttribute("myDonation"); 
    int ranking = (int)request.getAttribute("result");
    
    ArrayList<Donate> list = (ArrayList<Donate>)request.getAttribute("list");
    int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
    int startPage = ((Integer)request.getAttribute("startPage")).intValue();
    int endPage = ((Integer)request.getAttribute("endPage")).intValue();
    int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
    int listCount = ((Integer)request.getAttribute("listCount")).intValue();
    String beforeDate = (String)request.getAttribute("beforeDate");
    String afterDate = (String)request.getAttribute("afterDate");
     
    
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../header.jsp" %>
<% if(ranking !=0){ %>
<div align="center">
<br>
<hr>

<br><br><br><br>
<%=member.getMemberNik() %>님의 기부 랭킹은 <%= ranking %>위 입니다.<br>

상위<%= (double)ranking/memberTotal*100 %>%입니다.<br>
<%=member.getMemberNik() %>님의 총 기부금액 은 총 <%= myDonation %>원 입니다.
</div>
<hr>
<br><br><br>
<form action="/semi/dselect?memberid=<%= member.getMemberId() %>"method="post">
	<div style="margin-left:420px;">
		<a style="font-size:8pt;">총 <%= listCount %>개의 글을 찾았습니다.<a>
		<a style="margin-left:220px;">
		<input type="date" name ="beforedate" value="<%= beforeDate %>">~<input type="date" name="afterdate" value="<%= afterDate %>">
		<input type="submit"value="검색">
		</a>
	</div>
</form>
<table align="center">
<tr><th width = "50pt">No</th><th width="400pt">제 목</th><th width="100pt">날짜</th><th width = "100pt">기부금</th>
<% if(listCount != 0){ %>
	<% for(Donate d : list){ %>
	<tr>
	<td align="center"><%= d.getDonationNo() %></td>
	<td><a href = "#"><%= d.getMemberId() %></a></td>
	<td><%=d.getDonationDate() %></td>
	<td><%= d.getDonation() %></td>
	</tr>
	<% } %>
<% }else{ %>
	<tr>
		<td colspan="4" align="center" style="font-size:10pt; color:gray;">기부내역이 없습니다</td>
	</tr>
<% } %>
</table>
<div align ="center">
<% if(currentPage <=1){ %>
	[이전] &nbsp;
	<%}else{ %>
	<a href="/semi/dselect?page=<%= currentPage -1%>&memberid=<%= member.getMemberId() %>&beforedate=<%= beforeDate %>&afterdate=<%= afterDate %>">[이전]</a>
	<% } %>
	<% for(int p = startPage;p<=endPage;p++){
		if(p==currentPage){
	%>
	<b><font size="4"color="red">[<%= p %>]</font></b>
	<%}else{ %>
	<a href="/semi/dselect?page=<%= p %>&memberid=<%= member.getMemberId() %>&beforedate=<%= beforeDate %>&afterdate=<%= afterDate %>"><%= p %></a>
	<% }} %>
	<% if(currentPage >= maxPage){ %>
	[다음]
	<%}else{ %>
	<a href="/semi/dselect?page=<%= currentPage+1 %>&memberid=<%= member.getMemberId() %>&beforedate=<%= beforeDate %>&afterdate=<%= afterDate %>">[다음]</a>
	<% }}else{ %>
	<%= member.getMemberNik() %>님의 기부기록이 없습니다.
	<% } %> 

</div> 
</body>
</html>