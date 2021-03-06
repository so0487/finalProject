<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="attendance-list-template" >


{{#each .}}
   <tr>
      <td>{{@index}}</td>
      <td>{{student_id}}</td>
      <td>{{member.member_name}}</td>
      <td id="{{@index}}0"><input type='checkbox' class='adomx-checkbox'></td>
      <td id="{{@index}}1"><input type='checkbox' class='adomx-checkbox'></td>
      <td id="{{@index}}2"><input type='checkbox' class='adomx-checkbox'></td>
      <td id="{{@index}}3"><input type='checkbox' class='adomx-checkbox'></td>
      <td id="{{@index}}4"><input type='checkbox' class='adomx-checkbox'></td>
      
	  <td >
		<div class="progress" style="height: 20px;">
    		<div class="progress-bar bg-info" role="progressbar" style="width: {{ratio}}%" aria-valuenow="{{ratio}}" aria-valuemin="0" aria-valuemax="100"><strong>{{ratio}}%</strong></div>
		</div>
	  </td>
   </tr>
{{/each}}


</script>

<!-- 시간처리 -->
<script>
function getTimeStamp(d) {
    if(d.getDay()===0 || d.getDay()===6){
       d.setHours(d.getHours()+24);
    }
    if(d.getDay()===0 || d.getDay()===6){
       d.setHours(d.getHours()+24);
    }
   
    var s =
        leadingZeros(d.getFullYear(), 4) + '/' +
        leadingZeros(d.getMonth() + 1, 2) + '/' +
        leadingZeros(d.getDate(), 2);

    return s;
}

function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}

</script>

<script>
//returns the relative day in the week 0 = Sunday, 1 = Monday ... 6 = Saturday
function getRelativeDayInWeek(d,dy) {
  d = new Date(d);
  var day = d.getDay(),
      diff = d.getDate() - day + (day == 0 ? -6:dy); 
  return new Date(d.setDate(diff));
}

var m = getRelativeDayInWeek(new Date(),1);
var tu = getRelativeDayInWeek(new Date(),2);
var w = getRelativeDayInWeek(new Date(),3);
var th = getRelativeDayInWeek(new Date(),4);
var f = getRelativeDayInWeek(new Date(),5);



$('#0').html(getTimeStamp(m).substring(5.8));
$('#1').html(getTimeStamp(tu).substring(5.8));
$('#2').html(getTimeStamp(w).substring(5.8));
$('#3').html(getTimeStamp(th).substring(5.8));
$('#4').html(getTimeStamp(f).substring(5.8));

</script>





<script>
studentList = new Array();
window.onload = function(){
   
    var m = $('#m').text();
    var length = $("input[name=student_id]").length;
	
   
    for(var i=0; i<length; i++){
       studentList[i] = $('input[name=student_id]').eq(i).val();
    }


    
    myajax(getTimeStamp(getRelativeDayInWeek(new Date(),1)),getTimeStamp(getRelativeDayInWeek(new Date(),5)));
} 

	
    start= $('input[name=start]').val();
    end= $('input[name=end]').val();

$('.input-date').daterangepicker({
    "showWeekNumbers": true,
    "startDate": start,
    "endDate": end,
    "minDate": start,
    "maxDate": end,
    locale: {
        format: 'YYYY/MM/DD'
      }

}, function(start, end, label) {
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});

$('.input-date').on("change",function(){
   
   var start1 = $('.input-date').val();
   var tmp = start1.substring(0,10);
   var tmp2 = start1.substring(13,23)
   
   var str = tmp;

   var strArr = str.split('/');

   var date = new Date(strArr[0], strArr[1]-1, strArr[2]);
   
   
   
   $('#0').html(tmp.substring(5.8));
   
   date.setHours(date.getHours() + 24)
   $('#1').html((getTimeStamp(date)).substring(5.8));
   
   date.setHours(date.getHours() + 24);
   $('#2').html(getTimeStamp(date).substring(5.8));
   
   date.setHours(date.getHours() + 24);
   $('#3').html(getTimeStamp(date).substring(5.8));
   
   date.setHours(date.getHours() + 24);
   $('#4').html(getTimeStamp(date).substring(5.8));
   
   myajax(tmp,tmp2);

});


function myajax(start,end){
   
   
   $.ajax({
       url: '<%=request.getContextPath()%>/lecture/attendance/list.do',
       type: 'post',
       dataType: 'text',
       data: {
          start_date:start,
          end_date:end,
          lecture_no:$('input[name=lecture_no]').val(),
          studentList : studentList
          
       },
       success:function(data){
          
           var result=JSON.parse(data);
           getPage(result);
          
       }
       
   });
   
}


function getPage(result){ 
   var template=Handlebars.compile($('#attendance-list-template').html());
   var html = template(result); 
   
   $('#attendanceBody').empty();
   $('#attendanceBody').html(html);
   
   test222(result);
}   

function test222(result){
	$.each(result,function(i){
		var array=result[i].attendanceList;
      	$.each(array,function(j){
	    	for(var k=0; k<5; k++){
		    	if($('#'+k+'').text() == array[j].attendance_date){
		        	$('#'+i+""+k+'').html("<input type='checkbox' class='adomx-checkbox' checked='checked' onchange='cbf(this);' value='"+array[j].attendance_no+"'>");   
		        }
	    	}
		});
	});
}

function cbf(e){
	var aaa=$(e).val();
	var con= confirm("출결을 수정 하시겠습니까?");
	if(con == true){
		$.ajax({
			url: '<%=request.getContextPath()%>/lecture/attendance/remove.do',
		       type: 'post',
		       dataType: 'text',
		       data: {
		          attendance_no:aaa
		       },
		       success:function(data){
		    	   alert("출결수정 성공");
		    	   window.location.reload();
		       }
		})
	}
}

</script>
