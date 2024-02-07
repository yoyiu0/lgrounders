package com.grounders.port.persistence;

import javax.servlet.http.HttpSession;

import com.grounders.port.domain.UserVO;

public interface UserDAO {

	public void signup(UserVO vo) throws Exception;

	public UserVO signin(UserVO vo) throws Exception;

	public void signout(HttpSession session) throws Exception;
	
	public UserVO mypage(Integer userSeq) throws Exception;

	public void update(UserVO vo) throws Exception;

	public int idChk(UserVO vo) throws Exception;


	
	
}
