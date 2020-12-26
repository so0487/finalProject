<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/message/common_message_top.jsp" %>


	
<!--Mail List Start-->
<div class="mail-list">

<c:forEach items="${messageList}" var="message">
<c:if test="${message.message_receiver_status==0}">
<!--Mail Start-->
<div class="mail">

    <div class="left">
        <label class="adomx-checkbox"><input type="checkbox"> <i class="icon"></i></label>
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
            <span class="date"><fmt:formatDate value="${message.message_send_date}" pattern="yyyy-MM-dd"/></span>
        </div>

        <div class="body">
            <p>${message.message_title }</p>
        </div>

    </div>

    <div class="right">
        <button class="mail-button-delete"><i class="zmdi zmdi-delete"></i></button>
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
</c:if>
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



</html>