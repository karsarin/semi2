<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
        <meta charset="utf-8">
        <title>Flex - Responsive HTML Template</title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!--  헤더바 -->

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/templatemo_misc.css">
        <link rel="stylesheet" href="css/templatemo_style.css">
		<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
         
        <!--  헤더바 끝 -->
        <link href="graph/csslinegraph/csslinegraph.css" rel="stylesheet" type="text/css" media="screen" />
        
        <script type="text/javascript">
        function goBoardPage() { location.href="/semi/nlist"; }
        function goChatPage() { location.href="views/chatting/chat.html"; }
        function goCategoryPage(){location.href="/semi/clist"}
        function insertCategory() {location.href="/semi/views/category/categoryInsertView.jsp"}
        
       
        </script>

<!--  그래프 -->
<style>
#chartdiv {
  width: 500px;
  height: 500px;
}	
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "serial",
  "addClassNames": true,
  "theme": "light",
  "autoMargins": false,
  "marginLeft": 30,
  "marginRight": 8,
  "marginTop": 10,
  "marginBottom": 26,
  "balloon": {
    "adjustBorderColor": false,
    "horizontalPadding": 10,
    "verticalPadding": 8,
    "color": "#ffffff"
  },

  "dataProvider": [ {
    "year": 2012,
    "income": 2.35,
    "expenses": 2.11
  }, {
    "year": 2013,
    "income": 2.62,
    "expenses": 2.55
  }, {
    "year": 2014,
    "income": 3.01,
    "expenses": 3.29
  }, {
    "year": 2015,
    "income": 2.95,
    "expenses": 3.41
  }, {
    "year": 2016,
    "income": 3.06,
    "expenses": 2.82,
    "dashLengthLine": 5
  }, {
    "year": 2017,
    "income": 3.41,
    "expenses": 3.29,
    "dashLengthColumn": 5,
    "alpha": 0.2,
    "additional": "(projection)"
  } ],
  "valueAxes": [ {
    "axisAlpha": 0,
    "position": "left"
  } ],
  "startDuration": 1,
  "graphs": [ {
    "alphaField": "alpha",
    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "fillAlphas": 1,
    "title": "Donate",
    "type": "column",
    "valueField": "income",
    "dashLengthField": "dashLengthColumn"
  }, {
    "id": "graph2",
    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
    "bullet": "round",
    "lineThickness": 3,
    "bulletSize": 7,
    "bulletBorderAlpha": 1,
    "bulletColor": "#FFFFFF",
    "useLineColorForBulletBorder": true,
    "bulletBorderThickness": 3,
    "fillAlphas": 0,
    "lineAlpha": 1,
    "title": "Prediction",
    "valueField": "expenses",
    "dashLengthField": "dashLengthLine"
  } ],
  "categoryField": "year",
  "categoryAxis": {
    "gridPosition": "start",
    "axisAlpha": 0,
    "tickLength": 0
  },
  "export": {
    "enabled": true
  }
} );
</script>


<!--  2번째 그래프 -->
<style>
#chartdiv2 {
  width: 500px;
  margin-left:100px;
  height: 500px;
}
</style>
<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>



<!-- Chart code -->
<script>
var chart = AmCharts.makeChart( "chartdiv2", {
  "type": "pie",
  "theme": "light",
  "dataProvider": [ {
    "country": "IT",
    "litres": 501.9
  }, {
    "country": "디자인",
    "litres": 301.9
  }, {
    "country": "마케팅",
    "litres": 201.1
  }, {
    "country": "음악",
    "litres": 165.8
  }, {
    "country": "노하우",
    "litres": 139.9
  }, {
    "country": "건강",
    "litres": 128.3
  }, {
    "country": "번역",
    "litres": 60
  }, {
    "country": "기타",
    "litres": 50
  } ],
  "valueField": "litres",
  "titleField": "country",
   "balloon":{
   "fixedPosition":true
  },
  "export": {
    "enabled": true
  }
} );
</script>






  <!--  그래프 끝 -->
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->


<!-- 헤더 바  -->
	<%@ include file = "header.jsp" %>
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
                                        <li class="active"><a href="index.jsp">Home</a></li>
                                        <li><a href="javascript:goCategoryPage()">카테고리</a></li>

                                        <li><a href="javascript:goBoardPage()">게시판</a></li>
                                        <li><a href="javascript:insertCategory()">재능 등록</a></li>
                      
                                    </ul>                                    
                                </div> <!-- /.main-menu -->
                            </div> <!-- /.row -->
                        </div> <!-- /#menu-wrapper -->                        
                    </div> <!-- /.container -->
                </div> <!-- /.main-header -->
            </div> <!-- /.site-header -->
