<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="content-body">
	
	<!-- Page Headings Start -->
	<div class="row justify-content-between align-items-center mb-10">
	
		<!-- Page Heading Start -->
	<div class="col-12 col-lg-auto mb-20">
		<div class="page-heading">
			<h3 class="title" style="text-align: left;">메시지</h3>
		</div>
	</div>
	<!-- Page Heading End -->
	
	</div>
	<!-- Page Headings End -->
	
	   <!--Mail Wrapper Start-->
	   <div class="mail-wrapper">
	
	       <!--Mail Menu Start-->
	       <div class="mail-menu">
<!--  	           <button class="button-compose-mail button button-danger button-round" data-toggle="modal" data-target="#modal-compose-mail">메시지쓰기</button> -->
	           <button class="button-compose-mail button button-danger button-round" onclick="OpenWindow('<%=request.getContextPath()%>/message/sendMessageForm',800,600)">메시지쓰기</button>
	           <ul>
	               <li><a href="<%=request.getContextPath()%>/message/list"><i class="zmdi zmdi-email-open"></i>받은 메시지함</a></li>
	               <li><a href="<%=request.getContextPath()%>/message/sendMessageBox"><i class="zmdi zmdi-mail-send"></i>보낸 메시지</a></li>
	               <li><a href="<%=request.getContextPath()%>/message/notReadMessage"><i class="zmdi ti-email"></i>안읽은 메시지</a></li>
	               <li><a href="<%=request.getContextPath()%>/message/deleteMessageBox"><i class="zmdi zmdi-delete"></i>삭제메시지</a></li>
	           </ul>
	       </div>
	       <!--Mail Menu End-->
	
	       <!--Mail List Container Start-->
	       <div class="mail-container">
	
			
	
	           <!--Mail Options Start-->
	           
	           <div class="mail-options">
	               <div class="mail-options-group">
	                   <input type="checkbox" class="adomx-checkbox selectAll" id="selectAll" name="selectAll" style="margin-top: 20px;">
		                    <div class="header-search-form">
								<div id="keyword" class="card-tools" style="width: 500px;">
									<div class="input-group row">
					
										<!-- sort num -->
										<select class="form-control col-md-3" name="perPageNum"
											id="perPageNum">
											<option value="10">정렬개수</option>
											<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
											<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
											<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
										</select>
										<select class="form-control col-md-4" name="searchType"	id="searchType">
											<option value="all"${pageMaker.cri.searchType eq 'all' ? 'selected':'' }>전체</option>
											<option value="t"${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제 목</option>
											<option value="sender"${pageMaker.cri.searchType eq 'sender' ? 'selected':'' }>발신자</option>
											<option value="receiver"${pageMaker.cri.searchType eq 'receiver' ? 'selected':'' }>수신자</option>
											<option value="c"${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>내용</option>
											<option value="tc"${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
										</select>
										<input class="form-control" type="text" name="keyword"	placeholder="검색어를 입력하세요." value="${param.keyword }" style="width: 200px;"/>
											<span class="input-group-append">
											<button class="btn btn-primary" type="button"onclick="searchList_go(1);" data-card-widget="search">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
								</div>
		                        <button class="header-search-close d-block d-xl-none"><i class="zmdi zmdi-close"></i></button>
		                    </div>
	                   <button class="mail-button-delete" onclick="deleteMessage()"><i class="zmdi zmdi-delete"></i></button>
	               </div>
	           </div>
	           <!--Mail Options End-->














<script>
	$('#selectAll').on('click',function(){
		if($('#selectAll').is(":checked")){
			$('.checkbox').attr('checked',true);
		}else{
			$('.checkbox').attr('checked',false);
			$('.checkbox').trigger("reset");
		}
	});
</script>