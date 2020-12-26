<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="content-body">

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
			<button style="border:1px solid #dddddd" class="btn btn-outline" id="registBtn">
				<span>등록</span>
			</button>
			<button style="border:1px solid #dddddd" class="btn btn-outline" id="cancelBtn">
				<span>취소</span>
			</button>
		</div>

	</div>
	<!-- Page Headings End -->

	<form role="form" method="post" action="studentRegist.do" name="registForm" enctype="multipart/form-data">
		<div class="row">
			<input type="hidden" name="student_id"	value="${loginUser.member_id}" /> 
			<input type="hidden" name="lecture_no"	value="${assignment.lecture_no}" /> 
			<input type="hidden" name="assignment_no"	value="${assignment.assignment_no}" /> 
			
			<div class="col-lg-11 mb-20" style="margin-left: 30px;">
				과제제목<input type="text" class="form-control" name="assignment_history_name" id="assignment_history_name">
			</div>
		</div>
		

		
		<!-- summernote -->
		<div class="row">
			<div class="col-12 mb-30">
				<div class="box">
					<div class="box-head">
						<h3 class="title">제출내용</h3>
					</div>
					<div class="box-body">
						<textarea id="assignment_history_content" name="assignment_history_content" class="summernote" maxlength="10"></textarea>
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
				<div class="inputRow">
				</div>
			</div>
		</div>

	</form>

</div>
<script>
	$('#registBtn').on('click', function(e) {
		
		var end_date = $('#assignment_end_date').val();
		var today = new Date();
		var today2 = moment(today).format("YYYY-MM-DD");
		if(!moment(today2).isBefore(end_date)){
			alert("제출기한을 지나서 제출할수 없습니다.");
			return false;
		}
		
		var form = document.registForm;
		//alert($('#post_title').val().length);
		if (form.assignment_history_name.value == "") {
			alert("제목은 필수적으로 입력되어야 합니다.");
			return false;
		}
		if ($('#assignment_history_name').val().length > 50) {
			alert("입력가능한 최대 바이트를 초과하였습니다.");
			return false;
		}
		if ($('#assignment_history_name').val().length > 100) {
			alert("제목 최대 입력 크기를 초과하였습니다.");
			return false;
		}
		if ($('#assignment_history_content').val().length > 1000000) {
			alert("내용 최대 입력 크기를 초과하였습니다.");
			return false;
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
	
	  function maxLengthCheck(object){
		    if (object.value.length > object.maxLength){
		      //object.maxLength : 매게변수 오브젝트의 maxlength 속성 값입니다.
		      object.value = object.value.slice(0, object.maxLength);
		    }    
		  }
</script>
<%@ include file="attach_js.jsp"%>

