<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회전광고판 틀 &middot; 부트스트랩</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content=""> 
    <meta name="author" content="">

    <!-- 스타일 --> 
    <link href="assets/css/bootstrap-ko.css" rel="stylesheet">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <style>

    /* 전체 스타일
    -------------------------------------------------- */
    /* 꼬리말 아래 패딩과 연한색 본문 */

    body {
      padding-bottom: 40px;
      color: #5a5a5a;
    }



    /* 탐색막대 수정
    -------------------------------------------------- */

    /* 위치를 잡는 역할을 하는, .navbar를 둘러싸는 .container의 특별한 클래스. */
    .navbar-wrapper {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      z-index: 10;
      margin-top: 20px;
      margin-bottom: -90px; /* 회전광고판을 올리는 음수 여백. 90px는 대략 탐색막대의 여백과 높이이다. */
    }
    .navbar-wrapper .navbar {

    }

    /* 둘레를 없애고, 대비를 주기위해 상자 그림자를 변경한다 */
    .navbar .navbar-inner {
      border: 0;
      -webkit-box-shadow: 0 2px 10px rgba(0,0,0,.25);
         -moz-box-shadow: 0 2px 10px rgba(0,0,0,.25);
              box-shadow: 0 2px 10px rgba(0,0,0,.25);
    }

    /* 상표/프로젝트명 크기를 조금 줄인다 */
    .navbar .brand {
      padding: 14px 20px 16px; /* 탐색막대 링크에 맞도록 수직 패딩을 늘린다 */
      font-size: 16px;
      font-weight: bold;
      text-shadow: 0 -1px 0 rgba(0,0,0,.5);
    }

    /* 탐색막대 링크: 높은 탐색막대에 맞도록 패딩을 늘린다 */
    .navbar .nav > li > a {
      padding: 15px 20px;
    }

    /* 적절하게 수직 정렬하려고 버튼 위치를 조정한다 */
    .navbar .btn-navbar {
      margin-top: 10px;
    }



    /* 회전광고판 수정
    -------------------------------------------------- */

    /* 회전광고판 기본 클래스 */
    .carousel {
      margin-bottom: 60px;
    }

    .carousel .container {
      position: relative;
      z-index: 9;
    }

    .carousel-control {
      height: 80px;
      margin-top: 0;
      font-size: 120px;
      text-shadow: 0 1px 1px rgba(0,0,0,.4);
      background-color: transparent;
      border: 0;
      z-index: 10;
    }

    .carousel .item {
      height: 500px;
    }
    .carousel img {
      position: absolute;
      top: 0;
      left: 0;
      min-width: 100%;
      height: 500px;
    }

    .carousel-caption {
      background-color: transparent;
      position: static;
      max-width: 550px;
      padding: 0 20px;
      margin-top: 200px;
    }
    .carousel-caption h1,
    .carousel-caption .lead {
      margin: 0;
      line-height: 1.25;
      color: #fff;
      text-shadow: 0 1px 1px rgba(0,0,0,.4);
    }
    .carousel-caption .btn {
      margin-top: 10px;
    }



    /* 마케팅 내용
    -------------------------------------------------- */

    /* 회전광고판 아래에 있는 세개 열의 본문을 중앙 정렬한다 */
    .marketing .span4 {
      text-align: center;
    }
    .marketing h2 {
      font-weight: normal;
    }
    .marketing .span4 p {
      margin-left: 10px;
      margin-right: 10px;
    }


    /* 특집
    ------------------------- */

    .featurette-divider {
      margin: 80px 0; /* 부트스트랩 <hr> 공간을 더 벌린다 */
    }
    .featurette {
      padding-top: 120px; /* 수직으로 그림 중앙 위치 1 단계: 본문 위아래로 패딩을 더한다. */
      overflow: hidden; /* 수직으로 그림 중앙 위치 2 단계: 유동 흐름을 마친다 */
    }
    .featurette-image {
      margin-top: -120px; /* 수직으로 그림 중앙 위치 3 단계: 중앙에 배치하기위해 패딩과 동일한 크기의 음수 여백으로 그림을 올린다. */
    }

    /* 유동 태그 양편에 공간을 두어서 본문과 겹치지 않게 한다. */
    .featurette-image.pull-left {
      margin-right: 40px;
    }
    .featurette-image.pull-right {
      margin-left: 40px;
    }

    /* 마케딩 제목을 얇게 만든다 */
    .featurette-heading {
      font-size: 50px;
      font-weight: 300;
      line-height: 1;
      letter-spacing: -1px;
    }



    /* 반응형 CSS
    -------------------------------------------------- */

    @media (max-width: 979px) {

      .container.navbar-wrapper {
        margin-bottom: 0;
        width: auto;
      }
      .navbar-inner {
        border-radius: 0;
        margin: -20px 0;
      }

      .carousel .item {
        height: 500px;
      }
      .carousel img {
        width: auto;
        height: 500px;
      }

      .featurette {
        height: auto;
        padding: 0;
      }
      .featurette-image.pull-left,
      .featurette-image.pull-right {
        display: block;
        float: none;
        max-width: 40%;
        margin: 0 auto 20px;
      }
    }


    @media (max-width: 767px) {

      .navbar-inner {
        margin: -20px;
      }

      .carousel {
        margin-left: -20px;
        margin-right: -20px;
      }
      .carousel .container {

      }
      .carousel .item {
        height: 300px;
      }
      .carousel img {
        height: 300px;
      }
      .carousel-caption {
        width: 65%;
        padding: 0 70px;
        margin-top: 100px;
      }
      .carousel-caption h1 {
        font-size: 30px;
      }
      .carousel-caption .lead,
      .carousel-caption .btn {
        font-size: 18px;
      }

      .marketing .span4 + .span4 {
        margin-top: 40px;
      }

      .featurette-heading {
        font-size: 30px;
      }
      .featurette .lead {
        font-size: 18px;
        line-height: 1.5;
      }

    }
    </style>

    <!-- IE6~8에서 HTML5 태그를 지원하기위한 HTML5 shim -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- 파비콘과 앱 아이콘 -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
                    <link rel="shortcut icon" href="assets/ico/favicon.png">
                    
         <!-- 자바스크립트
    ================================================== -->
    <!-- 페이지를 빨리 읽어들이도록 문서 마지막에 배치 -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap-transition.js"></script>
    <script src="assets/js/bootstrap-alert.js"></script>
    <script src="assets/js/bootstrap-modal.js"></script>
    <script src="assets/js/bootstrap-dropdown.js"></script>
    <script src="assets/js/bootstrap-scrollspy.js"></script>
    <script src="assets/js/bootstrap-tab.js"></script>
    <script src="assets/js/bootstrap-tooltip.js"></script>
    <script src="assets/js/bootstrap-popover.js"></script>
    <script src="assets/js/bootstrap-button.js"></script>
    <script src="assets/js/bootstrap-collapse.js"></script>
    <script src="assets/js/bootstrap-carousel.js"></script>
    <script src="assets/js/bootstrap-typeahead.js"></script>
    <script src="assets/js/holder/holder.js"></script>
    <script>
