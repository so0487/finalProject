<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="content-body">
		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">
	
			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title">개선 및 제안</h3>
				</div>
			</div>
			<!-- Page Heading End -->
			<!-- button -->
			<div style="z-index: 1; position: absolute; top: 92px; right: 30px;">
				<button class="btn btn-outline" style="border:1px solid #dddddd;"
					onclick="location.href='<%=request.getContextPath()%>/board/imp/registForm'">
					<span>등록</span>
				</button>
			</div>
		</div>
		<!-- Page Headings End -->
	
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
									<option value="" ${pageMaker.cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
									<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제	목</option>
									<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
									<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>내	용</option>
									<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제 목 + 내 용</option>
									<option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected':'' }>작성자 + 내 용</option>
								</select> 
								<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }" /> 
								<span class="input-group-append">
									<button class="btn btn-outline" style="border:1px solid #dddddd;" type="button"
											onclick="searchList_go(1);" data-card-widget="search">
											<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
						<div class="tab-pane fade show active" id="course">
							<table class="table">
								<thead>
									<tr>
										<th data-name="post_no">번호</th>
										<th data-name="post_title">제목</th>
										<th data-breakpoints="xs" data-name="post_writer">작성자</th>
										<th data-breakpoints="xs" data-name="post_reg_date">작성일자</th>
										<th data-breakpoints="xs" data-name="post_update_date">수정일자</th>
										<th data-breakpoints="xs" data-name="viewcnt">조회수</th>
									</tr>
								</thead>
	
								<c:forEach items="${postList}" var="post">
									<tbody>
										<tr>
											<c:set var="post_no" value="${post.post_no }" />
											<c:set var="post_no_detail"
												value="${fn:substring(post_no, 8, 12)}" />
											<td style="width:10%">${post_no_detail }</td>
											<td style="width:50%"><a href="javascript:location.href='<%=request.getContextPath() %>/board/imp/detail.page?post_no=${post.post_no}'">${post.post_title}</a></td>
											<td style="width:10%">${post.post_writer}</td>
											<td style="width:10%"><fmt:formatDate value="${post.post_reg_date}" pattern="yyyy-MM-dd" /></td>
											<td style="width:10%"><fmt:formatDate value="${post.post_update_date}" pattern="yyyy-MM-dd" /></td>
											<td style="width:10%">${post.post_viewcnt}</td>
										</tr>
									</tbody>
	
								</c:forEach>
	
							</table>
						</div>
						<div class="card-footer">
							<%@include file="/WEB-INF/views/pagination/board_pagination.jsp"%>
						</div>
					</div>
				</div>
			</div>
	
		</div>
	</div>
