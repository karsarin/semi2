<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="donation.category.vo.Category, donation.question.model.vo.Question, java.util.*, java.sql.*"%>
<% 
	ArrayList<Category> clist = (ArrayList<Category>)request.getAttribute("clist");
	int clistCount = ((Integer)request.getAttribute("clistCount")).intValue();
	int ccurrentPage = ((Integer)request.getAttribute("ccurrentPage")).intValue();
	int cmaxPage = ((Integer)request.getAttribute("cmaxPage")).intValue();	
	
	ArrayList<Question> qlist = (ArrayList<Question>)request.getAttribute("qlist");
	int qlistCount = ((Integer)request.getAttribute("qlistCount")).intValue();
	int qcurrentPage = ((Integer)request.getAttribute("qcurrentPage")).intValue();
	int qmaxPage = ((Integer)request.getAttribute("qmaxPage")).intValue();
%>
<!DOCTYPE>
<html>
<head>
	<meta charset=UTF-8">
	<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Talent Donation - Manager/main</title>
	<link href="/semi/css/manager/main.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/semi/css/manager/mainFonts.css" rel="stylesheet" type="text/css" media="all" />
    <script src="/semi/js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
</head>
<body>
	<%@ include file="../../header.jsp" %>
	<%if(member!=null && member.getMemberId().equals("admin")) { %>
	<%@ include file="managerHeader.jsp" %>
			
	<div class="content-section" id="services">
		<div class="container" align="center">
			<div class="row">
				<div class="heading-section col-sm-12 col-md-12 text-center">
					<h2 style="text-shadow:1px 1px 2px gray;">재능기부 승인 요청</h2>
					<p><%=clistCount%>개</p>
				</div>
			</div><br>
			<div id="portfolio">
				<% if(ccurrentPage<=1) { %>
					<button id="pre">◀</button>
				<% } else { %>					
					<button id="pre" onclick="location.href='/semi/mgrmain?cpage=<%=ccurrentPage-1%>'">◀</button>
				<% } %>
				<% for(Category c : clist) { %>
				<div id="columnC">
					<div class="title">
						<h2>
							<%if(c.getCategoryTitle().length()>11) {
								String cTitle = c.getCategoryTitle().substring(0, 10)+"..."; 	
							%>
								<%=cTitle%>
							<%} else {%>
								<%=c.getCategoryTitle()%>
							<%}%>
						</h2>
					</div>
					<p>
						<%if(c.getCategoryContent().length()>62) {
								String cContent = c.getCategoryContent().substring(0, 61)+"..."; 	
						%>
							<%=cContent%>
						<%} else {%>
							<%=c.getCategoryContent()%>
						<%}%>
					</p>
					<a href="#" id="readBt" class="icon icon-plus-sign button">Read	More</a>
				</div>
				<% } %>
				
				<%if((clist.size()%4)!=0) {
					for(int i=clist.size()%4; i<4; i++) {%>
					<div id="columnC"> &nbsp; </div>
				<%}}%>
				
				<% if(ccurrentPage>=cmaxPage) { %>
				<button id="next">▶</button>
				<% } else { %>
					<button id="next" onclick="location.href='/semi/mgrmain?cpage=<%=ccurrentPage+1%>'">▶</button>
				<% } %>
			</div><br><br>
			<button id="tmore">More</button>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br>
	<div class="content-section col-md-12" id="services">
		<div class="container" align="center">
			<div class="row">
				<div class="heading-section text-center">
					<h2 style="text-shadow:1px 1px 2px gray;">Q&A 답변 대기</h2>
					<p><%=qlistCount%>개</p>
				</div>
			</div>
			<table class="qnatb">
				<thead>
					<tr>
						<th scope="cols">글번호</th>
						<th scope="cols">제목</th>
						<th scope="cols">내용</th>
						<th scope="cols">작성자</th>
						<th scope="cols">작성일</th>
					</tr>
				</thead>
				<tbody>
					<% for(Question q : qlist) { %>
					<tr>
						<th scope="row"><%=q.getQuestionNum()%></th>
						<td><%=q.getQuestionTitle()%></td>
						<td>
							<%if(q.getQuestionContent().length()>16) {
								String qcontent = q.getQuestionContent().substring(0, 15)+"..."; 	
							%>
								<%=qcontent%>
							<%} else {%>
								<%=q.getQuestionContent()%>
							<%}%>
						</td>
						<td><%=q.getQuestionWriter()%></td>
						<td><%=q.getQuestionDate()%></td>
					</tr>
					<% } %>
				</tbody>
			</table><br><br>
			<% if(qcurrentPage<=1) { %>
				<button id="qpre">PREVIOUS</button>
			<% } else { %>					
				<button id="qpre" onclick="location.href='/semi/mgrmain?qpage=<%=qcurrentPage-1%>'">PREVIOUS</button>
			<% } %>
			<% if(qcurrentPage>=qmaxPage) { %>
				<button id="qnext">NEXT</button>
			<% } else { %>
				<button id="qnext" onclick="location.href='/semi/mgrmain?qpage=<%=qcurrentPage+1%>'">NEXT</button>
			<% } %>
		</div>
	</div>
	<% } else {  %>
	<h2>관리자로 로그인해주세요.</h2>
	<% } %>
	<%@ include file="managerFooter.jsp" %>
</body>
</html>