<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, donation.search.model.vo.Notice"%>
<% 
	
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeListView</title>
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

<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/font-awesome.css">
<link rel="stylesheet" href="../../css/animate.css">
<link rel="stylesheet" href="../../css/templatemo_misc.css">
<link rel="stylesheet" href="../../css/templatemo_style.css">
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
							<li class="active"><a href="../../index.jsp">Home</a></li>
							<li><a href="#">카테고리</a></li>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">게시판</a></li>
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
					<li><a href="#">1 게시판</a></li>
					<li><a href="#">2 게시판</a></li>
					<li><a href="#">3 게시판</a></li>
					<li><a href="#">4 게시판</a></li>
					<li><a href="#">5 게시판</a></li>
					

				</ul>
			</li>

		</ul>



	</div>

	<!-- 반복 끝 -->
	
	<!--  게시판 -->
	<div>
	
	<table class="type10">
    <thead>
    <tr>
        <th scope="cols">글번호</th>
        <th scope="cols">글제목</th>
        <th scope="cols">글내용</th>
        <th scope="cols">작성자</th>
        <th scope="cols">날짜</th>
       
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">항목명</th>
        <td>내용이 들어갑니다.</td>
        <td>내용이 들어갑니다.</td>
        <td>내용이 들어갑니다.</td>
        <td>내용이 들어갑니다.</td>
       
    </tr>
    <tr>
        <th scope="row" class="even">항목명</th>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
       
    </tr>
    <tr>
        <th scope="row">항목명</th>
        <td>내용이 들어갑니다.</td>
         <td>내용이 들어갑니다.</td>
          <td>내용이 들어갑니다.</td>
           <td>내용이 들어갑니다.</td>
           
    </tr>
    <tr>
        <th scope="row" class="even">항목명</th>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
       
    </tr>
    <tr>
        <th scope="row">항목명</th>
        <td>내용이 들어갑니다.</td>
         <td>내용이 들어갑니다.</td>
          <td>내용이 들어갑니다.</td>
           <td>내용이 들어갑니다.</td>
           
    </tr>
    <tr>
        <th scope="row" class="even">항목명</th>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
       
    </tr>
    <tr>
        <th scope="row">항목명</th>
        <td>내용이 들어갑니다.</td>
         <td>내용이 들어갑니다.</td>
          <td>내용이 들어갑니다.</td>
           <td>내용이 들어갑니다.</td>
           
    </tr>
    <tr>
        <th scope="row" class="even">항목명</th>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
       
    </tr>
    <tr>
        <th scope="row">항목명</th>
        <td>내용이 들어갑니다.</td>
         <td>내용이 들어갑니다.</td>
          <td>내용이 들어갑니다.</td>
           <td>내용이 들어갑니다.</td>
           
    </tr>
    <tr>
        <th scope="row" class="even">항목명</th>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
        <td class="even">내용이 들어갑니다.</td>
       
    </tr>
  
    </tbody>
</table>	
	</div>
	
	<!--  table 끝 -->

	<div align="center">
	<br>
	<input type="search" name="boardkeyword">
	<button style="clear: both;">찾기</button>
	
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