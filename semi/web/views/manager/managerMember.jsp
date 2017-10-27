<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="donation.member.model.vo.Member, java.util.*"%>
<% ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list"); %>
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
    		$('.main-menu ul #home').removeClass('active');
    		$('.main-menu ul #category').removeClass('active');
    		$('.main-menu ul #board').removeClass('active');
    		$('.main-menu ul #minfo').addClass('active');
    	    
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
    						$('input:radio[name=mgrChat]:input[value="N"]').attr("checked", false);
    						$('input:radio[name=mgrChat]:input[value="Y"]').attr("checked", true);
    					} else {
    						$('input:radio[name=mgrChat]:input[value="Y"]').attr("checked", false);
    						$('input:radio[name=mgrChat]:input[value="N"]').attr("checked", true);
    					}
    					if(data.mgrLogin == 'Y') {
    						$('input:radio[name=mgrlogin]:input[value="N"]').attr("checked", false);
    						$('input:radio[name=mgrlogin]:input[value="Y"]').attr("checked", true);
    					} else {
    						$('input:radio[name=mgrlogin]:input[value="Y"]').attr("checked", false);
    						$('input:radio[name=mgrlogin]:input[value="N"]').attr("checked", true);
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
	<%@ include file="../../header.jsp" %>
	<%@ include file="managerHeader.jsp" %>

	<div class="row">
		<div class="container1 col-md-4 col-sm-12 col-md-offset-2">
			<form id="search-body">
				<button id="s-btn-body" type="submit">
					<span id="s-btn"></span>
				</button>
				<div id="s-form-body">
					<input id="s-form" type="text" placeholder="Search Keyword">
				</div>
			</form>
			<br>

			<table class="memberList">
				<thead>
					<tr>
						<th scope="cols">아이디</th>
						<th scope="cols">이름</th>
						<th scope="cols">재능</th>
					</tr>
				</thead>
				<tbody>
					<%for(Member m : list) {
						if(!m.getMemberId().equals("admin")) { %>
					<tr>
						<td><%=m.getMemberId()%></td>
						<td><%=m.getMemberName()%></td>
						<td><%=m.getTalent()%></td>
					</tr>
						<%}%>
					<%} if(list.size()<13) { 
							for(int i=list.size(); i<=13; i++) {%>
						<tr><td></td><td></td><td></td></tr>
					<%}%>
					<%}%>
				</tbody>
			</table>
		</div>
		
		<div class="col-md-4 col-sm-12">
			<div class="heading-section text-center">
				<h2	style="border-bottom: 0px; text-shadow:1px 1px 2px gray;">회원 상세정보</h2>
			</div>
			<form class="memberDetail" action="/semi/mgrmupdate">
				<table class="memberDetail">
					<tr>
						<th>아이디</th>
						<td colspan="3"><input name="memberId" value="" readonly class="form-control" id="input-text"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input name="memberName" value="" readonly class="form-control" id="input-text"></td>						
						<th>닉네임</th>
						<td><input name="memberNic" value="" readonly class="form-control"	id="input-text" placeholder=""></td>
					</tr>
					<tr>
						<th>번호</th>
						<td colspan="3"><input type="number" name="memberPhone" value="" readonly class="form-control" id="input-text"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3"><input type="email" name="memberEmail" value="" readonly class="form-control"	id="input-text"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3"><input name="memberAddress" value="" readonly class="form-control" id="input-text"></td>
					</tr>
					<tr>
						<th>재능</th>
						<td colspan="3"><input id="talent" name="talent" value="" readonly class="form-control"	id="input-text"></td>
					</tr>
					<tr>
						<th>접속가능</th>
						<td colspan="3" id="mgrController">
							<input type="radio" name="mgrlogin" value="Y"> ON
							<input type="radio" name="mgrlogin" value="N"> OFF
						</td>
					</tr>
					<tr>												
						<th>채팅가능</th>
						<td colspan="3" id="mgrController">
							<input type="radio" name="mgrChat" value="Y"> ON
							<input type="radio" name="mgrChat" value="N"> OFF
						</td>
					</tr>
				</table><br>
				<div class="form-group" align="center">
						<button type="submit" class="btn btn-success">수정</button>
				</div>
			</form>
		</div>
		
	</div>

	<%@ include file="managerFooter.jsp" %>
</body>
</html>