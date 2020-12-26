package kr.or.ddit.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class AssignmentVO {
	
	private String assignment_content;  //과제내용
	private String assignment_name;  //과제명
	private String lecture_no;  //강의id
	private String assignment_no;  //과제번호
	private int assignment_score;  //총점
	private Date assignment_end_date; //과제제출기한
	private int assignment_ratio;  //과제반영비율
	private Date assignment_reg_date; //과제 등록날짜
	

	
	public String getAssignment_no() {
		return assignment_no;
	}
	public void setAssignment_no(String assignment_no) {
		this.assignment_no = assignment_no;
	}
	public String getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(String lecture_no) {
		this.lecture_no = lecture_no;
	}

	public String getAssignment_name() {
		return assignment_name;
	}
	public void setAssignment_name(String assignment_name) {
		this.assignment_name = assignment_name;
	}
	public String getAssignment_content() {
		return assignment_content;
	}
	public void setAssignment_content(String assignment_content) {
		this.assignment_content = assignment_content;	}
	

	public int getAssignment_score() {
		return assignment_score;
	}
	public void setAssignment_score(int assignment_score) {
		this.assignment_score = assignment_score;
	}



	public int getAssignment_ratio() {
		return assignment_ratio;
	}
	public void setAssignment_ratio(int assignment_ratio) {
		this.assignment_ratio = assignment_ratio;
	}
	
	public Date getAssignment_reg_date() {
		return assignment_reg_date;
	}
	public void setAssignment_reg_date(Date assignment_reg_date) {
		this.assignment_reg_date = assignment_reg_date;
	}
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date getAssignment_end_date() {
		return assignment_end_date;
	}
	public void setAssignment_end_date(Date assignment_end_date) {
		this.assignment_end_date = assignment_end_date;
	}
	@Override
	public String toString() {
		return "AssignmentVO [assignment_content=" + assignment_content + ", assignment_name=" + assignment_name
				+ ", lecture_no=" + lecture_no + ", assignment_no=" + assignment_no + ", assignment_score="
				+ assignment_score + ", assignment_end_date=" + assignment_end_date + ", assignment_ratio="
				+ assignment_ratio + ", assignment_reg_date=" + assignment_reg_date + "]";
	}

	
	
}
