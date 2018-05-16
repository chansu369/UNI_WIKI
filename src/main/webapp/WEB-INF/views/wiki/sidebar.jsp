<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>[ UNI 위키 ]</title>
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
	.tab-pane > a{
		margin-left: 90%;
	}
</style>
<script type="text/javascript">
<c:if test="${param.errorMsg != null }">alert("${param.errorMsg }");</c:if>

	$(function(){
		//파일 업로드
		$("#imgBtn").on("click",function(){
			
			var formData = new FormData();
			formData.append("file",$("#upload")[0].files[0]);
			
			$.ajax({
				type:"POST",						
				url:"fileupload",				
				data:formData,
				processData: false,
			    contentType: false,
				dataType:"json",				
				success:function(data){	
					console.log(data);
					$("#imgDiv").empty();
					$("#imgDiv").html('<img alt="" src="download?origin='+data.originalfile+'&saved='+data.savedfile+'" width="500px" height="300px">');
					alert("파일 전송이 완료되었습니다!");
				},
				error: function(e){			
					console.log(e);
				}
			});
		});
		
		
		
		$('#subjectInfo > div').hide();
		
		//편집 온클릭이벤트
		$('.tab-pane > a').on('click',function(){
			var original = $(this).next().html();
			
			var textarea = '<textarea rows="20" cols="100">';
			textarea += original;
			textarea += '</textarea>';
			$(this).next().html(textarea);
			$(this).off('click');
			
			$(this).html('수정').on('click',function(){
				//ajax로 수정(waitDB에 저장)
				var updatetext = $(this).next().html();
				var subjectnum = $('#submenu1 li > a').attr('subjectnum');
				
				$.ajax({
					url : "writeWait",
					type : "POST",
					data :{
						updatetext : updatetext,
						subjectnum : subjectnum
					},
					success: function(){
						alert('수정요청 완료되었습니다.');
						window.location.reload();
					},
					error: function(e){
						console.log(e);
					}
				});
				
			});
			
		});
		
		
		//후버
		$('#submenu1 li > a').hover(function(){
			$(this).css('text-decoration','underline').css('cursor', 'pointer').css('color','blue');
		}, function(){
			$(this).css('text-decoration','none').css('color','black');
		});
		$('.tab-pane > a').hover(function(){
			$(this).css('text-decoration','underline').css('cursor', 'pointer').css('color','blue');
		}, function(){
			$(this).css('text-decoration','none').css('color','black');
		});
		
		
		//전공 메뉴 온클릭이벤트
		$('#submenu1 li > a').on('click',function(){
			$('#subjectInfo > div').show();
			var subjectnum = $(this).attr('subjectnum');		//각 태그당 과목번호를 받아온다
			var subjectname = $(this).attr('subjectname');	//각 태그당 과목이름을 받아온다
			
			//ajax로 각 전공과목당 게시글을 가져온다
			$.ajax({
				url : "listSelect",
				type : "GET",
				dataType : "json",
				success : function(boardList){
					
					$.ajax({
						url :"subjectList",
						type : "GET",
						dataType : "json",
						success : function(subjectList){
							$.each(boardList,function(index,item){
									console.log(this.boardnum);
									//정규표현식을 사용해서 content안에 있는 값을 짜른다.
									if(this.subjectnum == subjectnum){
										var text = this.content;
										var array = text.split('|');
										
										//탭창을 바꾼다(p태그4개)
										$('#curri > p').html(array[0]);
										$('#school > p').html(array[1]);
										$('#afterJob > p').html(array[2]);
										$('#docum > p').html(array[3]);
										return false;
									}
									
								
							});
							$.each(subjectList,function(index,item){
								$.each(this,function(index,item){

									if(this == subjectnum){
										//탭창을 바꾼다(h2 태그 1개)
										$('.sub-header').html(subjectname);
										return false;
									}
								});
								console.log("break 먹음");
							});
							
						},
						error: function(e){
							console.log(e);
						}
					});
					
				},
				error : function(e){
					console.log(e);
				}
			});
		
			
		//온클릭이벤트종료	
		});
		
		//링크체크
		
		
	//ready함수 종료	
	});
	
	function linkCheck(){
		var linkaddress = $('#linkaddress').val();
		var linkcheck = /(http[s]?|ftp):\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}/g;
		
		console.log(linkaddress);
		 var result = linkcheck.exec(linkaddress);
		
		if(result == null){
			alert("링크의 형식이 아닙니다");
			return false;
		}
		
		for(var i in result){
			if(result[i] == null){
				alert("링크의 형식이 아닙니다");
				return false;
			}
		}
		console.log(result);
		
		return true;
	}
