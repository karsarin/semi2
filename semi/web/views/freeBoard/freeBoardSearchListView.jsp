<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, donation.board.freeBoard.model.vo.FreeBoard"%>
<%

	
	ArrayList<FreeBoard> list = (ArrayList<FreeBoard>)request.getAttribute("list");
int listCount = ((Integer)request.getAttribute("listSearchCount")).intValue();
int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
String keyword  = (String)request.getAttribute("keyword");
	 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>
<script type="text/javascript">
	function insertPage()
	{
		location.href="views/freeBoard/freeBoardWriteForm.jsp";
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
width:50%;
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
					<li><a href="/semi/rlist">후기 게시판</a></li>
					<li><a href="/semi/qlist">QnA게시판</a></li>

				</ul>
			</li>
		</ul>
	</div>
	<!-- 반복 끝 -->
	</div>






	
	
	
	<!--  게시판 -->

	<table class="type10" width="1000px;">
				
<<<<<<< HEAD
					<tr id="firstTr">
						<th id="no">번호</th>
						<th id="titlie">제목</th>
						<th id="writer">작성자</th>
						<th id="date">날짜</th>
						<th id="readCount">조회수</th>
=======
				<thead>
					<tr>
						<th>번호</th>
						<th  class="titleTh">제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>첨부파일</th>
						<th>조회수</th>
>>>>>>> refs/remotes/origin/yunJisun
					</tr>
				</thead>




				<%
					for (FreeBoard fboard : list) {
				%>


				<tbody>
					<tr>
						<td id="no"><%=fboard.getfreeBoardNo()%></td>
						<td id="title"><a href="/semi/fdetail?no=<%=fboard.getfreeBoardNo()%>">
								<%=fboard.getfreeBoardTitle()%>
						</a></td>
<<<<<<< HEAD
						<td id="writer"><%=fboard.getfreeBoardWriter()%></td>
						<td id="date"><%=fboard.getfreeBoardDate()%></td>
						<td id="readCount"><%=fboard.getReadCount()%></td>
=======
						<td><%=fboard.getfreeBoardWriter()%></td>
						<td><%=fboard.getfreeBoardDate()%></td>
						<td>
							<%
								if (fboard.getOriginalFileName() != null) {
							%> O <%
								} else {
							%> X <%
 	}
 %>
						</td>
						<td><%=fboard.getReadCount()%></td>
>>>>>>> refs/remotes/origin/yunJisun
					</tr>
					<%
						}
					%>
				
<<<<<<< HEAD
					<tr id="firstTr">
						<th id="no">번호</th>
						<th id="titlie">제목</th>
						<th id="writer">작성자</th>
						<th id="date">날짜</th>
						<th id="readCount">조회수</th>
					</tr>
					
=======
				<tbody>
>>>>>>> refs/remotes/origin/yunJisun

<<<<<<< HEAD
				<%
					for (FreeBoard fboard : list) {
				%>
					<tr>
						<td id="no"><%=fboard.getfreeBoardNo()%></td>
						<td id="title"><%=fboard.getfreeBoardTitle()%></td>
						<td id="writer"><%=fboard.getfreeBoardWriter()%></td>
						<td id="date"><%=fboard.getfreeBoardDate()%></td>
						<td id="readCount"><%=fboard.getReadCount()%></td>
					</tr>
					<%
						}
					%>
=======

				</tbody>
>>>>>>> refs/remotes/origin/yunJisun
			</table>

	
		<!--  table 끝 -->

	<%-- 페이지 번호 처리 --%>
<div align="center">
<%-- 이전 페이지 있을 경우에 대한 처리 --%>
<% if(currentPage <= 1){ %>
	[이전] &nbsp;
<% }else{ %>
	<a href="/semi/fsearch?page=<%= currentPage - 1 %>&keyword=<%=keyword%>">[이전]</a>
<% } %>
<%-- 현재 페이지 숫자 보여주기 --%>
<% for(int p = startPage; p <= endPage; p++){ 
		if(p == currentPage){
%>
	<b><font size="4" color="red">[<%= p %>]</font></b>
<%     }else{ %>
	<a href="/semi/fsearch?page=<%=p%>&keyword=<%=keyword%>"><%=p%></a>
<% }} %>
<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
<% if(currentPage >= maxPage){ %>
	[다음]
<% }else{ %>
	<a href="/semi/fsearch?page=<%= currentPage + 1 %>&keyword=<%=keyword%>">[다음]</a>
<% } %>
</div>
	
	
	<div align="center">
	<form action="/semi/fsearch" method="post">
		<input type="search" autocomlete name="keyword" length="50">&nbsp;
		<input type="submit" value="제목검색"> 
	</form>
	
		<% if(member!= null){ %>		
			<button onclick="insertPage();">글쓰기</button>
		<%} %>		
			
	
</div>
	
	



	



	<div id="footer" >
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