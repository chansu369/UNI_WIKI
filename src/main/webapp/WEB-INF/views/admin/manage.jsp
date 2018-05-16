<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>[ UNI 위키 - Administration ]</title>
    <meta name="description" content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">


    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="<c:url value="/resources/css/styles.css"/>" />
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>

<style type="text/css">
	.bg-primary{
		background-color: #f05f40!important;
	}
</style>
<script type="text/javascript">
window.name = "managewindow";
<c:if test="${param.errorMsg != null }">alert("${param.errorMsg }");</c:if>
<c:if test="${errorMsg != null }">alert("${errorMsg }");</c:if>

	$(function(){
		
		//수정 요청 확인 클릭
		$('#updateConfrom').on('click',function(){
			var strupdate = '';
			strupdate += '<table class="table table-striped">';
            strupdate += '<thead class="thead-inverse">';
       		strupdate += '<tr>';
       		strupdate += '<th>수정 요청 번호</th>';
       		strupdate += '<th>위키 글 번호</th>';
       		strupdate += '<th>수정 내용</th>';
       		strupdate += '</tr>';
       		strupdate += '</thead>';
       		strupdate += '<tbody>';
       		strupdate += '<c:forEach items="${waitList }" var="wait">';
       		strupdate += '<tr>';
       		strupdate += '<td>${wait.updatenum }</td>';
       		strupdate += '<td>${wait.boardnum }</td>';
       		strupdate += '<td>${wait.content }</td>';
       		strupdate += '</tr>';
       		strupdate += '</c:forEach>';
       		strupdate += '</tbody>';
       		strupdate += '</table>';
    		
       		$('.table-responsive').html(strupdate);
       	});
		
		
		//파일 매핑 클릭
		$('#fileMapping').on('click',function(){
			var strfile = '';
			strfile += '<table class="table table-striped">';
            strfile += '<thead class="thead-inverse">';
       		strfile += '<tr>';
       		strfile += '<th>파일 번호</th>';
       		strfile += '<th>원래 파일명</th>';
       		strfile += '<th>저장된 파일명</th>';
       		strfile += '</tr>';
       		strfile += '</thead>';
       		strfile += '<tbody>';
       		strfile += '<c:forEach items="${fileList }" var="file">';
       		strfile += '<tr>';
       		strfile += '<td>${file.filenum }</td>';
       		strfile += '<td>${file.originalfile }</td>';
       		strfile += '<td>${file.savedfile }</td>';
       		strfile += '</tr>';
       		strfile += '</c:forEach>';
       		strfile += '</tbody>';
       		strfile += '</table>';
    		
       		$('.table-responsive').html(strfile);
		});
		
		//링크 매핑 클릭
		$('#linkMapping').on('click',function(){
			var strlink = '';
			strlink += '<table class="table table-striped">';
            strlink += '<thead class="thead-inverse">';
       		strlink += '<tr>';
       		strlink += '<th>링크 번호</th>';
       		strlink += '<th>링크 주소</th>';
       		strlink += '</tr>';
       		strlink += '</thead>';
       		strlink += '<tbody>';
       		strlink += '<c:forEach items="${linkList }" var="link">';
       		strlink += '<tr>';
       		strlink += '<td>${link.linknum }</td>';
       		strlink += '<td>${link.linkaddress }</td>';
       		strlink += '</tr>';
       		strlink += '</c:forEach>';
       		strlink += '</tbody>';
       		strlink += '</table>';
    		
       		$('.table-responsive').html(strlink);
		});
		
		
		//후버후버
		$('#submenu1 li > a').hover(function(){
			$(this).css('text-decoration','underline').css('cursor', 'pointer').css('color','blue');
		}, function(){
			$(this).css('text-decoration','none').css('color','black');
		});
		
		
		
	//ready함수 종료	
	});
	function miniForm(){
		window.open("writesubject","newWindow","top=300,left=300,width=500,height=500");
	}
</script>


</head>

<body>
<c:if test="${sessionScope.loginId != null }">
    <nav class="navbar fixed-top navbar-expand-md navbar-dark bg-primary mb-3">
    <div class="flex-row d-flex">
        <a class="navbar-brand" href="#" title="Free Bootstrap 4 Admin Template">UNI WIKI - 관리자 모드</a>
        <button type="button" class="navbar-toggler" data-toggle="offcanvas" title="Toggle responsive left sidebar">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse" id="collapsingNavbar">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="/mypro">Home <span class="sr-only">Home</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#myAlert" data-toggle="collapse">Alert</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="" data-target="#myModal" data-toggle="modal">User</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas pl-0" id="sidebar" role="navigation">
            <ul class="nav flex-column pl-1">
                <li class="nav-item"><a class="nav-link" href="javascript:miniForm()">전공학과 입력</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="#submenu1" data-toggle="collapse" data-target="#submenu1">게시글관리▾</a>
                    <ul class="list-unstyled flex-column pl-3 collapse" id="submenu1" aria-expanded="false">
                       <li class="nav-item"><a class="nav-link" href="writewikiForm">위키글 입력</a></li>
                       <li class="nav-item"><a class="nav-link" id="updateConfrom">수정 요청 확인</a></li>
                       <li class="nav-item"><a class="nav-link" id="wikiUpdate" href="updatewikiForm">게시글 수정</a></li>
                       <li class="nav-item"><a class="nav-link" id="fileMapping">파일 매핑</a></li>
                       <li class="nav-item"><a class="nav-link" id="linkMapping">링크 매핑</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--/col-->

         <div class="col-md-9 col-lg-10 main">

            <h1 class="display-4 d-none d-sm-block">
            관리자 모드
            </h1>

            <div class="alert alert-warning fade collapse" role="alert" id="myAlert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <strong> ←  관리할 항목을 클릭해주세요!</strong>
            </div>
    
            <a id="layouts"></a>
            <hr>
            
            <!-- 화면에 띄워줄 부분 -->
            <div class="div-manage">
            		<div class="table-responsive">
                        
                   </div>
            </div>
            
        </div>
        <!--/main col-->
    </div>

</div>
<!--/.container-->
<footer class="container-fluid">
    <p class="text-right small">©2017-2018 Company</p>
</footer>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">ADMIN</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body">
                <h3><a href="../user/updateUser">${sessionScope.loginId }</a></h3>
                <p>${sessionScope.loginName } 님 로그인중</p>
                <p>
                    <a href="../user/logout">LOGOUT</a>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</c:if>


    <!--scripts loaded here-->
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <script src="<c:url value="/resources/js/scripts.js"/>"></script>
  </body>
</html>