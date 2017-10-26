<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, donation.freeBoard.model.vo.FreeBoard"%>
<%
	FreeBoard fboard = (FreeBoard)request.getAttribute("fboard");

%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>NoticeUpdateView</title>

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
#writetable{
	
}
#title{
	width:65px;
}

#textarea textarea{
height:200px;
}


</style>
<!-- 세로목록 끝 -->







</head>

<body>

	<%@ include file="../../header.jsp"%>
	<%@ include file="../../headerbar.jsp" %>
	





<div class="row">
  <div class="col-md-2">
  	<div style="margin-left: 30px; width: 230px; height: 300px; float: left;">
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
</div>
  
  <div class="col-md-8">

	<form action="/semi/fupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%=fboard.getfreeBoardNo()%>"> 		
	<table id="writetable">
	<th colspan="2">자유게시판 쓰기</th>
	
	<tr>
	<td id="category">분류</td>
	<td>	
	<select class="form-control">
 	 	<option>자유</option>
  		<option>후기</option>
	</select>
	</td>
	</tr>
	
	<tr><td id="title">제목</td> <td><input type="text" name="title" class="form-control" id="exampleInputEmail1" value="<%= fboard.getfreeBoardTitle()%>"></td>	</tr>
	<tr><td>작성자</td> <td><input type="text" name="writer" class="form-control" id="exampleInputEmail1" value="<%=fboard.getfreeBoardWriter() %>" readonly></td></tr>
	<tr><td>첨부파일</td> 
	<td>
	<%if(fboard.getOriginalFileName() != null){ %>
	<input type="file" name="file" value="<%=fboard.getOriginalFileName()%>">
	<%}else{ %>
	<input type="file" name="file" >
	<%} %></td>
	</tr>
	
	
	<tr><td colspan="2" id="textarea"><textarea  name="content"  class="form-control"><%=fboard.getfreeBoardContent() %></textarea></td></tr>
	<tr><td colspan="2" align="right"><input type="submit" value="등록하기" class="btn btn-default">&nbsp; <input type="reset" value="취소하기" class="btn btn-default"></td></tr>
	</table>
	</form>


	<div align="center">
	<a href="/semi/flist">목록으로 이동</a>
	</div>
	
	

  </div>
	
	
  <div class="col-md-2">
  	<%@ include file="../../rightList.jsp"%>
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