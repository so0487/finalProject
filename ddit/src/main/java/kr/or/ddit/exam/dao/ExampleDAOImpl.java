package kr.or.ddit.exam.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.ExampleVO;
import kr.or.ddit.request.SearchCriteria;
import oracle.jdbc.internal.OracleStatement.SqlKind;

public class ExampleDAOImpl implements ExampleDAO {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public List<ExampleVO> selectExampleList() throws SQLException {		
		return sqlSession.selectList("Example-Mapper.selectExampleList");
	}

	@Override
	public ExampleVO selectExampleByNo(String example_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertExample(ExampleVO example) throws SQLException {
		sqlSession.update("Example-Mapper.insertExample",example);
		
	}

	@Override
	public void updateExample(ExampleVO example) throws SQLException {
		sqlSession.update("Example-Mapper.updateExample",example);		
	}

	@Override
	public void deleteExample(String example_no) throws SQLException {
		sqlSession.update("Example-Mapper.deleteExample",example_no);		
	}
	
	@Override
    public String selectExampleNo() throws SQLException {
	    String example_no=sqlSession.selectOne("Example-Mapper.selectExampleNo");
	    return example_no;
    }

}
