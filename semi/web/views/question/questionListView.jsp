<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- page 지시자 태그는 한 페이지에 한 개만 사용이 원칙임
     예외로 import 속성에 대해서만 따로 작성할 수 있음. --%>
<%@ page import="donation.question.model.vo.Question, java.util.ArrayList, java.sql.Date" %>
<%
	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuestionListView</title>
<script type ="text/javascript">
	function insertPage(){
		location.href = "views/question/questionWriteForm.jsp";		
		return false;
	}
	
</script>

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

<style>
table.type10 {
	width :  70%;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

table.type10 thead th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: lightblue;
	margin: 20px 10px;
}

table.type10 thead th.titleTh{
	width:60%;
}


table.type10 tbody td {
	width: 150px;
	padding: 10px;
}

</style>






</head>

<body>

	<%@ include file="../../header.jsp"%>

	<%if(member.getMemberId().equals("admin")) { %>
      <%@ include file="../manager/managerHeader.jsp" %>
   <% } else { %>
      <%@ include file="../../headerbar.jsp" %>
   <% } %>
   
   
	<%@ include file="../../rightList.jsp"%>
	

	<div style="margin-left: 30px; width: 230px; height: 500px; float: left;">

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
	






<table class="type10">

<thead>
	<tr><th>번호</th><th class="titleTh">제목</th><th>작성자</th><th>날짜</th><th>첨부파일</th><th>조회수</th></tr>
</thead>


<tbody>

<%
	for(Question q : list){
%>

<!--  
└┗┗┖┕
-->

<tr>
	<td><%= q.getQuestionNum() %></td>
	<td>
	<%-- 답글일 때는 들여쓰기하면서 앞에 ▶ 표시함 --%>
		<% if(q.getQuestionLevel() == 1){  //원글의 댓글일 때 %>
		&nbsp; &nbsp; ┕>
		<% }else if(q.getQuestionLevel() == 2){  //댓글의 댓글일 때 %>
		&nbsp; &nbsp; &nbsp; &nbsp; ┕>
		<% } %>
	<%-- 로그인한 경우 상세보기 가능하게 처리함 --%>
		<% if(member != null){ %>
			<a href="/semi/qdetail?no=<%= q.getQuestionNum() %>&page=<%= currentPage %>">
			<%= q.getQuestionTitle() %>
			</a>
		<% }else{ %>
			<%= q.getQuestionTitle() %>
		<% } %>
	</td>
	<td ><%= q.getQuestionWriter() %></td>
	<td ><%= q.getQuestionDate() %></td>
	<td >
		<% if(q.getQuestionOriginalFileName() != null){ %>
			O
		<% }else{ %>
			X
		<% } %>
	</td>
	
	<td ><%= q.getQuestionReadCount() %></td>
</tr>
<%  } %>

</tbody>
</table>


	
	<!-- 검색 -->
<div align="center">
	<form action="/semi/qsearch" method="post">
		<input type="search" autocomlete name="keyword" length="50">&nbsp;
		<input type="submit" value="제목검색"> 
		
		<!-- 글쓰기 -->
	<% if(member!= null){ %>
			<button onclick="return insertPage()" >글쓰기</button>	
	<%} %>
	</form>
</div>


<%-- 페이지 번호 처리 --%>
<div align="center">
<%-- 이전 페이지 있을 경우에 대한 처리 --%>
<% if(currentPage <= 1){ %>
	[이전] &nbsp;
<% }else{ %>
	<a href="/semi/qlist?page=<%= currentPage - 1 %>">[이전]</a>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
	<b><font size="4" color="red">[<%= p %>]</font></b>
<%     }else{ %>
	<a href="/semi/qlist?page=<%= p %>"><%= p %></a>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	[다음]
<% }else{ %>
	<a href="/semi/qlist?page=<%= currentPage + 1 %>">[다음]</a>
<% } %>








<div id="footer" style="clear: both;">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-xs-12 text-left">
					<span>Copyright &copy; 2014 Company Name</span>
				</div>
				<!-- /.text-center -->
				<div class="col-md-4 hidden-xs text-right">
					<a href="#top" id="go-top">Back to top</a>
				</div>
				<!-- /.text-center -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#footer -->


</body>
</html>









