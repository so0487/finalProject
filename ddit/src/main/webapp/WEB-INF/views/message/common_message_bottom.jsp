<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Modal -->
<div class="compose-mail-modal modal fade" id="modal-compose-mail">
	<div class="modal-dialog modal-dialog-centered modal-xl" style="position: absolute;right: 400px; top: 0px; bottom: 0px; width: 100%;" >
		<div class="modal-content">

			<div class="modal-header">
				<h5 class="modal-title">새 메시지 작성</h5>
				<button type="button" class="close" data-dismiss="modal">
					<i class="zmdi zmdi-close"></i>
				</button>
			</div>

			<div class="form">
				<form role="form" action="regist.do" name="registForm" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col-12 mb-30">
							<input class="form-control" type="text" id="message_seceiver"
								name="message_sender" placeholder="발신자"
								value="${loginUser.member_id}">
						</div>
						<div class="col-10 mb-30">
							<input class="form-control" type="text" id="message_receiver"
								name="message_receiver" placeholder="수신자">
						</div>
						<div class="col-2 mb-30">
							<input type="button" class="button button-primary"onclick="OpenWindow('<%=request.getContextPath()%>/message/member/admin','수신자추가',800,600)" value="수신자 추가" /> 
						</div>
						<div class="col-12 mb-30">
							<input class="form-control" type="text" id="message_title"
								name="message_title" placeholder="제목">
						</div>
						<div class="col-12 mb-30">
							<textarea class="summernote" id="message_content"
								name="message_content"></textarea>
						</div>
						<div class="buttons-group col-12">
							<button type="button" class="button button-outline button-round button-warning" id="addFileBtn">
								<i class="zmdi zmdi-attachment-alt"></i> 파일첨부
							</button>
							<button type="button" class="button button-round button-primary"
								id="registBtn">전송</button>
						</div>
						<div class="fileInput"></div>

					</div>
				</form>
			</div>

		</div>
	</div>
</div>











<script>


$('#registBtn').on('click', function(e) {
var form = document.registForm
var files = $('input[name="uploadFile"]');
 	for(var file of files){
 		if(file.value==""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
 		}
 	}
 	
	if(form.message_title.value==""){
		alert("제목은 필수입니다.");
		return;
	}
	document.registForm.submit();	

});
</script>


<%@ include file="attach_js.jsp" %>