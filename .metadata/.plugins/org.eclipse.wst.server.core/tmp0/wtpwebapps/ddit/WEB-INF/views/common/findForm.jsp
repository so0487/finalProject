<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
	
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	.form-control{
		width:200px;
		display: inline-block;
	}
	.col-form-label{
		display: inline-block;
	}
</style>
</head>
<body>
	<div style="margin-left:15px;margin-top:15px">
		<h3>���̵� ã�� </h3>
		<form action="findId.do" method="post">
		<label class="col-form-label">�� &#160; &#160;��</label> : <input type="text" name="member_name" class="form-control" maxlength="20" ><br>
		<label class="col-form-label" style="margin-top: 4px;">�̸���</label> : <input type="text" name="member_email" class="form-control" maxlength="25">
		<button class="button button-primary" style="margin-left: 52px; margin-top: 5px;">���̵� ã��</button>	
		</form>
	</div>
	
	<br><br><br><br>
	
	<div style="margin-left:15px;">
		<h3>��й�ȣ ã��</h3>
		<form action="findPwd.do" method="post">
		<label class="col-form-label">���̵�</label> : <input type="text" name="member_id" class="form-control" maxlength="20" ><br>
		<label class="col-form-label" style="margin-top: 4px;">�̸���</label> : <input type="text" name="member_email" class="form-control" maxlength="20" >
		<button class="button button-primary" style="margin-left: 52px; margin-top: 5px;">��й�ȣ ã��</button>
		</form>
	</div>
	
</body>

</html>

