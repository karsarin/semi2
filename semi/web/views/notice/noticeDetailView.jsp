<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, donation.notice.model.vo.Notice"%>
 
 <%
 	Notice notice = (Notice)request.getAttribute("notice");
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetailView</title>

<script src="/semi/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.main-menu ul #minfo').removeClass('active');
		$('.main-menu ul #home').removeClass('active');
		$('.main-menu ul #category').removeClass('active');
		$('.main-menu ul #board').addClass('active');
	});
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

<!-- 세로목록 끝 -->

<!-- 테이블 -->

#detailview{
width:66vw;
}

#textBox{
	height:200px;
}

#title{

width:40%;
}
#readCount{
width:8%;
}
#date{
width:15%;
}
#writer{
width:13%;
}
#file{
width:20%;
}

</style>


</head>

<body>

	<%@ include file="../../header.jsp"%>	
	<%if(member.getMemberId().equals("admin")) { %>
      <%@ include file="../manager/managerHeader.jsp" %>
   <% } else { %>
      <%@ include file="../../headerbar.jsp" %>
   <% } %>

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

	
	

<table  class="table table-hover" id="detailview">
	<tr>
		<td id="titlie"><label><%= notice.getNoticeTitle() %></label></td>
		<td id="readCount"><label>조회:<%=notice.getReadCount() %></label></td>
		<td id="date"><label><%=notice.getNoticeDate() %></label></td>
		<td id="writer"><label><%=notice.getNoticeWriter() %></label></td>
		<td id="file"><label><%if(notice.getOriginalFileName() != null){	%>		
		<a href="/semi/nfdown?oname=<%=notice.getOriginalFileName()%>&rname=<%=notice.getRenameFileName()%>">	<%=notice.getOriginalFileName() %></a>
		<%}else{ %>
		첨부파일 없음
		<%} %></label></td>
	<tr id="textBox">
		<td colspan="5"><%=notice.getNoticeContent() %></td>
	</tr>

	<%if(notice.getNoticeWriter().equals(member.getMemberId())){ //include에서 sission값을 가지고있기 때문에 그냥 사용할 수 있다. %>
	<tr><td colspan="5" align="right">
		<a href="/semi/nupview?no=<%=notice.getNoticeNo()%>">수정페이지로 이동</a> &nbsp; 
		<a href="/semi/ndel?no=<%=notice.getNoticeNo()%>">삭제하기</a>

	<%if(member.getMemberId().equals("admin")){ //include에서 sission값을 가지고있기 때문에 그냥 사용할 수 있다. %>
	<tr align="right"><td colspan="5">
		<a href="/semi/nupview?no=<%=notice.getNoticeNo()%>" style="margin-right:10px">수정</a> 
		<a href="/semi/ndel?no=<%=notice.getNoticeNo()%>" style="margin-right:10px">삭제</a>

	</td></tr>

	<%}else{ %>
	<tr><td></td></tr>
	<%} %>

	<%}%>
</table>

<div align ="center">

	<a href="/semi/nlist">목록보기로 이동</a>

	<a href="/semi/nlist">목록보기</a>


</div>
	
	
	
	

  </div>
	
	
  <div class="col-md-2">
  	<%@ include file="../../rightList.jsp"%>
	</div>
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