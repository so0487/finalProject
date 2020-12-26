package kr.or.ddit.security;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.util.SecurityUtil;


public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException{
		//dao를(맴버접근) 사용하기위해서 data컨텍스트를 한번로드해서 사용하고 버린다.
		String login_id = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
		// 입력한 비밀번호를 암호화한다.
		SecurityUtil scUtil;
		String login_pwd = "";
		try {
			scUtil = new SecurityUtil();
			String login_pwd2 = (String) auth.getCredentials(); // 로그인 시도한 Password를 가져온다		
			try {
				login_pwd = scUtil.encrypt(login_pwd2);
//				System.out.println(login_pwd);
			} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException
					| InvalidAlgorithmParameterException | IllegalBlockSizeException | BadPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		MemberVO member = null;
		
		try {
			member = memberDAO.selectMemberById(login_id);
		} catch (SQLException e) {
			throw new AuthenticationServiceException("Internal server error!");
		}

		
		if(member!=null && login_pwd.equals(member.getMember_pwd())) {//로그인 성공
			if(member.getMember_status().equals("0")) { // 아이디 활성화 여부 체크
				List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
				roles.add(new SimpleGrantedAuthority(member.getMember_role()));
				//스프링 시큐리티 내부 클래스로 인증 토큰생성한다.
				UsernamePasswordAuthenticationToken result =
						new UsernamePasswordAuthenticationToken(member.getMember_id(), member.getMember_pwd(), roles);
				// 전달할 내용을 설정한 후
				result.setDetails(new User(member));
				// 리턴한다. default-target-url
				return result;
			}else if(!member.getMember_status().equals("1")){
				throw new BadCredentialsException("이메일 인증이 필요한 아이디입니다.");
			}else {
				throw new BadCredentialsException("탈퇴한 회원입니다.");
			}
		}else { // 로그인 실패
			throw new BadCredentialsException("아이디나 비밀번호가 틀렸습니다.");
		}
		
	}

	@Override
	public boolean supports(Class<?> arg) {
		/*UsernamePasswordAuthenticationToken 리턴할 때
		파라미터와 같은 레퍼런스인지 비교를 하고 리턴을 한다.
		default-target-url로 전송된다. */
		return arg.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
