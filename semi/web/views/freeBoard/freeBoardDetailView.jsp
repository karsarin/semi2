<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,  donation.freeBoard.model.vo.FreeBoard"%>
 
 <%
 FreeBoard fboard = (FreeBoard)request.getAttribute("fboard");
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeDetailView</title>
<style type="text/css">
	#reply{
		
	}
	
	#replyDiv{
	width:900px;
	height:50px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	}
</style>

<script type="text/javascript" src="/semi/js/jquery-3.2.1.min.js"></script>


<script type="text/javascript">
	window.onload = function(){
		
		$.ajax({url: "/semi/reList",
			data: {boardNum :  $("#boardNum").val()},
			  type: "get", 
			  success: function(data){
					//console.log(data);
					
					var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
					//console.log(jsonStr);
					var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
					
					var values = $("#reply").html();	
					
					
					for(var i in json.list){
						//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
						//values += json.list[i].commentNum + ", " + json.list[i].boardNum + ", " + 
						//		decodeURIComponent(json.list[i].writer) + ", " +decodeURIComponent( json.list[i].date )+ ", " + decodeURIComponent(json.list[i].content) + "<br>";
						
								//$("#reply").html(values);	
				//	values +=  " 글쓴이 : "  + decodeURIComponent(json.list[i].writer) + "<br>" +   "내용 : " + decodeURIComponent(json.list[i].content) ;
					$("#reply").append(							
							"<div id=\"replyDiv\">" + "<label id=\"commentWriter\">"+  " 글쓴이 : " + "</label>" + decodeURIComponent(json.list[i].writer) + "<br>"  +"<label id=\"commentContent\">"+ "내용 : " + "</label>" + decodeURIComponent(json.list[i].content) + "</div>" + "<br>");
					
					values = "";
					} 	
					

				},
			  error : function(data){  //실패했을 때 구동되는 함수
				  consolse.log("에러발생 : " + data);
			  }
			
		});	
		
		
		
	}
	
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
</style>
<!-- 세로목록 끝 -->


<!-- 테이블 -->
<style>
#detailview{
	
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





<!-- 댓글 -->
#replyview{
	width:1000px;
}
#commentWriter{
	color: black;
	font-weight: bold;
	
}
#commentContent{
	color: black;
	font-weight: bold;
}

</style>




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

	<!-- 게시글 -->
	<table  class="table table-hover" id="detailview">
	<tr>
		<input type="hidden" id="writer" value="<%=fboard.getfreeBoardWriter() %>">
		<input type="hidden" id="commentWriter" value="<%=member.getMemberId() %>">
		<input type="hidden" id="boardNum" value="<%=fboard.getfreeBoardNo() %>">
		<td id="titlie"><label><%= fboard.getfreeBoardTitle() %></label></td>
		<td id="readCount"><label>조회:<%=fboard.getReadCount() %></label></td>
		<td id="date"><label><%=fboard.getfreeBoardDate() %></label></td>
		<td id="writer"><label><%=fboard.getfreeBoardWriter() %></label></td>
		<td id="file"><label><%if(fboard.getOriginalFileName() != null){	%>		
		<a href="/semi/ffdown?oname=<%=fboard.getOriginalFileName()%>&rname=<%=fboard.getRenameFileName()%>"> <%=fboard.getOriginalFileName() %></a>
		<%}else{ %>
		첨부파일 없음
		<%} %></label></td>
	<tr id="textBox">
		<td colspan="5"><%=fboard.getfreeBoardContent() %></td>
	</tr>


	<tr><td colspan="5" align="right">
		<a href="/semi/fupview?no=<%=fboard.getfreeBoardNo()%>">수정페이지로 이동</a> &nbsp; 
		<a href="/semi/fdel?no=<%=fboard.getfreeBoardNo()%>">삭제하기</a>
	</td></tr>
	
	</table>
	<!-- 게시글 -->


	
	
	
			
	
	


	<!-- 댓글 입력-->
		<table>
		<tr><td colspan="2">댓글</td></tr>
		<tr><td width="900px">
		<input type="text" class="form-control"  name="replyinput">
		</td>
		<td>
		<input type="button" onclick="insertReply()" value="등록">
		</td>
		<tr>
		</table>
			<script type="text/javascript">
			
			function insertReply(){
			$.ajax({
			url: "/semi/reInsert",
			data: {content : $("input[name=replyinput]").val() , writer : $("#commentWriter").val(), boardNum : $("#boardNum").val()},
			type: "post",
			dataType: "json", //리턴되는 결과의 자료형 명시함
			success: function(data){
				//console.log(data);
				
				var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
				//console.log(jsonStr);
				var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
				
				//var values = $("#reply").html();	
				
				
			/* 	for(var i in json.list){
					//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
					values += json.list[i].commentNum + ", " + json.list[i].boardNum + ", " + 
							decodeURIComponent(json.list[i].writer) + ", " +decodeURIComponent( json.list[i].date )+ ", " + decodeURIComponent(json.list[i].content) + "<br>";
					$("#reply").html(values);	
				} 	
 */
				$("#reply").append(							
						"<div id=\"replyDiv\">" +  "<label id=\"commentWriter\">"+ " 글쓴이 : " + "</label>"+ $("#commentWriter").val() + "<br>"	
						+ "<label id=\"commentContent\">" + "내용 : " + "</label>"+  	$("input[name=replyinput]").val() 
						+ "</div>" + "<br>");
 				
			},
			error: function(data){			
				console.log("에러 발생 : " + data);
			}
		});
	}
	</script>
			
	<!-- 댓글 표시될 공간 -->
	<div id="reply">
	
	</div>
			

			
</div>
	
  <div class="col-md-2">
  	<%@ include file="../../rightList.jsp"%>
	
  </div>




	
	<div align ="center">
		<a href="/semi/flist">목록보기로 이동</a>
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