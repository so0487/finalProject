package kr.or.ddit.counsel.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.CounselVO;
import kr.or.ddit.dto.ReviewVO;
import kr.or.ddit.request.SearchCriteria;

public class CounselDAOImpl implements CounselDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<CounselVO> selectCounselList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<CounselVO> councelList = sqlSession.selectList("Counsel-Mapper.selectCouncelAllList",cri,rowBounds);
		return councelList;
	}

	@Override
	public CounselVO selectCounselByNo(String counsel_no) throws SQLException {
		CounselVO counsel = sqlSession.selectOne("Counsel-Mapper.selectCounselByNo",counsel_no);
		return counsel;
	}

	@Override
	public void insertCounsel(CounselVO counsel) throws SQLException {
		 sqlSession.update("Counsel-Mapper.insertCounsel",counsel);
		
	}

	@Override
	public void updateCounsel(CounselVO counsel) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCounsel(CounselVO counsel) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CounselVO> selectCounselListByProfessor(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<CounselVO> councelList = sqlSession.selectList("Counsel-Mapper.selectCouncelListByStudent",cri,rowBounds);
		return councelList;
	}

	@Override
	public List<CounselVO> selectCouncelListByMember(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<CounselVO> councelList = sqlSession.selectList("Counsel-Mapper.selectCouncelListByMember",cri,rowBounds);
		return councelList;
	}

	@Override
	public int selectSearchCounselListCount1(SearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Counsel-Mapper.selectSearchCounselListCount1", cri);
		return count;
	}

	@Override
	public int selectSearchCounselListCount2(SearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Counsel-Mapper.selectSearchCounselListCount2", cri);
		return count;
	}

	@Override
	public int selectSearchCounselListCount3(SearchCriteria cri) throws SQLException {
		int count = sqlSession.selectOne("Counsel-Mapper.selectSearchCounselListCount3", cri);
		return count;
	}

	@Override
	public String selectCounselNo() throws SQLException {
		String counsel_no = sqlSession.selectOne("Counsel-Mapper.selectCounselNo");
		return counsel_no;
	}

	@Override
	public void updateCounselStudent(CounselVO counsel) throws SQLException {
		sqlSession.update("Counsel-Mapper.updateCounselStudent",counsel);
	}

}
