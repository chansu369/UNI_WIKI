<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [위키 글 입력] </title>
<meta name="description" content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">


    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="<c:url value="/resources/css/styles.css"/>" />
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
<c:if test="${param.errorMsg != null }">alert("${param.errorMsg }");</c:if>
<c:if test="${errorMsg != null }">alert("${errorMsg }");</c:if>
	$(function(){
		
		
	});
	
	function formCheck(){
		var content = $('textarea').val();
		
		if(content == ''){
			alert("내용을 입력해 주세요");
			return false;
		}
		
		return true;
	}
</script>
<style type="text/css">
.bg-primary{
		background-color: #f05f40!important;
	}
</style>
</head>
<body>
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
        <!--/col-->

         <div class="col-md-9 col-lg-10 main">

            <h1 class="display-4 d-none d-sm-block">
            위키 글 등록
            </h1>

            <a id="layouts"></a>
            <hr>
            
            <!-- 화면에 띄워줄 부분 -->
            <div class="div-manage">
            		<div class="table-responsive">
                        
						<form action="writeWikiBoard" method="post" onsubmit="return formCheck()">
							<table border="1" class="table table-bordered">
								<tr>
									<th>전공과목</th>
									<td>
										<select name="subjectnum" id="subjectnum">
											<c:forEach items="${subjectList }" var="subject">
											<option value="${subject.subjectnum }">${subject.subjectname }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td>
										<textarea rows="10" cols="100" name="content">| 형태로 끊어서 입력하세요.  ex) '경영학과 커리큘럼|경영학과 학교생활|경영학과 졸업후진로|경영학과 관련문서'</textarea>
									</td>
								</tr>
								<tr>
									<th>파일</th>
									<td>
										<select name="filenum">
											<c:forEach var="file" items="${fileList }">
												<option value="${file.filenum }">${file.originalfile }</option>
											</c:forEach>
										</select>
									</td>
								<tr>
									<th>링크</th>
									<td>
										<select name="linknum">
											<c:forEach var="link" items="${linkList }">
												<option value="${link.linknum }">${link.linkaddress }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
							<input type="submit" value="등록">
						</form>	
                     
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
	
	
	
<!--scripts loaded here-->
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <script src="<c:url value="/resources/js/scripts.js"/>"></script>	
	

</body>
</html>