<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="donation.category.vo.Category, donation.question.model.vo.Question, java.util.*, java.sql.*"%>
<% 
	ArrayList<Category> clist = (ArrayList<Category>)request.getAttribute("clist");
	int clistCount = ((Integer)request.getAttribute("clistCount")).intValue();
	int ccurrentPage = ((Integer)request.getAttribute("ccurrentPage")).intValue();
	int cmaxPage = ((Integer)request.getAttribute("cmaxPage")).intValue();	
	
	ArrayList<Question> qlist = (ArrayList<Question>)request.getAttribute("qlist");
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
    <script src="/semi/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$('.main-menu ul #minfo').removeClass('active');
    		$('.main-menu ul #category').removeClass('active');
    		$('.main-menu ul #board').removeClass('active');
    		$('.main-menu ul #home').addClass('active');	
    		
    		var qmaxPage = <%=qlist.size()%>;
    		var qcurrentView = <%=9%>;
    		$('.qnatb tbody tr').each(function(index){
    			if(index > qcurrentView) {
    				 $(this).hide('fast');
    			}
    		});
    		
    		$('#qmore').click(function(){
    			if(!(qcurrentView>qmaxPage)) {
    				$('.qnatb tbody tr').each(function(index){
    					if(qmaxPage-qcurrentView > 10) {
    						if(index > qcurrentView && index <= qcurrentView+10) {
    							$(this).show('3000');
    						}
    					} else {
    						if(index > qcurrentView) {
    							$(this).show('3000');
    						}
    					}
    				});
    				qcurrentView+=10;
    			}
    		});
    	});
    </script>
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
					<a href="/semi/cdetail?cnum=<%=c.getCategoryNo()%>&page=<%=ccurrentPage%>" id="readBt" class="icon icon-plus-sign button">Read More</a>
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
					<p><%=qlist.size()%>개</p>
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
						<td><a href="/semi/qdetail?no=<%=q.getQuestionNum()%>&page=1"><%=q.getQuestionTitle()%></a></td>
						<td><a href="/semi/qdetail?no=<%=q.getQuestionNum()%>&page=1">
							<%if(q.getQuestionContent().length()>16) {
								String qcontent = q.getQuestionContent().substring(0, 15)+"..."; 	
							%>
								<%=qcontent%>
							<%} else {%>
								<%=q.getQuestionContent()%>
							<%}%>
						</a></td>
						<td><%=q.getQuestionWriter()%></td>
						<td><%=q.getQuestionDate()%></td>
					</tr>
					<% } %>
				</tbody>
			</table><br><br>
			<button id="qmore">more</button>
		</div>
	</div>
	<% } else {  %>
	<h2>관리자로 로그인해주세요.</h2>
	<% } %>
	<%@ include file="managerFooter.jsp" %>
</body>
</html>