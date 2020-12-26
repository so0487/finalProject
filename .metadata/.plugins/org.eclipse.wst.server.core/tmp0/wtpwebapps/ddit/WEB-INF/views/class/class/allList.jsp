<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }" />

<body>

		<div class="content-body">
		
       <!-- Page Headings Start -->
        <div class="row justify-content-between align-items-center mb-10"  >

            <!-- Page Heading Start -->
            <div class="col-12 col-lg-auto mb-20" >
                <div class="page-heading">
                    <h3 class="title">회차목록</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
		
		<c:if test="${member.member_role eq 'ADMIN' }">
		<div style="z-index:1; position: absolute; top: 85px; right: 80px;">
			<button id="regBtn" style="border:1px solid #dddddd" class="btn btn-outline">
				<span>등록</span>
			</button>
		</div>
		</c:if>
		
		
		<div class="row">
			<div class="col-lg-12 mb-20">
	             <div class="box-body">
	                 <div class="tab-content">
	                 	<div id ="keyword" class="card-tools" style="width:600px;margin-bottom:10px;">
							<div class="input-group row">
							<select class="form-control col-md-4" name="perPageNum" id="perPageNum">
								<option value="10"> 정렬개수 </option>
								<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
								<option selected="selected" value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
								<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
							</select>
							<select class="form-control col-md-4" name="searchType" id="searchType">
								<option value="" ${pageMaker.cri.searchType eq ''? 'selected':''}>전체</option>
								<option value="n" ${pageMaker.cri.searchType eq 'n'? 'selected':''}>교육과정명</option>
								<option value="s" ${pageMaker.cri.searchType eq 's'? 'selected':''}>모집중 </option>
								<option value="ns" ${pageMaker.cri.searchType eq 'ns'? 'selected':''}>교육과정명+모집중</option>
							</select>
							<input class="form-control" type="text" name="keyword" style="width:150px;" placeholder="검색어를 입력하세요." value="${param.keyword }"/>       		
	                 		<span class="input-group-append">
	                 			<button style="border:1px solid #dddddd" class="btn btn-outline" type="button" onclick="searchList_go(1);" data-card-widget="search">
	                 				<i class="fa fa-fw fa-search"></i>
	                 			</button>
	                 		</span>
	                 	</div>
	                 </div>	                 			
	                     <div class="tab-pane fade show active">
	                         <table class="table">
	                               <thead>
	                                   <tr>
	                                       <th data-name="class_no" style="width:5%">번호</th>
	                                       <th data-name="class_number" style="width:25%">회차</th>
	                                       <th data-breakpoints="xs" data-name="class_recruitment_start" style="width:25%">회차 모집기간</th>
	                                       <th data-breakpoints="xs" data-name="class_recruitment_end" style="width:25%">수강기간</th>
	                                       <th data-breakpoints="xs" data-name="class_max" style="width:20%">모집인원</th>
	                                       <c:if test="${member.member_role eq'STUDENT'}">
	                                       <th data-breakpoints="xs" data-name="class_status" style="width:10%">상태</th>
	                                       </c:if>
	                                       <th></th>
	                                   </tr>
	                               </thead>
	                               <tbody>
										<c:forEach items="${classList }" var="classVO"  varStatus="status">
											<c:if test="${classVO.class_delete eq '0' }">
		                                   <tr>
		                                       <td>${status.count}</td>
		                                       <td><a href="javascript:location.href='../class/detail.page?class_no=${classVO.class_no}'">${classVO.curriculum_name} &nbsp;${classVO.class_number }차  </a></td>
		                                       <jsp:useBean id="today" class="java.util.Date" />
		                                       <fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
		                                       <fmt:formatDate var='start' value="${classVO.class_recruitment_start }"	pattern="yyyyMMdd" />
		                                       <fmt:formatDate var ='end' value="${classVO.class_recruitment_end }"	pattern="yyyyMMdd" />
		                                       <td><fmt:formatDate  value="${classVO.class_recruitment_start }"	pattern="yyyy-MM-dd" /> ~ <fmt:formatDate  value="${classVO.class_recruitment_end }"	pattern="yyyy-MM-dd" /></td>
		                                       <td><fmt:formatDate  value="${classVO.class_start_date}"	pattern="yyyy-MM-dd" /> ~ <fmt:formatDate  value="${classVO.class_end_date }"	pattern="yyyy-MM-dd" /></td>
		                                       
		                                       <td>${classVO.class_max }</td>
			                                       
		                                       <c:if test="${member.member_role eq'STUDENT'}">
			                                       <c:if test="${end-now >= 0 && now - start >=0}" >
			                                       <td><button class="badge badge-info" onclick="location.href='<%=request.getContextPath()%>/interview/list?keyword=${classVO.class_no}&searchType=class_no'" >신청하기</button></td>
			                                   	   </c:if>
			                                   	   <c:if test="${end-now <= 0 && now - start <=0}">
			                                       <td><button class="badge badge-primary" onclick="apply('${interview.interview_no}');" disabled="disabled">마감</button></td>
			                                   	   </c:if>
		                                   	   </c:if>
		                                   	   <c:if test="${member.member_role eq'ADMIN'}">
			                                       <td><button class="badge badge-outline badge-info" onclick="location.href='<%=request.getContextPath()%>/interview/list?keyword=${classVO.class_no}&searchType=class_no'" >지원자관리</button></td>
		                                   	   </c:if>
		                                   	   
		                                   </tr>
		                                   </c:if>
	                               		</c:forEach>
	                                 
	                                 
	                               </tbody>
	                           </table>
	                     </div>
	                     <div class="card-footer">
							<%@ include file="/WEB-INF/views/pagination/pagination.jsp" %>				
						</div>
	                 </div>
	             </div>
			</div>
			
		</div>
	
	</div><!-- content-body end -->
	
<script>


$('#regBtn').on('click',function(e){
	
	location.href="../../class/class/registForm.do";
});

</script>
</body>


    

