<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class="content-body">
	
		<c:if test="${loginUser.member_role eq 'STUDENT' || loginUser.member_role eq 'PROFESSOR'}">
		<div style="z-index:1; position: absolute; top: 85px; right: 30px;">
			<button style="border:1px solid #dddddd" class="btn btn-outline" onclick="location.href='list/mylist?'">
				<span>나의면접</span>
			</button>
		</div>
		</c:if>
		<!-- Page Headings Start -->
		<div class="row justify-content-between align-items-center mb-10">

			<!-- Page Heading Start -->
			<div class="col-12 col-lg-auto mb-20">
				<div class="page-heading">
					<h3 class="title">면접목록<span></span></h3>
				</div>
			</div>
			<!-- Page Heading End -->

		</div>
		<!-- Page Headings End -->

		<div class="row">
			<div class="col-lg-12 mb-20">
				<div class="box-body">
					<div class="tab-content">
						<div id="keyword" class="card-tools" style="width:600px;margin-bottom:10px;">
							<div class="input-group row">
		
								
								<select class="form-control col-md-4" name="perPageNum" id="perPageNum">
							  		<option value="10" >정렬개수</option>
							  		<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
							  		<option value="15" ${cri.perPageNum == 15 ? 'selected':''}>15개씩</option>
							  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
							  		
							  	</select>	
											
								<select class="form-control col-md-4" name="searchType" id="searchType">
									<option value=""  ${pageMaker.cri.searchType eq '' ? 'selected':'' }>전 체</option>
									<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>교육과정</option>
									<option value="d" ${pageMaker.cri.searchType eq 'd' ? 'selected':'' }>기간</option>
								</select>					
								<input  class="form-control" id="inputKeword" type="text" name="keyword" style="width:150px;" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
								<span class="input-group-append">
									<button style="border:1px solid #dddddd" class="btn btn-outline" type="button" onclick="searchList_go(1);" 
									data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
					</div>	
						<div class="tab-pane fade show active" id="course">
							<table class="table" data-paging="true"
								data-filtering="true" data-sorting="true"
								data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
								<thead>
									<tr>
										<th data-name="title">면접번호</th>
										<th data-name="post_no" style="width:20%">면접이름</th>
										<th data-name="title" style="width:15%">시작날짜</th>
										<th data-name="title" style="width:15%">종료날짜</th>
										<th data-name="title" style="width:20%">회차모집기간</th>
										<th data-breakpoints="xs" data-name="writer" style="width:10%">모집인원</th>
										<th data-breakpoints="xs" data-name="writer" style="width:10%">신청인원</th>
										<c:if test="${loginUser.member_role eq 'STUDENT' }">
										<th style="width:10%">신청</th>
										</c:if>
<!-- 										<th>경쟁률</th> -->
									</tr>
								</thead>

								<tbody>	
									<jsp:useBean id="today" class="java.util.Date" />
									<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
		                            <fmt:formatDate var='start' value="${classes.class_recruitment_start }"	pattern="yyyyMMdd" />
		                            <fmt:formatDate var ='end' value="${classes.class_recruitment_end }"	pattern="yyyyMMdd" />
									<c:set var="sum" value="0"/>
									<c:forEach var="interview" items="${interviewList}" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>${interview.interview_name }</td>
										<td ><fmt:formatDate value="${interview.interview_start_date }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatDate value="${interview.interview_end_date }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatDate value="${classes.class_recruitment_start}" pattern="yyyy-MM-dd" />~
									     	<fmt:formatDate value="${classes.class_recruitment_end}" pattern="yyyy-MM-dd" />
										</td>
										<td>${interview.interview_max_personnel }</td>
										<td>${interview.interview_personnel }</td>
<%-- 										<td>${interview.interview_personnel/interview.interview_max_personnel}</td> --%>
										

										<c:if test="${loginUser.member_role eq 'STUDENT' }">
											<c:if test="${start-now <= 0 && now-end <=0 && interview.interview_personnel < interview.interview_max_personnel }">
											<th><button class="badge badge-info" onclick="apply('${interview.interview_no}');" >신청</button></th>
											</c:if>
											<c:if test="${(end-now < 0 && now-start <0) || interview.interview_max_personnel <= interview.interview_personnel}" >
											<th><button class="badge badge-danger" onclick="apply('${interview.interview_no}');" disabled="disabled">모집종료</button></th>
											</c:if>
											<c:if test="${ now - start <0 }" >
											<th><button class="badge badge-secondary" onclick="apply('${interview.interview_no}');" disabled="disabled">모집준비중</button></th>
											</c:if>
										</c:if>
									</tr>
									<c:set var ="sum" value="${sum + interview.interview_personnel}"/>
									</c:forEach>
							
									<tr>
									</tr>
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
			<c:if test="${!empty class_no && loginUser.member_role eq 'ADMIN'}">
			<div class="col-lg-9 mb-20"></div>
			<div class="col-lg-3 mb-20">
				<div class="box">
                        <div class="box-head">
                            <h4 class="title">총계</h4>
                        </div>
                        <div class="box-body">
                            <p class="mb-10">회차모집인원 : ${classes.class_max }</p>
                            <p class="mb-10">신청인원 : <c:out value="${sum}"/></p>
                            <p class="mb-10"><button class="badge badge-info" onclick="location.href='<%=request.getContextPath()%>/interview/ivhs/list.do?class_no=${classes.class_no}'">신청자 목록 보러가기 </button></p>
                        </div>
                </div>
			</div>
			</c:if>
		</div>
	</div>
	<form role="form">
		<input type="hidden" name="interview_no" /> 
			<input type="hidden" name="student_id" value="${loginUser.member_id}" />
			<input type="hidden" name="student_name" value="${loginUser.member_name}" />
			<input type="hidden" name="student_phone" value="${loginUser.member_phone}" />
	</form>
</body>
<script>

function apply(interview_no) {
	var formObj = $("form[role='form']");
	$('input[name=interview_no]').attr('value',interview_no);
		formObj.attr({
			'action' : 'ivhs/regist.do',
			'method' : 'post'
		});
		formObj.submit();
	
	
}

function test(){
	var length = $('input:checkbox[name=result]:checked').length;
	$("#ddd").html(length+"명");
// 	var obj = document.getElementsByName("result");
// 	for(var i=0; i<length; i++) {
// 	   alert( obj[i].value); 
// 	};
	
// 	console.log($('input:checkbox[name=result]:checked').);
}

function test1(){
	//선택된checkbox값 담을 배열
	var checkArr = new Array();

    $("input[name=result]:checked").each(function() {
    	alert( $(this).val());
    	checkArr.push( $(this).val());
    });
    
    $.ajax({
        url: '<%=request.getContextPath()%>/interview/ivhs/changedecision.do',
        type: 'post',
        dataType: 'text',
        data: {
        	valueArrTest: checkArr
        }
    });
}


$('#searchType').on("change",function(){
	var html="";
	if(this.value == 'd'){
		$('#inputKeword').prop("type", "date");
		str="<input  class='form-control' id='inputKeword' type='text' name='keyword' style='width:150px;' placeholder='검색어를 입력하세요.' value='${param.keyword }'/>"
		$('#inputKeword').after(html);
		
	}
})


</script>

