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
	</div>
	<!-- Page Headings End -->

	<!-- improvement and suggestions 제목 -->
	<div class="row">
		<div class="col-12">
			<div class="box">
				<div class="box-head" style="display: inline-block; margin: 0 auto;">
					<h3 class="title">${assignHistory.assignment_history_name}</h3>				
				</div>
				<div style="z-index: 1; position: absolute; bottom: 20px; right: 40px; margin-top: 20px;">
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />             <%-- 오늘날짜 --%>
					<fmt:formatDate value="${assign.assignment_end_date}" pattern="yyyyMMdd" var="endDate"/>       <%-- 시작날짜 --%>
					<c:if test="${loginUser.member_role eq 'STUDENT'}">
						<c:if test="${nowDate<=endDate}">					
						<button style="border:1px solid #dddddd; margin-left: 4px;" class="btn btn-outline" id="modifyBtn">
							<span>수정</span>
						</button>
						<button style="border:1px solid #dddddd" class="btn btn-outline" id="removeBtn">
							<span>삭제</span>
						</button>
						</c:if>
					</c:if>	
					<c:if test="${loginUser.member_role eq 'STUDENT'}">
					<button style="border:1px solid #dddddd" class="btn btn-outline" id="listBtn">
						<span>목록</span>
					</button>
					</c:if>
					<c:if test="${loginUser.member_role eq 'PROFESSOR'}">
					<button style="border:1px solid #dddddd" class="btn btn-outline" type="button"
						onclick="location.href='javascript:history.go(-1)'">
						<span>뒤로</span>
					</button>
					</c:if>
				</div>
				
<!-- 			과제	채점하기 -->
				<c:if test="${loginUser.member_role eq 'PROFESSOR'}">
				<div style="z-index: 1; position: absolute; bottom: 20px; right: 240px; margin-top: 20px;">
					<form action="modifyStudentScore.do" method="post">
					<div style="font-size:20px;">점수 : 
					<c:if test="${assignHistory.assignment_history_score eq '-1'}">
					<input type="number" maxlength="3"  oninput="maxLengthCheck(this)" class="pointBox" name="assignment_history_score" value="0">
					</c:if>
					<c:if test="${assignHistory.assignment_history_score ne '-1'}">
					<input type="number" maxlength="3"  oninput="maxLengthCheck(this)" class="pointBox" name="assignment_history_score" value="${assignHistory.assignment_history_score }">
					</c:if>
					
					/<input type="text" readonly class="pointBox" name="assignment_score" value="${assign.assignment_score }">
					<button><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></div>
					<input type="hidden" name="assignment_history_no" value="${assignHistory.assignment_history_no }">
					<input type="hidden" name="assignment_no" value="${assignHistory.assignment_no }">
										
					</form>
				</div>		
				</c:if>		
			</div>
		</div>
	</div>
	<!-- improvement and suggestions 제목 END -->
	
	<!-- improvement and suggestions 내용 -->
	<div class="row">
		<div class="col-12">
			<div class="box">
				<div class="box-body" style="background-color: white;">
					<h5>내용</h5>
					<div class="content">${assignHistory.assignment_history_content}</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="attachment">
		<div class="box">
			<div class="box-body">
				<h5 class="title">첨부파일:</h5>
			</div>
			<div class="content" style="margin-left: 20px;">				
				<c:if test="${!empty assignHistory.attachList }">
					<c:forEach items="${assignHistory.attachList}" var="attach" varStatus="c">						
						<div class="row" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/assign/attach/getFile.do?attach_no=${attach.attach_no}';">
							<span class="fa fa-download">${attach.attach_original_name}</span> <br>
						</div>
					</c:forEach>
				</c:if>
			
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal5">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" data-reply_no>
					<div class="form-group">
						<input type="text" class="form-control" id="reply_content" style="text-align: left; margin: 0 auto;">
					</div>
				</div>
				<div class="modal-footer">
					<button class="button button-info" data-dismiss="modal">닫기</button>
					<button class="button button-primary" id="replyModBtn">수정</button>
					<button class="button button-danger" id="replyDelBtn">삭제</button>

				</div>
			</div>
		</div>
	</div>
	<!-- modalEND -->
	</div>
</div>
<!-- content-body END -->




<form role="form">
	<input type="hidden" name="assignment_history_no" value="${assignHistory.assignment_history_no}" />
	<input type="hidden" name="lecture_no" value="${assignHistory.lecture_no}" />
	
</form>

<script>
	function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	
	$('input[name=assignment_history_score]').change(function(){
		if($('input[name=assignment_history_score]').val()>${assign.assignment_score }){
			alert("점수가 최대점수를 초과하였습니다.");
			$('input[name=assignment_history_score]').val("");
		}
	});

	var formObj = $("form[role='form']");

	$('#modifyBtn').on('click', function() {

		//alert('modify btn click');
		formObj.attr({
			'action' : 'studentModifyForm.do',
// 			'method' : 'post'
		});
		formObj.submit();
	});

	$("#removeBtn").on("click", function() {
		formObj.attr({
			'action' : 'studentRemove.do',
			'method' : 'post'
		});
		formObj.submit();
	});

	$("#listBtn").on("click", function() {
		location.href="<%=request.getContextPath()%>/assign/studentList.do?lecture_no=${assignHistory.lecture_no}";
	});
</script>

<style>
	.pointBox{
		width:45px;
		margin-right:10px;
		margin-bottom:5px;
		border:none;
		border-bottom : 1px solid #dadce0;
	}
	
/* 	넘버타입 값조절칸 지우기 */
	input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	
	button{
		padding-top:15px;
		background: none;
		border:none;
	}

</style>

<%-- <%@include file="/WEB-INF/views/board/pds/reply_js.jsp"%> --%>