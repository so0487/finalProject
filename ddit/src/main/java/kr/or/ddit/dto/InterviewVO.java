package kr.or.ddit.dto;

import java.util.Date;

public class InterviewVO {
	private String interview_no;  //면접id
	private Date interview_end_date;  //면접종료날짜
	private String class_no;  //회차id
	private Date interview_start_date;  //면접시작날짜
	private String interview_status;  //상태
	private int interview_max_personnel; //정원
	private int interview_personnel; //정원
	private String interview_name;
	
	public String getInterview_name() {
		return interview_name;
	}
	public void setInterview_name(String interview_name) {
		this.interview_name = interview_name;
	}
	public String getInterview_no() {
		return interview_no;
	}
	public void setInterview_no(String interview_no) {
		this.interview_no = interview_no;
	}
	public Date getInterview_end_date() {
		return interview_end_date;
	}
	public void setInterview_end_date(Date date) {
		this.interview_end_date = date;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public Date getInterview_start_date() {
		return interview_start_date;
	}
	public void setInterview_start_date(Date interview_start_date) {
		this.interview_start_date = interview_start_date;
	}
	public String getInterview_status() {
		return interview_status;
	}
	public void setInterview_status(String interview_status) {
		this.interview_status = interview_status;
	}
	public int getInterview_max_personnel() {
		return interview_max_personnel;
	}
	public void setInterview_max_personnel(int interview_max_personnel) {
		this.interview_max_personnel = interview_max_personnel;
	}
	public int getInterview_personnel() {
		return interview_personnel;
	}
	public void setInterview_personnel(int interview_personnel) {
		this.interview_personnel = interview_personnel;
	}

	

	
	

	
}
