package kr.or.ddit.dto;

public class VideoVO {
	private String student_id;  //수강생id
	private String video_name;  //동영상이름
	private String video_path;  //동영상경로
	private String lecture_no;  //강의id
	private String video_no;  //동영상id
	private String video_title;
	private String video_meeting_no;
	private String video_start_date;
	
	
	
	public String getVideo_meeting_no() {
		return video_meeting_no;
	}
	public void setVideo_meeting_no(String video_meeting_no) {
		this.video_meeting_no = video_meeting_no;
	}
	public String getVideo_start_date() {
		return video_start_date;
	}
	public void setVideo_start_date(String video_start_date) {
		this.video_start_date = video_start_date;
	}
	public String getVideo_title() {
		return video_title;
	}
	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String viedeo_name) {
		this.video_name = viedeo_name;
	}
	public String getVideo_path() {
		return video_path;
	}
	public void setVideo_path(String video_path) {
		this.video_path = video_path;
	}
	public String getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(String lecture_no) {
		this.lecture_no = lecture_no;
	}
	public String getVideo_no() {
		return video_no;
	}
	public void setVideo_no(String video_no) {
		this.video_no = video_no;
	}
	@Override
	public String toString() {
		return "VideoVO [student_id=" + student_id + ", viedeo_name=" + video_name + ", video_path=" + video_path
				+ ", lecture_no=" + lecture_no + ", video_no=" + video_no + "]";
	}
	
	
}
