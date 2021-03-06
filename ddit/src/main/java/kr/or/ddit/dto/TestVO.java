package kr.or.ddit.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TestVO {
	private String test_no;  //시험번호
	private String test_name;  //시험이름
	private int test_score;  //총점
	private int test_ratio; //반영비율
	private Date test_start_date;  //시험시작시간
	private Date test_end_date;  //시험종료시간
	private String lecture_no;  //강의id
	private String test_status; //시험상태
	
	public String getTest_no() {
		return test_no;
	}
	public void setTest_no(String test_no) {
		this.test_no = test_no;
	}
	public String getTest_name() {
		return test_name;
	}
	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}
	public int getTest_score() {
		return test_score;
	}
	public void setTest_score(int test_score) {
		this.test_score = test_score;
	}
	public int getTest_ratio() {
		return test_ratio;
	}
	public void setTest_ratio(int test_ratio) {
		this.test_ratio = test_ratio;
	}
	public Date getTest_start_date() {
		return test_start_date;
	}
	
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	public void setTest_start_date(Date test_start_date) {
		this.test_start_date = test_start_date;
	}
	public Date getTest_end_date() {
		return test_end_date;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	public void setTest_end_date(Date test_end_date) {
		this.test_end_date = test_end_date;
	}
	public String getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(String lecture_no) {
		this.lecture_no = lecture_no;
	}
	@Override
	public String toString() {
		return "TestVO [test_no=" + test_no + ", test_name=" + test_name + ", test_score=" + test_score
				+ ", test_ratio=" + test_ratio + ", test_start_date=" + test_start_date + ", test_end_date="
				+ test_end_date + ", lecture_no=" + lecture_no + "]";
	}
	public String getTest_status() {
		return test_status;
	}
	public void setTest_status(String test_status) {
		this.test_status = test_status;
	}

	

	
}
