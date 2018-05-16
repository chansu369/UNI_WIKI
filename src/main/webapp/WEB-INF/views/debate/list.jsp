<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [ 토론장 목록 ] </title>
<link href="<c:url value="/resources/css/background.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet" type="text/css">


<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>">
</script>
<script type="text/javascript">

	$(function(){
		
		//컨트롤러에서 넘어온 값
		var searchSelect = '${searchSelect}';
		var searchText = '${searchText}';
		
		$('select > option').each(function(index,item){
			if(searchSelect == this.value){
				$(this).attr('selected','selected');		//컨트롤러에서 넘어온 값과 같으면 selected속성 추가
			}
			
		});
		
	});


	function writeForm(){
		location.href="writeForm";
	}
	
	function pagingFormSubmit(currentPage){
		var form = document.getElementById("pagingForm");
		var page = document.getElementById("page");
		
		page.value = currentPage;
		
		form.submit();
	}
	
	function returnHome(){
		location.href="/mypro";
		
	}
</script>
<style type="text/css">
	.paging{
		margin-left: 38%;
	}
	.searchForm{
		margin-left: 38%;
	}
	
</style>
</head>
<body>


	<c:if test="${searchSelect != null }">
	<script type="text/javascript">
		var searchSelect = '${searchSelect}';
		$('select > option[value='+searchSelect+']').attr('selected','selected');
	</script>
	</c:if>


<button type="button" class="btn btn-default" aria-label="Left Align" onclick="returnHome()">
  <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
</button>

<div>
	<span>
		전체 : ${navi.totalRecordsCount }
	<c:if test="${sessionScope.loginId != null }">
		<input type="button" value="글쓰기" onclick="writeForm()" class="write">
	</c:if>
	</span>
</div>

<table class="table table-striped">
	<thead>
	<tr>
		<th>글번호</th>
		<th>전공번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="debate" items="${list }">
		<tr>
			<td>${debate.debatenum }</td>
			<td>${debate.subjectnum }</td>
			<td>
				<a href="read?debatenum=${debate.debatenum }">
				    ${debate.title }
				</a>
			</td>
			<td>${debate.id }</td>
			<td>${debate.hits }</td>
			<td>${debate.inputdate }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br>
<nav>
<div class="paging">
	<ul class="pagination">
	<li><a href="javascript:pagingFormSubmit(${navi.startPageGroup - navi.pagePerGroup })">◁◁</a></li>
	<li><a href="javascript:pagingFormSubmit(${navi.currentPage - 1 })">◀</a></li>
	
	<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="counter">
		<c:choose>
			<c:when test="${counter == navi.currentPage }">
				<li><a href="javascript:pagingFormSubmit(${counter })"><b>${counter }</b></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="javascript:pagingFormSubmit(${counter })">${counter }</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<li><a href="javascript:pagingFormSubmit(${navi.currentPage + 1 })">▶</a></li>
	<li><a href="javascript:pagingFormSubmit(${navi.startPageGroup + navi.pagePerGroup })">▷▷</a></li>
	</ul>
</div>
</nav>



<div class = "searchForm">
<form action="list" method="get" id="pagingForm" class="navbar-form navbar-left">
	<div class="form-group">
	<input type="hidden" name="page" id="page">
	
	
	
	<select name="searchSelect" class="form-control">
		<option value="title">제목</option>
		<option value="content">본문</option>
		<option value="id">작성자</option>
	</select>
	
	<input type="text" name="searchText" value="${searchText }" class="form-control">
	</div>
	<input type="button" value="검색" onclick="pagingFormSubmit(1)" class="btn btn-default">	
</form>
</div>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js"/>"></script>

</body>
</html>