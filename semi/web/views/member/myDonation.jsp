<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="donation.donate.model.vo.Donate" %>
    <% Donate donate = (Donate)request.getAttribute("donate"); %>
    <% int ranking = (int)request.getAttribute("result"); %>
    <% int memberTotal = (int)request.getAttribute("memberTotal"); %>
    <% int myDonation = (int)request.getAttribute("myDonation"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../header.jsp" %>

<%=member.getMemberNik() %>님의 기부 랭킹은 <%= ranking %>위 입니다.<br>

상위<%= (double)ranking/memberTotal*100 %>%입니다.<br>
<%=member.getMemberNik() %>님의 총 기부금액 은<%= myDonation%>원 입니다.
</body>
</html>