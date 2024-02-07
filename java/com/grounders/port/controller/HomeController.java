package com.grounders.port.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.grounders.port.domain.BoardVO;
import com.grounders.port.domain.TicketVO;
import com.grounders.port.service.BoardService;
import com.grounders.port.service.TicketService;


@Controller
public class HomeController {
	
	@Inject
	BoardService boardService;
	
	@Inject
	TicketService ticketService;

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home( Model model) throws Exception {
		
		//경기 정보 가져오기
		List<TicketVO> gameInfo = ticketService.homeGameInfo();
		
		//맨 아래 공지사항 리스트 가져오기
		List<BoardVO> noticeList = boardService.noticeList(1,8);
		
		
		model.addAttribute("gameInfo",gameInfo);
		model.addAttribute("noticeList",noticeList);
		
		
		
		return "home";
	}
	
	@RequestMapping(value="/", method = RequestMethod.POST)
	public String homePOST(Model model, @RequestParam("gameNo")String gameNo) {
		
		model.addAttribute("gameNo",gameNo);
		
		return "redirect:/ticket/order";
	}
	
	
	@RequestMapping(value="/alert", method = RequestMethod.GET)
	public String alert() {
		return "/alert";
	}
	


}
