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
					<h3 class="title" style="text-align: left;">과목</h3>
				</div>
			</div>
			<!-- Page Heading End -->

		</div>
		<!-- Page Headings End -->

		<input type="hidden" name="subject_no" value="${subject.subject_no }" />
		<div class="row">
			<div class="col-lg-1 mb-20"
				style="width: 100%; text-align: center; margin-right: 0px; margin-top: 10px;">
				<h5>과목명</h5>
			</div>
			<div class="col-lg-5 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="text" class="form-control" name="subject_name"
					id="subject_name" value="${subject.subject_name}" readonly />
			</div>
			<div class="col-lg-1 mb-20" style="width:100%; text-align:center; margin-right:0px; margin-top:10px;" >
				<h5>담당교수</h5>
			</div>
			<div class="col-lg-5 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="text" class="form-control" name="professor_name" id="professor_name" value="${subject.professor_name}" readonly/>
			</div>
			<div class="col-lg-1 mb-20"
				style="width: 100%; text-align: center; margin-right: 0px; margin-top: 10px;">
				<h5>과목소개</h5>
			</div>
			<div class="col-lg-11 mb-20" style="width: 100%; margin-left: 0px;">
				<input type="text" class="form-control" name="subject_introduce"
					id="subject_introduce" value="${subject.subject_introduce}"
					readonly />
			</div>
		</div>

		<!-- button -->
		<div class="row" style="position:absolute; right:45px; top:30px;">
			<div >
				<c:if test="${loginUser.member_role eq 'ADMIN' || loginUser.member_role eq 'PROFESSOR'}">
					<button class="btn btn-outline" style="border:1px solid #dddddd;" id="modifyBtn">
						<span>수정</span>
					</button>
					<button class="btn btn-outline" style="border:1px solid #dddddd;" id="removeBtn">
						<span>삭제</span>
					</button>
				</c:if>
				<button class="btn btn-outline" style="border:1px solid #dddddd;" id="cancelBtn">
					<span>목록</span>
				</button>
			</div>
		</div>
	</div>
	<form role="form">
		<input type="hidden" name="subject_no" value="${subject.subject_no }" />
		<input type="hidden" name="subject_name" value="${subject.subject_name }" /> 
		<input type="hidden" name="subject_introduce" value="${subject.subject_introduce }" />
		<input type="hidden" name="professor_id" value="${subject.professor_id}" />
	</form>

	<script>
		var formObj = $("form[role='form']");

		$('#modifyBtn').on('click', function(event) {
			formObj.attr({
				'action' : 'modifyForm.do',
				'method' : 'post'
			});
			formObj.submit();
		});

		$("#removeBtn").on("click", function() {
			var chk = confirm("정말 삭제하시겠습니까?");
			if (chk) {
				formObj.attr({
					'action' : 'remove.do',
					'method' : 'post'
				});
			}
			formObj.submit();
		});


		$("#cancelBtn").on("click", function() {
			location.href = "list";
		});
	</script>

</body>
