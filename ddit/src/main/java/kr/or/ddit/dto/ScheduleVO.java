package kr.or.ddit.dto;

import java.util.Date;

public class ScheduleVO {
	private String schedule_content;  //일정내용
	private String schedule_no;  //일정번호
	private String schedule_start_date;  //시작날짜
	private String schedule_title;  //일정제목
	private String schedule_category_no;  //일정카테고리번호
	private String schedule_color;  //일정색상
	private String member_id;  //회원id
	private String schedule_end_date;  //종료날짜
	private String schedule_subject_no; // 카테고리별 아이디
	private String schedule_status; // 상태
	
	
	private String schedule_category_name;
	
	
	
	public String getSchedule_category_name() {
		return schedule_category_name;
	}
	public void setSchedule_category_name(String schedule_category_name) {
		this.schedule_category_name = schedule_category_name;
	}
	public String getSchedule_status() {
		return schedule_status;
	}
	public void setSchedule_status(String schedule_status) {
		this.schedule_status = schedule_status;
	}
	private String schedule_start;
	private String schedule_end;
	public String getSchedule_content() {
		return schedule_content;
	}
	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}
	public String getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(String schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getSchedule_start_date() {
		return schedule_start_date;
	}
	public void setSchedule_start_date(String schedule_start_date) {
		this.schedule_start_date = schedule_start_date;
	}
	public String getSchedule_title() {
		return schedule_title;
	}
	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}
	public String getSchedule_category_no() {
		return schedule_category_no;
	}
	public void setSchedule_category_no(String schedule_category_no) {
		this.schedule_category_no = schedule_category_no;
	}
	public String getSchedule_color() {
		return schedule_color;
	}
	public void setSchedule_color(String schedule_color) {
		this.schedule_color = schedule_color;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getSchedule_end_date() {
		return schedule_end_date;
	}
	public void setSchedule_end_date(String schedule_end_date) {
		this.schedule_end_date = schedule_end_date;
	}
	public String getSchedule_subject_no() {
		return schedule_subject_no;
	}
	public void setSchedule_subject_no(String schedule_subject_no) {
		this.schedule_subject_no = schedule_subject_no;
	}
	public String getSchedule_start() {
		return schedule_start;
	}
	public void setSchedule_start(String schedule_start) {
		this.schedule_start = schedule_start;
	}
	public String getSchedule_end() {
		return schedule_end;
	}
	public void setSchedule_end(String schedule_end) {
		this.schedule_end = schedule_end;
	}
	@Override
	public String toString() {
		return "ScheduleVO [schedule_content=" + schedule_content + ", schedule_no=" + schedule_no
				+ ", schedule_start_date=" + schedule_start_date + ", schedule_title=" + schedule_title
				+ ", schedule_category_no=" + schedule_category_no + ", schedule_color=" + schedule_color
				+ ", member_id=" + member_id + ", schedule_end_date=" + schedule_end_date + ", schedule_subject_no="
				+ schedule_subject_no + ", schedule_status=" + schedule_status + ", schedule_start=" + schedule_start
				+ ", schedule_end=" + schedule_end + "]";
	}
	
	
	
	
}