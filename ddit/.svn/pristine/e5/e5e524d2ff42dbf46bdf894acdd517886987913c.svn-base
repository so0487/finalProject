package kr.or.ddit.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원가입
	@Override
	@Transactional
	public int insertUser(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.insertUser",paramMap);
	}
	
	//로그인
	@Override
	public Map<String, Object> selectUser(String username) {
		// TODO Auto-generated method stub
		System.out.println("-------select--------");
		return sqlSession.selectOne("user.selectUser",username);
	}
	
	//관리 중인 유저 조회 
		@Override
	public List<HashMap<String, Object>> selectUseradmin(String userid) {
		// TODO Auto-generated method stub
		System.out.println("-------selectUseradmin--------");
		List<HashMap<String, Object>> result = sqlSession.selectList("user.selectUseradmin",userid);
				
		return result;
	}

	
}
