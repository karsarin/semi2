<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>suggestError</title>
</head>
<body>
<h2>suggest 에러 발생 : <%= (String)request.getAttribute("message") %></h2>
</body>
</html>