<!-- 헤더 끝    -->
            <div class="site-slider">
                <div class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <div class="overlay"></div>
                                <img src="images/slide1.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>다재다능 홈페이지에 오신걸 환영함니다</h2>
                                    <p>Welcome</p>
<!--                                     <a href="#" class="slider-btn">Let us design!</a> -->
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="images/slide2.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>우리 모두 누군가에게는 기쁨을줄 수 있는 하나의 재능을 가지고 있습니다</h2>
                                    <p>Your talent will bring joy to others.</p>
<!--                                     <a href="#" class="slider-btn">Go to Portfolio</a> -->
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="images/slide3.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>이 홈페이지는 6명의 개발자로 만들어졌습니다</h2>
                                    <p>All proceeds are donated.</p>
<!--                                     <a href="#" class="slider-btn">Mobile Website</a> -->
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.flexslider -->
                </div> <!-- /.slider -->
            </div> <!-- /.site-slider -->
        </div> <!-- /.site-main -->




       

<!-- 카테고리 -->

        <div class="content-section" id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>카테고리</h2>
                        <p>Our many talent classifications</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/IT.png" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>IT</h3>
                                <p>Category IT classification. Click if you want to find out about IT.</p>
                               
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/Design.png" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>Design</h3>
                                <p>Category design classification. Click to find design related matters.</p>
                                
                            </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/marketing.png" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>MarKeting</h3>
                                <p>Category marketing category.Click if you want to find something related to marketing.</p>
                               
                            </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/music.png" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>Music</h3>
                                <p>Category Music classification.Click if you want to find music related stuff.</p>
                                
                            </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/know-how.png" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>Know-how</h3>
                                <p>Category Know-how classification.Click here to find out more about know-how.</p>
                                
                            </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    
                    <div class="portfolio-item col-md-3 col-sm-6" >
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/Translation.png" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>Translation</h3>
                                <p>Category Know-How Translation.Click here to find translations.</p>
                                
                            </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/health.png" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>Health</h3>
                                <p>Category health.Click if you want to find out about your health.</p>
                                
                            </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
							<img src="images/indexPicture/etc.png" alt="">
                                <a href="#"><div class="portfolio-overlay">
                                <h3>Etc</h3>
                                <p>Category is etc.Click if you want to find something related to the etc.</p>
                                </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#portfolio -->
<!-- 카테고리 끝-->


<!-- 도움준사람들 -->
<div class="content-section" id="our-team">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>재능 기부 BEST 전문가들</h2>
                        <p>The best experts</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="images/indexPicture/jisun.jpg" alt="">
                            <div class="team-overlay">
                                <h3>Tracy</h3>
                                <span>Designer</span>
                                <ul class="social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-linkedin"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="images/indexPicture/bigbro.jpg" alt="">
                            <div class="team-overlay">
                                <h3>Cindy</h3>
                                <span>Developer</span>
                                <ul class="social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-linkedin"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="images/indexPicture/subin.jpg" alt="">
                            <div class="team-overlay">
                                <h3>Mary</h3>
                                <span>Director</span>
                                <ul class="social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-linkedin"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                    <div class="team-member col-md-3 col-sm-6">
                        <div class="member-thumb">
                            <img src="images/indexPicture/jisun.jpg" alt="">
                            <div class="team-overlay">
                                <h3>Linda</h3>
                                <span>Chief Executive</span>
                                <ul class="social">
                                    <li><a href="#" class="fa fa-facebook"></a></li>
                                    <li><a href="#" class="fa fa-twitter"></a></li>
                                    <li><a href="#" class="fa fa-linkedin"></a></li>
                                </ul>
                            </div> <!-- /.team-overlay -->
                        </div> <!-- /.member-thumb -->
                    </div> <!-- /.team-member -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="skills-heading">
                            <h3 class="skills-title">재능별 조회</h3>
                            <p class="small-text">A graph devoted much to talent </p>
                        </div>
                    </div> <!-- /.col-md-12 -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-8 col-sm-6">
                        <p>
                        
	<img src="images/indexPicture/gift.gif " width="900px" height="200px">
                        
						</p>
                    </div> <!-- /.col-md-8 -->
                    <div class="col-md-4 col-sm-6" >
                        <ul class="progess-bars">
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">IT</div>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="18" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">Design </div>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">Health </div>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="23" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">Marketing </div>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.col-md-4 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#our-team -->


