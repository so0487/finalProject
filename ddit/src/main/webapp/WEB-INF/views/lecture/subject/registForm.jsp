<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
<div class="content-body">
	<!-- Page Headings Start -->
	<div class="row justify-content-between align-items-center mb-10">
		<!-- Page Heading Start -->
		<div class="col-12 col-lg-auto mb-20">
			<div class="page-heading">
				<h3 class="title" style="text-align: left;">과목 등록</h3>
			</div>
		</div>
		<!-- Page Heading End -->
		<!-- button -->
		<div style="position: absolute; top: 25px; right: 62px;">
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
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>과목명</h5>
			</div>
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="text" class="form-control" name="subject_name" id="subject_name" maxlength="20">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>과목소개</h5>
			</div>
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="text" class="form-control" name="subject_introduce" id="subject_introduce">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>담당교수</h5>
			</div>
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<select class="form-control" name="professor_id" id="professor_id">
					<option value="">강사 선택</option>
						<c:forEach items="${professorList }" var="professor">
								<option value="${professor.professor_id }">${professor.professor_name }</option>
						</c:forEach>
				</select>
			</div>
		</div>
	</form>
</div>
<script>
	$('#subject_name').keyup(function() {
		if ($(this).val().length > $(this).attr('maxlength')) {
			alert('과목명은 20자 이내로 작성해야 합니다.');
			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
		}	
	});
	
	$('#registBtn').on('click', function(e) {
		var form = document.registForm;
		if (form.subject_name.value == "") {
			alert("제목은 반드시 입력해야 합니다.");
			return;
		}
		
		if ($('#subject_introduce').val().length > 400) {
			alert('과목소개는 최대 400자까지 작성 가능합니다.');
			return;
		}
		
		if (form.professor_id.value == "") {
			alert('담당교수 선택은 필수입니다.');
			return;
		}
		
		form.submit();
	});

	$('#cancelBtn').on('click', function(e) {
		location.href = "<%=request.getContextPath()%>/lecture/subject/list.do";
	});
</script>
