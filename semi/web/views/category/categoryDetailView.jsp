<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="donation.category.vo.Category, java.sql.Date, java.util.*, donation.member.model.vo.Member" %>
<%
	Category category = (Category)request.getAttribute("category");
	int currentPage = ((Integer)request.getAttribute("ccurrentPage")).intValue();
	Member member = (Member)request.getAttribute("member");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 게시판</title>

<style type="text/css">
	
	tr{
		align: center;
	}
	
	.mainimg{
		align: center;
		width: 855px;
		height: 600px;
	}
	
	#imgarea {
		float: center;
		align: center;
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
		<tr>
		<th>기부금<br><%= category.getCategoryDonation() %></th>
		<th>구매평점</th>
		<th>작업기간<br><%= category.getWorkDate() %></th>
		<th>현재 작업현황</th>
		</tr>
	</table>
	<div class="row">
 	 <div class="col-md-4">기부금 <br><%= category.getCategoryDonation() %></div>
 	 <div class="col-md-4">구매평점</div>
 	 <div class="col-md-4">작업기간<br><%= category.getWorkDate() %></div>
 	 <div class="col-md-4">현재 작업현황</div>
</div>
	<div id="imgarea">
		<img class="mainimg" src="<%= category.getOriginalImage()%>"> <br>
	</div>
	
	<hr>
	<%= category.getCategoryContent() %>		
	</div>
<%@ include file="../../rightList.jsp" %>
</body>
</html>