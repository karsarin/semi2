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
<title>카테고리 게시판</title>
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

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/templatemo_style.css">

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
							<li class="active"><a href="../../semi/index.html">Home</a></li>
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

	<div style="width: 300px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">카테고리</div>
				<ul class="sub">
					<li><a href="#">IT 재능</a></li>
					<li><a href="#">집안일</a></li>
					<li><a href="#">마케팅</a></li>
					<li><a href="#">홍보</a></li>
					<li><a href="#">문학</a></li>
					<li><a href="#">수작업</a></li>
					<li><a href="#">한수빈</a></li>

				</ul>
			</li>

		</ul>



	</div>

	<!-- 반복 끝 -->

	<!--  그림 -->
	<div >
		<hgroup>
			<h1 style="font-size:20pt">[검색 결과]</h1>

		</hgroup>
		<br>
		<div id="container">
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img27.jpg" />
				</div>
				<strong>Sunset Lake</strong>
				<p>A peaceful sunset view...</p>
				<div class="meta">by j osborn</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img26.jpg" />
				</div>
				<strong>Bridge to Heaven</strong>
				<p>Where is the bridge lead to?</p>
				<div class="meta">by SigitEko</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img15.jpg" />
				</div>
				<strong>Autumn</strong>
				<p>The fall of the tree...</p>
				<div class="meta">by Lars van de Goor</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img23.jpg" />
				</div>
				<strong>Winter Whisper</strong>
				<p>Winter feel...</p>
				<div class="meta">by Andrea Andrade</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img17.jpg" />
				</div>
				<strong>Light</strong>
				<p>The only shinning light...</p>
				<div class="meta">by Lars van de Goor</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img22.jpg" />
				</div>
				<strong>Rooster's Ranch</strong>
				<p>Rooster's ranch landscape...</p>
				<div class="meta">by Andrea Andrade</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img16.jpg" />
				</div>
				<strong>Autumn Light</strong>
				<p>Sun shinning into forest...</p>
				<div class="meta">by Lars van de Goor</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img21.jpg" />
				</div>
				<strong>Yellow cloudy</strong>
				<p>It is yellow cloudy...</p>
				<div class="meta">by Zsolt Zsigmond</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img28.jpg" />
				</div>
				<strong>Herringfleet Mill</strong>
				<p>Just a herringfleet mill...</p>
				<div class="meta">by Ian Flindt</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img2.jpg" />
				</div>
				<strong>Battle Field</strong>
				<p>Battle Field for you...</p>
				<div class="meta">by Andrea Andrade</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img24.jpg" />
				</div>
				<strong>Sundays Sunset</strong>
				<p>Beach view sunset...</p>
				<div class="meta">by Robert Strachan</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img19.jpg" />
				</div>
				<strong>Sun Flower</strong>
				<p>Good Morning Sun flower...</p>
				<div class="meta">by Zsolt Zsigmond</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img5.jpg" />
				</div>
				<strong>Beach</strong>
				<p>Something on beach...</p>
				<div class="meta">by unknown</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img25.jpg" />
				</div>
				<strong>Flowers</strong>
				<p>Hello flowers...</p>
				<div class="meta">by R A Stanley</div>
			</div>
			<div class="grid">
				<div class="imgholder">
					<img
						src="http://www.inwebson.com/demo/blocksit-js/demo2/images/img20.jpg" />
				</div>
				<strong>Alone</strong>
				<p>Lonely plant...</p>
				<div class="meta">by Zsolt Zsigmond</div>
			</div>
			<!---->
		</div>
	</div>

	<!-- 그림 끝 -->




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