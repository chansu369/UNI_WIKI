<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <meta name="description" content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">


    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="<c:url value="/resources/css/styles.css"/>" />
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
<script type="text/javascript">
	$(function(){
		
		$('.submit').on('click',function(){
			var bool = formCheck();
			var form = $('.form_write');
			if(bool){
				form.submit();
				window.opener.location.reload();
				window.close();
			}
		});
		
	});

	
	function formCheck(){
		var subjectname = $('#subjectname').val();
		
		if(subjectname==''){
			alert('전공과목 이름을 입력해 주세요');
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>

<h3> [ 전공과목 추가 ] </h3>

<form action="writeSubject" method="post" onsubmit="return formCheck()" target="managewindow" id="form_write">
	<table border="1" class="table table-bordered">
		<tr>
			<th>전공과목 이름</th>
			<td><input type="text" name="subjectname" id="subjectname"></td>
		</tr>
	</table>
	<input type="submit" value="추가" id="submit" class="btn btn-primary-outline btn-lg">
	
</form>




</body>
</html>