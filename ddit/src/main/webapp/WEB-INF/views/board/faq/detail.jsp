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
					<h3 class="title" style="text-align: left;">자주 묻는 질문</h3>
				</div>
			</div>
			<!-- Page Heading End -->
		</div>
		<!-- Page Headings End -->
	
		<!-- freeBoard제목 -->
		<div class="row">
			<div class="col-12">
				<div class="box">
					<div class="box-head" style="display: inline-block; margin: 0 auto;">
						<h3 class="title">${post.post_title}</h3>
						<a>작성자 : </a> <a>${post.post_writer}</a> &nbsp;&nbsp; <a>|</a> <a>
							작성일자 : </a> <a>${post.post_reg_date}</a> &nbsp;&nbsp; <a>|</a> <a>
							수정일자 : </a> <a>${post.post_update_date}</a> &nbsp;&nbsp; <a>|</a> <a>
							조회수 : </a> <a>${post.post_viewcnt }</a>
					</div>
					<div style="z-index: 1; position: absolute; bottom: 20px; right: 40px; margin-top: 20px;">
						<c:if test="${loginUser.member_role eq 'ADMIN'}">
							<button class="btn btn-outline" style="border:1px solid #dddddd;" id="modifyBtn"
								style="margin-left: 4px;">
								<span>수정</span>
							</button>
							<button class="btn btn-outline" style="border:1px solid #dddddd;" id="removeBtn">
								<span>삭제</span>
							</button>
						</c:if>	
						<button class="button button-info" id="listBtn">
							<span>목록</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- faqBoard 제목 END -->
	
		<!-- faqBoard 내용 -->
		<div class="row">
			<div class="col-12">
				<div class="box">
					<div class="box-body" style="background-color: white;">
						<h5>내용</h5>
						<div class="content">${post.post_content}</div>
					</div>
				</div>
			</div>
		</div>
		<!-- faqBoard 내용 END -->
	</div>	
</div>
<!-- content-body END -->




<form role="form">
	<input type="hidden" name="post_no" value="${post.post_no}" />
</form>

<script>
	var formObj = $("form[role='form']");

	$('#modifyBtn').on('click', function(evnet) {
		//alert('modify btn click');
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

	$("#listBtn").on("click", function() {
		location.href="<%=request.getContextPath()%>/board/faq/list.do?board=faq&board_no=BOARD004";
	});
</script>

