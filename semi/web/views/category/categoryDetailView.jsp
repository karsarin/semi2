<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="donation.category.vo.Category, java.sql.Date, java.util.*" %>
<%
	Category category = (Category)request.getAttribute("category");
	int currentPage = ((Integer)request.getAttribute("ccurrentPage")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 게시판</title>

<style type="text/css">
	th{
		align: "center";
	}
	
	img {
		width: 855px;
		height: 600px;
	}
</style>

</head>
<body>
<%@ include file="../../headerbar.jsp" %>
	<div>
	<font size="5"><%=category.getCategoryTitle() %></font>
	<table align="center" cellspacing="0" cellpadding="10" border="1" width="500">
		<tr><th>기부금<br><%= category.getCategoryDonation() %></th>
		<th>구매평점</th>
		<th>작업기간<br><%= category.getWorkDate() %></th>
		<th>현재 작업현황</th>
		</tr>
	</table>
	
	<img align="center" src="<%= category.getOriginalImage()%>"> <br>
	
	<h2> 상세내용 </h2>
	<hr>
	<%= category.getCategoryContent() %>
	
	
		
	</div>
<%@ include file="../../rightList.jsp" %>
</body>
</html>