<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="donation.member.model.vo.Member" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/semi/css/loginstyle2.css">


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
	<%@ include file = "../../rightList.jsp" %>
	<h1 align="center"><%=member.getMemberNik() %></h1>
	<div style=" margin-top:200px;margin-left: 30px; width: 230px; height: 500px; float: left;">

		<ul id="navi">
			<li class="group">
				<div class="title">마이페이지</div>
				<ul class="sub">
					<li><a href="#">내정보보기</a></li>
					<li><a href="#">기부현황보기</a></li>
					<li><a href="#">작성한 글 보기</a></li>
					<li><a href="/semi/mdelete">회원탈퇴</a></li>

				</ul>
			</li>

		</ul>



	</div>




	<div class="login-page">
		<div class="form">

			<form class="login-form" action="/semi/mupdate" method="post">
			<input type="hidden" name = "memberoriginname"value="<%= member.getMemberName()%>">
		<input type="hidden" name = "memberoriginpwd"value="<%= member.getMemberPwd()%>">
		<input type="hidden" name = "memberoriginnik"value="<%= member.getMemberNik()%>">
		<input type="hidden" name = "memberoriginaddress"value="<%= member.getMemberAddress()%>">
		<input type="hidden" name = "memberoriginemail"value="<%= member.getMemberEmail()%>">
		<input type="hidden" name = "memberoriginphone"value="<%= member.getMemberPhone()%>">
		
			
			
				<input type="text" name = "memberid"value="<%= member.getMemberId()%>" readonly="readonly">
				<input type="text" name="membername"value="<%=member.getMemberName() %>"> 
					<input type="password" name="memberpwd1"value=""placeholder="비밀번호"> 
					<input type="password"name="memberpwd2"value=""placeholder="비밀번호 확인"> 
					<input type="text"name="membernik"value="<%=member.getMemberNik()%>">
				<button onclick="">중복확인</button>
				<input type="text"name="memberaddress"value="<%= member.getMemberAddress()%>">
				<input type="email"name="memberemail"value="<%= member.getMemberEmail()%>">
				<input type="text"name="memberphone"value="<%= member.getMemberPhone()%>">
				
				<% String[] talent = member.getTalent().split(","); %>
			<table>
				<tr>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능1")){%>checked<%break;}} %>>재능1</td>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능2")){%>checked<%break;}} %>>재능2</td>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능3")){%>checked<%break;}} %>>재능3</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능4")){%>checked<%break;}} %>>재능4</td>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능5")){%>checked<%break;}} %>>재능5</td>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능6")){%>checked<%break;}} %>>재능6</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능7")){%>checked<%break;}} %>>재능7</td>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능8")){%>checked<%break;}} %>>재능8</td>
					<td><input type="checkbox" name="talent" value="재능1"style="width: 50px;"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능9")){%>checked<%break;}} %>>재능9</td>
				</tr>
				
			</table>
				<button>회원정보 변경</button>
				

			</form>
		</div>
		<div></div>
	</div>
	<script src="/semi/js/loginjs.js"></script>
</body>
</html>