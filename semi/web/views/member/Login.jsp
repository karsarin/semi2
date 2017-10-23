<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="donation.member.model.vo.Member" %>
    <% Member member = (Member)session.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
 <link rel="stylesheet" href="../../css/loginstyle.css">
</head>
<body>

<h1 align="center" style="margin-top:50px;font-size:60pt;color:white;"><a href="../../index.jsp" 
style="color:white;text-decoration:none;">다재다능</a></h1>
<hr>

  <div class="login-page">
  <div class="form">
    

    <form class="login-form" action="../../login" method="post">
      <input type="text" placeholder="username" name="memberid" placeholder="아이디"/>
      <input type="password" placeholder="password"  name="memberpwd" placeholder="비밀번호"/>
      <button value="로그인">login</button>
      
    </form>
  </div>
</div>


  
    <script  src="../../js/loginjs.js"></script>





</div>
</body>
</html>