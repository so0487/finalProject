<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@include file="/WEB-INF/views/include/open_header.jsp"%>





<!--Basic Tab Start-->
<div class="col-lg-6 col-12 mb-30">
	<div class="box">
		<div class="box-head">
			<h4 class="title">메시지 보내기</h4>
		</div>
		<div class="box-body">
			<div id="keyword" class="card-tools" style="width: 600px; margin-bottom: 10px;">
				<div class="input-group row">
					<select class="form-control col-md-4" name="perPageNum"	id="perPageNum">
						<option value="10">정렬개수</option>
						<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
						<option value="15" ${cri.perPageNum == 15 ? 'selected':''}>15개씩</option>
						<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>

					</select> <select class="form-control col-md-4" name="searchType" id="searchType">
						<option value=""${pageMaker.cri.searchType eq '' ? 'selected':'' }>전 체</option>
						<option value="n"${pageMaker.cri.searchType eq 'n' ? 'selected':'' }>이 름</option>
						<option value="i"${pageMaker.cri.searchType eq 'i' ? 'selected':'' }>아이디</option>
						<option value="m"${pageMaker.cri.searchType eq 'm' ? 'selected':'' }>이메일</option>
						<option value="nim"${pageMaker.cri.searchType eq 'nim' ? 'selected':'' }>이름,아이디,이메일</option>
					</select>
					<input class="form-control" type="text" name="keyword" style="width: 150px;" placeholder="검색어를 입력하세요." maxlength="20" value="${param.keyword }" /> <span class="input-group-append">
						<button class="btn btn-primary" type="button" onclick="searchList_go(1);" data-card-widget="search">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
				</div>
			</div>
				<!-- 관리자 -->
				<ul class="nav nav-tabs mb-15">
					<li class="nav-item"><a class="nav-link" onclick="location.href='<%=request.getContextPath()%>/message/member/admin'">관리자</a></li>
					<li class="nav-item"><a class="nav-link" onclick="location.href='<%=request.getContextPath()%>/message/member/professor'">교수</a></li>
					<li class="nav-item"><a class="nav-link" onclick="location.href='<%=request.getContextPath()%>/message/member/student'">학생</a></li>
				</ul>
				<div class="tab-content">
					<div class="modal-body">
						<div class="form-group">
							<table class="table footable">
								<thead>
									<tr>
										<th><input type="checkbox" class="allselect" id="allselect"></th>
										<th data-name="member_id">아이디</th>
										<th data-name="member_name">이름</th>
										<th data-name="member_role">권한</th>
									</tr>
								</thead>

								<c:forEach items="${professorList}" var="professorList"	varStatus="status">
									<c:if test="${professorList.member_role eq 'PROFESSOR'}">
										<tbody>
											<tr>
												<th><input type="checkbox" name="member" id="member" class="member" value="${professorList.member_id}"></th>
												<td>${professorList.member_id}</td>
												<td>${professorList.member_name}</td>
												<td>${professorList.member_role}</td>
											</tr>
										</tbody>
									</c:if>
								</c:forEach>
							</table>
							<div class="modal-footer">
								<input type="hidden" id="checkArr" name="checkArr">
								<button class="button button-danger" data-dismiss="modal">닫기</button>
								<input type="button" class="button button-primary" id="memberSelect" value="선택완료">
							</div>
							<div class="card-footer">
								<%@include file="/WEB-INF/views/pagination/messageProfessor_pagination.jsp" %>
							</div>
						</div>
					</div>
				</div>
			
			
				

				
				
				
				
				
				
			</div>
		</div>
	</div>
</div>
<!--Basic Tab End-->







<script>


$('.member_role').on('click',function(){
	alert($(this).val());
});


$(document).on('click','.role',function(){
	alert($(this).val());
})


$(document).on('click', '.allselect', function() {


if($('.allselect').is(":checked")){
	$(this).parent().parent().parent().parent().children('tbody').children('tr').children('th').children('#member').attr('checked', true);
}else{
	$(this).parent().parent().parent().parent().children('tbody').children('tr').children('th').children('#member').attr('checked', false);
}



});


$('div #memberSelect').on('click', function() {
	
var checkArr = new Array();

$("input[name=member]:checked").each(function(){
	checkArr.push($(this).val());
	
	//alert(checkArr);
	opener.document.getElementById('message_receiver').value = checkArr;
	window.close();
	
});
	

}); 

</script>
