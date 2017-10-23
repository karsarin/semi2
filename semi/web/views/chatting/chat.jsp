<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Chatting</title>
    <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!--  헤더바 -->

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" href="../../css/font-awesome.css">
        <link rel="stylesheet" href="../../css/animate.css">
        <link rel="stylesheet" href="../../css/templatemo_misc.css">
        <link rel="stylesheet" href="../../css/templatemo_style.css">
		<script src="../../js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
         
        <!--  헤더바 끝 -->
        <link href="../../graph/csslinegraph/csslinegraph.css" rel="stylesheet" type="text/css" media="screen" />
        
        <script type="text/javascript">
        function goBoardPage() { location.href="../board/boardView.jsp"; }
        function goChatPage() { location.href="../chatting/chat.jsp"; }
        function goCategoryPage(){location.href="../category/categoryListView.jsp"}
        </script>
        
        <%-- 세로목록 --%>
		<style>
		ul#navi {
		   width: 200px;
		   text-indent: 10px;
		   background-color:lightgray;
		   
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


		<style type="text/css">
		#chat ul#discussion{
			float: left;
			width: 600px;
			height: 500px;
			border: 1px solid gray;
			margin-left: 250px;
			overflow:auto;
		}
	
		#chat #message, #btnSend{
			float: left;
			width: 600px;
			margin-left: 250px;
		}
		
		</style>
        
    </head>
    <body>

	<!-- 헤더 바  -->
	<%@ include file = "../../header.jsp" %>
	<br>
	<br>
	<hr>
                <div class="main-header">
                    <div class="container">
                        <div id="menu-wrapper">
                            <div class="row">
                                <div class="logo-wrapper col-md-2 col-sm-2">
                                    
                                </div> <!-- /.logo-wrapper -->
                                <div class="col-md-10 col-sm-10 main-menu text-right">
                                    <div class="toggle-menu visible-sm visible-xs"><i class="fa fa-bars"></i></div>
                                    <ul class="menu-first">
										<li>
										<form action="/semi/tsearch" method="post">
										<input type="search" name = "keyword" autocomplete>
										<input type="submit" value="제목검색" >
										</form>
										</li>
                                        <li class="active"><a href="../../../index.jsp">Home</a></li>
                                        <li><a href="javascript:goCategoryPage()">카테고리</a></li>
                                        <li><a href="javascript:goBoardPage()">공지사항</a></li>
                                        <li><a href="#">게시판</a></li>                                       
                                        <li><a href="#">마이페이지</a></li>
                                        
                                        <li><a href="javascript:goChatPage()">채팅</a></li>
                                        
                                        
										                            
                                    </ul>                                    
                                </div> <!-- /.main-menu -->
                            </div> <!-- /.row -->
                        </div> <!-- /#menu-wrapper -->                        
                    </div> <!-- /.container -->
                </div> <!-- /.main-header -->
            </div> <!-- /.site-header -->
<!-- 헤더 끝    -->
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>


<div style="margin-left:30px;width: 230px; height: 500px; float: left;">
   
      <ul id="navi">
         <li class="group">
            <div class="title">카테고리</div>
            <ul class="sub">
               <li><a href="#">IT</a></li>
               <li><a href="#">디자인</a></li>
               <li><a href="#">마케팅</a></li>
               <li><a href="#">음악</a></li>
               <li><a href="#">노하우/상담</a></li>
               <li><a href="#">번역</a></li>
               <li><a href="#">건강</a></li>
               <li><a href="#">기타</a></li>

            </ul>
         </li>

      </ul>



   </div>
   
   <!-- 채팅 -->

	<script src="http://demo.dongledongle.com/Scripts/jquery-1.10.2.min.js"></script>
    <script src="http://demo.dongledongle.com/Scripts/jquery.signalR-2.2.1.min.js"></script>

	

	<!-- 아이디 입력 -->
    <input type="hidden" id="userid" placeholder="Input User ID" value="AAAB">
    
    <table id="chat">
    	<!-- 채팅 내용란 -->
    	<tr><td><ul id="discussion"></ul></td></tr>
    	<!-- 채팅 입력 -->
    	<tr><td><input type="text" id="message" placeholder="Input Message."></td></tr>
    	<!-- 전송 버튼 -->
    	<tr><td><input type="button" id="btnSend" value="Send"/></td></tr>
    </table>
    
    
    

	
	
    <script type="text/javascript">
        var connection = $.hubConnection('http://demo.dongledongle.com/');
        var chat = connection.createHubProxy('chatHub');

        $(document).ready(function () {

            chat.on('addNewMessageToPage', function (name, message) {
                $('#discussion').append('<li>' + htmlEncode(name) + '</strong>: ' + htmlEncode(message) + '</li>');
            });

            $('#message').focus();

            connection.start({ jsonp: true }).done(function () {

                $('#btnSend').click(function () {
                    chat.invoke('send', $('#userid').val(), $('#message').val());
                    $('#message').val('').focus();
                });
            });
        });

        function htmlEncode(value) {
            var encodedValue = $('<div />').text(value).html();
            return encodedValue;
        }
        
    </script>
    
    <!-- 채팅 끝 -->
    
    
    
    <!--  오른쪽 메뉴바 -->
    
	  <div  style="float:right;border:1px solid black; width:200px;height:800px; margin-right:10px; tex-align:center; ">
   	  <ul align="center">
      <li style="background-color:#648CFF;color:white; text-align:center; ">새로운 재능<br> 기부문화 다재다능</li>
      <li style=" text-align:center;">
      <a href="#" onclick="window.open('../../views/usage/usage.html','usage','resizable=no ,width=650,left=500,top=100, height=650');return false">
      <image src="../../images/verticalList1.PNG" align="center"width="198px" height="150px"></image></a>이용방법</li>
      <a href="#" onclick="window.open('../../views/usage/usage2.html','usage1','resizable=no ,width=650,left=500,top=100, height=400');return false">
      <image src="../../images/verticalList2.png" align="center"width="198px" height="150px"></image></a>이용방법2<br>동영상편</li>
      <a href="#" onclick="window.open('../../views/usage/usage3.html','usage2','resizable=no ,width=450,left=500,top=100, height=450');return false">
      <image src="../../images/verticalList3.png" align="center"width="198px" height="150px"></image></a>필수사항</li>
      <a href="#" onclick="window.open('../../views/usage/usage4.html','usage3','resizable=no ,width=500,left=500,top=100, height=400');return false">
      <image src="../../images/verticalList4.png" align="center"width="198px" height="150px"></image></a>이벤트</li>
      </ul>
      </div>
   





   <div id="footer" style="clear: both;">
      <div class="container">
         <div class="row">
            <div class="col-md-8 col-xs-12 text-left">
               <span>Copyright &copy; 2014 Company Name</span>
            </div>
            <!-- /.text-center -->
            <div class="col-md-4 hidden-xs text-right">
               <a href="#top" id="go-top">Back to top</a>
            </div>
            <!-- /.text-center -->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.container -->
   </div>
   <!-- /#footer -->
    </body>



</html>