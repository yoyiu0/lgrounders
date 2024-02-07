package com.grounders.port.persistence;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.grounders.port.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sql;
	
	public static String namespace = "grounders_user";
	
	@Override
	public void signup(UserVO vo) throws Exception{
		sql.insert(namespace + ".signup", vo);
	}
	
	@Override
	public UserVO signin(UserVO vo) throws Exception{
		return sql.selectOne(namespace + ".signin", vo);
	}

	@Override
	public UserVO mypage(Integer userSeq) throws Exception {
		return sql.selectOne(namespace + ".mypage", userSeq);
	}

	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	@Override
	public void update(UserVO vo) throws Exception{
		sql.insert(namespace + ".update", vo);
	}

	@Override
	public int idChk(UserVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".idChk", vo);
		return result;
	}
	
}
