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

	<form role="form" method="post" action="modify.do" name="modifyForm">
		<div class="row">
			<input type="hidden" name="assignment_no" value="${assignment.assignment_no}" />
			<input type="hidden" id="class_start_date" name="class_start_date" value="${classVO.class_start_date }">
						
			<div class="col-lg-10 mb-20" style="width: 100%; margin-left: 0px;">
				과제제목 <input type="text" class="form-control" value="${assignment.assignment_name}" id="assignment_name" name="assignment_name">
			</div>
			<div class="col-lg-3 mb-20" style="width: 100%; margin-left: 0px;">
				총점 <input type="text" class="form-control" 	value='${assignment.assignment_score }'
					id="assignment_score" name="assignment_score">
			</div>
			
			<div class="col-lg-3 mb-20" style="width: 86%; margin-left: 5px;">
				반영비율<input type="text" class="form-control" name="assignment_ratio" id="assignment_ratio" value="${assignment.assignment_ratio }">
			</div>
			<div class="col-lg-5 mb-20">
				제출기한<input type="date" class="form-control" name="assignment_end_date" id="assignment_end_date" value="${assignment.assignment_end_date }" max="${classVO.class_end_date }">
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
						<textarea id="assignment_content" name="assignment_content" class="summernote">${assignment.assignment_content }</textarea>
					</div>
				</div>
			</div>
		</div>
		
	</form>
	</div>
</div>


<script src="<%=request.getContextPath() %>/resources/js/moment.js"></script>
<script>
	var date_val = '${endDate}';
	var date_val2 = moment(date_val).format("YYYY-MM-DD");


	$("#assignment_end_date").val(date_val2);
	

	var date = new Date();
	var dates = $('#class_start_date').val();

	
	var strs = moment(dates).format("YYYY-MM-DD");
	var str = moment(date).format("YYYY-MM-DD");
	if(str>$('#class_start_date').val()){
		document.getElementById("assignment_end_date").min =str;
	}else{
		document.getElementById("assignment_end_date").min =strs;
	}
	
	$('#modifyBtn').on('click', function(e) {
		
		var end_date = $('#assignment_end_date').val();
		var today = new Date();
		today.setDate(today.getDate()-1);
		
		if(!moment(today).isBefore(end_date)){
			alert("오늘보다 이전 날짜를 선택하였습니다.");
			return false;
		}
		
		var form = document.modifyForm;
		if (form.assignment_name.value == "") {
			alert("제목은 필수적으로 입력해야 합니다.");
			return;
		}
		if (form.assignment_name.content == "") {
			alert("내용은 필수적으로 입력해야 합니다.");
			return;
		}
		if ($('#assignment_name').val().length > 100) {
			alert("제목 최대 입력 크기를 초과하였습니다.");
			return;
		}
		if ($('#assignment_content').val().length > 1000000) {
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