<!--많이 도와준사람 -->


<!-- 최신/마감 -->
  <div class="content-section" id="services">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>최신/마감</h2>
                        <p>We have many talents.</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-1">
                            <div class="service-icon">
                                <i class="fa fa-file-code-o"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                               <a href="#"> <div class="inner-service">
                                   <h3>[기타]전자기계 싸게 사는법</h3>
                                   <p>삼성,애플,LG 등등 컴퓨터 및 핸드폰 싸게사는 팁 알려드립니다. 최소 20% ~ 최대 50% 까지 해외직구 하는법</p> 
                                   <br>(최신 10시간전)
                                </div></a>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-2">
                            <div class="service-icon">
                                <i class="fa fa-paper-plane-o"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                          <a href="#"><div class="inner-service">
						 
                                   <h3>[디자인]로고 만들어드립니다</h3>
                                   <p>KH 교육학원, 다재다능 홈페이지 등 로고를 제작했습니다. 제작하기 어렵거나 힘드시는분들 언제나 환영합니다.</p> 
                                   <br>(최신 7시간전)
                                </div></a>
                                
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-3">
                            <div class="service-icon">
                                <i class="fa fa-institution"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <a href="#"> <div class="inner-service">
                                   <h3>[IT]C,C#,C++,JAVA 알려드립니다.</h3>
                                   <p>현업에서 20년간 일했습니다. 기초강의 수업만 5년이상했습니다 학생들위주로 많은걸 알려드리고싶습니다.</p> 
                                   <br>(마감 3일전)
                                </div></a>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-4">
                            <div class="service-icon">
                                <i class="fa fa-flask"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <a href="#"> <div class="inner-service">
                                   <h3>[건강]남자라면 王자 !!</h3>
                                   <p>헬스트레이너 50년 째 입니다. 남자 운동 전문가로 남자 王 복부에 직접 새겨드리도록 운동시킵니다.</p> 
                                   <br>(마감 1일전)
                                </div></a>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#services -->










<!-- 이색재능 -->

<div class="content-section" id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>이색재능</h2>
                        <p>It can be attractive to someone with a unique talent.</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/Unusual1.jpg" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>IT</h3>
                                <p>아무 웹사이트 해킹해드립니다. 해킹 독학 1년차입니다. 도전정신 강합니다. 다뚫습니다.</p>
                               
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/Unusual2.jpg" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>Design</h3>
                                <p>색다른 명함만들어드립니다. 자신과 같게생긴 레고를 만들어서 레고뒤에 전화번호를 입혀서 임펙트있는 명함을 만들어드립니다.</p>
                                
                            </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/Unusual3.jpg" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>기타</h3>
                                <p>게임 레벨 키워드립니다. 경력은 게임 20년간 해왓습니다. 맡겨주시면 최대한 키워드립니다.</p>
                                
                            </div> <!-- /.portfolio-overlay --></a>
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="images/indexPicture/Unusual4.jpg" alt="">
                            <a href="#"><div class="portfolio-overlay">
                                <h3>기타</h3>
                                <p>책읽어 드립니다. 성우로서 일을 많이 해온지라 아이들 책읽는데 재능을 기부하고 싶습니다.</p>
                                
                           
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#portfolio -->

<!-- 이색재능 끝-->
<br>
<br>
<br>


<!-- 기부 현황 -->

<div class="container">

<div style="float:left;">
<h2>기부현황(년도별)</h2>  
<p>단위 : 억</p>

 <div id="chartdiv"></div>
</div>

<div style="float:left;">
<h2>기부현황(카테고리별)</h2>  
<p>단위 : %</p>

 <div id="chartdiv2"></div>
</div>


</div>




        

 <!-- 기부 현황  -->
 
 
 
 


 
 
 
 
 
 
 
 
 
  
        <div id="footer" style="clear:both;">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12 text-left">
                        <span>Copyright &copy; 2017 다재다능</span>
                  </div> <!-- /.text-center -->
                    <div class="col-md-4 hidden-xs text-right">
                        <a href="#top" id="go-top">Back to top</a>
                    </div> <!-- /.text-center -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#footer -->
        
        <script src="js/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/bootstrap.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>


        
       
    </body>
</html>