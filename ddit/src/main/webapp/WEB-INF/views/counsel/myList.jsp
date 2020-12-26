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
                    <h3 class="title">상담일정</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
        <div style="z-index:1; position: absolute; top: 85px; right: 30px;">
			<button id="backBtn" name="backBtn" style="border:1px solid #dddddd" class="btn btn-outline" type="button">
				<span>뒤로가기</span>
			</button>
		</div>
		
		<div class="row">
			<div class="col-lg-12 mb-20">
	             <div class="box-body">
	                 <div class="tab-content">
	                 	<div id ="keyword" class="card-tools" style="width:600px;margin-bottom:10px;">
							<div class="input-group row">
							
							<select class="form-control col-md-4" name="perPageNum" id="perPageNum">
								<option value="10"> 정렬개수 </option>
								<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
								<option value="15" ${cri.perPageNum == 15 ? 'selected':''}>15개씩</option>
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
	                 			<button class="btn btn-outline" style="border:1px solid #dddddd" type="button" onclick="searchList_go(1);" data-card-widget="search">
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
	                                       <c:if test="${member.member_role eq 'ADMIN' || member.member_role eq 'PROFESSOR' }">
	                                       <th data-name="councel_no">내담자</th>
	                                       </c:if>
	                                       <c:if test="${member.member_role eq 'STUDENT'  }">
	                                       <th data-name="councel_no">상담자</th>
	                                       </c:if>
	                                       <th data-name="counsel_start">상담시작시간</th>
	                                       <th data-name="counsel_end">상담종료시간</th>
	                                       <th data-breakpoints="xs" data-name="curriculum_time">상담제목</th>
	                                        <c:if test="${member.member_role eq 'ADMIN' || member.member_role eq 'PROFESSOR' }">
	                                       <th data-breakpoints="xs" data-name="curriculum_certificate">신청여부</th>
	                                       </c:if>
	                                        <c:if test="${member.member_role eq 'STUDENT'}">
	                                        	<c:if test="${member.member_role eq 'STUDENT'}">
	                                       			<th data-breakpoints="xs" data-name="curriculum_certificate" >신청</th>
	                                       		</c:if>
	                                       </c:if>
	                                   </tr>
	                               </thead>
	                               <tbody>
										<c:forEach items="${counselList }" var="counsel" varStatus="status">
											<c:if test="${counsel.counsel_status eq '0' }">
			                                   <tr>
			                                       <td>${status.count} <input type="hidden" value="${counsel.counsel_no}" name="counsel_no"> </td>
<%-- 			                                       <td><a href="javascript:location.href='detail/list.do?keyword=${curriculum.curriculum_no}&searchType=curriculum_no'">${curriculum.curriculum_name }</a></td> --%>
													<c:if test="${member.member_role eq 'ADMIN' || member.member_role eq 'PROFESSOR' }">
														<c:if test="${counsel.counsel_student eq null}">
					                                       <td>신청 대기중</td>
		                                       			</c:if>
														<c:if test="${counsel.counsel_student ne null}">
					                                       <td><a href="">${counsel.counsel_student }</a></td>
		                                       			</c:if>
	                                       			</c:if>
			                                        <c:if test="${member.member_role eq 'STUDENT'  }">
				                                       <td><a href="">${counsel.counsel_professor }</a></td>
				                                    </c:if>
			                                       <td><a href="">${counsel.counsel_start}</a></td>
			                                       <td>${counsel.counsel_end }</td>
			                                       <td>${counsel.counsel_title }</td>
			                                       <c:if test="${member.member_role eq 'ADMIN' || member.member_role eq 'PROFESSOR' }">
			                                       		<jsp:useBean id="now" class="java.util.Date" />
			                                       			<c:if test="${now < counsel.counsel_end}">
				                                       <td><button class="badge badge-outline badge-primary" id="goBtn" name="goBtn">참여</button></td>
				                                       		</c:if>
				                                       		
			                                       			<c:if test="${now > counsel.counsel_end}">
				                                       <td><button class="badge badge-outline badge-primary" id="goBtn" name="goBtn" disabled="disabled">상담종료</button></td>
				                                       		</c:if>
	                                       			</c:if>
	                                       			
			                                        <c:if test="${member.member_role eq 'STUDENT'  }">
<%-- 			                                        	<c:if test="${counsel.counsel_student eq null }"> --%>
<!-- 				                                       		<td><a href=""><button type="button" class="button button-info" id="applyBtn" name ="applyBtn">신청</button></a></td> -->
<%-- 				                                    	</c:if> --%>
<%-- 			                                        	<c:if test="${counsel.counsel_student ne null }"> --%>
			                                       			<c:if test="${now < counsel.counsel_end}">
				                                       			<td><a href=""><button type="button" class="button button-info"  style="background-color: gray;" >신청마감</button></a></td>
				                                    		</c:if>
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
	
	
<script src="<%=request.getContextPath() %>/resources/js/moment.js"></script>
<script>



	

$('button[name="applyBtn"]').on('click',function(e){
	
	$.ajax({
		type:"POST",
		url :"<%= request.getContextPath() %>/counsel/go/counsel.do",
		data : {
				counsel_no :$('input[name="counsel_no"]').val()
		},
	
	success:function(result){
		alert("신청되었습니다.");		
	},
	error:function(error){
		alert('신청 실패했습니다.');		
	},
	complete:function(){
		location.reload(true);
	}
});
});

$('button[name="backBtn"]').on('click',function(e){
	history.go(-1);
});



$('button[name="goBtn"]').on('click',function(e){
	
	$.ajax({
		type:"POST",
		url :"<%=request.getContextPath() %>/counsel/goZoom.do",
		data : {
				counsel_no :$('input[name="counsel_no"]').val()
		},

		success:function(result){
			alert(result);
			location.href=result;
		},
		error:function(error){
			alert('신청 실패했습니다.');		
		},
		complete:function(){
				
		}
	
	
});
});

</script>

</body>


    

