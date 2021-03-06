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
					<h3 class="title" style="text-align: left;">개선 및 제안 수정</h3>
				</div>
			</div>
			<!-- Page Heading End -->
			<!-- button -->
			<div style="position: absolute; top:80px; right:82px;">
				<button class="btn btn-outline" style="border:1px solid #dddddd;" id="modifyBtn">
					<span>수정</span>
				</button>
				<button class="btn btn-outline" style="border:1px solid #dddddd;" id="cancelBtn">
					<span>취소</span>
				</button>
			</div>
	
		</div>
		<!-- Page Headings End -->
	
		<form role="form" method="post" action="modify.do" name="modifyForm" enctype="multipart/form-data">
			<div class="row">
				<input type="hidden" name="post_writer" value="${post.post_writer}" />
				<input type="hidden" name="board_no" value="BOARD007" />
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-left: 8px; margin-right: -8px; margin-top: 15px;">
					<h5>글번호</h5>
				</div>
				<div class="col-lg-3 mb-20" style="width: 100%; margin-left: 0px;">
					<input type="text" class="form-control" readonly="readonly"
						value="${post.post_no }" id="post_no" name="post_no">
				</div>
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-right: -8px; margin-top: 15px; margin-left: -7px;">
					<h5>수정일</h5>
				</div>
				<div class="col-lg-3 mb-20" style="width: 100%; margin-left: 0px;">
					<input type="text" class="form-control" readonly="readonly"
						value='<fmt:formatDate value="${post.post_update_date }" pattern="yyyy-MM-dd"/>'
						id="post_update_date" name="post_update_date">
				</div>
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-right: -8px; margin-top: 15px; margin-left: -7px;">
					<h5>조회수</h5>
				</div>
	
				<div class="col-lg-3 mb-20" style="width: 100%; margin-left: 0px;">
					<input type="text" class="form-control" readonly="readonly"
						value="${post.post_viewcnt}" id="post_viewcnt" name="post_viewcnt">
				</div>
				<div class="col-lg-1 mb-25"
					style="width: 100%; text-align: center; margin-left: 10px; margin-right: 0px; margin-top: 12px;">
					<h5>제목</h5>
				</div>
				<div class="col-lg-10.5 mb-20" style="width: 86%; margin-left: 5px;">
					<input type="text" class="form-control" name="post_title"
						id="post_title" value="${post.post_title }" maxlength="50">
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
							<textarea id="post_content" name="post_content" class="summernote">${post.post_content }</textarea>
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
							<c:forEach items="${post.attachList}" var="attach">
								<li class="attach-item" style="margin-bottom:5px;">
									<div class="mailbox-attachment-info">
										<span class="mailbox-attachment-name" name="attachedFile"
											attach-fileName="${attach.attach_original_name }"
											attach-no="${attach.attach_no }"
											>
											<i></i>${attach.attach_original_name }&nbsp;&nbsp;
											<button type="button" style="border: 0; outline: 0;"
												class="badge bg-red">X</button> <br>
										</span>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</form>
	</div>	
</div>


<script>

	$('#post_title').keyup(function() {
		if ($(this).val().length > $(this).attr('maxlength')) {
			alert('제목은 50자까지 입력가능 합니다.');
			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
			return;
		}	
	});
	
	$('#modifyBtn').on('click', function(e) {
		var form = document.modifyForm;
		if (form.post_title.value == "") {
			alert("입력하지 않은 항목이 있습니다.");
			return;
		}
		if ($('#post_content').val().length == 0) {
			alert("입력하지 않은 항목이 있습니다.");
			return;
		}
		
		if ($('#post_content').val().length > 1000000) {
			alert('입력 제한을 초과하였습니다.');
			return;
		}
		form.submit();
	});

	$('#cancelBtn').on('click', function(e) {
		location.href='<%=request.getContextPath() %>/board/imp/detail.page?post_no=${post.post_no}';
	});
</script>
<%@ include file="modify_js.jsp"%>

