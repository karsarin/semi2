<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>	
	<meta charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Talent Donation - Manager/member</title>
	<link href="/semi/css/manager/member.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="/semi/css/manager/mainFonts.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="/semi/js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
</head>
<body>
	<br><br>
	<div class="container">
		<div id="menu-wrapper">
			<div class="row">
				<div class="logo-wrapper col-md-2 col-sm-2">
					<h1>
						<a href="#">han</a>
					</h1>
				</div>
				<div class="col-md-10 col-sm-10 main-menu text-right">
					<div class="toggle-menu visible-sm visible-xs">
						<i class="fa fa-bars"></i>
					</div>
					<ul class="menu-first">
						<li><a href="/semi/views/manager/managerMain.jsp">Home_관리자</a></li>
						<li class="active"><a href="/semi/views/manager/managerMember.jsp">회원정보</a></li>
						<li><a href="#">카테고리</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">게시판</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br>

	<div class="container1">
		<!-- <div class="wrap">
			<div class="search">
				<input type="text" class="searchTerm"
					placeholder="keyword">
				<button type="submit" class="searchButton">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div><br><br><br> -->
		<form action="" method="post">
				<select name="searchType">
					<option value="0" selected>아이디</option>
					<option value="1">이름</option>
					<option value="2">재능</option>
				</select>
				<input  id="searchinput" type="search" autocomplete name="keyword" length="70" placeholder="키워드">
				<input id="searchbt" type="submit" value="검색">
		</form><br>

		<table class="memberList">
			<thead>
				<tr>
					<th scope="cols">아이디</th>
					<th scope="cols">이름</th>
					<th scope="cols">재능</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>wltjs1796</td>
					<td>윤지선</td>
					<td>JAVA</td>
				</tr>
				<tr>
					<td>yeojin</td>
					<td>김여진</td>
					<td>HTML, CSS</td>
				</tr>
				<tr>
					<td>subin</td>
					<td>한수빈</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>shshsh</td>
					<td>정세화</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>leehs</td>
					<td>이홍섭</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>kimjh</td>
					<td>김지훈</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>wltjs1796</td>
					<td>윤지선</td>
					<td>JAVA</td>
				</tr>
				<tr>
					<td>yeojin</td>
					<td>김여진</td>
					<td>HTML, CSS</td>
				</tr>
				<tr>
					<td>subin</td>
					<td>한수빈</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>shshsh</td>
					<td>정세화</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>leehs</td>
					<td>이홍섭</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>kimjh</td>
					<td>김지훈</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>wltjs1796</td>
					<td>윤지선</td>
					<td>JAVA</td>
				</tr>
				<tr>
					<td>yeojin</td>
					<td>김여진</td>
					<td>HTML, CSS</td>
				</tr>
				<tr>
					<td>subin</td>
					<td>한수빈</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>shshsh</td>
					<td>정세화</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>leehs</td>
					<td>이홍섭</td>
					<td>C, JAVA, CSS</td>
				</tr>
				<tr>
					<td>kimjh</td>
					<td>김지훈</td>
					<td>C, JAVA, CSS</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container2" style="background:lightgray; align:right;">
		<div class="row">
			<div class="heading-section col-md-12 text-center">
				<h2>회원 상세 정보</h2>
			</div>
		</div>
	</div>

	<%@ include file="managerFooter.jsp" %>
</body>
</html>