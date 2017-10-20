<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="donation.question.model.vo.Question, java.sql.Date, java.util.*" %>
<%
	Question q = (Question)request.getAttribute("question");
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuestionDetailView</title>
</head>
<body>
<%@ include file="../../header.jsp" %>


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
							<li class="active"><a href="/semi/index.jsp">Home</a></li>
							<li><a href="#">카테고리</a></li>
							<li><a href="/semi/nlist">게시판</a></li>
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
	<br>
	<br>

	<div style="width: 300px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">카테고리</div>
				<ul class="sub">
					<li><a href="/semi/nlist">공지사항</a></li>
					<li><a href="#">자유 게시판</a></li>
					<li><a href="#">후기 게시판</a></li>
					<li><a href="/semi/qlist">QnA게시판</a></li>

				</ul>
			</li>
		</ul>
	</div>

	<!-- 반복 끝 -->
	
	
</div>




<hr style="clear:both;">
<h2 align="center"><%= q.getQuestionNum() %>번 게시글 상세보기</h2>
<br>
<table align="center" cellspacing="0" cellpadding="10" border="1" width="500">
<tr><th>제목</th><td><%= q.getQuestionTitle() %></td></tr>
<tr><th>작성자</th><td><%= q.getQuestionWriter() %></td></tr>
<tr><th>첨부파일</th>
	<td>
	<% if(q.getQuestionOriginalFileName() == null){ %>
		첨부파일 없음
	<% }else{ %>
	<a href="/semi/qfdown?ofile=<%= q.getQuestionOriginalFileName() %>&rfile=<%= q.getQuestionRenameFileName() %>">
		<%= q.getQuestionOriginalFileName() %>
	</a>
	<% } %>
	</td>
</tr>
<tr><th>내용</th><td><%= q.getQuestionContent() %></td></tr>
<tr><td colspan="2" align="center">
<%  if(member != null){ %>
	<%--쿼리스트링에는 반드시 공백 사용하면 안됨 다 붙여서 써야됨 꼭 --%>
	<a href="/semi/views/question/questionReplyForm.jsp?qnum=<%= q.getQuestionNum() %>&page=<%= currentPage %>">[댓글달기]</a>
<% if(member.getMemberId().equals(q.getQuestionWriter())){ %>
	<a href="/semi/qupview?qnum=<%= q.getQuestionNum() %>&page=<%= currentPage %>">[수정페이지로 이동]</a>
	&nbsp;
	<a href="/semi/qdelete?qnum=<%= q.getQuestionNum() %>">[삭제]</a>
<%  }} %>
&nbsp; 
<a href="/semi/qlist?page=<%= currentPage %>">[목록]</a>
</td></tr>
</table>
<br>
<hr>

</body>
</html>











