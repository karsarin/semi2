<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="donation.category.vo.Category"%>
  
<% 
	Category category = (Category)request.getAttribute("category");
	int currentPage = ((Integer)request.getAttribute("ccurrentPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능 수정</title>
<link rel="stylesheet" href="../../css/bootstrap.min.css">
	<link rel="stylesheet" href="../../css/font-awesome.css">
    <link rel="styles2heet" href="../../css/animate.css">
    <link rel="stylesheet" href="../../css/templatemo_misc.css">
    <link rel="stylesheet" href="../../css/templatemo_style.css">
	<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
	
<script src="text/javascript">
function addImage2Check()
{
	var check = document.getElementById('addImage1').value;
	
	console.log(check);
	if(check != "" && check != null){
		document.getElementById('addImage2').disabled = false;
	}
}

function addImage3Check()
{
	var check1 = document.getElementById('addImage2').value;
	
	console.log(check1);
	if(check1 != "" && check1 != null){
		document.getElementById('addImage3').disabled = false;
	}
}

function addImage4Check()
{
	var check2 = document.getElementById('addImage3').value;
	
	console.log(check2);
	if(check2 != "" && check2 != null){
		document.getElementById('addImage4').disabled = false;
	}
}

</script>
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
 <form action="/semi/cupdate" method="post" enctype="multipart/form-data">

<input type="hidden" name="cwriter" value="<%=member.getMemberId()%>">
<input type="hidden" name="oimage" value="<%= category.getOriginalImage() %>">
<input type="hidden" name="rimage" value="<%= category.getRenameImage() %>">
<input type="hidden" name="cpage" vlaue="<%= currentPage %>">

<table class="table table-striped" width="400px">


<colgroup>
	<col width="160">
</colgroup>
<tbody>
<tr> 
	<th><strong>*카테고리</strong></th>

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
   <tr><th><strong>*재능제목</strong></th> <td> <input type="text" name="ctitle" value="<%= category.getCategoryTitle() %>" required> &nbsp; 40자 이내 </td></tr>
 <tr><th> <strong>*기부금설정</strong></th><td> <input type="text" name="cdonation" value="<%= category.getCategoryDonation() %>" required> &nbsp; 별도의 가격이 정해지지 않으면 0원으로 설정됩니다.</td></tr>
 <tr><th><strong>*작업일</strong></th> <td><input type="text" name="cworkdate" value="<%= category.getWorkDate() %>" required> &nbsp; 작업이 완료되는 평균 작업일을 작성합니다.</td></tr>
 <tr><th><strong>*이메일</strong></th><td><input type="email" name="cemail" value="<%= category.getEmail() %>" required></td></tr>
 <% if(category.getPhone()!= null) { %>
 <tr><th><strong>휴대폰</strong></th> <td><input type="text" name="cphone" value="<%= category.getPhone()%>"></td> </tr>
<%} else { %>
	<tr><th><strong>휴대폰</strong></th> <td><input type="text" name="cphone"></td> </tr>
<% %>
  <tr><th><strong>*메인 이미지 등록</strong></th><td> <input type="file" name="upfile" id="originalImage" value="<%= category.getOriginalImage() %>" required> &nbsp; 나의 재능을 잘 대표할 수 있는 이미지로 설정합니다.</td></tr>
  <tr><th><strong>*재능상세내용</strong></th> <td><textarea cols="50" row="50" name="ccontent" value="<%= category.getCategoryContent() %>"></textarea></td> </tr>
  <tr><th><strong>재능상세이미지</strong></th>  
 	<% if(category.getAddImage1() != null){ %>
		<td> <input type="file" name="cimage1" id="addImage1" value="<%= category.getAddImage1() %>" onchange="addImage2Check();"> &nbsp; 추가로 4장의 이미지를 더 설정할 수 있습니다.</td><br>
	<%} else {%>
		<td><input type="file" name="cimage1" id="addImage1" onchange="addImage2Check();"> &nbsp; 추가로 4장의 이미지를 더 설정할 수 있습니다.</td><br>
	<%} %>
	
	<% if(category.getAddImage2() != null){ %>
		<td><input type="file" name="cimage2" id="addImage2" value="<%= category.getAddImage2()%>" onchange="addImage3Check();" disabled></td><br>
	<% } else { %>
		<input type="file" name="cimage2" id="addImage2" onchange="addImage3Check();" disabled> <br>
	<%} %>
	
	<% if(category.getAddImage3() != null){ %>
		<input type="file" name="cimage3" id="addImage3" value="<%= category.getAddImage3() %>" onchange="addImage4Check();" disabled> <br>
	<% } else { %>
		<input type="file" name="cimage3" id="addImage3" onchange="addImage4Check();" disabled> <br>
	<%} %>
	
	<% if(category.getAddImage4() != null){ %>
			<input type="file" name="cimage4" value="<%= category.getAddImage4() %>" id="addImage4" disabled> <br> </td>
	<%} else { %>
		<input type="file" name="cimage4" id="addImage4" disabled> <br> </td>
	<% } %>
	</tr>
	<tr><th></th><td><input type="submit" value="재능 수정하기"></td></tr>
	</tbody>
</table>
 </div>
</div>
</div>
   <%@ include file="../../rightList.jsp" %> 	
		<%@ include file="../../footerbar.jsp" %>
</body>
</html>