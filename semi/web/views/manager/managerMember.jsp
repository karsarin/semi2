<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="donation.member.model.vo.Member, java.util.*"%>
<% ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list"); 
   Member member[] = new Member[list.size()];
   for(int i=0; i<list.size(); i++) {
   		member[i] = list.get(i);
   }%>
<!DOCTYPE>
<html>
<head>	
	<meta charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Talent Donation - Manager/member</title>
	<link href="/semi/css/manager/member.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="/semi/css/manager/mainFonts.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="/semi/js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
    <script src="/semi/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    	$(function (){
    	    $(".memberList tr").click(function(){
    	        $.ajax({
    				url: "/semi/mgrmemberdetail",
    				data: {memberId: $(this).children().first().text()},
    				type: "get",
    				dataType: "json",
    				success: function(data){
    					$("input[name=memberId]").val(data.memberId);
    					$("input[name=memberNic]").val(decodeURIComponent(data.memberNik));
    					$("input[name=memberName]").val(decodeURIComponent(data.memberName));
    					$("input[name=memberPhone]").val(data.memberPhone);
    					$("input[name=memberEmail]").val(data.memberEmail);
    					$("input[name=memberAddress]").val(decodeURIComponent(data.memberAddress));
    					$("input[name=talent]").val(decodeURIComponent(data.talent));
    					if(data.mgrChat == 'Y') {
    						$('input:radio[name=mgrChat]:input[value="on"]').attr("checked", true);
    					} else {
    						$('input:radio[name=mgrChat]:input[value="off"]').attr("checked", true);
    					}
    					if(data.mgrLogin == 'Y') {
    						$('input:radio[name=mgrlogin]:input[value="on"]').attr("checked", true);
    					} else {
    						$('input:radio[name=mgrlogin]:input[value="off"]').attr("checked", true);
    					}
    				},
    				error: function(data){
    					console.log("에러 발생 : " + data);
    				}
    			});
    	    });
    	});
	</script>
</head>
<body>
	<br><br>	
	<div class="container">
		<div id="menu-wrapper">
			<div class="row">
				<div class="logo-wrapper col-md-2 col-sm-2">
					<h1>
						<a href="#"></a>
					</h1>
				</div>
				<div class="col-md-10 col-sm-10 main-menu text-right">
					<div class="toggle-menu visible-sm visible-xs">
						<i class="fa fa-bars"></i>
					</div>
					<ul class="menu-first">
						<li><a href="/semi/views/manager/managerMain.jsp">Home_관리자</a></li>
						<li class="active"><a href="/semi/mgrmember">회원정보</a></li>
						<li><a href="#">카테고리</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">게시판</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<br><br><br><br>
	<div class="row">
		<div class="container1 col-md-4 col-sm-12 col-md-offset-2">
			<form id="search-body">
				<button id="s-btn-body" type="submit">
					<span id="s-btn"></span>
				</button>
				<div id="s-form-body">
					<input id="s-form" type="text" placeholder="Search Keyword">
				</div>
			</form><br>

			<table class="memberList">
				<thead>
					<tr>
						<th scope="cols">아이디</th>
						<th scope="cols">이름</th>
						<th scope="cols">재능</th>
					</tr>
				</thead>
				<tbody>
					<% for(int i=0; i<member.length; i++) {%>
					<tr>
						<td><%=member[i].getMemberId()%></td>
						<td><%=member[i].getMemberName()%></td>
						<td><%=member[i].getTalent()%></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</div>
		
		<div class="container2  col-md-4 col-sm-12">
			<div class="heading-section col-md-12 text-center">
				<h2	style="background: white; border-bottom: 0px; text-shadow: 1px 1px 2px gray;">&nbsp;상세 정보&nbsp;</h2>
			</div><br>
			<div class="container2-1">
				<table class="memberDetail">
					<tr>
						<th>아이디</th>
						<td><input name="memberId" value="" readonly></td>						
						<th>닉네임</th>
						<td><input name="memberNic" value="" readonly></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input name="memberName" value="" readonly></td>						
						<th>번호</th>
						<td><input type="number" name="memberPhone" value="" readonly></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="memberEmail" value="" readonly></td>						
						<th>주소</th>
						<td><input name="memberAddress" value="" readonly></td>
					</tr>
					<tr>
						<th>재능</th>
						<td><input id="talent" name="talent" colspan="3" value="" readonly></td>
					</tr>
					<tr>
						<th>접속가능</th>
						<td colspan="3">
							<input type="radio" name="mgrlogin" value="on"> ON
							<input type="radio" name="mgrlogin" value="off"> OFF
						</td>
					</tr>
					<tr>												
						<th>채팅가능</th>
						<td colspan="3">
							<input type="radio" name="mgrChat" value="on"> ON
							<input type="radio" name="mgrChat" value="off"> OFF
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button>수정</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<%@ include file="managerFooter.jsp" %>
</body>
</html>