<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*,donation.member.model.vo.Member, donation.suggest.model.vo.Suggest" %>
<%	
	/* HashMap<Integer, Notice> map = 
			(HashMap<Integer, Notice>)request.getAttribute("map");
	Set<Map.Entry<Integer, Notice>> entrySet = map.entrySet();
	Iterator<Map.Entry<Integer, Notice>> entryIter = entrySet.iterator(); */
	
	ArrayList<Suggest> list = (ArrayList<Suggest>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>suggestListView</title>

<%@ include file="../../header.jsp" %>
<%@ include file="../../headerbar.jsp" %>

<link href="../../graph/csslinegraph/csslinegraph.css" rel="stylesheet" type="text/css" media="screen" />
        
        <script type="text/javascript">
        function goBoardPage() { location.href="../board/boardView.jsp"; }
        function goChatPage() { location.href="../chatting/chat.jsp"; }
        function goCategoryPage(){location.href="../category/categoryListView.jsp"}
        </script>
        
        <%-- 세로목록 --%>
		<style>
		ul#navi {
		   width: 200px;
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
		
		<!-- 쪽지함 style -->
		<style>
		#suglisth {
		margin-left: 600px;
		
		}
		</style>

<script type="text/javascript">
	function insertPage(){
		location.href="views/suggest/suggestWriteForm.jsp";
	}
</script>

</head>
<body>
	
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
<!-- 세로 목록 -->
<div style="margin-left:30px;width: 230px; height: 500px; float: left;">
   
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
   </div>
<!-- 세로 목록 끝 -->

<!-- 쪽지함 -->

<h2 align="center">쪽지함</h2>
<br><br>
<div align="left">
	<button onclick="insertPage();">글쓰기</button>
</div>
<br><br>

<br><br>

<table id="suglisth" align="center" width="600" border="1" cellspacing="0">
<th>번호</th><th>제목</th><th>발신자</th><th>날짜</th><th>첨부파일</th>
<% /* while(entryIter.hasNext()){
		Map.Entry<Integer, Notice> entry = entryIter.next();
		Integer key = entry.getKey();
		Notice notice = entry.getValue(); */
		
	for(Suggest suggest : list){
%>
	<tr height="30">
	<td align="center"><%= suggest.getSuggestNo() %></td>
	<td>
	<%-- <% if(member != null){ %> --%>
		<a href="/semi/sugdetail?no=<%= suggest.getSuggestNo() %>">
			<%= suggest.getSuggestTitle() %>
		</a>
	<%-- <% }else{ %> --%>
		<%-- <%= suggest.getSuggestTitle() %> --%>
	<%-- <% } %> --%>
	</td>
	<td align="center"><%= suggest.getSuggestWriter() %></td>
	<td align="center"><%= suggest.getSuggestDate() %></td>
	<td align="center">
	<% if(suggest.getSuggestOriginalFileName() != null){ %>
		◎
	<% }else{ %>
		&nbsp;
	<% } %>
	</td>
	</tr>
<% } %>
</table>
<!-- 쪽지함 -->


<!--  오른쪽 메뉴바 -->
    
	  <div  style="float:right;border:1px solid black; width:200px;height:800px; margin-right:10px; tex-align:center; ">
   	  <ul align="center">
      <li style="background-color:#648CFF;color:white; text-align:center; ">새로운 재능<br> 기부문화 다재다능</li>
      <li style=" text-align:center;">
      <a href="#" onclick="window.open('../../views/usage/usage.html','usage','resizable=no ,width=650,left=500,top=100, height=650');return false">
      <image src="../../images/verticalList1.png" align="center"width="198px" height="150px"></image></a>이용방법</li>
      <a href="#" onclick="window.open('../../views/usage/usage2.html','usage1','resizable=no ,width=650,left=500,top=100, height=400');return false">
      <image src="../../images/verticalList2.png" align="center"width="198px" height="150px"></image></a>이용방법2<br>동영상편</li>
      <a href="#" onclick="window.open('../../views/usage/usage3.html','usage2','resizable=no ,width=450,left=500,top=100, height=450');return false">
      <image src="../../images/verticalList3.png" align="center"width="198px" height="150px"></image></a>필수사항</li>
      <a href="#" onclick="window.open('../../views/usage/usage4.html','usage3','resizable=no ,width=500,left=500,top=100, height=400');return false">
      <image src="../../images/verticalList4.png" align="center"width="198px" height="150px"></image></a>이벤트</li>
      </ul>
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



<br><br>
<div align="center">
	<a href="/semi/index.jsp">시작페이지로 이동</a>
</div>
<br>
<hr>

</body>
</html>