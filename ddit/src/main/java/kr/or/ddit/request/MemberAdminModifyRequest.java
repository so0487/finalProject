package kr.or.ddit.request;



import java.io.UnsupportedEncodingException;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.MemberVO;


public class MemberAdminModifyRequest {
	
	private String member_id;  //아이디
	private String member_pwd; //패스워드
	private String member_name; // 이름
	private String member_status; // 상태
	private String member_role; // 권한
	private String[] member_address; // 주소	
	private String member_phone; //전화번호
	private String member_email; //이메일
	private MultipartFile member_picture; // 사진파일 경로/파일명
	private String oldPicture; // 이전 사진 파일명	
	private String uploadPicture; // 변경된 사진 파일명
	

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;		
	}


	public String getOldPicture() {
		return oldPicture;
	}

	public void setOldPicture(String oldPicture) {
		this.oldPicture = oldPicture;
	}
	public String getUploadPicture() {
		return uploadPicture;
	}
	public void setUploadPicture(String uploadPicture) {
		this.uploadPicture = uploadPicture;
	}


	public MultipartFile getMember_picture() {
		return member_picture;
	}
	public void setMember_picture(MultipartFile member_picture) {
		this.member_picture = member_picture;
	}

	



	public MemberVO toParseMember() throws UnsupportedEncodingException {
		MemberVO member = new MemberVO();
		member.setMember_id(this.member_id);
		member.setMember_pwd(this.member_pwd);
		member.setMember_name(this.member_name);
		member.setMember_role(this.member_role);
		member.setMember_status(this.member_status);
		member.setMember_address(member_address[0]+","+member_address[1]+","+member_address[2]);
		member.setMember_phone(this.member_phone);
		member.setMember_email(this.member_email);
		
		return member;
	}

	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_status() {
		return member_status;
	}
	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String[] getMember_address() {
		return member_address;
	}
	public void setMember_address(String[] member_address) {
		this.member_address = member_address;
	}




	
	
	
}