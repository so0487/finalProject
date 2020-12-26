<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin:150px 0 0 250px;">
		<h1>DDIT 비밀번호 재설정</h1>
		<br>
		<form action="changePwd" method="post">
			
			<input type="hidden" name="member_id" value="${member_id }">
			<input type="hidden" name="ckUrl" value="${ckUrl }">
			변경할 비밀번호 : <input class="form-control" style="width:350px;" type="password" id="member_pwd" name="member_pwd"><br><br>
			변경할 비밀번호 확인 : <input class="form-control" style="width:350px;" type="password" id="member_pwd2">
			<button class="button button-outline button-info" style="margin-top:15px;">변경하기</button>
		</form>
	</div>
	<!-- 	비밀번호 확인 	 -->
	<script>
		$(function(){			
			$("#member_pwd, #member_pwd2").focusout(function(){
				
				var	pwd1 = $("#member_pwd").val();
				var pwd2 = $("#member_pwd2").val();
				
				if(pwd1!="" && pwd2!=""){
					if(pwd1!=pwd2){
						alert("비밀번호가 일치하지 않습니다.");
						$("#member_pwd2").val("");
						$("member_pwd2").focus();
					}
				}					
			});
		});
	</script>
</body>
</html>