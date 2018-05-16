<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> Uni wiki - 대문 </title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="<c:url value="/resources/vendor/magnific-popup/magnific-popup.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/creative.min.css"/>" rel="stylesheet">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	window.name = "index";
	$(function(){
		if('${popup}' == popup){
			window.document.location.reload();
		}
	});
	
	function openLog(){
		window.open("user/loginForm","newWindow","top=300,left=300,width=500,height=500");
	}
	
	function logout(){
		if(confirm("정말 로그아웃 하시겠습니까?")){
			location.href="user/logout";
		}
	}
	<c:if test="${param.errorMsgIn != null }">alert("${param.errorMsgIn }");</c:if>
</script>
</head>
<body id="page-top">
	
	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">UNI WIKI</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#Intro">Intro</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#content">content</a>
            </li>
            <c:choose>
	            <c:when test="${sessionScope.loginId == null }">
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="javascript:openLog()">LOGIN</a>
	            </li>
	            </c:when>
            <c:otherwise>
	            <li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="javascript:logout()">LOGOUT</a>
	            </li>	
	            </c:otherwise>
          </c:choose>
          		<c:if test="${sessionScope.loginType eq 'admin' }">
          		<li class="nav-item">
	              <a class="nav-link js-scroll-trigger" href="admin/manage">관리자모드</a>
	            </li>	
	            </c:if>
          </ul>
        </div>
      </div>
    </nav>

    <header class="masthead text-center text-white d-flex">
      <div class="container my-auto" id="test">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h1 class="text-uppercase">
              <strong> UNI WIKI </strong>
            </h1>
            <hr>
          </div>
          <div class="col-lg-8 mx-auto">
            <p class="text-faded mb-5"> 대학교 학과정보 위키</p>
            <a class="btn btn-primary btn-xl js-scroll-trigger" href="sidebar"> Get Started! </a>
          </div>
        </div>
      </div>
    </header>

    <section class="bg-primary" id="Intro">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="section-heading text-white">주요 학과들에 대한 정보를 확인하세요!</h2>
            <hr class="light my-4">
            <p class="text-faded mb-4"> 대학교 내에 있는 주요 학과들에 대한 커리큘럼, 취업 현황 및 진로방향 등 다양한 정보를 검색하거나 자신이 추가, 수정 할 수 있습니다!</p>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading">제공되는 기능</h2>
            <hr class="my-4">
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-diamond text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3"> 사용자들이 직접 입력한 정보 </h3>
              <p class="text-muted mb-0">태그를 사용한 HTML 형식의 글 작성 및 수정</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-paper-plane text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3"> 파일 업로드 </h3>
              <p class="text-muted mb-0"> JPG,PNG 형식의 사진파일 업로드</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3"> 사용자 지정 링크 </h3>
              <p class="text-muted mb-0"> 사용자가 지정한 형식대로 링크 설정</p>
            </div>
          </div>
          <div class="col-lg-3 col-md-6 text-center">
            <div class="service-box mt-5 mx-auto">
              <i class="fa fa-4x fa-heart text-primary mb-3 sr-icons"></i>
              <h3 class="mb-3"> 토론장 </h3>
              <p class="text-muted mb-0"> 오류가 있는 정보에 대한 토론장 </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
	
    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/scrollreveal/scrollreveal.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"/>"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value="/resources/js/creative.min.js"/>"></script>

  </body>

</html>