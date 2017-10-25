<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="donation.question.model.vo.Question, java.sql.Date, java.util.*" %>
<%
	Question q = (Question)request.getAttribute("question");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuestionDetailView</title>

<!-- 카테고리  -->




<%-- 헤더바 --%>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="/semi/css/bootstrap.min.css">
<link rel="stylesheet" href="/semi/css/font-awesome.css">
<link rel="stylesheet" href="/semi/css/animate.css">
<link rel="stylesheet" href="/semi/css/templatemo_misc.css">
<link rel="stylesheet" href="/semi/css/templatemo_style.css">
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>

<%-- 헤더바 끝 --%>

<style>
ul#navi {
	width: 200px;
	text-indent: 10px;
	background-color: lightgray;
}

ul#navi, ul#navi ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

li.group {
	margin-bottom: 3px;
}

li.group div.title {
	height: 35px;
	line-height: 35px;
	background: lightblue;
	cursor: pointer;
}

ul.sub li {
	margin-bottom: 2px;
	height: 35px;
	line-height: 35px;
	background: #f4f4f4;
	cursor: pointer;
}

ul.sub li a {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	color: #000;
}

ul.sub li:hover {
	background: lightblue;
}
</style>
<!-- 세로목록 끝 -->



<!-- 테이블 -->
<style>

table.type10{
	border : 1px solid #ccc;
}
table.type10{
	width : 70%;
}
table tr.firstTr{
	height:40px;
	background-color: lightblue;
}
table td.firstTd{
	width:600px;
	padding-top : 10px;
}



table.type10 tr{
	border-bottom : 1px solid #ccc;

}

table.type10 td{
	border-right : 1px solid #ccc;
}
tr.content {
	height:300px;
}
</style>





</head>

<body>

	<%@ include file="../../header.jsp"%>
	<%@ include file="../../headerbar.jsp" %>
	<%@ include file="../../rightList.jsp"%>
	

	<div
		style="margin-left: 30px; width: 230px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">카테고리</div>
				<ul class="sub">
					<li><a href="/semi/nlist">공지사항</a></li>
					<li><a href="/semi/flist">자유 게시판</a></li>
					<li><a href="/semi/qlist">QnA게시판</a></li>

				</ul>
			</li>
		</ul>
	</div>
	<!-- 반복 끝 -->
	</div>










<table class="type10">
<tr class="firstTr">
<td class="firstTd"><%= q.getQuestionTitle() %></td>
<td><%= q.getQuestionReadCount() %></td>
<td><%= q.getQuestionDate() %> </td>
<td><%= q.getQuestionWriter() %></td>

	<td>
	<% if(q.getQuestionOriginalFileName() == null){ %>
		첨부파일 없음
	<% }else{ %>
	<a href="/semi/qfdown?ofile=<%= q.getQuestionOriginalFileName() %>&rfile=<%= q.getQuestionRenameFileName() %>">
		<%= q.getQuestionOriginalFileName() %>
	</a>
	<% } %>
	</td>
</tr>	
	

	<tr class="content">
		<td colspan="5">
		<%= q.getQuestionContent() %></td>
	</tr>

<tr><td colspan="5" align="center">
<%  if(member != null){ %>
	<%--쿼리스트링에는 반드시 공백 사용하면 안됨 다 붙여서 써야됨 꼭 --%>
	<a href="/semi/views/question/questionReplyForm.jsp?no=<%= q.getQuestionNum() %>&page=<%= currentPage %>">[댓글달기]</a>
<% if(member.getMemberId().equals(q.getQuestionWriter())){ %>
	<a href="/semi/qupview?no=<%= q.getQuestionNum() %>&page=<%= currentPage %>">[수정페이지로 이동]</a>
	&nbsp;
	<a href="/semi/qdelete?no=<%= q.getQuestionNum() %>">[삭제]</a>
<%  }} %>
&nbsp; 
<a href="/semi/qlist?page=<%= currentPage %>">[목록]</a>
</td></tr>
</table>



<br>
<hr>

</body>
</html>











