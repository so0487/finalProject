package kr.or.ddit.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class MemberVO {
	private String member_pwd;  //비밀번호
	private String member_role;  //권한
	private String member_address;  //주소
	private String member_status;  //탈퇴여부
	private String member_email;  //메일
	private String member_phone;  //번호
	private String member_id;  //회원id
	private String member_name;  //이름
	private String member_picture; // 회원사진
	
	private Collection<? extends GrantedAuthority> authorities;
	
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_status() {
		return member_status;
	}
	public void setMember_status(String member_status) {
		this.member_status = member_status;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_picture() {
		return member_picture;
	}
	public void setMember_picture(String member_picture) {
		this.member_picture = member_picture;
	}
	
	@Override
	public String toString() {
		return "MemberVO [member_pwd=" + member_pwd + ", member_role=" + member_role + ", member_address="
				+ member_address + ", member_status=" + member_status + ", member_email=" + member_email
				+ ", member_phone=" + member_phone + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_picture=" + member_picture + "]";
	}
	
	
	
}
