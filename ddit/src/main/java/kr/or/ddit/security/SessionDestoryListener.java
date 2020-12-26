package kr.or.ddit.security;

import java.util.List;

import org.springframework.context.ApplicationListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.session.SessionDestroyedEvent;

import kr.or.ddit.dto.MemberVO;


public class SessionDestoryListener implements ApplicationListener<SessionDestroyedEvent>{

	@Override
	public void onApplicationEvent(SessionDestroyedEvent event) {
		List<SecurityContext> contexts = event.getSecurityContexts();
		if(!contexts.isEmpty()) {
			for(SecurityContext ctx : contexts) {
				Authentication auth = ctx.getAuthentication();
				
				if(auth != null && auth.getDetails() != null) {
					try {
						User user = (User) auth.getDetails();
						
						MemberVO member = user.getMemberVO();
						
						System.out.println(member);
						
						// 사용자가 로그아웃 했을 때 정상적으로 처리되는 프로세스를 대신함.
						
						
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}


}
