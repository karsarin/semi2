<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, donation.notice.model.vo.Notice"%>
<%
	Notice notice = (Notice)request.getAttribute("notice");

%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>NoticeUpdateView</title>
</head>
<body>

<hr>
<br><br>


<h2 align="center"><%= notice.getNoticeNo() %>번 공지글 수정 페이지</h2>
<section align="center">
	<form action="/second/nupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="<%=notice.getNoticeNo()%>">  <!-- 쿼리스트링 안쓰고 form 안에서 input으로 숨겨서 보낼 수 있음 -->
	<table align="center" width ="600">
	<tr><th width="150" bgcolor="gray">제목</th>
	<td align="left"><input type="text" name="title" value="<%= notice.getNoticeTitle()%>"></td>
	</tr>
	<tr><th width="150" bgcolor="gray">작성자</th>
	<td  align="left"><input type="text" name="writer" value="<%=notice.getNoticeWriter() %>" readonly></td>
	</tr>
	<tr><th width="150" bgcolor="gray">첨부파일</th>
	<td  align="left">
	<%if(notice.getOriginalFileName() != null){ %>
	<input type="file" name="file" value="<%=notice.getOriginalFileName()%>">
	<%}else{ %>
	<input type="file" name="file" >
	<%} %>
	</td>	
	</tr>
	<tr><th width="150" bgcolor="gray">내용</th>
	<td  align="left"><textarea rows="5" cols="50" name="content"><%=notice.getNoticeContent() %></textarea></td>
	</tr>
	<tr><th width="150" bgcolor="gray" colspan="2">
	<input type="submit" value="수정하기">&nbsp;
	<input type="reset" value="취소하기">
	</th></tr>
	</table>
	</form>
	<br>
	<a href="/semi/nlist">목록으로 이동</a>
</section>


<br><br>
<hr>

</body>
</html>