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
					<h3 class="title" style="text-align: left;">자유게시판</h3>
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
						<c:if test="${loginUser.member_role eq 'ADMIN' || loginUser.member_id eq post.post_writer}">
							<button class="btn btn-outline" style="border:1px solid #dddddd;" id="modifyBtn"
								style="margin-left: 4px;">
								<span>수정</span>
							</button>
							<button class="btn btn-outline" style="border:1px solid #dddddd;" id="removeBtn">
								<span>삭제</span>
							</button>
						</c:if>
						<button class="btn btn-outline" style="border:1px solid #dddddd;" id="listBtn">
							<span>목록</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- freeBoard제목 END -->
	
		<!-- freeBoard 내용 -->
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
		<!-- freeBoard 내용 END -->
	
		<!-- 댓글 -->
		<div class="row">
			<div class="col-12">
				<div class="box">
					<div class="timeline">
						<div class="" id="repliesDiv">
							<div class="replyLi" data-reply_no={{reply_no}}></div>
						</div>
						<input type="hidden" id="newreply_writer" name="newreply_writer">
						<input type="hidden" id="newreply_no" name="newreply_no">
						<div class="text-center">
							<ul id="pagination" class="pagination justify-content-center m-0"></ul>
						</div> 
					</div>
				</div>
				<div>
					<input type="text" placeholder="댓글을 작성해주세요." id="newreply_content" name="newreply_content" class="form-control" style="display: inline-block; margin:0 auto; width:90%;" maxlength="300" />
					<button class="submit button button-box button-round button-primary" id="replyAddBtn" style="position:absolute; right:42px; bottom:-2px;">
						<i class="zmdi zmdi-mail-send"></i>
					</button>
				</div>	
			</div>
		</div>
		<!-- 댓글 END -->
		<!-- Modal -->
		<div class="modal fade" id="exampleModal5" >
			<div class="modal-dialog modal-dialog-centered" style="position:absolute; top:-100px; left:250px;">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title"></h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" data-reply_no>
						<div class="form-group">
							<input type="text" class="form-control" id="reply_content" style="text-align:left; margin: 0 auto;" maxlength="300">
						</div>
					</div>
					<div class="modal-footer" >
						<button class="button button-primary" data-dismiss="modal" id="replyModBtn">수정</button>
						<button class="button button-danger" data-dismiss="modal" id="replyDelBtn">삭제</button>
						<button class="button button-info" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- modalEND -->
	</div>	
</div>
<!-- content-body END -->




<form role="form">
	<input type="hidden" name="post_no" value="${post.post_no}" />
</form>

<script>
	$(document).ready(function() {
		$('#reply_content').keyup(function() {
			if ($('#reply_content').val().length > $('#reply_content').attr('maxlength')) {
				alert('글자수 제한을 초과하였습니다. 댓글은 1000자 이내로 작성 가능합니다.');
				$('#reply_content').val($('#reply_content').val().substring(0, $('#reply_content').attr('maxlength')));
			}
		});
	});
	
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
		location.href="<%=request.getContextPath()%>/board/free/list.do?board=free&board_no=BOARD002";
	});
</script>

<%@include file="/WEB-INF/views/board/free/reply_js.jsp"%>