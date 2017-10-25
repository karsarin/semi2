<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="donation.member.model.vo.Member"%>
    <%  
    	Member member = (Member)session.getAttribute("member");
    %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<%-- 헤더바 --%>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/templatemo_style.css">

<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<%-- 헤더바 끝 --%>

 <script type="text/javascript">
        function goBoardPage() { location.href="/semi/nlist"; }
        function goHomePage() { location.href="/semi/index.jsp"; }
        
        function goCategoryPage(){location.href="/semi/clist";}
       	function insertCategory(){location.href="views/category/categoryInsertView.jsp";}
       	function needLogin(){ alert("로그인이 필요합니다."); }
        </script>




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
							<li class="active"><a href="javascript:goHomePage();">Home</a></li>
							<li><a href="javascript:goCategoryPage();">카테고리</a></li>
							<li><a href="javascript:goBoardPage();">게시판</a></li>
							<li>
							<% if(member != null){ %>
								<a href="javascript:insertCategory();">재능 등록</a>
							<% } else { %>
								<a href="javascript:needLogin();">재능 등록</a>
								
							<% } %>
							</li>
							
							
							
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
</body>
</html>