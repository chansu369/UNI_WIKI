<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [ 로그인 폼 ]</title>
	<link href="<c:url value="/resources/css/background.css"/>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
<c:if test="${errorMsg != null }">alert("${errorMsg }");</c:if>

	$(function(){
		$('a').hover(function(){
			$(this).css('text-decoration','underline').css('cursor', 'pointer');
		}, function(){
			$(this).css('text-decoration','none').css('color','black');
		});
		
		
		$('a').on('click',function(){
			var requestPath = '${param.requestPath}';
			if(requestPath == ''){
				opener.document.location.href="joinForm";
				window.close();
			}else{
				document.location.href="joinForm";
			}
		});
		
		$('.submit').on('click',function(){
			var bool = formCheck();
			var form = $('.form_log');
			if(bool){
				form.submit();
				window.opener.location.reload();
				window.close();
			}
		});
	});
	
	
	function formCheck(){
		var id = document.getElementById("id");
		var pw = document.getElementById("password");
		
		if(id.value==''){
			alert("ID를 입력해 주세요");
			id.focus();
			return false;
		}
		
		if(pw.value==''){
			alert("비밀번호를 입력해 주세요");
			pw.focus();
			return false;
		}
		return true;
	}
	
	function returnHome(){
		location.href="../";
	}
	function closeWindow(){
		window.close();
	}
	
	
</script>
</head>
<body>

<c:if test="${param.requestPath != null }">
<button type="button" class="btn btn-default" aria-label="Left Align" onclick="returnHome()">
  <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
</button>
</c:if>
<h2> [ 로그인 ] </h2>

<form action="login" method="post" class="form_log" target="index">
	<input type="hidden" name="requestPath" value="${param.requestPath }">
	<table class="table table-bordered">
		<tr>
			<th>ID</th>
			<td>
				<input type="text" name="userid" id="id">
			</td>
		</tr>
		<tr>
			<th>Password</th>
			<td>
				<input type="password" name="password" id="password">
			</td>
		</tr>	
	</table>
	<div class="button">
	<input type="submit" value="Login" class="submit">
	<c:if test="${param.requestPath == null }">
		<input type="button" value="닫기"  onclick="javascript:closeWindow()">
	</c:if>
	</div>
</form>
<br>
<a>아직 Uniwiki의 회원이 아니세요?</a>

</body>
</html>