package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProfessorVO;
import kr.or.ddit.request.SearchCriteria;

public class ProfessorDAOImpl implements ProfessorDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<ProfessorVO> selectProfessorList(SearchCriteria cri) throws SQLException {
		List<ProfessorVO> proList = sqlSession.selectList("Professor-Mapper.selectProfessorList");
		return proList;
	}

	@Override
	public ProfessorVO selectProfessorById(String professor_id) throws SQLException {
		ProfessorVO professor = sqlSession.selectOne("Professor-Mapper.selectProfessorById",professor_id);
		return professor;
	}

	@Override
	public void insertProfessor(MemberVO member) throws SQLException {
		sqlSession.update("Professor-Mapper.insertProfessor", member);		
	}

	@Override
	public void updateProfessor(ProfessorVO professor) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProfessor(ProfessorVO professor) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProSub(ProfessorVO professor) throws SQLException {
		sqlSession.update("Professor-Mapper.updateProSub", professor);
		
	}

	@Override
	public List<ProfessorVO> selectProfessorBySub(String subject_no) throws SQLException {
		return sqlSession.selectList("Professor-Mapper.selectProfessorBySub",subject_no);
	}


	@Override
	public List<ProfessorVO> selectProAdminByMorning(Map<String, String> param) throws SQLException {
		return sqlSession.selectList("Professor-Mapper.selectProAdminByMorning",param);
	}

	@Override
	public List<ProfessorVO> selectProAdminByAfternoon(Map<String, String> param) throws SQLException {
		return sqlSession.selectList("Professor-Mapper.selectProAdminByAfternoon",param);
	}

}
