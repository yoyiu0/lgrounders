package com.grounders.port.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.grounders.port.domain.UserVO;
import com.grounders.port.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;
	
	@Override
	public void signup(UserVO vo) throws Exception {
		dao.signup(vo);
	}
	
	@Override
	public UserVO signin(UserVO vo) throws Exception {
		return dao.signin(vo);
	}

	@Override
	public UserVO mypage(Integer userSeq) throws Exception {
		return dao.mypage(userSeq);
	}

	@Override
	public void signout(HttpSession session) throws Exception {
		dao.signout(session);
		
	}
	
	@Override
	public void update(UserVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int idChk(UserVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

}
