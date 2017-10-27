<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="donation.question.model.vo.Question" %>

<% Question question = (Question)request.getAttribute("question");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdateView</title>

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
	background: aliceblue;
}


<!-- 테이블 -->
#writetable{
width:66vw;
}
#title{
	width:80px;
}

#textarea textarea{
width:66vw;
height:200px;
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

	
	<%
		//원글일 때 
		if(question.getQuestionLevel() == 0){	%>
	
	<form action="/semi/qupdate0" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%=question.getQuestionNum() %>"> 
	<input type="hidden" name="ofile" value="<%=question.getQuestionOriginalFileName()%>">
	<input type="hidden" name="rfile" value="<%=question.getQuestionRenameFileName()%>">
	<input type="hidden" name="page" value="<%=currentPage %>">
		
	<table id="writetable">
	<th colspan="2">QA 글 수정</th>
	
	<tr><td id="title">제목</td> <td><input type="text" name="title" class="form-control" id="exampleInputEmail1" value="<%=question.getQuestionTitle()%>"></td>	</tr>
	<tr><td>작성자</td> <td><input type="text" name="writer" class="form-control" id="exampleInputEmail1" value="<%=question.getQuestionWriter()%>" readonly></td></tr>
	<tr><td>첨부파일</td> 
	<td>
	<%if(question.getQuestionOriginalFileName() != null){ %>
	<input type="file" name="file" value="<%= question.getQuestionOriginalFileName()%>">
	<%}else{ %>
	<input type="file" name="file" >
	<%} %>
	</td></tr>
	<tr><td colspan="2" id="textarea"><textarea rows="5" cols="50" name="content"  class="form-control" ><%=question.getQuestionContent()%></textarea></td></tr>
	<tr><td colspan="2" align="right"><input type="submit" value="수정하기" class="btn btn-default">&nbsp; <input type="reset" value="취소하기" class="btn btn-default"></td></tr>
	</table>


	</form>
	
	<%}else{   //댓글일 때%> 
	<form action="/semi/qupdate1" method="post">
		<input type="hidden" name="no" value="<%=question.getQuestionNum() %>">
		<input type="hidden" name="page" value="<%=currentPage %>">

	<table id="writetable">
	<th colspan="2">QA 답글 수정</th>
	
	<tr><td id="title">제목</td> <td><input type="text" name="title" class="form-control" id="exampleInputEmail1" value="<%=question.getQuestionTitle()%>"></td>	</tr>
	<tr><td>작성자</td> <td><input type="text" name="writer" class="form-control" id="exampleInputEmail1" value="<%=question.getQuestionWriter()%>" readonly></td></tr>
	<tr><td colspan="2" id="textarea"><textarea rows="5" cols="50" name="content"  class="form-control" ><%=question.getQuestionContent()%></textarea></td></tr>
	<tr><td colspan="2" align="right"><input type="submit" value="수정하기" class="btn btn-default">&nbsp; <input type="reset" value="취소하기" class="btn btn-default"></td></tr>
	</table>



	</form>
	<%} %>
	
	
	
	<div align = "center">
	<a href="javascript:history.go(-1);">이전 페이지로</a>
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


