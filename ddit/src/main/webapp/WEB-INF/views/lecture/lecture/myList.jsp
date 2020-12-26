<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
	<!-- 	<h2>관리자</h2> -->
	<%-- 	<a href="${url}">zoom유저 회의 리스트 보기</a> <br> --%>
	<!-- 	<a href="/list/meetings">유저 회의 리스트 보기</a> <br> -->
	<!-- 	<a href="/create/meetings">회의 추가</a> <br> -->

	<!-- 	<h2>사용자</h2> -->
	<!-- 	<a href="/user/Invitation">회의 초대장 보기</a> <br> -->
	<div class="content-body">
		
		<div class="integration-lti-home">
			<div class="integration-lti-home-header">
				<div class="zm-comp-header">
					<div class="zm-comp-header-left">
						<div class="zm-comp-header-figure">
							<img tabindex="0"
								src="data:image/png;base64,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"
								class="zm-comp-header-logo" alt="image, Zoom Logo">
						</div>
					</div>
					<div class="zm-comp-header-content" style="width: 100%;">
						<div style="margin-top: 12px;">
							<div>
								<span>Your current Time Zone is (GMT+09:00) Seoul.<a
									href="javascript:void(0)"><i aria-label="icon: edit"
										class="anticon anticon-edit"
										style="margin-left: 5px; cursor: pointer; color: rgb(51, 51, 51);"><svg
												viewBox="64 64 896 896" focusable="false" class=""
												data-icon="edit" width="1em" height="1em"
												fill="currentColor" aria-hidden="true">
												<path d="M257.7 752c2 0 4-.2 6-.5L431.9 722c2-.4 3.9-1.3 5.3-2.8l423.9-423.9a9.96 9.96 0 0 0 0-14.1L694.9 114.9c-1.9-1.9-4.4-2.9-7.1-2.9s-5.2 1-7.1 2.9L256.8 538.8c-1.5 1.5-2.4 3.3-2.8 5.3l-29.5 168.2a33.5 33.5 0 0 0 9.4 29.8c6.6 6.4 14.9 9.9 23.8 9.9zm67.4-174.4L687.8 215l73.3 73.3-362.7 362.6-88.9 15.7 15.6-89zM880 836H144c-17.7 0-32 14.3-32 32v36c0 4.4 3.6 8 8 8h784c4.4 0 8-3.6 8-8v-36c0-17.7-14.3-32-32-32z"></path></svg></i></a></span>
							</div>
							<div class="header-option-right"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<br />
		<c:if
			test="${loginUser.member_role eq 'ADMIN' || loginUser.member_role eq 'PROFESSOR' }">
			<button class="button button-outline button-primary" id="listBtn" style="float: right; margin-top: 3px;"
				onclick="location.href='<%=request.getContextPath()%>/lecture/create/meetings?lecture_no=${lecture_no }'">
				<span>ZOOM개설 </span>
			</button>
			<button class="button button-outline button-primary" data-toggle="modal" data-target="#exampleModal5" data-whatever="@mdo" style="float: right; margin-top: 3px;">동영상올리기</button>
		</c:if>
		<ul class="nav nav-tabs mb-15">
			<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#upcoming">예정된강의</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#pre">지난강의</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#video">지난강의영상</a></li>
		</ul>
		
		<div class="modal fade" id="exampleModal5" aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">New message</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="<%=request.getContextPath()%>/lecture/video/upload?lecture_no=${lecture_no}" method="post" enctype="multipart/form-data" name="registForm" >
						<input type="file" name="file" /> 
						<input type="hidden" name="lecture_no" value="${lecture_no }">
					</form>
				</div>
				<div class="modal-footer">
					<input type="submit" id="fileBtn" value="업로드" class="button button-outline button-primary" style="float: right; margin-top: 3px;">
					<button class="button button-danger button-outline" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	 
	<div class="tab-content">
		<div class="tab-pane fade show active" id="upcoming">
			<div tabindex="0" role="presentation"
				style="width: 0px; height: 0px; overflow: hidden; position: absolute;"></div>
			<div id="integration-meeting-list"
				style="table-layout: fixed; word-break: break-all;">
				<div class="">
					<div class="ant-table-wrapper">
						<div class="ant-spin-nested-loading">
							<div class="ant-spin-container">
								<div
									class="ant-table ant-table-default ant-table-empty ant-table-scroll-position-left">
									<div class="ant-table-content">
										<div class="ant-table-body">
											<table class="table table-hover">
												<colgroup>
													<col style="width: 24%; min-width: 24%;">
													<col style="width: 36%; min-width: 36%;">
													<col style="width: 15%; min-width: 15%;">
													<col>
												</colgroup>
												<thead class="ant-table-thead">
													<tr>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title">Start Time</span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title">Topic</span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title">Meeting ID</span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title"></span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
													</tr>
													<c:forEach var="meetingList" items="${meetingList}">
