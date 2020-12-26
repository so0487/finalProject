<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<body>
	<div class="content-body">
		<c:forEach var="valueArr" items="${valueArr }" >
			<p>${valueArr }</p>
		</c:forEach>
		
	</div>
</body>   