<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, donation.notice.model.vo.Notice"%>

<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>

<script src="/semi/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.main-menu ul #minfo').removeClass('active');
		$('.main-menu ul #home').removeClass('active');
		$('.main-menu ul #category').removeClass('active');
		$('.main-menu ul #board').addClass('active');
	});
</script>

<script type="text/javascript">
	function insertPage() {w
		location.href = "views/notice/noticeWriteForm.jsp";
	}
</script>

        
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
	background:aliceblue;
}
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
}

=======
>>>>>>> refs/remotes/origin/yunJisun
</style>
<!-- 세로목록 끝 -->



<!-- 테이블 -->
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
	<%if(member!=null && member.getMemberId().equals("admin")) { %>
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
					<li><a href="/semi/rlist">후기 게시판</a></li>
					<li><a href="/semi/qlist">QnA게시판</a></li>

				</ul>
			</li>
		</ul>
	</div>
	<!-- 반복 끝 -->
	



	<!--  게시판 -->
<<<<<<< HEAD
			<table class="table table-hover" id="table">		
					<tr id="firstTr">
						<th id="no">번호</th>
						<th id="titlie">제목</th>
						<th id="writer">작성자</th>
						<th id="date">날짜</th>
						<th id="readCount">조회수</th>
=======

			<table class="type10">	
				<thead>			
					<tr>
						<th class="noTh">번호</th>
						<th class="titleTh">제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>첨부파일</th>
						<th>조회수</th>
>>>>>>> refs/remotes/origin/yunJisun
					</tr>
				</thead>

				<%
					for (Notice notice : list) {
				%>


				<tbody>
					<tr>
<<<<<<< HEAD
						<td id="no"><%=notice.getNoticeNo()%></td>
						<td id="title"><a href="/semi/ndetail?no=<%=notice.getNoticeNo()%>">
								<%=notice.getNoticeTitle()%>
						</a></td>
						<td id="writer"><%=notice.getNoticeWriter()%></td>
						<td id="date"><%=notice.getNoticeDate()%></td>
						<td id="readCount"><%=notice.getReadCount()%></td>
=======
						<td><%=notice.getNoticeNo()%></td>
						<td>
						<%if(member!=null) { %>
							<a href="/semi/ndetail?no=<%=notice.getNoticeNo()%>"><%=notice.getNoticeTitle()%></a>
						<% } else {%>
							<%=notice.getNoticeTitle()%>
						<% } %>
						</td>
						<td><%=notice.getNoticeWriter()%></td>
						<td><%=notice.getNoticeDate()%></td>
						<td>
							<%
								if (notice.getOriginalFileName() != null) {
							%> O <%
								} else {
							%> X
							<%
							 	}
							 %>
						</td>
						<td><%=notice.getReadCount()%></td>
>>>>>>> refs/remotes/origin/yunJisun
					</tr>
					<%
						}
					%>
				
				</tbody>


			</table>

		
		<!--  table 끝 -->
		
		
		
		
	
		

		<%-- 페이지 번호 처리 --%>
		<div align="center">
			<%-- 이전 페이지 있을 경우에 대한 처리 --%>
			<%
				if (currentPage <= 1) {
			%>
			[이전] &nbsp;
			<%
				} else {
			%>
			<a href="/semi/nlist?page=<%=currentPage - 1%>">[이전]</a>
			<%
				}
			%>
			<%-- 현재 페이지 숫자 보여주기 --%>
			<%
				for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<b><font size="4" color="red">[<%=p%>]
			</font></b>
			<%
				} else {
			%>
			<a href="/semi/nlist?page=<%=p%>"><%=p%></a>
			<%
				}
				}
			%>
			<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
			<%
				if (currentPage >= maxPage) {
			%>
			[다음]
			<%
				} else {
			%>
			<a href="/semi/nlist?page=<%=currentPage + 1%>">[다음]</a>
			<%
				}
			%>
		</div>
				
<<<<<<< HEAD

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




<%}else{   //로그인 되어 있지 않으면%>


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
	
	<!--  게시판 -->
			<table class="table table-hover" id="table">		
					<tr id="firstTr">
						<th id="no">번호</th>
						<th id="titlie">제목</th>
						<th id="writer">작성자</th>
						<th id="date">날짜</th>
						<th id="readCount">조회수</th>
					</tr>

				<%
					for (Notice notice : list) {
				%>


					<tr>
						<td id="no"><%=notice.getNoticeNo()%></td>
						<td id="title"><%=notice.getNoticeTitle()%></td>
						<td id="writer"><%=notice.getNoticeWriter()%></td>
						<td id="date"><%=notice.getNoticeDate()%></td>
						<td id="readCount"><%=notice.getReadCount()%></td>
					</tr>
					<%
						}
					%>
				
			</table>

		<!--  table 끝 -->
		
		
		 <!--  검색 -->
		<div align="right">
=======
		<!--  검색 -->
		<div align="center">
>>>>>>> refs/remotes/origin/yunJisun
			<form action="/semi/nsearch" method="post">
				<input type="search" autocomlete name="keyword" length="50">&nbsp;
				<input type="submit" value="제목검색">
			</form>
			
			
		<!--  글쓰기 -->
	<% if(member!= null && member.getMemberId().equals("admin")){ %>		
			<button onclick="javascript:insertPage();">글쓰기</button>
	<%} %>
	
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





</body>
</html>