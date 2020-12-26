<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body>
	<div class="content-body">  
		<div class="col-md-12 col-12 mb-30">
            <div class="box">
                <div class="box-head">
                    <h4 class="title">HTML5 Video (Plyr)</h4>
                </div>
                <div class="box-body">
                	<video poster="" class="plyr-video" playsinline controls width="1080" height="720">
<%-- 					    <source src="${video.video_path }/${video.video_name }.mp4" type="video/mp4" size="576" /> --%>
<%-- 					    <source src="${video.video_path }/${video.video_name }.mp4" type="video/mp4" size="720" /> --%>
					    <source src="<%=request.getContextPath()%>/resources/zoom/video/${video.video_name }.mp4" type="video/mp4" size="1080" />
					</video>
                </div>
            </div>
        </div>
	</div>
</body>  


<script>
// const plyrVideo = new Plyr('.plyr-video');
</script>