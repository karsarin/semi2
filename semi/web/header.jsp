<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="donation.member.model.vo.Member" %>
    <% Member member = (Member)session.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
div#loginbar{
	float:right;
	margin-right:50px;
	font-size:10pt;
}

</style>
</head>
<body>
<div id=loginbar>
<%-- <% if(member ==null){ %> --%>
	<a href="/semi/views/member/Login.jsp">로그인</a>
	<a href="/semi/views/member/Insert.jsp">회원가입</a>
<%-- <% }else{ %>
	<a href="#"><%=member.getMemberNik() %></a>님 환영합니다
<% } %> --%>
</div>
</body>
</html>