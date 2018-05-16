<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [ 게시글 수정 폼 ] </title>
<link href="<c:url value="/resources/css/background.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function formCheck(){
		var title = document.getElementById("title");
		var content = document.getElementById("content");
		
		
		if(title.value == ''){
			alert("제목을 입력해주세요");
			title.focus();
			return false;
		}
		
		if(content.value == ''){
			alert("글 내용을 입력해주세요");
			content.focus();
			return false;
		}
		
		return true;
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


<h2> [ 글수정 ] </h2>

<form action="update" method="post" onsubmit="return formCheck()">
	<input type="hidden" name="debatenum" value="${debate.debatenum }">
	<input type="hidden" name="id" value="${sessionScope.loginId }">
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
			<th>제목</th>
			<td>
				<input type="text" name="title" value="${debate.title }">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="20" cols="40" name="content">${debate.content }</textarea>
			</td>
		</tr>
	</table>
	<input type="submit" value="수정" class="button">
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>