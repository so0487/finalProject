<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-body">
	
		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">
	
			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title">과목 관리</h3>
				</div>
			</div>
			<!-- Page Heading End -->
			<!-- button -->
			<div style="z-index: 1; position: absolute; top: 92px; right: 30px;">
				<c:if test="${loginUser.member_role eq 'ADMIN' || loginUser.member_role eq 'PROFESSOR'}">
					<button class="btn btn-outline" style="border:1px solid #dddddd;" onclick="location.href='<%=request.getContextPath()%>/lecture/subject/registForm'">
						<span>등록</span>
					</button>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 mb-20">
				<div class="box-body">
					<div class="tab-content">
						<div id="keyword" class="card-tools" style="width:600px; margin-left:15px; margin-bottom:10px;">
							<div class="input-group row">
	
								<!-- sort num -->
								<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
									<option value="10">정렬개수</option>
									<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
									<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
									<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
								</select> 
								<select class="form-control col-md-4" name="searchType" id="searchType">
									<option value="" ${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>전 체</option>
									<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>과목명</option>
									<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>과목소개</option>
									<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>과목명 + 과목소개</option>
								</select> 
								<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" /> 
								<span class="input-group-append">
									<button class="btn btn-outline" style="border:1px solid #dddddd;" type="button" onclick="searchList_go(1);" data-card-widget="search">
											<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
						<div class="tab-pane fade show active" id="course">
							<table class="table">
								<thead>
									<tr>
										<th style="width:10%" data-name="subject_no">번호</th>
										<th style="width:20%" data-name="subject_name">과목명</th>
										<th style="width:50%" data-name="subject_introduce">과목소개</th>
										<th style="width:20%" data-name="professor_name">담당교수</th>
									</tr>
								</thead>
	
								<tbody>
									<c:forEach items="${subjectList }" var="subjectRequest">
										<c:if test="${subjectRequest.SUBJECT_STATUS eq '0' }">
											<tr>
												<td><a href="javascript:location.href='detail.page?subject_no=${subjectRequest.SUBJECT_NO }'">${subjectRequest.SUBJECT_NO }</a></td>
												<td><a href="javascript:location.href='detail.page?subject_no=${subjectRequest.SUBJECT_NO }'">${subjectRequest.SUBJECT_NAME }</a></td>
												<td><a href="javascript:location.href='detail.page?subject_no=${subjectRequest.SUBJECT_NO }'">${subjectRequest.SUBJECT_INTRODUCE }</a></td>
												<td>${subjectRequest.PROFESSOR_NAME }</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
	
							</table>
						</div>
						<div class="card-footer">
							<%@include file="/WEB-INF/views/pagination/pagination.jsp"%>
						</div>
					</div>
				</div>
			</div>
	
		</div>
	</div>
<form role="form">
	<input type="hidden" name="subject_no" value="${subject.subject_no }" />
	<input type="hidden" name="subject_name" value="${subject.subject_name }" /> 
	<input type="hidden" name="subject_introduce" value="${subject.subject_introduce }" />
	<input type="hidden" name="professor_id" value="${subjectRequest.professor_id }"/>
</form>

