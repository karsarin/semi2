<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="donation.member.model.vo.Member" %>
<% Member member = (Member)request.getAttribute("member"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/semi/css/loginstyle2.css">
<script type="text/javascript">
 function mdel(){
	 location.href = "/semi/mdelete?memberid=<%= member.getMemberId() %>";
	 return false;
 }
</script>
</head>
<body>
<h1 align="center"
		style="margin-top: 50px; font-size: 60pt; color: white;">
		<a href="../../index.jsp" style="color: white; text-decoration: none;">다재다능</a>
		
	</h1>
	<hr>
	<h2><%= member.getMemberNik() %>님 회원정보</h2>
	<hr>



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
				<button onclick="return mdel()">회원탈퇴</button>

			</form>

		</div>
		<div></div>
	</div>
	<script src="/semi/js/loginjs.js"></script>
</body>
</html>