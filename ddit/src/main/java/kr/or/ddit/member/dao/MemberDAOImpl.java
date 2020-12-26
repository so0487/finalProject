package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.request.SearchCriteria;

public class MemberDAOImpl implements MemberDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public MemberVO selectMemberById(String member_id) throws SQLException {
		MemberVO member = sqlSession.selectOne("Member-Mapper.selectMemberById",member_id);
		return member;
	}
	
	@Override
	public MemberVO selectMemberByEmail(String member_email) throws SQLException {
		MemberVO member = sqlSession.selectOne("Member-Mapper.selectMemberByEmail",member_email);
		return member;
	}

	@Override
	public List<MemberVO> selectMemberList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<MemberVO> memberList = null;

		memberList = sqlSession.selectList("Member-Mapper.selectSearchMemberList",cri,rowBounds);			

		
		return memberList;		
	}

	@Override
	public int selectMemberListCount(SearchCriteria cri) throws SQLException {
		int count = 0;
		count = sqlSession.selectOne("Member-Mapper.selectSearchMemberListCount",cri);
		return count;
	}
	

	@Override
	public void insertMember(MemberVO member) throws SQLException {
		sqlSession.update("Member-Mapper.insertMember",member);
	}

	@Override
	public void updateMember(MemberVO member) throws SQLException {
		sqlSession.update("Member-Mapper.updateMember",member);		
	}

	@Override
	public void deleteMember(String member_id) throws SQLException {
		sqlSession.update("Member-Mapper.deleteMember",member_id);
	}

	@Override
	public void disableMember(String member_id) throws SQLException {
		sqlSession.update("Member-Mapper.disabledMember",member_id);
	}

	@Override
	public void enabledMember(String member_id) throws SQLException {
		sqlSession.update("Member-Mapper.enabledMember",member_id);
	}
	
	@Override
	public void insertUser(MemberVO member) throws Exception {

		System.out.println("DAO 로그 : 회원가입 중");
		sqlSession.insert("Member-Mapper.insertMember", member);
//			System.out.println(vo.toString());
	}

	// 회원의 상태를 랜덤키로 바꾸는 메서드
	@Override
	public void createAuthKey(String member_email, String member_status) throws Exception {
		// TODO Auto-generated method stub
		MemberVO member = new MemberVO();
		member.setMember_status(member_status);
		member.setMember_email(member_email);

		sqlSession.selectOne("Member-Mapper.createAuthKey", member);
	}
	
	// 인증완료 후 맴버 상태를 0으로 바꿔주는 메서드
	@Override
	public void userAuth(String member_email) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("Member-Mapper.successAuthKey", member_email);
	}

	@Override
	public MemberVO selectMemberFindId(MemberVO member) throws Exception {
		MemberVO memberVO = sqlSession.selectOne("Member-Mapper.selectMemberFindId", member);
		return memberVO;
	}

	@Override
	public MemberVO selectMemberFindPwd(MemberVO member) throws Exception {
		MemberVO memberVO = sqlSession.selectOne("Member-Mapper.selectMemberFindPwd", member);
		return memberVO;
	}

	@Override
	public void updateMemberResetPwd(MemberVO member) throws Exception {
		sqlSession.update("Member-Mapper.updateMemberResetPwd", member);		
	}

	@Override
	public List<HashMap<String, Object>> selectMemberAdmin(String member_id) throws Exception {
		List<HashMap<String, Object>> list = sqlSession.selectList("Member-Mapper.selectMemberAdmin", member_id);
		return list;
	}

	@Override
	public void updateAdminMember(MemberVO member) throws SQLException {
		sqlSession.update("Member-Mapper.updateAdminMember", member);	
		
	}

	@Override
	public void insertAdminMember(MemberVO member) throws SQLException {
		sqlSession.update("Member-Mapper.insertAdminMember", member);
		
	}

	@Override
	public List<MemberVO> selectMemberCriteria(SearchCriteria cri) throws SQLException {
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<MemberVO> memberList = null;

		memberList = sqlSession.selectList("Member-Mapper.selectSearchMemberList",cri,rowBounds);			
		
		return memberList;
	}

	@Override
	public int selectMemberCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		int count=sqlSession.selectOne("Member-Mapper.selectSearchMemberListCount",cri);
		return count;
	}

	@Override
	public List<MemberVO> selectMemberByRole(String member_role) throws SQLException {
		List<MemberVO> memberList = sqlSession.selectList("Member-Mapper.selectMemberByRole",member_role);
		return memberList;
	}

	@Override
	public List<MemberVO> selectProAdminByTime(Map<String, String> param) throws SQLException {
		return sqlSession.selectList("Member-Mapper.selectProAdminByTime",param);
	}


}
