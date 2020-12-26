package kr.or.ddit.request;

import java.util.List;

import kr.or.ddit.dto.EvaToLecVO;

public class LectureRequest {
	private String lecture_status;  //삭제여부
	private String lecture_end_date;  //강의 종료날짜
	private String lecture_start_date;  //강의 시작날짜
	private String subject_no;  //과목번호
	private String lecture_name;  //강의명
	private String class_no;  //회차id
	private String lecture_no;  //강의id
	private String professor_id;  //강사id
	
	
	private List<EvaToLecVO> evaToLecList;
	
	public List<EvaToLecVO> getEvaToLecList() {
		return evaToLecList;
	}
	public void setEvaToLecList(List<EvaToLecVO> evaToLecList) {
		this.evaToLecList = evaToLecList;
	}
	public String getLecture_status() {
		return lecture_status;
	}
	public void setLecture_status(String lecture_status) {
		this.lecture_status = lecture_status;
	}
	public String getLecture_end_date() {
		return lecture_end_date;
	}
	public void setLecture_end_date(String lecture_end_date) {
		this.lecture_end_date = lecture_end_date;
	}
	public String getLecture_start_date() {
		return lecture_start_date;
	}
	public void setLecture_start_date(String lecture_start_date) {
		this.lecture_start_date = lecture_start_date;
	}
	public String getSubject_no() {
		return subject_no;
	}
	public void setSubject_no(String subject_no) {
		this.subject_no = subject_no;
	}
	public String getLecture_name() {
		return lecture_name;
	}
	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public String getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(String lecture_no) {
		this.lecture_no = lecture_no;
	}
	public String getProfessor_id() {
		return professor_id;
	}
	public void setProfessor_id(String professor_id) {
		this.professor_id = professor_id;
	}
	@Override
	public String toString() {
		return "LectureVO [lecture_status=" + lecture_status + ", lecture_end_date=" + lecture_end_date
				+ ", lecture_start_date=" + lecture_start_date + ", subject_no=" + subject_no + ", lecture_name="
				+ lecture_name + ", class_no=" + class_no + ", lecture_no=" + lecture_no + ", professor_id="
				+ professor_id + "]";
	}
	
	
	
}
