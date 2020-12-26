<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="subMenu-list-template" >
{{#each .}}
	<li class="nav-item subMenu" >
      	<a href="javascript:goPage('{{menu_url }}','{{menu_no}}');" >
          <i class="{{menu_icon }}"></i>
             <p>{{menu_name }}</p>
        </a>
	</li>
{{/each}}
</script>
<script>

var printData=function(subMenuArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(subMenuArr);	
	$('.subMenu').remove();
	target.append(html);
}

function subMenu(menu_no){
	
		$.getJSON("<%=request.getContextPath()%>/common/subMenu.do?menu_no="+menu_no,function(data){	
			console.log(data);
			printData(data,$('.side-header-sub-menu'),$('#subMenu-list-template'));
		});

}

function goPage(menu_url,menu_no){
	
	$.ajax({
		url : '<%=request.getContextPath()%>/common/loginUser',
		type : 'get',
		success:function(data){
			if(data){
				//alert("로그인 유저 존재!");
			}
		},
		error:function(error){
			//alert("로그인 유저 없음!");
			window.location.reload();				
			return;
		}
		
	});
			
	
	  // HTML5 지원브라우저에서 사용 가능
    if (typeof(history.pushState) == 'function') {
        //현재 주소를 가져온다.
        var renewURL = location.href;
        //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
        renewURL = renewURL.substring(0, renewURL.indexOf("/ddit")+5);
        

            renewURL += menu_url;

        
        //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
        location.href= renewURL;
     
    } else {
        location.hash = "#"+menu_no;
    }
	  
	$('#if_list').attr("src","<%=request.getContextPath()%>"+menu_url);
}

</script>










