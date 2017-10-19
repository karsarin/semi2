<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, donation.notice.model.vo.Notice"%>
 <%
 	Notice notice = (Notice)request.getAttribute("notice");
 
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetailView</title>



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
	background: lightgray;
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
	background: gray;
}
</style>
<!-- 세로목록 끝 -->



<!-- 테이블 -->
<style>
table{
border : 1px;
}
</style>
</head>
<body>

	<!-- 반복 -->
	<div class="main-header">
		<div class="container">
			<div id="menu-wrapper">
				<div class="row">
					<div class="logo-wrapper col-md-2 col-sm-2">
						
					</div>
					<!-- /.logo-wrapper -->
					<div class="col-md-10 col-sm-10 main-menu text-right">
						<div class="toggle-menu visible-sm visible-xs">
							<i class="fa fa-bars"></i>
						</div>
						<ul class="menu-first">
							<li>
								<form action="/semi/tsearch" method="post">
									<input type="search" name="keyword" autocomplete> <input
										type="submit" value="제목검색">
								</form>
							</li>
							<li class="active"><a href="/semi/index.jsp">Home</a></li>
							<li><a href="#">카테고리</a></li>
							<li><a href="/semi/nlist">게시판</a></li>
							<li><a href="#">마이페이지</a></li>
						</ul>
					</div>
					<!-- /.main-menu -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /#menu-wrapper -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.main-header -->
	</div>
	<!-- /.site-header -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div style="width: 300px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">카테고리</div>
				<ul class="sub">
					<li><a href="/semi/nlist">공지사항</a></li>
					<li><a href="/semi/views/board/freeBoardListView.jsp">자유 게시판</a></li>
					<li><a href="/semi/views/board/replyBoardListView.jsp">후기 게시판</a></li>
					<li><a href="/semi/views/qna/qnaBoardListView.jsp">QnA게시판</a></li>

				</ul>
			</li>
		</ul>
	</div>

	<!-- 반복 끝 -->
	
	

<h2 align="left"><%= notice.getNoticeNo() %>번 상세보기</h2>




<table border="1" cellspacing = "0" width ="600" height="500">
	<tr>
		<td width="300"><%= notice.getNoticeTitle() %></td><td>조회:<%=notice.getReadCount() %></td><td><%=notice.getNoticeDate() %></td><td><%=notice.getNoticeWriter() %></td><td>	<%if(notice.getOriginalFileName() != null){	%>
		
		<a href="/first/fdown?oname=<%=notice.getOriginalFileName()%>&rname=<%=notice.getRenameFileName()%>">	<%=notice.getOriginalFileName() %></a>
	<%}else{ %>
		첨부파일 없음
	<%} %></td>
	

	<tr height="350">
		<td colspan="5"><%=notice.getNoticeContent() %></td>
	</tr>


</table>


<div align ="center">
	<a href="/semi/nlist">목록보기로 이동</a>

</div>
<br><br>
<hr>



</body>
</html>