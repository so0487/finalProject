<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<!-- 	<h2>관리자</h2> -->
	<%-- 	<a href="${url}">zoom유저 회의 리스트 보기</a> <br> --%>
	<!-- 	<a href="/list/meetings">유저 회의 리스트 보기</a> <br> -->
	<!-- 	<a href="/create/meetings">회의 추가</a> <br> -->

	<!-- 	<h2>사용자</h2> -->
	<!-- 	<a href="/user/Invitation">회의 초대장 보기</a> <br> -->
	
	
	<div class="content-body">
		<div style="z-index:1; position: absolute; top: 85px; right: 30px;">
			<button id="regBtn" style="border:1px solid #dddddd" class="btn btn-outline" onclick="history.back(-1);"'>
				<span>뒤로가기</span>
			</button>
		</div>
		
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
												<path
													d="M257.7 752c2 0 4-.2 6-.5L431.9 722c2-.4 3.9-1.3 5.3-2.8l423.9-423.9a9.96 9.96 0 0 0 0-14.1L694.9 114.9c-1.9-1.9-4.4-2.9-7.1-2.9s-5.2 1-7.1 2.9L256.8 538.8c-1.5 1.5-2.4 3.3-2.8 5.3l-29.5 168.2a33.5 33.5 0 0 0 9.4 29.8c6.6 6.4 14.9 9.9 23.8 9.9zm67.4-174.4L687.8 215l73.3 73.3-362.7 362.6-88.9 15.7 15.6-89zM880 836H144c-17.7 0-32 14.3-32 32v36c0 4.4 3.6 8 8 8h784c4.4 0 8-3.6 8-8v-36c0-17.7-14.3-32-32-32z"></path></svg></i></a></span>
							</div>
							<div class="header-option-right"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<br />
<!-- 		<ul class="nav nav-tabs mb-15"> -->
<!-- 			<li class="nav-item"><a class="nav-link active" -->
<!-- 				data-toggle="tab" href="#home">Home</a></li> -->
<!-- 			<li class="nav-item"><a class="nav-link" data-toggle="tab" -->
<!-- 				href="#profile">Profile</a></li> -->
<!-- 			<li class="nav-item"><a class="nav-link" data-toggle="tab" -->
<!-- 				href="#contact">Contact</a></li> -->
<!-- 		</ul> -->
		<div
			class="ant-tabs-content ant-tabs-content-no-animated ant-tabs-top-content ant-tabs-card-content">
			<div role="tabpanel" aria-hidden="false"
				class="ant-tabs-tabpane ant-tabs-tabpane-active">
				<div tabindex="0" role="presentation"
					style="width: 0px; height: 0px; overflow: hidden; position: absolute;"></div>
				<div aria-label="Upcoming Meetings">
					<div class="ant-spin-nested-loading">
						<div class="ant-spin-container">
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
																		<th class=""><span
																			class="ant-table-header-column"><div>
																					<span class="ant-table-column-title">Start
																						Time</span><span class="ant-table-column-sorter"></span>
																				</div></span></th>
																		<th class=""><span
																			class="ant-table-header-column"><div>
																					<span class="ant-table-column-title">Topic</span><span
																						class="ant-table-column-sorter"></span>
																				</div></span></th>
																		<th class=""><span
																			class="ant-table-header-column"><div>
																					<span class="ant-table-column-title">Meeting
																						ID</span><span class="ant-table-column-sorter"></span>
																				</div></span></th>
																		<th class=""><span
																			class="ant-table-header-column"><div>
																					<span class="ant-table-column-title"></span><span
																						class="ant-table-column-sorter"></span>
																				</div></span></th>
																	</tr>
																	<c:forEach var="meetingList" items="${meetingList}">
<%-- 																	<fmt:formatDate var="start_time" value="${meetingList.START_TIME}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
																	<tr>
																		<td>${meetingList.START_TIME}</td>
																		<td>${meetingList.TOPIC }</td>
																		<td>${meetingList.MEETING_NO }</td>
																		<td><button class="badge badge-outline badge-primary" onclick="window.open('<%=request.getContextPath()%>/interview/ivhs/changedecision.do?join_url=${meetingList.JOIN_URL }&interview_history_stu_no=${meetingList.INTERVIEW_HISTORY_STU_NO }'); ">참여</button></td>
<!-- 																		<td><button id="applyBtn" class="badge badge-outline badge-primary" >참여</button></td> -->
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
				<div tabindex="0" role="presentation"
					style="width: 0px; height: 0px; overflow: hidden; position: absolute;"></div>
			</div>
			<div role="tabpanel" aria-hidden="true"
				class="ant-tabs-tabpane ant-tabs-tabpane-inactive"></div>
			<div role="tabpanel" aria-hidden="true"
				class="ant-tabs-tabpane ant-tabs-tabpane-inactive"></div>
		</div>
</body>

<script>
$( document ).ready( function() {
 $('.footer-section').remove();
});
</script>
