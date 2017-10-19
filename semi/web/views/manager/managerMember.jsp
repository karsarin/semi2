<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="donation.member.model.vo.Member, java.util.*"%>
<% ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list"); %>
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
						<a href="#"></a>
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
	<div class="row">
		<div class="container1 col-md-4 col-sm-12 col-md-offset-2">
			<form id="search-body">
				<button id="s-btn-body" type="submit">
					<span id="s-btn"></span>
				</button>
				<div id="s-form-body">
					<input id="s-form" type="text" placeholder="Search Keyword">
				</div>
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
					<% for(Member member : list) { %>
					<tr>
						<td><%=member.getMemberId()%></td>
						<td><%=member.getMemberName()%></td>
						<td><%=member.getTalent()%></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
		
		<div class="container2  col-md-4 col-sm-12">
			<div class="heading-section col-md-12 text-center">
				<h2
					style="background: white; border-bottom: 0px; text-shadow: 1px 1px 2px gray;">&nbsp;상세 정보&nbsp;</h2>
			</div>
			<br>
			<div class="container2-1"></div>
		</div>
	</div>
	
	<%@ include file="managerFooter.jsp" %>
</body>
</html>