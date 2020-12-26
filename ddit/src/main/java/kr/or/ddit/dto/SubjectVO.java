package kr.or.ddit.dto;

public class SubjectVO {
	private String subject_no; // 과목번호
	private String subject_status; // 삭제여부
	private String subject_name; // 과목이름
	private String subject_introduce; // 과목소개

	public String getSubject_no() {
		return subject_no;
	}

	public void setSubject_no(String subject_no) {
		this.subject_no = subject_no;
	}

	public String getSubject_status() {
		return subject_status;
	}

	public void setSubject_status(String subject_status) {
		this.subject_status = subject_status;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public String getSubject_introduce() {
		return subject_introduce;
	}

	public void setSubject_introduce(String subject_introduce) {
		this.subject_introduce = subject_introduce;
	}

	@Override
	public String toString() {
		return "SubjectVO [subject_no=" + subject_no + ", subject_status=" + subject_status + ", subject_name="
				+ subject_name + ", subject_introduce=" + subject_introduce + "]";
	}


}
