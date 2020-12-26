<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="content-body">
	<div class="add-edit-product-wrap col-12" style="background-color: white; margin-top:-50px ">
		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">
	
			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title" style="text-align: left;">부정행위신고</h3>
				</div>
	
			</div>
			<!-- Page Heading End -->
	
			<!-- button -->
			<div style="position: absolute; top:80px; right:82px;">
				<button class="btn btn-outline" style="border:1px solid #dddddd;" id="registBtn">
					<span>등록</span>
				</button>
				<button class="btn btn-outline" style="border:1px solid #dddddd;" id="cancelBtn">
					<span>취소</span>
				</button>
			</div>
	
		</div>
		<!-- Page Headings End -->
	
		<form role="form" method="post" action="regist.do" name="registForm"
			enctype="multipart/form-data">
				
			<div class="row">
				<input type="hidden" name="post_writer"	value="${loginUser.member_id}" /> 
				<input type="hidden" name="board_no" value="BOARD006" />
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-left: 10px; margin-top: 12px; margin-right: -5px;">
					<h5>제목</h5>
				</div>
				<div class="col-lg-10.5 mb-20"
					style="width: 86.5%; margin-left: 5px;">
					<input type="text" class="form-control" name="post_title"
						id="post_title" maxlength="50">
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
							<textarea id="post_content" name="post_content" class="summernote"></textarea>
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
					<div class="inputRow" id="file">
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
	$('#registBtn').on('click', function(e) {
		var form = document.registForm;
		//alert($('#post_title').val().length);
		if (form.post_title.value == "") {
			alert("제목은 필수적으로 입력되어야 합니다.");
			return;
		}
		if ($('#post_title').val().length > 100) {
			alert("제목 최대 입력 크기를 초과하였습니다.");
			return;
		}
		if ($('#post_content').val().length > 1000000) {
			alert("내용 최대 입력 크기를 초과하였습니다.");
			return;
		}
		
		var files = $('input[name="uploadFile"]');
	 	for(var file of files){
	 		if(file.value==""){
				alert("파일을 선택하세요.");
				file.focus();
				file.click();
				return;
	 		}
	 	}
		
		form.submit();
	});

	$('#cancelBtn').on('click', function(e) {
		history.go(-1);
	});
</script>
<%@ include file="attach_js.jsp"%>
