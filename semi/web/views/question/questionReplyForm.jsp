<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int qnum = Integer.parseInt(request.getParameter("qnum"));
	int currentPage = Integer.parseInt(request.getParameter("page"));
	
%>    
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>boardReplyForm</title>


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
	<%@ include file="../../headerbar.jsp" %>

	

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



<h2><%= qnum %>번글 댓글달기</h2>
<br>
<form action="/semi/qreply" method="post">
	<input type="hidden" name="page" value="<%=currentPage%>">  <%-- currentPage도 form태그 안에 숨겨서 값 post로 넘기기위해서  --%>
	<input type="hidden" name="qnum" value="<%=qnum %>">
	<table align = "center" cellspacing="0" border="1" width=500">
	<tr><th>제목</th><td><input type="text" name="qtitle"></td></tr>
	<tr><th>작성자</th><td><input type="text" name="qwriter" readonly value=<%=member.getMemberId() %>></td></tr>
	<tr><th>내용</th><td><textarea name="qcontent" rows="7" cols="50"  ></textarea></td></tr>
	<tr><th colspan="2"><input type="submit" value ="댓글등록">
		<a href="javascript:history.go(-1);">이전 페이지로</a>
	</th></tr>
	</table>
</form>




<h4 align="center"><a href="/semi/qlist?page=<%=currentPage%>">목록</a></h4>

<br>




</body>
</html>



























