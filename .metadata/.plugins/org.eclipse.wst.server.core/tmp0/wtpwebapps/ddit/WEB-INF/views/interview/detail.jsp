<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class="content-body">
		<div class="box">
			<div class="box-head">
				<h4 class="title">${interview.interview_name }</h4>
			</div>
			<div class="col-md-12 col-12 mb-30">
					<div class="box">
						<div class="box-body">
							<p id="paragraphClipboard">
								시작시간
								<fmt:formatDate value="${interview.interview_start_date }"
									pattern="yyyy-MM-dd" />
							</p>
							<p id="paragraphClipboard">
								종료시간
								<fmt:formatDate value="${interview.interview_end_date }"
									pattern="yyyy-MM-dd" />
							</p>
							<p id="paragraphClipboard">
								신청기간 
								<fmt:formatDate value="${classes.class_recruitment_start}"
									pattern="yyyy-MM-dd" /> ~ 
								<fmt:formatDate value="${classes.class_recruitment_end}"
									pattern="yyyy-MM-dd" />
							</p>
							<p id="paragraphClipboard">모집인원
								${interview.interview_max_personnel }</p>
							<p id="paragraphClipboard">현재신청인원
								${interview.interview_personnel }</p>
							
							<!-- 현재시간과 회차별 모집 종료기간을 비교해서 기간이 지났으면 버튼 비활성화 -->
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
							<fmt:formatDate var ="cre_time" value="${classes.class_recruitment_end }" pattern="yyyyMMdd"/>
							
							<c:if test="${today-cre_time < 0 || interview.interview_max_personnel >= interview.interview_personnel}" >
							<button class="button button-clipboard mb-0 mt-15"
								data-clipboard-target="#paragraphClipboard"  onclick="apply('${interview.interview_no}');" >모집종료
							</button>
							</c:if>
							
							<c:if test="${today-cre_time > 0}">
							<button class="button button-primary button-clipboard mb-0 mt-15"
								data-clipboard-target="#paragraphClipboard"  onclick="apply('${interview.interview_no}');">신청
							</button>
							</c:if>
							
							
							<!-- 관리자만활성화 -->
							<button class="button button-primary button-clipboard mb-0 mt-15"
								data-clipboard-target="#paragraphClipboard"  onclick="location.href='/ddit/interview/ivhs/list.do?interview_no=${interview.interview_no}'" >신청자조회</button>
							<button class="button button-primary button-clipboard mb-0 mt-15"
								data-clipboard-target="#paragraphClipboard">면접관조회</button>
						</div>
					</div>
				</div>
		</div>
	</div>
</body>