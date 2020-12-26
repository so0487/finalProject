<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/message/common_message_top.jsp" %>


	
<!--Mail List Start-->
<div class="mail-list">

<c:forEach items="${messageList}" var="message">
<!--Mail Start-->
<div class="mail">

    <div class="left">
        <label class="adomx-checkbox"><input type="checkbox" class="checkbox" name="messageCheck" value="${message.message_no}"> <i class="icon"></i></label>
		<input type="hidden" name="hiddenValue" id="hiddenValue" value="">
        <c:choose>
        	<c:when test="${message.message_receiver_status==0}">
        		<button class="mail-button-starred"><i class="zmdi ti-email"></i></button>
    		</c:when>
    		<c:otherwise>
        		<button class="mail-button-starred"><i class="zmdi zmdi zmdi-email-open"></i></button>
    		</c:otherwise>
    	</c:choose>
    </div>

    <div class="middle">

        <div class="top">
            <h4 class="name"><a href="<%=request.getContextPath()%>/message/detail.page?message_no=${message.message_no}">${message.message_sender}</a></h4>
            <div class="message_receiver" style="display: none;">${message.message_receiver}</div>
            <span class="date"><fmt:formatDate value="${message.message_send_date}" pattern="yyyy-MM-dd"/></span>
        </div>

        <div class="">
            <p>${message.message_title }</p>
        </div>

    </div>

    <div class="right">
        <button class="mail-button-delete" value="${message.message_no}"><i class="zmdi zmdi-delete"></i></button>
        <div class="adomx-dropdown">
            <button class="mail-button-option toggle"><i class="zmdi zmdi-more-vert"></i></button>
            <ul class="adomx-dropdown-menu adomx-dropdown-menu-right">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another Action</a></li>
                <li><a href="#">Something else</a></li>
            </ul>
        </div>
    </div>

</div>
<!--Mail End-->
</c:forEach>
</div>

<div class="card-footer">
	<%@include file="/WEB-INF/views/pagination/pagination.jsp" %>
</div>
</div>	
</div>         
</div>
</div> 
<%@include file="/WEB-INF/views/message/common_message_bottom.jsp" %>
     





<form role="form">
	<input type="hidden" name="message_no" value="${message.message_no}">
</form>

<script>
	
function deleteMessage(){

	
	var obj = $('input[name="messageCheck"]');
	var chkArray = new Array();
	
	$('input:checkbox[name=messageCheck]:checked').each(function(){
		 chkArray.push($(this).val());
	});
	$('#hiddenValue').val(chkArray);
	
	
	for(var i=0; i<chkArray.length; i++){
		message_no = chkArray[i];
		$(document).on('click','.mail-button-delete',function(){
		});
		
	}
	

	
	
	$.ajax({
		url: 'removeReceiveMessage.do',
		type:'post',
		dataType: 'text',
		data :{
			valueArrTest:chkArray
		},
		success : function(result) {
			alert("성공했습니다.");
			location.reload();
		},
		error : function(error) {
			alert("실패했습니다.");
		}
	});

	
	
}






var formObj = $("form[role='form']");

$(".mail-button-delete").on("click",function(){
 	var message_no = $(this);
	var message_no_val = message_no.val();
	return location.href="removeReceiveMessage_one?message_no="+message_no_val+"";
});

</script>


</html>