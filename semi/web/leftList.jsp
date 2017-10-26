<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%-- 세로목록 --%>
<style>
ul#navi {
	width: 150px;
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



</head>
<body>

<div style="margin-left:30px; width: 230px; height: 500px; float: left;">
	
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

</body>
</html>