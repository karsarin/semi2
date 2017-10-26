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

table.type10{
   border : 1px solid #ccc;
}
table.type10{
   width : 1000px;
}
table tr.firstTr{
   height:40px;
   background-color: lightblue;
}
table td.firstTd{
   width:600px;
   padding-top : 10px;
}



table.type10 tr{
   border-bottom : 1px solid #ccc;

}

table.type10 td{
   border-right : 1px solid #ccc;
}
</style>





</head>

<body>

   <%@ include file="../../header.jsp"%>
   <%if(member!=null && member.getMemberId().equals("admin")) { %>
      <%@ include file="../manager/managerHeader.jsp" %>
   <% } else { %>
      <%@ include file="../../headerbar.jsp" %>
   <% } %>
   <%@ include file="../../rightList.jsp"%>
   

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
   </div>
   



<table class="type10">
   <tr class="firstTr">
      <td class="firstTd"><%= notice.getNoticeTitle() %></td><td>조회:<%=notice.getReadCount() %></td><td><%=notice.getNoticeDate() %></td><td><%=notice.getNoticeWriter() %></td><td>   <%if(notice.getOriginalFileName() != null){   %>
      
      <a href="/semi/nfdown?oname=<%=notice.getOriginalFileName()%>&rname=<%=notice.getRenameFileName()%>">   <%=notice.getOriginalFileName() %></a>
   <%}else{ %>
      첨부파일 없음
   <%} %></td>
   

   <tr height="100">
      <td colspan="5"><%=notice.getNoticeContent() %></td>
   </tr>


   <%if(member.getMemberId().equals("admin")){ //include에서 sission값을 가지고있기 때문에 그냥 사용할 수 있다. %>
   <tr align="right"><td colspan="5">
      <a href="/semi/nupview?no=<%=notice.getNoticeNo()%>">수정페이지로 이동</a> &nbsp; 
      <a href="/semi/ndel?no=<%=notice.getNoticeNo()%>">삭제하기</a>
   </td></tr>
   <%}else{ %>
   
   <%} %>
</table>



<div align ="center">
   <a href="/semi/nlist">목록보기로 이동</a>

</div>
<br><br>
<hr>



</body>
