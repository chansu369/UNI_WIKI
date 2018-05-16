<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [ 게시판 글읽기 ] </title>
<link href="<c:url value="/resources/css/background.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet" type="text/css">


<style type="text/css">
	.control{
		margin-left: 35%;
	}
	.replyForm{
		margin-left: 35%;
	}
</style>
<script type="text/javascript">

<c:if test="${errorMsg != null }">alert("${errorMsg }")</c:if>

	function deleteForm(debatenum){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="delete?debatenum="+debatenum;
		}
	}
	
	function replyCheck(){
		var text = document.getElementById("text");
		
		if(text.value==''){
			alert("댓글내용을 입력해주세요");
			text.focus();
			return false;
		}
		return true;
	}
	
	function deleteReply(replynum,debatenum){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="deleteReply?replynum="+replynum+"&debatenum="+debatenum;
		}
	}
	
	function updateReplyForm(replynum,debatenum,replyText){
		var div = document.getElementById("div"+replynum);
	
		var str = '<form action="updateReply" method="post" id="editForm'+replynum+'">';
		str += '<input type="hidden" name="replynum" value="'+replynum+'">';
		str += '<input type="hidden" name="debatenum" value="'+debatenum+'">';
		str += '<input type="text" name="text" value="'+replyText+'">';
		str += '<a href="javascript:replyUpdate('+replynum+')">[수정하기]</a>';
		str += '<a href="javascript:replyCancel(div'+replynum+')">[취소]</a>';
		str += '</form>';
		
		div.innerHTML= str;
	}
	
	function replyCancel(div){
		div.innerHTML="";
	}
	
	function replyUpdate(replynum){
		var form = document.getElementById("editForm"+replynum);
		form.submit();
	}
	function returnHome(){
		location.href="list";
		
	}
	
</script>
</head>
<body>

<button type="button" class="btn btn-default" aria-label="Left Align" onclick="returnHome()">
  <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
</button>

<h2> [ 게시판 글읽기 ] </h2>

<table class="table table-bordered">
	<tbody>
	<tr>
		<th>작성자</th>
		<td>${debate.id }</td>
	</tr>
	<tr>
		<th>전공과목 번호</th>
		<td>${debate.subjectnum }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${debate.inputdate }</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${debate.hits }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${debate.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${debate.content }</td>
	</tr>
	</tbody>
</table>

<div class="control">
<c:if test="${sessionScope.loginId == debate.id }">
<a href="javascript:deleteForm('${debate.debatenum }')">삭제</a>
<a href="updateForm?debatenum=${debate.debatenum }">수정</a>
</c:if>
<a href="list">목록보기</a>
<br><br><br><br><br><br>
</div>

<form action="insertReply" method="post" onsubmit="return replyCheck()" class="replyForm">
	<input type="hidden" name="debatenum" value="${debate.debatenum }">
	리플내용 : <input type="text" name="text">
	<input type="submit" value="확인">
</form>


<table class="type08">
	<c:forEach var="reply" items="${replyList }">
	<tbody>
	<tr>
		<td>${reply.id }</td>
		<td>${reply.text }</td>
		<td>
			<c:if test="${sessionScope.loginId == reply.id }">	
				<a href="javascript:updateReplyForm('${reply.replynum }','${reply.debatenum }','${reply.text }')">
					[수정]
				</a>
			</c:if>
		</td>
		<td>
			<c:if test="${sessionScope.loginId == reply.id }">	
				<a href="javascript:deleteReply('${reply.replynum }','${reply.debatenum }')">
					[삭제]
				</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<div id="div${reply.replynum }"></div>
		</td>
	</tr>
	</tbody>
	</c:forEach>
</table>







</body>
</html>