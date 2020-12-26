package kr.or.ddit.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.or.ddit.dto.MemberVO;

public class User implements UserDetails{
	private MemberVO member;
	
	public User() {};
	public User(MemberVO member) {
		this.member = member;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(member.getMember_role()));
		return roles;
	}
	@Override
	public String getPassword() {
		return member.getMember_pwd();
	}
	@Override
	public String getUsername() {
		return member.getMember_name();
	}
	@Override
	public boolean isAccountNonExpired() { //기간제 계정의 경우 기간만료여부
		return true;
	}
	@Override
	public boolean isAccountNonLocked() { // 휴면계정 여부
		return member.getMember_status()=="1";
	}
	@Override
	public boolean isCredentialsNonExpired() { //인증정보만료 여부
		return true;
	}
	@Override
	public boolean isEnabled() { //사용 제재 여부
		return member.getMember_status()=="1";
	}
	
	public MemberVO getMemberVO() {
		return this.member;
	}
}
