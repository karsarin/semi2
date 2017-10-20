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


<%-- 세로목록 --%>
<style>
ul#navi {
	width: 200px;
	text-indent: 10px;
	background-color:lightgray;
	
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
<link rel='stylesheet' href='../../semi/image_js/style.css'
	media='screen' />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="../../semi/image_js/blocksit.min.js"></script>
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

	<%@ include file="../../headerbar.jsp" %>
	
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
	
	<div style="margin-left:30px;width: 230px; height: 500px; float: left;">
	
		<ul id="navi">
			<li class="group">
				<div class="title">카테고리</div>
				<ul class="sub">
					<li><a href="#">IT</a></li>
					<li><a href="#">디자인</a></li>
					<li><a href="#">마케팅</a></li>
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
	<div style="float:left;">
		<hgroup>
			<h1 style="font-size:20pt">[검색 결과]</h1>

		</hgroup>
		<br>
		<div id="container">
		<%for(Notice n : list){ %>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img27.jpg" />
				</div>
				<strong><%= n.getCategoryTitle() %></strong>
				<p><%= n.getCategoryContent() %></p>
				<div class="meta"><%= n.getCategoryWriter() %></div>
			</div>
			<% } %>
			
			<!---->
		</div>
	</div>

	<!-- 그림 끝 -->
	
	
<!--  오른쪽 메뉴바 -->
<div  style="float:right;border:1px solid black; width:200px;height:800px;
	margin-right:10px; tex-align:center; ">
	<ul align="center">
		<li style="background-color:#648CFF;color:white; text-align:center; ">새로운 재능<br> 기부문화 다재다능</li>
		<li style=" text-align:center;">
		<a href="#" onclick="window.open('../../semi/views/usage/usage.html','usage','resizable=no ,width=650,left=500,top=100, height=650');return false">
		<image src="../../semi/images/verticalList1.PNG" align="center"width="198px" height="150px"></image></a>
		이용방법</li>
		<a href="#" onclick="window.open('../../semi/views/usage/usage2.html','usage1','resizable=no ,width=650,left=500,top=100, height=400');return false">
		<image src="../../semi/images/verticalList2.png" align="center"width="198px" height="150px"></image></a>
		이용방법2<br>
		동영상편
		</li>
		<a href="#" onclick="window.open('../../semi/views/usage/usage3.html','usage2','resizable=no ,width=450,left=500,top=100, height=450');return false">
		<image src="../../semi/images/verticalList3.png" align="center"width="198px" height="150px"></image></a>
		필수사항</li>
		<a href="#" onclick="window.open('../../semi/views/usage/usage4.html','usage3','resizable=no ,width=500,left=500,top=100, height=400');return false">
		<image src="../../semi/images/verticalList4.png" align="center"width="198px" height="150px"></image></a>
		이벤트</li>
		
	
	
	</ul>
	
	
	</div>
	





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