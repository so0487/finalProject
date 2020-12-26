package kr.or.ddit.request;


public class InterviewRegistRequest {
	private String class_no;    //회차id
	private String interview_name;//교육과정+회차
	private String interview_start_date;
	private String interview_time;
	private int interview_max_personnel;
	private int interview_personnel;
	
	
	
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}

	public String getInterview_name() {
		return interview_name;
	}
	public void setInterview_name(String interview_name) {
		this.interview_name = interview_name;
	}
	public String getInterview_start_date() {
		return interview_start_date;
	}
	public void setInterview_start_date(String interview_start_date) {
		this.interview_start_date = interview_start_date;
	}
	public int getInterview_time() {
		return Integer.parseInt(interview_time);
	}
	public void setInterview_time(String interview_time) {
		this.interview_time = interview_time;
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