//       !function ($) {
        $(function(){
          // carousel demo
      
          $('#myCarousel').carousel();
          
        })
//       }(window.jQuery)
    </script>
  </head>

  <body>



    <!-- 탐색막대
    ================================================== -->
    <div class="navbar-wrapper">
      <!-- 절대 위치를 지정한 상위 요소 안에서 중앙 정렬하도록 .navbar를 .container로 두른다. -->
      <div class="container">

        <div class="navbar navbar-inverse">
          <div class="navbar-inner">
            <!-- 유동형 탐색막대 1 단계: 반응형 탐색막대를 여는 버튼 (문서에서 다루지 않음). 반응형 CSS가 필요하다. -->
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">프로젝트명</a>
            <!-- 유동형 탐색막대 2 단계: .navbar-collapse.collapse 안에 숨기고 싶은 모든 탐색막대 내용을 넣는다. -->
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="#">대문</a></li>
                <li><a href="#about">소개</a></li>
                <li><a href="#contact">연락처</a></li>
                <!-- 부트스트랩 드롭다운은 http://twbs.github.com/bootstrap/javascript.html#dropdowns 을 참고 -->
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">드롭다운 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">행동</a></li>
                    <li><a href="#">다른 행동</a></li>
                    <li><a href="#">여기에는 또 다른</a></li>
                    <li class="divider"></li>
                    <li class="nav-header">탐색 제목</li>
                    <li><a href="#">따로 떨어진 링크</a></li>
                    <li><a href="#">따로 떨어진 링크 하나 더</a></li>
                  </ul>
                </li>
              </ul>
            </div><!--/.nav-collapse -->
          </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->

      </div> <!-- /.container -->
    </div><!-- /.navbar-wrapper -->



    <!-- 회전광고판
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <img src="assets/img/examples/slide-01.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>예제 표제.</h1>
              <p class="lead">인상파의 개척자이며 지도자로, 파리에서 출생하여 소년 시절을 르아브르에서 보냈다. 그곳에서 터너 등의 작품에 영향을 받아 더욱 밝은 색조에 대한 연구를 하게 되었다.</p>
              <a class="btn btn-large btn-primary" href="#">가입하세요</a>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="assets/img/examples/slide-02.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>다른 예제 표제.</h1>
              <p class="lead">인상파의 개척자이며 지도자로, 파리에서 출생하여 소년 시절을 르아브르에서 보냈다. 그곳에서 터너 등의 작품에 영향을 받아 더욱 밝은 색조에 대한 연구를 하게 되었다.</p>
              <a class="btn btn-large btn-primary" href="#">더 알아보기</a>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="assets/img/examples/slide-03.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>추가로 하나 더.</h1>
              <p class="lead">인상파의 개척자이며 지도자로, 파리에서 출생하여 소년 시절을 르아브르에서 보냈다. 그곳에서 터너 등의 작품에 영향을 받아 더욱 밝은 색조에 대한 연구를 하게 되었다.</p>
              <a class="btn btn-large btn-primary" href="#">갤러리 둘러보기</a>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="en-font-family">&lsaquo;</span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="en-font-family">&rsaquo;</span></a>
    </div>
    <!-- /.carousel -->



    <!-- 마케팅 문구와 특집
    ================================================== -->
    <!-- 모든 내용을 중앙 정렬하기위해 나머지 페이지를 다른 container로 두른다. -->

    <div class="container marketing">




     

      <!-- 꼬리말 -->
      <footer>
        <p class="pull-right"><a href="#">제일 위로</a></p>
        <p>&copy; . &middot; <a href="#">개인정보취급방침</a> &middot; <a href="#">이용약관</a></p>
      </footer>

    </div><!-- /.container -->



   
  </body>
</html>

