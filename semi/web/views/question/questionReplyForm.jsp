<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int currentPage = Integer.parseInt(request.getParameter("page"));
	
%>    
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>boardReplyForm</title>


<script src="/semi/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.main-menu ul #minfo').removeClass('active');
		$('.main-menu ul #home').removeClass('active');
		$('.main-menu ul #category').removeClass('active');
		$('.main-menu ul #board').addClass('active');
	});
</script>

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
table.type10 th{
background-color : lightblue;
}

table.type10{
	border : 1px solid black;
	width : 710px;
}
table.type10 tr{

	border-bottom : 1px solid;
	height:30px;
}
td.firstTd{
	width:210px;
		
}


table.type10 textarea{
width:710px;
height:200px;
}
input#input{
	height:30px;
	width:500px;
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



<h2><%= no %>번글 댓글달기</h2>
<br>

	<form action="/semi/qreply" method="post">
		<input type="hidden" name="no" value="<%=no%>"> <input
			type="hidden" name="page" value="<%=currentPage%>">
		<table class="type10">
			<thead>
				<th colspan="2">답글 쓰기</th>
			</thead>
			<tbody>
				<tr>
					<td class="firstTd">제목</td>
					<td><input type="text" name="title" id="input"></td>
				</tr>
				<tr>
					<td class="firstTd">작성자</td>
					<td><input type="text" name="writer" id="input"
						value="<%=member.getMemberId()%>" readonly></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="5" cols="50" name="content"
							class="contentbox"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="확인">&nbsp;
						<input type="reset" value="취소"></td>
				</tr>
			</tbody>
		</table>
	</form>






	<h4 align="center"><a href="/semi/qlist?page=<%=currentPage%>">목록</a></h4>

<br>




</body>
</html>



























