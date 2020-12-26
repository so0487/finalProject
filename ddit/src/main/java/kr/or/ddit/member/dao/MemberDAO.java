package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.request.SearchCriteria;

public interface MemberDAO {
	List<MemberVO> selectMemberList(SearchCriteria cri) throws SQLException;
	
	MemberVO selectMemberById(String member_id) throws SQLException;

	List<MemberVO> selectMemberByRole(String member_role) throws SQLException;
	
	void insertMember(MemberVO member) throws SQLException;

	void insertAdminMember(MemberVO member) throws SQLException;
	
	void updateMember(MemberVO member) throws SQLException;

	void updateAdminMember(MemberVO member) throws SQLException;
	
	void deleteMember(String member_id) throws SQLException;
	
	void disableMember(String member_id) throws SQLException;
	
	void enabledMember(String member_id) throws SQLException;
	
	int selectMemberListCount(SearchCriteria cri) throws SQLException;
	
	MemberVO selectMemberByEmail(String member_email) throws SQLException;
	
	void insertUser(MemberVO member) throws Exception;
	
	void createAuthKey(String user_email, String user_authCode) throws Exception;
	
	void userAuth(String user_email) throws Exception;
	
	MemberVO selectMemberFindId(MemberVO member) throws Exception;

	MemberVO selectMemberFindPwd(MemberVO member) throws Exception;
	
	void updateMemberResetPwd(MemberVO member) throws Exception;
	
	List<HashMap<String, Object>> selectMemberAdmin(String member_id) throws Exception;
	
	List<MemberVO> selectMemberCriteria(SearchCriteria cri) throws SQLException;

	int selectMemberCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	List<MemberVO> selectProAdminByTime(Map<String, String>param) throws SQLException;
	
}
