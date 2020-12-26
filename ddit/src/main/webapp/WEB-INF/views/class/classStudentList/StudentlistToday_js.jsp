<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
    function aaaaaa(){
	alert('dd');	
	var today = new Date();   

	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var date = today.getDate();  // 날짜
	var day = today.getDay();  // 요일

		
	myajax2((year + '-' + month + '-' + date));
}

$('.input-today').on("change",function(){
	var start = $('.input-today').val();
	var lecture_no = $('input[name=lecture_no]').val();
	alert(start);
	location.href="<%=request.getContextPath()%>/lecture/attendance/list/today?lecture_no="+lecture_no+"&start_date="+start;
})

function myajax2(start){
	$.ajax({
    	url: '<%=request.getContextPath()%>/lecture/attendance/list/today.do',
        type: 'post',
        dataType: 'text',
        data: {
           start_date:start,
           lecture_no:$('input[name=lecture_no]').val(),
          
        },
        success:function(data){
    		$('#attendanceBody').empty();
            var result = JSON.parse(data);
        }
    });
   
}

</script>