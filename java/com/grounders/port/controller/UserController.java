package com.grounders.port.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grounders.port.domain.UserVO;
import com.grounders.port.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
    @Autowired
    private JavaMailSender mailSender;
	
	@Bean
	BCryptPasswordEncoder passEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@GetMapping("/signup")
	public void signup() throws Exception{
		logger.info("get signup");
	}
	
	
	
	
	// 아이디 중복 체크
    @ResponseBody
    @RequestMapping(value="/idChk", method = RequestMethod.POST)
    public int idChk(UserVO vo) throws Exception {
		logger.info("idChk 진입성공");
    	int result = service.idChk(vo);
    	return result;
    }

	
	@PostMapping("/signup")
	public String Signup(UserVO vo,RedirectAttributes rttr,String emailChk)throws Exception{
		logger.info("post signup");
		
		String inputPass = vo.getPw();
		String pass = passEncoder.encode(inputPass);
		vo.setPw(pass);
		
		String inputPass2 = vo.getPwRe();
		String pass2 = passEncoder.encode(inputPass2);
		vo.setPwRe(pass2);

		
    	int result = service.idChk(vo);
    	logger.info(emailChk);
    	try {
    		if(result == 1) { //아이디 중복확인 통과했는지
    			rttr.addFlashAttribute("msg","아이디 중복확인을 해주세요.");
				rttr.addFlashAttribute("url","");
    		}else if(result == 0) {
    			if(emailChk != null && emailChk != "") { //이메일 인증을 완료했는지
    				service.signup(vo);
        			rttr.addFlashAttribute("msg","회원가입 성공");
    				rttr.addFlashAttribute("url","/user/signin");
    			}else {
    				rttr.addFlashAttribute("msg","이메일 인증을 해주세요.");
    				rttr.addFlashAttribute("url","");
    			}
    			
				
    		}
    	} catch (Exception e) {
    		throw new RuntimeException();
    	}
		
		return "redirect:/alert";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/signin")
	public void signin() throws Exception{
		logger.info("get signin");
	}
	
	@PostMapping("/signin")
	public String Signin(UserVO vo, HttpServletRequest req, RedirectAttributes rttr)throws Exception {
		logger.info("post signin");
		
		UserVO login = service.signin(vo);
		HttpSession session = req.getSession();
		
		
		
		if(login != null) {
			boolean passMatch = passEncoder.matches(vo.getPw(), login.getPw());
			
			if(passMatch) {
				session.setAttribute("member", login);
				session.setAttribute("userSeq", login.getUserSeq());
				session.setAttribute("id", login.getId());
				rttr.addFlashAttribute("msg","로그인 성공");
				rttr.addFlashAttribute("url","/");
			}else {
				session.setAttribute("member", null);
				session.setAttribute("userSeq", null);
				session.setAttribute("id", null);
				rttr.addFlashAttribute("msg","비밀번호가 틀립니다.");
				rttr.addFlashAttribute("url","/user/signin");
				logger.info("login failed");
				return "redirect:/alert";
			}
		}else {
			session.setAttribute("member", null);
			session.setAttribute("userSeq", null);
			session.setAttribute("id", null);
			rttr.addFlashAttribute("msg","회원 정보가 없습니다.");
			rttr.addFlashAttribute("url","/user/signin");
			logger.info("login failed");
			return "redirect:/alert";
		}
		logger.info("login successful");
		return "redirect:/alert";
	}
	
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		service.signout(session);
		
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public void Mypage(Integer userSeq, Model model) throws Exception {
		logger.info("get mypage");
		
		UserVO mypage = service.mypage(userSeq);
		
		if(mypage != null) {
			model.addAttribute("member", mypage);
		}

	}
	
	@PostMapping("/mypage")
	public String MypagePOST(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post mypage");
		
		
		HttpSession session = req.getSession();
		
		String inputPass = vo.getPw();
		String pass = passEncoder.encode(inputPass);
		vo.setPw(pass);
		
		String inputPass2 = vo.getPwRe();
		String pass2 = passEncoder.encode(inputPass2);
		vo.setPwRe(pass2);
		
		service.update(vo);
		
		
		String userSeq = session.getAttribute("userSeq").toString();
		
		rttr.addFlashAttribute("msg","수정 완료 !");
		rttr.addFlashAttribute("url","/user/mypage");
		rttr.addFlashAttribute("paramName","userSeq");
		rttr.addFlashAttribute("paramValue",userSeq);
		return "redirect:/alert";

	}
	
    // 이메일 인증
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        // 뷰(View)로부터 넘어온 데이터 확인
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증메일 : " + email);
                
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 : " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "dlrjsdustmqdyd@naver.com";
        String toMail = email;
        String title = "회원가입 인증메일";
        String content = 
                "그라운더즈의 가족을 언제나 환영합니다" +
                "<br><br>" + 
                "회원가입을 위한 인증코드는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
        
    }
	

	
	
	
	
	
	
	
	
	
	
}
