package kr.or.ddit.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class AttendanceVO {
	private String student_id;  //수강생id
	private String attendance_date;  //출석일자
	private String attendance_no;  //출석번호
	private String lecture_no;  //강의id
	private String attendance_is;  //출석여부
	private String student_name;
	
	private String attendance_date2;
	
	
	private LectureVO lecture;
	
	public LectureVO getLecture() {
		return lecture;
	}

	public void setLecture(LectureVO lecture) {
		this.lecture = lecture;
	}

	public String getAttendance_date2() throws ParseException {
		String dateStr = this.attendance_date;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = fmt.parse(dateStr);
		return fmt.format(date);
	}

	public void setAttendance_date2(String attendance_date2) {
		this.attendance_date2 = attendance_date2;
	}

	public String getStudent_name() {
		return student_name;
	}
	
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getAttendance_no() {
		return attendance_no;
	}
	public void setAttendance_no(String attendance_no) {
		this.attendance_no = attendance_no;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getLecture_no() {
		return lecture_no;
	}
	public void setLecture_no(String lecture_no) {
		this.lecture_no = lecture_no;
	}
	public String getAttendance_is() {
		return attendance_is;
	}
	public void setAttendance_is(String attendance_is) {
		this.attendance_is = attendance_is;
	}
	public String getAttendance_date() throws ParseException {
		String dateStr = this.attendance_date;
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		Date date = fmt.parse(dateStr);
		SimpleDateFormat fmt1 = new SimpleDateFormat("MM/dd");
		return fmt1.format(date);
	}
	public void setAttendance_date(String attendance_date) {
		this.attendance_date = attendance_date;
	}

	@Override
	public String toString() {
		return "AttendanceVO [student_id=" + student_id + ", attendance_date=" + attendance_date + ", attendance_no="
				+ attendance_no + ", lecture_no=" + lecture_no + ", attendance_is=" + attendance_is + ", student_name="
				+ student_name + ", attendance_date2=" + attendance_date2 + "]";
	}
	
	
	
}