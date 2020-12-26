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
					<h3 class="title" style="text-align: left;">게시글 등록</h3>
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
	
		<form role="form" method="post" action="regist.do" name="registForm">
			<div class="row">
				<input type="hidden" name="post_writer"
					value="${loginUser.member_id}" /> <input type="hidden"
					name="board_no" value="BOARD002" />
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
							<textarea id="post_content" name="post_content" class="summernote" ></textarea>
						</div>
					</div>
				</div>
			</div>
	
		</form>
	</div>
</div>
<script>
	$('#post_title').keyup(function() {
		if ($(this).val().length > $(this).attr('maxlength')) {
			alert('제목은 50자까지만 입력 가능합니다.');
			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
		}	
	});
	
// 	if ($('#post_content').val().length > 10) {
// 		alert("내용 최대 입력 크기를 초과하였습니다.");
// 		return;
// 	}

	$('#registBtn').on('click', function(e) {
		var form = document.registForm;

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
		location.href="<%=request.getContextPath()%>/board/free/list.do?board=free&board_no=BOARD002";
	});
</script>


