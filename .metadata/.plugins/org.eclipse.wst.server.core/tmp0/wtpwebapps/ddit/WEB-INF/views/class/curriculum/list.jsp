<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }" />

<body>

		<div class="content-body">
		
       <!-- Page Headings Start -->
        <div class="row justify-content-between align-items-center mb-10">

            <!-- Page Heading Start -->
            <div class="col-12 col-lg-auto mb-20">
                <div class="page-heading">
                    <h3 class="title">교육과정</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
        
       	<div style="z-index:1; position: absolute; top: 85px; right: 30px;">
			<button id="regBtn" style="border:1px solid #dddddd" class="btn btn-outline">
				<span>등록</span>
			</button>
		</div>
		
		<div class="row">
			<div class="col-lg-12 mb-20">
	             <div class="box-body">
	                 <div class="tab-content">
	                 	<div id ="keyword" class="card-tools" style="width:600px;margin-bottom:10px;">
							<div class="input-group row">
							
							<select class="form-control col-md-4" name="perPageNum" id="perPageNum">
								<option value="5"> 정렬개수 </option>
								<option  value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
								<option selected="selected" value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
								<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
							</select>
							<select class="form-control col-md-4" name="searchType" id="searchType">
								<option value="" ${pageMaker.cri.searchType eq ''? 'selected':''}>전체</option>
								<option value="i" ${pageMaker.cri.searchType eq 'i'? 'selected':''}>교육과정번호</option>
								<option value="n" ${pageMaker.cri.searchType eq 'n'? 'selected':''}>교육과정명</option>
								<option value="in" ${pageMaker.cri.searchType eq 'in'? 'selected':''}>교육과정번호+교육과정명</option>
							</select>	         
							<input class="form-control" type="text" name="keyword" style="width:150px;" placeholder="검색어를 입력하세요." value="${param.keyword }"/>       		
	                 		<span class="input-group-append">
	                 			<button class="btn btn-outline" style="border:1px solid #dddddd"  type="button" onclick="searchList_go(1);" data-card-widget="search">
	                 				<i class="fa fa-fw fa-search"></i>
	                 			</button>
	                 		</span>
	                 	</div>
	                 </div>
	                     <div class="tab-pane fade show active">
	                         <table class="table">
	                               <thead>
	                                   <tr>
	                                       <th data-name="councel_no">번호</th>
	                                       <th data-name="counsel_start">교육과정명</th>
	                                       <th data-name="counsel_end">훈련시간</th>
	                                       <th data-breakpoints="xs" data-name="curriculum_time">관련 자격증</th>
	                                   </tr>
	                               </thead>
	                               <tbody>
										<c:forEach items="${curriculumList }" var="curriculum" varStatus="status">
											<c:if test="${curriculum.curriculum_status eq '0' }">
			                                   <tr>
			                                       <td>${status.count}</td>
			                                       <td><a href="javascript:location.href='detail/list.do?keyword=${curriculum.curriculum_no}&searchType=curriculum_no'">${curriculum.curriculum_name }</a></td>
			                                       <td>${curriculum.curriculum_time }시간</td>
			                                       <td>${curriculum.curriculum_certificate }</td>
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
		        
		        <!-- button -->
<!-- 		        <div class="col-lg-9 mb-20"></div> -->
		        
<!-- 		        <div class="col-lg-3 mb-20"> -->
					
<!-- 					<button id="regBtn" class="button button-info"> -->
<!-- 						<span>등록</span> -->
<!-- 					</button>	 -->
					
<!-- 				</div>              -->
			
		</div>
	
	</div><!-- content-body end -->
	
	
	
<script>


$('#regBtn').on('click',function(e){
	
	location.href="registForm.do";
});

</script>

</body>


    

