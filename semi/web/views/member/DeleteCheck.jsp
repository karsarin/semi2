<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="donation.member.model.vo.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>


<%-- 세로목록 --%>
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

</head>
<body>

	<%@ include file = "../../header.jsp" %>
	<%@ include file = "../../headerbar.jsp" %>
	<div style=" margin-top:200px;margin-left: 30px; width: 230px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">마이페이지</div>
				<ul class="sub">
					<li><a href="/semi/minfor?userid=<%=member.getMemberId()%>">내정보보기</a></li>
					<li><a href="#">기부현황보기</a></li>
					<li><a href="#">작성한 글 보기</a></li>
					<li><a href="/semi/views/member/DeleteCheck.jsp">회원탈퇴</a></li>
					
				</ul>
			</li>

		</ul>



	</div>




<h4 align="center">회원탈퇴를 위한 패스워드를 입력해주세요</h4>
<form action="/semi/mdelete"method="post">
<div align="center">
<input type="password" name="inputpwd" value="">
<input type="hidden" name="memberpwd" value="<%= member.getMemberPwd() %>">
<input type="hidden" name="memberid" value="<%= member.getMemberId() %>">
<br>
<input type="submit"value="탈퇴"><input type="button"value="취소" onClick="window.close()">

</div>
</form>
<script src="/semi/js/loginjs.js"></script>
</body>
</html>