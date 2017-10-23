<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="donation.question.model.vo.Question" %>

<% Question question = (Question)request.getAttribute("question");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdateView</title>

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

<%-- 세로목록 --%>
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
table.type10 {
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
    background: #e7708d;
    margin: 20px 10px;
}
table.type10 tbody th {
    width: 150px;
    padding: 10px;
}
table.type10 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.type10 .even {
    background: #fdf3f5;
}

</style>

</head>
<body>
<%@ include file="../../header.jsp"%>



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
					<li><a href="#">자유 게시판</a></li>
					<li><a href="#">후기 게시판</a></li>
					<li><a href="/semi/qlist">QnA게시판</a></li>

				</ul>
			</li>
		</ul>
	</div>

	<!-- 반복 끝 -->
	
	
</div>





	<br>
	<h2><%= question.getQuestionNum() %>번글 수정페이지</h2>
	
	<%
		//원글일 때 
		if(question.getQuestionLevel() == 0){	%>
		<form action="/semi/qupdate0" method="post" enctype="multipart/form-data">
			<input type="hidden" name="qnum" value="<%=question.getQuestionNum() %>">
			<input type="hidden" name="ofile" value="<%=question.getQuestionOriginalFileName() %>">
			<input type="hidden" name="rfile" value="<%=question.getQuestionRenameFileName()%>">
			<input type="hidden" name="page" value="<%=currentPage %>">
		
			<table align="center" border="1" cellspacing="0" width="700">
				<tr><th>제목</th><td><input type="text" name="qtitle" value="<%=question.getQuestionTitle()%>"></td></tr>
				<tr><th>작성자</th><td><input type="text" name="qwriter" value="<%=question.getQuestionWriter() %>" readonly></td></tr>
				<tr><th>첨부파일</th><td>
				<%if(question.getQuestionOriginalFileName() != null){ %>
					<%= question.getQuestionOriginalFileName() %>
				<%}else{ %>							
				<input type="file" name="upfile">
				<%} %>
				</td>
				</tr>
		
		
				<tr><th>내용</th><td><textarea cols="50" rows="7" name="qcontent"><%=question.getQuestionContent() %></textarea></td></tr>
				<tr><td colspan="2" align="center"><input type="submit" value="수정하기"> &nbsp;
				<a href="/semi/qlist?page=1">목록</a>		
				</td></tr>
	
			</table>
		</form>
	<%}else{   //댓글일 때%> 
		<form action ="/semi/qupdate1" method="post">
			<input type="hidden" name="qnum" value="<%=question.getQuestionNum() %>">
			<input type="hidden" name="page" value="<%=currentPage %>">
			<table align = "center" cellspacing="0" border="1" width=500">
				<tr><th>제목</th><td><input type="text" name="qtitle" value="<%=question.getQuestionTitle()%>"></td></tr>
				<tr><th>작성자</th><td><input type="text" name="qwriter" readonly value=<%=question.getQuestionWriter() %>></td></tr>
				<tr><th>내용</th><td><textarea name="qcontent" rows="7" cols="50"  ><%=question.getQuestionContent() %></textarea></td></tr>
				<tr><th colspan="2"><input type="submit" value ="댓글수정">
					<a href="javascript:history.go(-1);">이전 페이지로</a>
				</th></tr>
			</table>
		</form>
	<%} %>
	
	
	<br>
	
	<div align = "center">
	<a href="/semi/qlist?page=<%=currentPage%>">목록</a>
	
	</div>

</body>
</html>






















