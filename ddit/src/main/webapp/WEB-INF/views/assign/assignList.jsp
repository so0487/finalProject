<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="content-body">
    <div class="add-edit-product-wrap col-12" style="background-color: white; margin-top:-50px ">
	<!-- Page Headings Start -->
	<div class="row justify-content-between align-items-center mb-10">

		<!-- Page Heading Start -->
		<div class="col-12 col-lg-auto mb-20">
			<div class="page-heading">
				<h3 class="title">과제관리</h3>
			</div>
		</div>
		<!-- Page Heading End -->
		<!-- button -->
		<c:if test="${loginUser.member_role eq 'PROFESSOR'}">
		<div style="z-index: 1; position: absolute; top: 85px; right: 30px;">
			<button style="border:1px solid #dddddd" class="btn btn-outline"
				onclick="location.href='<%=request.getContextPath()%>/	assign/registForm?lecture_no=${lecture_no }'">
				<span>등록</span>
			</button>
		</div>
		</c:if>
		<c:if test="${loginUser.member_role eq 'STUDENT'}">
		<div style="z-index: 1; position: absolute; top: 85px; right: 30px;">
			<button style="border:1px solid #dddddd" class="btn btn-outline"
				onclick="location.href='<%=request.getContextPath()%>/assign/studentList?lecture_no=${lecture_no }'">
				<span>과제함</span>
			</button>
		</div>
		</c:if>
	</div>
	<!-- Page Headings End -->

	<div class="row">
		<div class="col-lg-12 mb-20">
			<div class="box-body">
				<div class="tab-content">
					<div id="keyword" class="card-tools" style="width:600px; margin-bottom:10px;">
						<div class="input-group row">

							<!-- sort num -->
							<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
								<option value="10">정렬개수</option>
								<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
								<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
								<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
							</select> 
							<select class="form-control col-md-4" name="searchType" id="searchType">
								<option value="nc" ${pageMaker.cri.searchType eq 'nc' ? 'selected':'' }>전 체</option>
								<option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected':'' }>과제명</option>
								<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>과제내용</option>
								
							</select> 
							<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" /> 
							<span class="input-group-append">
								<button class="btn btn-outline" style="border:1px solid #dddddd" type="button" onclick="searchList_go(1);" data-card-widget="search">
									<i class="fa fa-fw fa-search"></i>
								</button>
							</span>
						</div>
					</div>

						<table class="table">
							<thead>
								<tr>
									<th>번호</th>								
									<th>과제명</th>									
									<th>총점</th>
									<th>반영비율</th>
									<th>과제제출기한</th>
									<th>등록날짜</th>
									<c:if test="${loginUser.member_role eq 'STUDENT'}">
										<th>제출</th>
									</c:if>
									<c:if test="${loginUser.member_role eq 'PROFESSOR'}">
										<th>제출확인</th>
									</c:if>
								</tr>
							</thead>

							<c:forEach items="${assignList}" var="assign" varStatus="status">
								<tbody>
									<tr>
										<td>${status.count }</td>
										<td><a href="javascript:location.href='<%=request.getContextPath() %>/assign/detail?assignment_no=${assign.assignment_no }'">${assign.assignment_name}</a></td>									
										<td>${assign.assignment_score }</td>										
										<td>${assign.assignment_ratio }</td>
										<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${assign.assignment_end_date }"/></td>
										<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${assign.assignment_reg_date }"/></td>
										
										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />             <%-- 오늘날짜 --%>
										<fmt:formatDate value="${assign.assignment_end_date}" pattern="yyyyMMdd" var="endDate"/>       <%-- 시작날짜 --%>
										<c:if test="${loginUser.member_role eq 'STUDENT'}">
										<td>
											<c:if test="${nowDate<=endDate}">
												<a href="#" onClick=selectSubmit("${assign.assignment_no }");return false;>제출하기</a>
											</c:if>
										</td>
										</c:if>
										<c:if test="${loginUser.member_role eq 'PROFESSOR'}">
										<td>
											<a href="#" onClick=selectCheckAssign("${assign.assignment_no }");return false;>확인하기</a>
										</td>
										</c:if>
									</tr>
								</tbody>

							</c:forEach>

						</table>

					<div class="card-footer">
						<%@include file="/WEB-INF/views/pagination/assign_pagination.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<script>
	function selectSubmit(ele){
		location.href="studentRegistForm?assignment_no="+ele;
	}
	
	function selectCheckAssign(ele){
		location.href="submitList?assignment_no="+ele;
	}
</script>