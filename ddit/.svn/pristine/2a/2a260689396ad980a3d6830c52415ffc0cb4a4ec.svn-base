package kr.or.ddit.lecture.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.SubjectVO;
import kr.or.ddit.request.SearchCriteria;
import kr.or.ddit.request.SubjectRequest;

public class SubjectDAOImpl implements SubjectDAO {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<SubjectVO> selectSearchSubjectList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<SubjectVO> subjectList = sqlSession.selectList("Subject-Mapper.selectSearchSubjectList", cri, rowBounds);
		
		return subjectList;
	}
	
	@Override
	public List<Map<String, Object>> selectSearchSubjectList2(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Map<String, Object>> subjectList = sqlSession.selectList("Subject-Mapper.selectSearchSubjectList2", cri, rowBounds);
		
		return subjectList;

	}
	@Override
	public List<SubjectVO> selectSubjectList(String subject_no) throws SQLException {
		List<SubjectVO> subjectList = sqlSession.selectList("Subject-Mapper.selectSubjectList", subject_no);
		return subjectList;
	}

	@Override
	public int selectSearchSubjectListCount(SearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Subject-Mapper.selectSearchSubjectListCount", cri);
		return count;
	}

	@Override
	public SubjectRequest selectSubjectByNo(String subject_no) throws SQLException {
		SubjectRequest subjectRe = sqlSession.selectOne("Subject-Mapper.selectSubjectByNo2", subject_no);
		return subjectRe;
	}

	@Override
	public String selectSubjectNo() throws SQLException {
		return sqlSession.selectOne("Subject-Mapper.selectSubjectNo");
	}

	@Override
	public void insertSubject(SubjectVO subject) throws SQLException {
		sqlSession.update("Subject-Mapper.insertSubject", subject);
	}

	@Override
	public void updateSubject(SubjectVO subject) throws SQLException {
		sqlSession.update("Subject-Mapper.updateSubject", subject);

	}

	@Override
	public void deleteSubject(String subject_no) throws SQLException {
		sqlSession.update("Subject-Mapper.deleteSubject", subject_no);

	}




}
