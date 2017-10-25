<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>
<script type="text/javascript">
	function insertPage()
	{
		location.href="views/notice/noticeWriteForm.jsp";
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


table.type10{
	width : 1200px;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border : 1px solid black;
}

table.type10 th{
background-color : lightblue;
}

table.type10 tr{

	border-bottom : 1px solid;
	height:30px;
}
td.firstTd{
	width:100px;
		
}
table.type10 textarea{
width:1200px;
height:300px;
}
input#input{
width:1100px

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


<div style="float:left;">

	<form action="/semi/ninsert" method="post" enctype="multipart/form-data">
	<table class="type10">
	<thead><th colspan="2">공지글 쓰기</th></thead>
		
	<tbody>
	<tr><td class="firstTd">제목</td> <td><input type="text" name="title" id="input"></td>	</tr>
	<tr><td class="firstTd">작성자</td> <td><input type="text" name="writer" id="input" value="<%=member.getMemberId() %>" readonly></td></tr>
	<tr><td class="firstTd">첨부파일</td> <td><input type="file" name="file"></td></tr>
	<tr><td colspan="2"><textarea rows="5" cols="50" name="content" class="contentbox"></textarea></td></tr>
	<tr><td colspan="2" align="right"><input type="submit" value="등록하기">&nbsp; <input type="reset" value="취소하기"></td></tr>
	</tbody>
	</table>
	</form>
	
	
	<br>
	<div align="right">
	<a href="/semi/nlist">목록으로 이동</a>
    </div>
    
</div>



	<div id="footer" style="clear:both;">
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