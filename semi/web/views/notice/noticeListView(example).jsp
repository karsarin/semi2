<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, donation.notice.model.vo.Notice"%>

<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardListView</title>
<script type="text/javascript">
	function insertPage() {
		location.href = "views/notice/noticeWriteForm.jsp";
	}
</script>

        
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



<!-- 테이블 -->
<style>
table.type10 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

table.type10 thead th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #e7708d;
	margin: 20px 10px;
}

table.type10 tbody th {
	width: 150px;
	padding: 10px;
}

table.type10 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
}

table.type10 .even {
	background: #fdf3f5;
}
</style>





</head>

<body>

	<%@ include file="../../header.jsp"%>
	<%@ include file="../../headerbar.jsp" %>

	

	<div
		style="margin-left: 30px; width: 230px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">카테고리</div>
				<ul class="sub">
					<li><a href="/semi/nlist">공지사항</a></li>
					<li><a href="/semi/flist">자유 게시판</a></li>
					<li><a href="/semi/rlist">후기 게시판</a></li>
					<li><a href="/semi/qlist">QnA게시판</a></li>

				</ul>
			</li>
		</ul>
	</div>
	<!-- 반복 끝 -->
	

<!--  검색 -->
	<div align="center">
			<form action="/semi/nsearch" method="post">
				<input type="search" autocomlete name="keyword" length="50">&nbsp;
				<input type="submit" value="제목검색">

			</form>
		</div>

	<!--  게시판 -->
	<div style="float: left;">
		<div>

			<table class="type10" width="1000px;">				

				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>첨부파일</th>
						<th>조회수</th>
					</tr>
				</thead>

				<%
					/* while(entryIter.hasNext()){
					Map.Entry<Integer, Notice> entry = entryIter.next();
					Integer key = entry.getKey();
					Notice notice = entry.getValue(); */

					for (Notice notice : list) {
				%>


				<tbody>
					<tr height="30">
						<th align="center"><%=notice.getNoticeNo()%></th>
						<td><a href="/semi/ndetail?no=<%=notice.getNoticeNo()%>">
								<%=notice.getNoticeTitle()%>
						</a></td>
						<td align="center"><%=notice.getNoticeWriter()%></td>
						<td align="center"><%=notice.getNoticeDate()%></td>
						<td align="center">
							<%
								if (notice.getOriginalFileName() != null) {
							%> O <%
								} else {
							%> &nbsp: <%
 	}
 %>
						</td>
						<td align="left"><%=notice.getReadCount()%></td>
					</tr>
					<%
						}
					%>
				
				<tbody>


				</tbody>
			</table>

		</div>
		<!--  table 끝 -->
		
		
		
		
	<% if(member!= null){ %>
		<div align="right">
			<button onclick="javascript:insertPage();">글쓰기</button>
		</div>
	<%} %>
		
		


		<br>
		<%-- 페이지 번호 처리 --%>
		<div align="center">
			<%-- 이전 페이지 있을 경우에 대한 처리 --%>
			<%
				if (currentPage <= 1) {
			%>
			[이전] &nbsp;
			<%
				} else {
			%>
			<a href="/semi/nlist?page=<%=currentPage - 1%>">[이전]</a>
			<%
				}
			%>
			<%-- 현재 페이지 숫자 보여주기 --%>
			<%
				for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<b><font size="4" color="red">[<%=p%>]
			</font></b>
			<%
				} else {
			%>
			<a href="/semi/nlist?page=<%=p%>"><%=p%></a>
			<%
				}
				}
			%>
			<%-- 현재 페이지 다음 페이지에 대한 처리 --%>
			<%
				if (currentPage >= maxPage) {
			%>
			[다음]
			<%
				} else {
			%>
			<a href="/semi/nlist?page=<%=currentPage + 1%>">[다음]</a>
			<%
				}
			%>
			
			
			

		
		
	</div>

		
		
		
		</div>
		<br>



	


	<!--  오른쪽 메뉴바 -->
	<%@ include file="../../rightList.jsp"%>







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