</script>


</head>

<body>
<c:if test="${sessionScope.loginId != null }">
    <nav class="navbar fixed-top navbar-expand-md navbar-dark bg-primary mb-3">
    <div class="flex-row d-flex">
        <a class="navbar-brand" href="#" title="Free Bootstrap 4 Admin Template">UNI WIKI</a>
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
                <a class="nav-link" href="" data-target="#myModal" data-toggle="modal">USER</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas pl-0" id="sidebar" role="navigation">
            <ul class="nav flex-column pl-1">
                <li class="nav-item">
                    <a class="nav-link" href="#submenu1" data-toggle="collapse" data-target="#submenu1">학과정보▾</a>
                    <ul class="list-unstyled flex-column pl-3 collapse" id="submenu1" aria-expanded="false">
                     <c:forEach var="subject" items="${subjectList }">  
                       <li class="nav-item"><a class="nav-link" subjectnum="${subject.subjectnum }" subjectname="${subject.subjectname }">${subject.subjectname }</a></li>
                    </c:forEach>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="debate/list">토론장</a></li>
            </ul>
        </div>
        <!--/col-->

         <div class="col-md-9 col-lg-10 main">

            <h1 class="display-4 d-none d-sm-block">
            UNI WIKI
            </h1>
            <!-- <p class="lead d-none d-sm-block">(test)</p> -->

            <div class="alert alert-warning fade collapse" role="alert" id="myAlert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <strong> ←  학과 정보를 클릭해주세요!</strong>
            </div>
    
            <a id="layouts"></a>
            <hr>
            
            
            <section id="subjectInfo">
            
            <h2 class="sub-header mt-5"></h2>
            <div class="row mb-3">
                
  
                <div>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" href="#curri" role="tab" data-toggle="tab">커리큘럼</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#school" role="tab" data-toggle="tab">학교생활</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#afterJob" role="tab" data-toggle="tab">졸업 후 진로</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#docum" role="tab" data-toggle="tab">관련 문서</a>
                        </li>
                    </ul>
 
                    
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <br>
                        <div role="tabpanel" class="tab-pane active" id="curri">
                            <h4>커리큘럼</h4>
                            <a>편집</a>
                            <p>
                                <!-- 커리큘럼 내용 -->
                                
                            </p>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="school">
                            <h4>학교생활</h4>
                            <a>편집</a>
                            <p>
                                <!-- 학교생활 내용 -->
                                
                            </p>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="afterJob">
                            <h4>졸업 후 진로</h4>
                            <a>편집</a>
                            <p>
                                <!-- 졸업 후 진로 내용 -->
                                
                            </p>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="docum">
                            <h4>관련 문서</h4>
                            <a>편집</a>
                            <p>
                                <!-- 관련 문서 내용 -->
                                
                            </p>
                            <section id="filesubmit">
	                            <div id="imgDiv">
		
								</div>
	                            <input type="file" id="upload" name="file-data">	
	
								<input type="button" class="btn btn-outline-secondary" id="imgBtn" value="전송">
								<br><br>
								<h4>링크 업로드</h4>
								<form action="writeLink" method="post" onsubmit="return linkCheck()">
									<textarea rows="5" cols="100" name= "linkaddress" id = "linkaddress">
									</textarea>
									<input type="submit" value="링크 업로드" class="btn btn-outline-secondary">
								</form>
                        	</section>
                        </div>
                    </div>
                    
                </div>
                
              </div>
                
           </section>
              
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
                <h4 class="modal-title" id="myModalLabel">USER</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body">
                <h3><a href="user/updateUser">${sessionScope.loginId }</a></h3>
                <p>${sessionScope.loginName } 님 로그인중</p>
                <p>
                    <a href="user/logout">LOGOUT</a>
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