<%-- 														<jsp:useBean id="now" class="java.util.Date" /> --%>
<%-- 														<fmt:formatDate value="${now}" --%>
<%-- 															pattern="yyyy-MM-dd HH:mm:ss" /> --%>
														<fmt:parseDate value="${meetingList.start_time }"
															pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime"
															type="both" />

														<tr>
															<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
																	value="${parsedDateTime }" /></td>
															<td>${meetingList.topic }</td>
															<td>${meetingList.meeting_no }</td>
															<td>
																<button class="badge badge-outline badge-primary" onclick="window.open('<%=request.getContextPath()%>/lecture/attendance?join_url=${meetingList.join_url }&lecture_no=${meetingList.meeting_category_no }&start_time=${meetingList.start_time }')">참여</button>
																<c:if test="${loginUser.member_role eq 'PROFESSOR'}" >
																<button class="badge badge-outline badge-primary" onclick="location.href='<%=request.getContextPath()%>/lecture/video/upload2?start_time=${meetingList.start_time }&topic=${meetingList.topic }&meeting_no=${meetingList.meeting_no }&lecture_no=${lecture_no }'">강의영상업로드</button>
																</c:if>	
																	</td>
																
															<td></td>
														</tr>
													</c:forEach>
												</thead>
												<tbody class="ant-table-tbody"></tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="tab-pane fade" id="pre">
			<div tabindex="0" role="presentation" style="width: 0px; height: 0px; overflow: hidden; position: absolute;"></div>
			<div id="integration-meeting-list" style="table-layout: fixed; word-break: break-all;">
				<div class="">
					<div class="ant-table-wrapper">
						<div class="ant-spin-nested-loading">
							<div class="ant-spin-container">
								<div
									class="ant-table ant-table-default ant-table-empty ant-table-scroll-position-left">
									<div class="ant-table-content">
										<div class="ant-table-body">
											<table class="table table-hover">
												<colgroup>
													<col style="width: 24%; min-width: 24%;">
													<col style="width: 36%; min-width: 36%;">
													<col style="width: 15%; min-width: 15%;">
													<col>
												</colgroup>
												<thead class="ant-table-thead">
													<tr>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title">Start Time</span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title">Topic</span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title">Meeting ID</span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title"></span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
														<th class=""><span class="ant-table-header-column"><div>
																	<span class="ant-table-column-title"></span><span
																		class="ant-table-column-sorter"></span>
																</div></span></th>
													</tr>
													<c:forEach var="meetingListPre" items="${meetingListPre}">
<%-- 														<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /> --%>
														<fmt:parseDate value="${meetingListPre.start_time }" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />

														<tr>
															<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${parsedDateTime }" /></td>
															<td>${meetingListPre.topic }</td>
															<td>${meetingListPre.meeting_no }</td>
															<c:if test="${loginUser.member_role eq 'PROFESSOR'}" >
															<td><button class="badge badge-outline badge-primary" onclick="location.href='<%=request.getContextPath()%>/lecture/video/upload2?start_time=${meetingListPre.start_time }&topic=${meetingListPre.topic }&meeting_no=${meetingListPre.meeting_no }&lecture_no=${lecture_no }'">강의영상업로드</button></td>
															</c:if>
														</tr>
													</c:forEach>
												</thead>
												<tbody class="ant-table-tbody"></tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="video">
		<div tabindex="0" role="presentation" style="width: 0px; height: 0px; overflow: hidden; position: absolute;"></div>
				<div id="integration-meeting-list"
					style="table-layout: fixed; word-break: break-all;">
					<div class="">
						<div class="ant-table-wrapper">
							<div class="ant-spin-nested-loading">
								<div class="ant-spin-container">
									<div
										class="ant-table ant-table-default ant-table-empty ant-table-scroll-position-left">
										<div class="ant-table-content">
											<div class="ant-table-body">
												<table class="table table-hover">
													<colgroup>
														<col style="width: 24%; min-width: 24%;">
														<col style="width: 36%; min-width: 36%;">
														<col style="width: 15%; min-width: 15%;">
														<col>
													</colgroup>
													<thead class="ant-table-thead">
														<tr>
															<th class=""><span class="ant-table-header-column"><div>
																		<span class="ant-table-column-title">Start Time</span><span
																			class="ant-table-column-sorter"></span>
																	</div></span></th>
															<th class=""><span class="ant-table-header-column"><div>
																		<span class="ant-table-column-title">Topic</span><span
																			class="ant-table-column-sorter"></span>
																	</div></span></th>
															<th class=""><span class="ant-table-header-column"><div>
																		<span class="ant-table-column-title">Meeting ID</span><span
																			class="ant-table-column-sorter"></span>
																	</div></span></th>
															<th class=""><span class="ant-table-header-column"><div>
																		<span class="ant-table-column-title"></span><span
																			class="ant-table-column-sorter"></span>
																	</div></span></th>
														</tr>
														<c:forEach var="videoList" items="${videoList}">
	
															<tr>
																<td>${videoList.video_start_date }</td>
																<td><a href="<%=request.getContextPath()%>/lecture/video/detail?video_no=${videoList.video_no}">${videoList.video_title }</a></td>
																<td>${videoList.video_meeting_no}</td>
																<td>
																	<c:if test="${loginUser.member_role eq 'PROFESSOR' }">
																	<button class="badge badge-outline badge-primary" onclick="location.href='<%=request.getContextPath()%>/lecture/video/remove?video_no=${videoList.video_no }'">삭제</button>
																	</c:if>
																</td>
															</tr>
														</c:forEach>
													</thead>
													<tbody class="ant-table-tbody"></tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	



</body>

<script>
	$('#fileBtn').on('click',function(){
		document.registForm.submit();
	})
</script>
