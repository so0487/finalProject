package kr.or.ddit.evaToLec.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ClassVO;
import kr.or.ddit.dto.EvaVO;
import kr.or.ddit.request.SearchCriteria;

public class EvaDAOImpl implements EvaDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<EvaVO> selectEvaList() throws SQLException {

		List<EvaVO> evaList = sqlSession.selectList("Eva-Mapper.selectSearchEvaList");
		return evaList;
	}

	@Override
	public EvaVO selectEvaByNo(String evalution_no) throws SQLException {
		EvaVO eva = sqlSession.selectOne("Eva-Mapper.selectEvaByNo", evalution_no);
		return eva;
	}

	@Override
	public void insertEva(EvaVO evalution) throws SQLException {
		sqlSession.update("Eva-Mapper.insertEva", evalution);
		
	}

	@Override
	public void updateEva(EvaVO evalution) throws SQLException {
		sqlSession.update("Eva-Mapper.updateEva", evalution);
		
	}

	@Override
	public void deleteEva(String evalution_no) throws SQLException {
		sqlSession.update("Eva-Mapper.deleteEva", evalution_no);
		
	}

	@Override
	public String selectEvaNo() throws SQLException {
		String evalution_no =sqlSession.selectOne("Eva-Mapper.selectEvaNo");
	    return evalution_no;
	}

}