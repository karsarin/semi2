<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link href="graph/csslinegraph/csslinegraph.css" rel="stylesheet" type="text/css" media="screen" />
	</style>
</head>

<body>
	<%@ include file="../../headerbar.jsp" %>
	<%@ include file="../../leftList.jsp" %>
	<%@ include file="../../rightList.jsp" %>

<!-- 	<font size="5">재능 등록</font> -->

 <form action="/semi/cinsert" method="post" enctype="multipart/form-data">

 <strong>카테고리</strong>
   		<select class="form-control" name="category" required>
  			<option value="">카테고리를 선택하세요.</option>
  			<option value="IT">IT</option>
 			 <option value="디자인">디자인</option>
  			<option value="마케팅">마케팅</option>
  			<option value="음악">음악</option>
 			 <option value="노하우/상담">노하우/상담</option>
 			 <option value="번역">번역</option>
 			 <option value="건강">건강</option>
 			 <option value="기타">기타</option>
		</select><br><br>
 <strong>재능제목</strong> <input type="text" name="ctitle" required> &nbsp; 40자 이내 <br><br>
  <strong>기부금설정</strong> <input type="text" name="cdonation"> &nbsp; 별도의 가격이 정해지지 않으면 0원으로 설정됩니다. <br><br>
  <strong>작업일</strong> <input type="text" name="cworkdate"> &nbsp; 작업이 완료되는 평균 작업일을 작성합니다. <br><br>
 <strong>이메일</strong> <input type="email" name="cemail" required> <br><br>
  <strong>휴대폰</strong> <input type="text" name="cphone"> <br><br>
  <strong>메인 이미지 등록</strong> <input type="file" name="upfile"> &nbsp; 나의 재능을 잘 대표할 수 있는 이미지로 설정합니다. <br><br>
  <strong>재능상세내용</strong> <textarea cols="50" row="50" name="ccontent"></textarea> <br><br>
  <fieldset>
  	<legend>재능상세이미지</legend> 
			<input type="file" name="cimage1"> <br><br>
			<input type="file" name="cimage2"> <br><br>
			<input type="file" name="cimage3"> <br><br>
			<input type="file" name="cimage4"> <br><br>
	</fieldset> 
<br><br>

		<input type="submit" value="재능 등록하기"> 
</form>
		<br><br>
</body>
</html>