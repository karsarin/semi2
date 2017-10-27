<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.sql.*, donation.search.model.vo.Notice"%>

<%@ page import="donation.category.vo.Category" %>
<% 
	ArrayList<Category> category = (ArrayList<Category>)request.getAttribute("clist");
	int clistCount = ((Integer)request.getAttribute("clistCount")).intValue();
	int ccurrentPage = ((Integer)request.getAttribute("ccurrentPage")).intValue();
	int cstartPage = ((Integer)request.getAttribute("cstartPage")).intValue();
	int cendPage = ((Integer)request.getAttribute("cendPage")).intValue();
	int cmaxPage = ((Integer)request.getAttribute("cmaxPage")).intValue();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 게시판</title>
<script type="text/javascript">
	function insertPage()
	{
		location.href="views/notice/noticeWriteForm.jsp";
	}
</script>

<!-- 카테고리  -->




<%-- 세로목록 --%>
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



<!-- 그림 적용 -->
<link rel='stylesheet' href='/semi/image_js/style.css'
	media='screen' />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="/semi/image_js/blocksit.min.js"></script>
<script>
$(document).ready(function() {
	//vendor script
	$('#header')
	.css({ 'top':-50 })
	.delay(1000)
	.animate({'top': 0}, 800);
	
	$('#footer')
	.css({ 'bottom':-15 })
	.delay(1000)
	.animate({'bottom': 0}, 800);
	
	//blocksit define
	$(window).load( function() {
		$('#container').BlocksIt({
			numOfCol: 5,
			offsetX: 8,
			offsetY: 8
		});
	});
	
	//window resize
	var currentWidth = 1100;
	$(window).resize(function() {
		var winWidth = $(window).width();
		var conWidth;
		if(winWidth < 660) {
			conWidth = 440;
			col = 2
		} else if(winWidth < 880) {
			conWidth = 660;
			col = 3
		} else if(winWidth < 1100) {
			conWidth = 880;
			col = 4;
		} else {
			conWidth = 1100;
			col = 5;
		}
		
		if(conWidth != currentWidth) {
			currentWidth = conWidth;
			$('#container').width(conWidth);
			$('#container').BlocksIt({
				numOfCol: col,
				offsetX: 8,
				offsetY: 8
			});
		}
	});
});

</script>

<link rel="shortcut icon"
	href="http://www.inwebson.com/wp-content/themes/inwebson2/favicon.ico" />
<link rel="canonical"
	href="http://www.inwebson.com/demo/blocksit-js/demo2/" />


<!-- 그림 끝 -->

</head>

<body>

<%@ include file="../../header.jsp" %>

<%if(member!=null&&member.getMemberId().equals("admin")) { %>
	<%@ include file="../manager/managerHeader.jsp" %>
<% } else { %>

	
	
<%} %> 
<%@ include file="../../headerbar.jsp" %>

	<div style="margin-left: 30px; width: 230px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">카테고리</div>
				<ul class="sub">
					<li><a href="#">IT</a></li>
					<li><a href="#">디자인</a></li>
					<li><a href="#">음악</a></li>
					<li><a href="#">노하우/상담</a></li>
					<li><a href="#">번역</a></li>
					<li><a href="#">건강</a></li>
					<li><a href="#">기타</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<!-- 반복 끝 -->

	<!--  그림 -->
<div style="float:left; width:1000px;">
<form action="/clist" method="post">
	<div>
		<hgroup>
		<div class="row" style="width: 1000px">
  		<div class="col-md-4"><h1 style="font-size:20pt">카테고리 게시판</h1>
			<h3>총 <%= clistCount %>개의 재능이 등록돼 있습니다.</h3></div>
 		 <div class="col-md-4"></div>
  		<div class="col-md-4">
  		<button type="button" class="btn btn-primary">조회순</button>

			<button type="button" class="btn btn-success">구매순</button>

			<button type="button" class="btn btn-info">평가순</button>
		</div>
		</div>
			</hgroup>
		<br><br>
		
		<div class="container" >
		<% for(Category c : category){ %>
		
		<div class="row" style="float:left; width:300px; height:400px;">
		  <div class="col-md-4" style="border: 1px solid black ;width:300px;">
		  	<div class="imgholder">			
				<a href="/semi/cdetail?cnum=<%=c.getCategoryNo() %>&page=<%= ccurrentPage%>">
				<img src="cuploadfiles/<%=c.getRenameImage() %>" /> </a>
				</div>

				<strong><%=c.getCategoryTitle() %></strong>
				<p >by <%=c.getUserId() %> <br>
				<%=c.getCategoryDonation() %>원 <br>★★★★ 후기 5건</p>
			</div>
  
			</div>
		
			<%} %>
			</div>
	
</form>
	<!-- 그림 끝 -->

	<!-- 페이지 번호 처리 -->
	<br>
	<div align="center">
	<% if(ccurrentPage <= 1){ %>
		[이전] &nbsp;
	<%} else {%>
		<a href="/semi/clist?page=<%= ccurrentPage - 1 %>">[이전]</a>
	<%} %>
	<!-- 현재 페이지 숫자 보여주기 -->
	<% for(int p = cstartPage; p <= cendPage; p++){
		if(p == ccurrentPage){	
	%>
	<b><font size="4" color="red">[<%= p %>]</font></b>
	<% } else{%>
		<a href="/semi/clist?page=<%= p %>"> <%= p %></a>
	<%}} %>
	
	<!-- 현재 페이지 다음 페이지에 대한 처리 -->
	<% if(ccurrentPage >= cmaxPage){ %>
		[다음]
	<%} else { %>
		<a href="/semi/clist?page=<%=ccurrentPage + 1 %>">[다음]</a>
	<% } %>
	</div>

	<br>
	<br>
	<br>
	
	</div>
	</div>
	
	<%@ include file="../../rightList.jsp" %>
	
	

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