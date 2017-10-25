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
<%=member.getMemberNik() %>님의 기부 랭킹은 <%= ranking %>위 입니다.<br>

상위<%= (double)ranking/memberTotal*100 %>%입니다.<br>
<%=member.getMemberNik() %>님의 총 기부금액 은<%= myDonation %>원 입니다.
</div>
<hr>
<input type="">
<table align="center" border="1">
<tr><th>No</th><th>날짜</th><th>기부금</th>
<% for(Donate d : list){ %>
	<tr>
	<td align="center"><%= d.getDonationNo() %></td>
	<td align = "center" width="200pt"><%=d.getDonationDate() %></td>
	<td align="center"><%= d.getDonation() %></td>
	</tr>
	<% } %>
</table>
<div align ="center">
<% if(currentPage <=1){ %>
	[이전] &nbsp;
	<%}else{ %>
	<a href="/semi/dselect?page=<%= currentPage -1%>">[이전]</a>
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
	<a href="/semi/select?page=<%= currentPage %>">[다음]</a>
	<% }}else{ %>
	<%= member.getMemberNik() %>님의 기부기록이 없습니다.
	<% } %> 

</div> 
</body>
</html>