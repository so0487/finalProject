<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



	<div class="content-body">
		
       <!-- Page Headings Start -->
        <div class="row justify-content-between align-items-center mb-10">

            <!-- Page Heading Start -->
            <div class="col-12 col-lg-auto mb-20">
                <div class="page-heading">
                    <h3 class="title">시험목록</h3>
                </div>		
            </div><!-- Page Heading End -->

        </div><!-- Page Headings End -->
        

		
		<div class="row">
					
			<div class="col-lg-10 mb-20">
				 <table class="table" id="testListTable">
                       <thead>
                          <tr>
                               <th>시험지명</th>
                               <th>시험시작시간</th>
                               <th>시험종료시간</th>
                               <th>만점</th>
                               <th>반영비율</th>
                               <th>시험여부</th>
                               <th>응시</th>
                                                                            
                           </tr>
             	       </thead>
                       <tbody>

                           
                           
                       </tbody>
                 </table>
			</div>							
		</div>	
	</div><!-- content-body end -->









<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	window.onload=function(){
		testList("${lecture_no}");	
	}

</script>


<script>
	
	//테스트 리스트	 
	function testList(ele){
// 		alert(ele);
		var lecture_no = ele;
		
		$.ajax({
			url:'testSubmitList.do',
			data:{"lecture_no":lecture_no},
			type:'post',
			success:function(data){	
// 				alert(data.testList[0].TEST_NAME);
// 				console.log(data);
		        getTestPage(data.testList);       				

			},
			error:function(error){
				alert(error.status);				
			}
		});
	}
	
	//테스트링크
	function selectTest(ele){
		var test_no = ele;
// 		location.href="insertTestHistory.do?test_no="+test_no+"&lecture_no="+"${lecture_no}";
// 		location.href="listStu.do?test_no="+test_no+"&lecture_no="+"${lecture_no}";
	
		
		location.href="listStu.do?test_no="+test_no+"&lecture_no="+"${lecture_no}"+"&member_id"+"${loginUser.member_id}";
		setCookie("testJustOne",test_no+"${lecture_no}"+"${loginUser.member_id}","1");
	}
	
	function setCookie(cookie_name, value, days) {
		  var exdate = new Date();
		  exdate.setDate(exdate.getDate() + days);
		  // 설정 일수만큼 현재시간에 만료값으로 지정

		  var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
		  document.cookie = cookie_name + '=' + cookie_value;
	}
	

	
</script>
<!-- 핸들바 - 강의명, 시험지명 -->
<script src="<%=request.getContextPath() %>/resources/js/moment.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

<script type="text/x-handlebars-template"  id="test-list-template" >
<tbody id="testList"
{{#each .}}
   <tr>
		<td>{{TEST_NAME}}</td>
		<td>{{dateFormat TEST_START_DATE}}</td>
		<td>{{dateFormat TEST_END_DATE}} </td>  
		<td>{{TEST_SCORE}}</td>
		<td>{{TEST_RATIO}}</td>	
 		<td>{{periodFormat TEST_START_DATE TEST_END_DATE}}</td>
		<td>{{{goBtn TEST_START_DATE TEST_END_DATE TEST_NO TEST_HISTORY_SUBMIT}}}</td>

   </tr>
{{/each}}
</tbody>
</script>



<script>	

function getTestPage(result){
	var today = new Date();

		Handlebars.registerHelper('goBtn', function(start,end,test_no,submit) {
			if(submit=='0'){				
				return "응시완료"
			}else{
				if(moment(today).isBefore(start)){
					return ""
				}else if(moment(today).isAfter(end)){				
					return ""
				}else{
					return '<a href="#" onClick=selectTest("'+test_no+'");return false;>시험보기</a>'
				}				
			}
		});
	
		Handlebars.registerHelper('periodFormat', function(start,end) {
			if(moment(today).isBefore(start)){
				return "시험전"
			}else if(moment(today).isAfter(end)){				
				return "시험종료"
			}else{				
				return "시험중"
			}
		});
		
		Handlebars.registerHelper('dateFormat', function(context, block) {			
		  if (window.moment) {			  
		    return moment(context).format("YYYY년 MM월 DD일 HH:mm");
		  }else{
		    return context;   //  moment plugin not available. return data as is.
		  };
		});
				
	   var template=Handlebars.compile($('#test-list-template').html());
	   var html = template(result); 
	   $('#testList').remove();
	   $('#testListTable').append(html);

}


</script>

<style>
	.compose-mail-modal modal fade{
		width:400px;
	}
	.addTestBtn{background-color: rgba(0,0,0,0);border:none;}
	th, td{text-align: center;}
	.form-control{width:300px; display: inline-block; margin-bottom:5px;}
/* 	span{width:100px;display: inline-block; margin-left:10px;} */
	.modifyBtn{background-color: rgba(0,0,0,0);border:none;}
	.goBtn{background-color: rgba(0,0,0,0);border:none;}
</style>

<%@ include file="registForm_js.jsp"%>


    

