<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="donation.member.model.vo.Member"%>
    <%-- <%
    	Member member = (Member)session.getAttribute("member");
    %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능 등록</title>
	<link rel="stylesheet" href="../../css/bootstrap.min.css">
	<link rel="stylesheet" href="../../css/font-awesome.css">
    <link rel="stylesheet" href="../../css/animate.css">
    <link rel="stylesheet" href="../../css/templatemo_misc.css">
    <link rel="stylesheet" href="../../css/templatemo_style.css">
	<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
	
	

</head>

<body>
	<%@ include file="../../header.jsp" %>
<%@ include file="../../headerbar.jsp" %>	
		
		<div class="row">
  <div class="col-md-2">
 <%@ include file="../../leftList.jsp" %> 
 </div>
 
 
 

 
  <div style="width:1000px;">
  <div style="align: center;">
	<font size="5">&nbsp; &nbsp; &nbsp;재능 등록</font>
</div>

<div style="float:left; width:650px;" >
 <form action="/semi/cinsert" method="post" enctype="multipart/form-data">

<table class="table table-striped" width="400px">
<input type="hidden" name="cwriter" value="<%=member.getMemberId()%>">
<colgroup>
	<col width="160">
</colgroup>
<tbody>
<tr> 
	<th><strong>카테고리</strong></th>

<td>
	<select class="form-control" name="category" style="width:200px" required>
	
  			<option value="">카테고리를 선택하세요.</option>
  			<option value="IT">IT</option>
 			 <option value="디자인">디자인</option>
  			<option value="마케팅">마케팅</option>
  			<option value="음악">음악</option>
 			 <option value="노하우/상담">노하우/상담</option>
 			 <option value="번역">번역</option>
 			 <option value="건강">건강</option>
 			 <option value="기타">기타</option>
		</select>
</td>
</tr>
   <tr><th><strong>재능제목</strong></th> <td> <input type="text" name="ctitle" required> &nbsp; 40자 이내 </td></tr>
 <tr><th> <strong>기부금설정</strong></th><td> <input type="text" name="cdonation"> &nbsp; 별도의 가격이 정해지지 않으면 0원으로 설정됩니다.</td></tr>
 <tr><th><strong>작업일</strong></th> <td><input type="text" name="cworkdate"> &nbsp; 작업이 완료되는 평균 작업일을 작성합니다.</td></tr>
 <tr><th><strong>이메일</strong></th><td><input type="email" name="cemail" required></td></tr>
 <tr><th><strong>휴대폰</strong></th> <td><input type="text" name="cphone"></td> </tr>
  <tr><th><strong>메인 이미지 등록</strong></th><td> <input type="file" name="upfile" required> &nbsp; 나의 재능을 잘 대표할 수 있는 이미지로 설정합니다.</td></tr>
  <tr><th><strong>재능상세내용</strong></th> <td><textarea cols="50" row="50" name="ccontent"></textarea></td> </tr>
  <tr><th><strong>재능상세이미지</strong></th>  <td>
 
			<input type="file" name="cimage1"> <br>
			<input type="file" name="cimage2"> <br>
			<input type="file" name="cimage3"> <br>
			<input type="file" name="cimage4"> <br> </td>
	</tr>
	<tr><th></th><td><input type="submit" value="재능 등록하기"></td></tr>
	</tbody>
</table>
 </div>



</div>
</div>
  
  
   <%@ include file="../../rightList.jsp" %> 
 
		
		
		
		
	
	
		<%@ include file="../../footerbar.jsp" %>
		
		
	
		
		
		
		
		
</body>
</html>