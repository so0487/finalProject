<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="reply-list-template" >

{{#each .}}
<div class="replyLi">
	<div class="details">
		<hr>
		<input type="hidden" class="modal_reply_writer" name="reply_writer" value={{reply_writer}}>	
		<input type="hidden" class="modal_reply_no" name="reply_no" value={{reply_no}}>	
		
		<h5 class="title">{{reply_writer}}</h5>
		<div class="content">
			<div id="{{reply_no}}-reply_content" style="display: inline-block;">
				{{reply_content}}




			</div>
			<div style="display: inline-block;style=;float: right;">
               {{{reply_writerChe reply_writer reply_no}}}
			</div>
		</div>
	</div>
</div>
{{/each}}	
</script>   


<script> //댓글 리스트
$(document).ready(function(){
	
	Handlebars.registerHelper("reply_writerChe", function(reply_writer, reply_no){
		var memberId = '${loginUser.member_id}';
		
		if(reply_writer == memberId){
			return '<i class="zmdi zmdi-edit" id="modifyReplyBtn" data-toggle="modal" data-reply_no='+reply_no+' data-reply_writer='+reply_writer+' data-target="#exampleModal5">수정</i>'
		 }else{
			return ""
		} 
	}); 
	
	Handlebars.registerHelper("prettifyDate",function(timeValue){
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	});
});





var replyPage=1;
var realEndPage=1;


getPage("<%=request.getContextPath()%>/replies/board/qna/${post.post_no}/"+replyPage);

//reply list
function getPage(pageInfo){    
   $.getJSON(pageInfo,function(data){   
      printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
      printPaging(data.pageMaker,$('.pagination'));   
      if(data.pageMaker.realEndPage>0){
         realEndPage=data.pageMaker.realEndPage;
      }
   });
      $('.replyLi').remove();
}

var printData=function(replyArr,target,templateObject){
   var template=Handlebars.compile(templateObject.html());
   var html = template(replyArr);   
   $('.replyLi').remove();
   target.after(html);
}




//reply pagination
var printPaging=function(pageMaker,target){
   var str="";
   
   if(pageMaker.prev){
      str+="<li class='page-item'><a class='page-link' href='"+(pageMaker.startPage-1)+"'> <i class='fas fa-angle-left'/> </a></li>";         
   }
   for(var i=pageMaker.startPage;i<=pageMaker.endPage;i++){
      var strClass = pageMaker.cri.page == i ? 'active' : '';
      str+="<li class='page-item "+strClass+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
   }
   if(pageMaker.next){
      str+="<li class='page-item' ><a class='page-link' href='"+(pageMaker.endPage+1)+"'> <i class='fas fa-angle-right'/> </a></li>";
   }
   target.html(str);
}


$('.pagination').on('click','li a',function(event){
   event.preventDefault();
   replyPage=$(this).attr("href");
   getPage("<%=request.getContextPath()%>/replies/board/qna/${post.post_no}/"+replyPage);
});

//reply modify 권한체크


$('div.timeline').on('click','#modifyReplyBtn',function(event){   
   var reply_no = $(this).attr("data-reply_no");
   var reply_writer = $(this).attr("data-reply_writer");
   var reply_content = $('#'+reply_no+'-reply_content').text();
      
   if(reply_writer!="${loginUser.member_id}"){
      alert("수정 권한이 없습니다.");
      $(this).attr("data-toggle","");
   }
   
   $('#reply_content').val(reply_content);
   $('.modal-title').text(reply_no);
      
});




$('#replyAddBtn').on('click',function(e){

	   var reply_writer=$('#newreply_writer').val();
	   var reply_content=$('#newreply_content').val();
	   
	   if(reply_content==""){
	      alert('댓글 내용은 필수입니다.');
	      $('#newreply_content').focus().css("border-color","red")
	      .attr("placeholder","내용은 필수입니다.");         
	      return;
	   }
	   
	   var data={
	         "post_no":"${post.post_no}",
	         "reply_writer":"${loginUser.member_id}",
	         "reply_content":reply_content   
	   }
	   
	   
	   $.ajax({
	      url:"<%=request.getContextPath()%>/replies",
	      type:"post",
	      data:JSON.stringify(data),   
	      contentType:"application/json", //보내는 data 형식 지정
	      dataType:"text", //받는 data 형식 지정
	      success:function(data){
	         var result=data.split(',');
	         if(result[0]=="SUCCESS"){
	            alert('댓글이 등록되었습니다.');
	            getPage("<%=request.getContextPath()%>/replies/board/qna/${post.post_no}/"+result[1]);
	            $('#newreply_content').val("");
	            $('.replyLi').remove();
	         }else{
	            alert('댓글이 등록을 실패했습니다.');   
	         }
	      }
	   });
	   
	});











$('#replyModBtn').on('click',function(event){
    var reply_no=$('.modal-title').text();
   var reply_content=$('#reply_content').val();
   

   var sendData={
         reply_no:reply_no,
         reply_content:reply_content
   }
   
   $.ajax({
      url:"<%=request.getContextPath()%>/replies/board/qna/"+reply_no,
      type:"put",
      data:JSON.stringify(sendData),
      headers:{
         "Content-Type":"application/json",
         "X-HTTP-Method-Override":"PUT"
      },
      success:function(result){
         alert("수정되었습니다.");         
      },
      error:function(error){
         alert('수정 실패했습니다.');      
      },
      complete:function(){
          $('#exampleModal5').modal('hide');
         $('.replyLi').remove();
         getPage("<%=request.getContextPath()%>/replies/board/qna/${post.post_no}/"+replyPage);
      }
   });
   
   
});




$('#replyDelBtn').on('click',function(event){
   
   var reply_no=$('.modal-title').text();
   
   var sendData={
         post_no:"${post.post_no}",
         reply_no:reply_no,
         page:replyPage
   };
   
   
   $.ajax({
      url:"<%=request.getContextPath()%>/replies/board/qna/"+reply_no,
      type:"delete",
      data:JSON.stringify(sendData),
      headers:{
         "Content-Type" : "application/json",
         "X-HTTP-Method-Override":"DELETE"
      },
      success:function(page){
         alert("삭제되었습니다.");
      },
      error:function(error){
         alert('삭제 실패했습니다.');      
      },
      complete:function(){
          $('#exampleModal5').modal('hide');
         getPage("<%=request.getContextPath()%>/replies/board/qna/${post.post_no}/"+replyPage);
      }
   });
});
</script>
