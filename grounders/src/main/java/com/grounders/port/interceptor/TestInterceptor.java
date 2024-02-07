package com.grounders.port.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grounders.port.domain.UserVO;


public class TestInterceptor extends HandlerInterceptorAdapter{
	


	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
		
		HttpSession session = req.getSession();
		UserVO member = (UserVO)session.getAttribute("member");

		
		if(member == null) {
			session.setAttribute("msg","로그인을 해주세요");
			session.setAttribute("url","/user/signin");
			res.sendRedirect("http://localhost:8080/alert");
			return false;
		}

		
		return true;
	}
}

//spring/appServlet/servlet-context.xml

