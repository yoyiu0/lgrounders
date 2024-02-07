package com.grounders.port.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grounders.port.domain.TicketVO;
import com.grounders.port.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	
	@Inject
	TicketService service;
	
	//예매내역보이기
	@GetMapping("/detail")
	public void Detail(String id, Model model, HttpServletRequest req,
			@RequestParam(value="period", defaultValue="n") String period) throws Exception {
		logger.info("get detail"); 
		
		HttpSession session = req.getSession();
		id = session.getAttribute("id").toString();

		List<TicketVO> detail = service.detail(id,period);
		
		for(int i=0; i<detail.size(); i++) {
			int c=0;
			if(detail.get(i).getSeat1() != null && !detail.get(i).getSeat1().equals("")) {
				c++;
			}
			if(detail.get(i).getSeat2() != null && !detail.get(i).getSeat2().equals("")) {
				c++;
			}
			if(detail.get(i).getSeat3() != null && !detail.get(i).getSeat3().equals("")) {
				c++;
			}
			detail.get(i).setPrice(c*10000);
		}
		int count = service.getCount(id);
		int cancelCount = service.getCancelCount(id);
		model.addAttribute("detail", detail);
		model.addAttribute("count", count);
		model.addAttribute("cancelCount", cancelCount);
	}
	
	//예매취소
	@PostMapping("/detail")
	public String postDetail(Integer ticketNo) throws Exception{
		logger.info("post detail");
		service.update(ticketNo);
		return "redirect:/ticket/detail";
	}

	
	@GetMapping("/order")
	public void orderGET(Model model, Integer gameNo) throws Exception{
		
		
		logger.info("get ticketOrder");
		
		
		TicketVO gameInfo = service.gameInfo(gameNo);
		
		//DB에 있는 좌석 가져와서 list에 넣기
		List<TicketVO> list = service.seatSelect();
		

		model.addAttribute("seatList",list);
		model.addAttribute("gameInfo",gameInfo);
		model.addAttribute("gameNo",gameNo);
	}
	
	@PostMapping("/order")
	public String orderPOST(TicketVO vo,Model model,Integer gameNo,HttpServletRequest req,String ai1, String ai2, String ai3) throws Exception{
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		vo.setId(id);
		vo.setSeat1(ai1);
		vo.setSeat2(ai2);
		vo.setSeat3(ai3);
		service.insert(vo);
		
		model.addAttribute("gameNo",gameNo);
		
		return "redirect:/ticket/detail";
		
		

	}
	
	@PostMapping("/order_next")
	public String orderNextPOST(TicketVO vo,Model model,HttpServletRequest req,String ai1, String ai2, String ai3) throws Exception{
		
		
		HttpSession session = req.getSession();
		String id = session.getAttribute("id").toString();
		vo.setId(id);
		vo.setSeat1(ai1);
		vo.setSeat2(ai2);
		vo.setSeat3(ai3);
		service.insert(vo);
		
		return "redirect:/ticket/detail";
	}
	
	
	

}
