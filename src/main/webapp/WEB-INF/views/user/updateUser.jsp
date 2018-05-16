<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [ 회원 정보 수정 폼 ] </title>
<link href="<c:url value="/resources/css/background.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">

<style type="text/css">
h1 {
	text-align: center;
}
table {
    border-collapse: collapse;
    width: 70%;
    margin: auto;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">

	<c:if test="${errorMsg != null }">alert("${errorMsg }");</c:if>

	function formCheck(){
		//submit 버튼 클릭시
		
		var id = document.getElementById("id");
		var pw = document.getElementById("password");
		var pw2 = document.getElementById("password2");
		var name = document.getElementById("name");
		var subjectnum = document.getElementById("subjectnum");
		
		if(id.value == ''){
			alert("ID를 입력해 주세요");
			id.focus();
			return false;
		}
		
		if(pw.value == ''){
			alert("비밀번호를 입력해 주세요");
			pw.focus();
			return false;
		}else if(pw.value != pw2.value){
			alert("비밀번호와 동일하게 입력해 주세요");
			pw2.value = '';
			pw2.focus();
			return false;
		}

		if(name.value == ''){
			alert("이름를 입력해 주세요");
			name.focus();
			return false;
		}
		
		if(subjectnum.value == ''){
			alert("식별번호를 입력해 주세요");
			idno.focus();
			return false;
		}
		
		return true;
	}
	
	function returnHome(){
		location.href="../";
		
	}
</script>
</head>
<body>

<button type="button" class="btn btn-default" aria-label="Left Align" onclick="returnHome()">
  <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
</button>


<h2>[ 회원 정보 수정 ]</h2>

<form action="updateUserinfo" method="post" onsubmit="return formCheck()">
<table border="1" class="table table-bordered">
	<tr>
		<th>
			ID
		</th>
		<td>
			<input type="text" value="${user.userid }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>
			비밀번호
		</th>
		<td>
			<input type="password" name="password" id="password" placeholder="비밀번호 입력"><br>
			<input type="password" id="password2" placeholder="비밀번호 다시 입력">			
		</td>
	</tr>
	<tr>
		<th>
			계정유형
		</th>
		<td>
			<input type="checkbox" name="usertype" id="usertype" checked="checked" value="common" checked onclick="return false;">일반 사용자
		</td>
	</tr>
	<tr>
		<th>
			이름
		</th>
		<td>
			<input type="text" name="name" id="name" value="${user.name }" placeholder="이름 입력">
		</td>
	</tr>
	<tr>
		<th>
			이메일
		</th>
		<td>
			<input type="text" name="email" value="${user.email }" placeholder="이메일 입력">
		</td>
	</tr>
	<tr>
		<th>
			전공
		</th>
		<td>
			<select name="subjectnum" id="subjectnum">
				<c:forEach items="${subjectList }" var="subject">
				<option value="${subject.subjectnum }">${subject.subjectname }</option>
				</c:forEach>
			</select>
		</td>
	</tr>

</table>
<div class="button">
	<input type="submit" value="가입">
	<input type="reset" value="다시 쓰기">
</div>
</form>



</body>
</html>