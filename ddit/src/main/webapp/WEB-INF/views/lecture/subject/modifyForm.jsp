<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
	<div class="content-body">

		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">

			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title" style="text-align: left;">과목 수정</h3>
				</div>
			</div>
			<!-- Page Heading End -->
			<!-- button -->
			<div style="position: absolute; top: 25px; right: 62px;">
				<button class="btn btn-outline" style="border:1px solid #dddddd;" id="modifyBtn">
					<span>수정</span>
				</button>
				<button class="btn btn-outline" style="border:1px solid #dddddd;" id="cancelBtn">
					<span>취소</span>
				</button>
			</div>
		</div>
		<!-- Page Headings End -->

		<form role="form" method="post" action="modify.page" name="modifyForm" >
		<input type="hidden" name="subject_no" value="${subject.subject_no }" />	
		<c:forEach items="${professor }" var="professor">
			<input type="hidden" id="prof_id" name="prof_id" value="${professor.professor_id }" />
		</c:forEach>
			<div class="row">
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
					<h5>과목명</h5>
				</div>
				<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
					<input type="text" class="form-control" name="subject_name"
						id="subject_name" value="${subject.subject_name }">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-1 mb-20"
					style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
					<h5>과목소개</h5>
				</div>
				<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
					<input type="text" class="form-control" name="subject_introduce"
						id="subject_introduce" value="${subject.subject_introduce }">
				</div>
			</div>
			<div class="row">
			<div class="col-lg-1 mb-20" style="width: 100%; text-align: center; margin-right: 0px; margin-top: 15px;">
				<h5>담당교수</h5>
			</div>
			<div class="col-lg-9 mb-20" style="width: 100%; margin-left: 0px;">
				<select class="form-control" name="professor_id" id="professor_id">
					<c:forEach items="${professorList }" var="professor">
						<c:if test="${subject.subject_no eq professor.subject_no }" >
							<option selected value="${professor.professor_id}">${professor.professor_name}</option>
						</c:if>
						<c:if test="${professor.subject_no eq null }">
							<option value="${professor.professor_id }">${professor.professor_name }</option>
						</c:if>
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
				return;
			}	
		});
	
		$('#modifyBtn').on('click', function(e) {
			var form = document.modifyForm;
				if (form.subject_name.value == "") {
				alert("입력하지 않은 항목이 있습니다.");
				return;
			}
			
			if ($('#subject_introduce').val().length > 400) {
				alert('과목소개는 최대 400자까지 작성 가능합니다.');
				return;
			}
			form.submit();
		});
		$('#cancelBtn').on('click', function(e) {
			location.href = "detail.page?subject_no=${subject.subject_no}";
		});
	</script>