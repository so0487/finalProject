<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content-body">
	<div class="add-edit-product-wrap col-12" style="background-color: white; margin-top:-50px ">
	<!-- Page Headings Start -->
	<div class="row justify-content-between align-items-center mb-10">

		<!-- Page Heading Start -->
		<div class="col-12 col-lg-auto mb-20">
			<div class="page-heading">
				<h3 class="title" style="text-align: left;">과제자료실</h3>
			</div>
		</div>
		<!-- Page Heading End -->
		<!-- button -->
		<div style="position: absolute; top: 25px; right: 62px;">
			<button style="border:1px solid #dddddd" class="btn btn-outline" id="modifyBtn">
				<span>수정</span>
			</button>
			<button style="border:1px solid #dddddd" class="btn btn-outline" id="cancelBtn">
				<span>취소</span>
			</button>
		</div>

	</div>
	<!-- Page Headings End -->

	<form role="form" method="post" action="studentModify.do" name="modifyForm" enctype="multipart/form-data">
		<div class="row">
			<input type="hidden" name="assignment_history_no" value="${assignHistory.assignment_history_no}" />			
			<div class="col-lg-10 mb-20" style="width: 100%; margin-left: 0px;">
				과제제목 <input type="text" class="form-control" value="${assignHistory.assignment_history_name}" id="assignment_history_name" name="assignment_history_name">
			</div>
		</div>

		<!-- summernote -->
		<div class="row">
			<div class="col-12 mb-30">
				<div class="box">
					<div class="box-head">
						<h3 class="title">내용</h3>
					</div>
					<div class="box-body">
						<textarea id="assignment_history_content" name="assignment_history_content" class="summernote">${assignHistory.assignment_history_content }</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="fileInput">
				<button type="button"
					class="button button-round button-primary"
					id="addFileBtn">
					<i class="zmdi zmdi-attachment-alt"></i> 파일첨부
				</button>
				<div class="attachResult">
					<ul class="mailbox-attachments">
					<c:if test="${!empty assignHistory.attachList }">
						<c:forEach items="${assignHistory.attachList}" var="attach">
							<li class="attach-item">
								<div class="mailbox-attachment-info">
									<a class="mailbox-attachment-name" name="attachedFile"
										attach-fileName="${attach.attach_original_name }"
										attach-no="${attach.attach_no }"
										href="<%=request.getContextPath()%>/assign/attach/getFile.do?assignment_history_no=${assignHistory.assignment_history_no}&attach_no=${attach.attach_no}">
										<i></i>${attach.attach_original_name }&nbsp;&nbsp;
										<button type="button" style="border: 0; outline: 0;" class="badge bg-red">X</button><br>
									</a>
								</div>
							</li>
						</c:forEach>
					</c:if>
						<%-- 						</c:if> --%>
					</ul>
				</div>
			</div>
		</div>
	</form>
	</div>
</div>


<script>
	$('#modifyBtn').on('click', function(e) {		

		var form = document.modifyForm;
		if (form.assignment_history_name.value == "") {
			alert("제목은 필수적으로 입력해야 합니다.");
			return;
		}
		if (form.assignment_history_name.content == "") {
			alert("내용은 필수적으로 입력해야 합니다.");
			return;
		}
		if ($('#assignment_history_name').val().length > 100) {
			alert("제목 최대 입력 크기를 초과하였습니다.");
			return;
		}
		if ($('#assignment_history_content').val().length > 1000000) {
			alert("내용 최대 입력 크기를 초과하였습니다.");
			return;
		}
		form.submit();
	});

	$('#cancelBtn').on('click', function(e) {
		history.go(-1);
	});
</script>
<%@ include file="modify_js.jsp"%>

