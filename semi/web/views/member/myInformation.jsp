<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="donation.member.model.vo.Member" %>
<% Member member = (Member)request.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center"><%= member.getMemberNik() %>님 회원정보</h2>
	<form action = mupdate" method="post">
		<table align="center" width="600" height="350">
		<tr>
			<th width = "150px">아이디</th>
			<td width = "450px"><label name = "memberid"><%=member.getMemberId() %></label> 
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="membername"value="<%=member.getMemberName() %>">
			</td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" name="memberpwd1"value=""></td>
		</tr>
		<tr>
			<th>암호확인</th>
			<td><input type="password"name="memberpwd2"value=""></td>
		</tr>
		<tr>
		<th>주소</th>
		<td><input type="text"name="memberaddress"value="<%= member.getMemberAddress()%>"></td>
		</tr>
		<tr>
		<th>이메일</th>
		<td><input type="email"name="memberemail"value="<%= member.getMemberEmail()%>"></td>
		</tr>
		<tr>
		<th>전화번호</th>
		<td><input type="text"name="memberphone"value="<%= member.getMemberPhone()%>"></td>
		</tr>
		<tr>
		<th>재능</th>
		<td>
			<% String[] talent = member.getTalent().split(","); %>
			<table>
				<tr>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능1")){%>checked<%break;}} %>>재능1</td>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능2")){%>checked<%break;}} %>>재능2</td>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능3")){%>checked<%break;}} %>>재능3</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능4")){%>checked<%break;}} %>>재능4</td>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능5")){%>checked<%break;}} %>>재능5</td>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능6")){%>checked<%break;}} %>>재능6</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능7")){%>checked<%break;}} %>>재능7</td>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능8")){%>checked<%break;}} %>>재능8</td>
					<td><input type="checkbox" name="talent" value="재능1"<% for(int i=0;i<talent.length;i++){if(talent[i].equals("재능9")){%>checked<%break;}} %>>재능9</td>
				</tr>
				
			</table>
		</td>
		</tr>
		<td colspan="2"><input type="submit"value="회원정보 수정">&nbsp;<input type="reset"value="취소"></td>
		</table>
	
	</form>
</body>
</html>