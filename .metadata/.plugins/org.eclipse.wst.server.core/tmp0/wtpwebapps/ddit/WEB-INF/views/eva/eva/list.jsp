<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<body>

		<div class="content-body">
		
       <!-- Page Headings Start -->
        <div class="row justify-content-between align-items-center mb-10">

            <!-- Page Heading Start -->
            <div class="col-12 col-lg-auto mb-20">
                <div class="page-heading">
                    <h3 class="title">평가기준</h3>
                </div>
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
		
		<div class="row">
			<div class="col-lg-12 mb-20">
	             <div class="box-body">
	                 <div class="tab-content">
	                     <div class="tab-pane fade show active" id="course">
	                     
	                         <table class="table footable" data-paging="true" data-filtering="true" data-sorting="true" data-breakpoints='{ "xs": 480, "sm": 768, "md": 992, "lg": 1200, "xl": 1400 }'>
	                               <thead>
	                                   <tr>
	                                       <th data-name="evalution_no">평가기준번호</th>
	                                       <th data-name="evalution_name">평가기준이름</th>
	                                       <th data-name="">삭제</th>
	                                   </tr>
	                               </thead>
	                               <tbody>
										<c:forEach items="${evaList }" var="evalution">
												<c:if test="${evalution.evalution_status eq '0'}">
			                                   <tr>
			                                       <td>${evalution.evalution_no }</td>
			                                       <td>${evalution.evalution_name }</td>
			                                	   <td><button name="delBtn" id="delBtn" class=""    onclick="apply('${evalution.evalution_no}');" style="width: 50px;height: 25px; text-align: center;">삭제</button></td>
			                                   </tr>
			                                   </c:if>
	                               		</c:forEach>
	                                 
	                                 
	                               </tbody>
	                           </table>
	                     </div>
	                 </div>
	             </div>
			</div>
		        
		        <!-- button -->
		        <div class="col-lg-9 mb-20"></div>
		        
		        <div class="col-lg-3 mb-20">
					
					<button id="regBtn" class="button button-info">
						<span>등록</span>
					</button>	
					
				</div>             
			
		</div>
	
	</div><!-- content-body end -->
	
<form role="form">
		<input type="hidden" name="evalution_no" /> 
</form>	
	
<script>


$('#regBtn').on('click',function(e){
	
	location.href="registForm.do";
});


function apply(evalution_no) {
	var formObj = $("form[role='form']");
	$('input[name=evalution_no]').attr('value',evalution_no);
		formObj.attr({
			'action' : 'remove.do',
			'method' : 'post'
		});
		formObj.submit();
	
	
}

</script>
</script>
</body>


    

