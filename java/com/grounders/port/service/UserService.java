package com.grounders.port.service;

import javax.servlet.http.HttpSession;

import com.grounders.port.domain.UserVO;

public interface UserService {

	public void signup(UserVO vo) throws Exception;

	public UserVO signin(UserVO vo) throws Exception;
	
	public void signout(HttpSession session) throws Exception;
	
	public UserVO mypage(Integer userSeq) throws Exception;

	void update(UserVO vo) throws Exception;
	
	public int idChk(UserVO vo) throws Exception;

}
