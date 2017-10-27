<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- page 지시자 태그는 한 페이지에 한 개만 사용이 원칙임
     예외로 import 속성에 대해서만 따로 작성할 수 있음. --%>
<%@ page import="donation.question.model.vo.Question, java.util.ArrayList, java.sql.Date" %>
<%
	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listSearchCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	String keyword  = (String)request.getAttribute("keyword");
	
	System.out.println("view 페이지 : "+list.toString());		
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuestionListView</title>

<script src="/semi/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.main-menu ul #minfo').removeClass('active');
		$('.main-menu ul #home').removeClass('active');
		$('.main-menu ul #category').removeClass('active');
		$('.main-menu ul #board').addClass('active');
	});
</script>

<script type ="text/javascript">
	function showWriteQuestion(){
		location.href = "views/question/questionWriteForm.jsp";		
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
	background: aliceblue;
}
</style>
<!-- 세로목록 끝 -->


<<<<<<< HEAD
#table{
width:66vw;
}
#table #no{
width:6%;
text-align:center;
}
#table #title{
width:50%
}
#table #writer{
width:10%;
text-align:center;
}
#table #date{
width:15%;
text-align:center;
}

#table #readCount{
width:7%;
text-align:center;
}
#firstTr{
background-color:lightblue;
=======

<!-- 테이블 -->
<style>
table.type10 {
	width : 70%;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
>>>>>>> refs/remotes/origin/yunJisun
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
	<%if(member!=null && member.getMemberId().equals("admin")) { %>
		<%@ include file="../manager/managerHeader.jsp" %>
	<% } else { %>
		<%@ include file="../../headerbar.jsp" %>
	<% } %>
	<%@ include file="../../rightList.jsp"%>
	

	<div
		style="margin-left: 30px; width: 230px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">카테고리</div>
				<ul class="sub">
					<li><a href="/semi/nlist">공지사항</a></li>
					<li><a href="/semi/flist">자유 게시판</a></li>
					<li><a href="/semi/rlist">후기 게시판</a></li>
					<li><a href="/semi/qlist">QnA게시판</a></li>

				</ul>
			</li>
		</ul>
	</div>
	<!-- 반복 끝 -->
	</div>


<h2 align="left">QA 게시판</h2>




<br>


<table class="type10">

<thead>
	<tr><th>번호</th><th class="titleTh">제목</th><th>작성자</th><th>날짜</th><th>첨부파일</th><th>조회수</th></tr>
</thead>


<tbody>

<%
	for(Question q : list){
%>



<tr>
	<td id="no"><%= q.getQuestionNum() %></td>
	<td id="title">
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
	<td id="writer" ><%= q.getQuestionWriter() %></td>
	<td id="date" ><%= q.getQuestionDate() %></td>
	<td id="readCount" ><%= q.getQuestionReadCount() %></td>
</tr>
<%  } %>

</tbody>
</table>


<br>
<%-- 페이지 번호 처리 --%>
<div align="center">
<%-- 이전 페이지 있을 경우에 대한 처리 --%>
<% if(currentPage <= 1){ %>
	[이전] &nbsp;
<% }else{ %>
	<a href="/semi/qsearch?page=<%= currentPage - 1 %>&keyword=<%=keyword%>">[이전]</a>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
	<b><font size="4" color="red">[<%= p %>]</font></b>
<%     }else{ %>
	<a href="/semi/qsearch?page=<%= p %>&keyword=<%=keyword%>"><%= p %></a>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	[다음]
<% }else{ %>
	<a href="/semi/qsearch?page=<%= currentPage + 1 %>&keyword=<%=keyword%>">[다음]</a>
<% } %>




<<<<<<< HEAD

	

  </div>
</div>	
	
  <div class="col-md-2">
  	<%@ include file="../../rightList.jsp"%>
	</div>
 </div>
  
  
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



	<%}else{ //로그인 되어 있지 않다면 %>
	
	    <%@ include file="../../headerbar.jsp" %>
   
	
<div class="row">
  <div class="col-md-2">
  	<div style="margin-left: 30px; width: 230px; height: 300px; float: left;">
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
</div>
  
  <div class="col-md-8">

	

<table class="table table-hover" id="table">


		<tr id="firstTr">
			<th id="no">번호</th>
			<th id="titlie">제목</th>
			<th id="writer">작성자</th>
			<th id="date">날짜</th>
			<th id="file">첨부파일</th>
			<th id="readCount">조회수</th>
		</tr>



<%
	for(Question q : list){
%>



<tr>
	<td id="no"><%= q.getQuestionNum() %></td>
	<td id="title">
	<%-- 답글일 때는 들여쓰기하면서 앞에 ▶ 표시함 --%>
		<% if(q.getQuestionLevel() == 1){  //원글의 댓글일 때 %>
		&nbsp; &nbsp; ┕>
		<% }else if(q.getQuestionLevel() == 2){  //댓글의 댓글일 때 %>
		&nbsp; &nbsp; &nbsp; &nbsp; ┕>
		<% } %>
			<%= q.getQuestionTitle() %>		
	</td>
	<td id="writer" ><%= q.getQuestionWriter() %></td>
	<td id="date" ><%= q.getQuestionDate() %></td>
	<td id="readCount" ><%= q.getQuestionReadCount() %></td>
</tr>
<%  } %>


</table>



<div align="right">
=======
<div align="center">
>>>>>>> refs/remotes/origin/yunJisun
	<form action="/semi/qsearch" method="post">
		<input type="search" autocomlete name="keyword" length="50">&nbsp;
		<input type="submit" value="제목검색"> 
	</form>
	
	<% if(member!= null){ %>
		<button onclick="showWriteQuestion()" >글쓰기</button>
	<%} %>
	
</div>



	

	
<br><br><br>

</body>
</html>









