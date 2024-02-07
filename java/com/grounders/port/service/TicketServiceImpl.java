package com.grounders.port.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.grounders.port.domain.TicketVO;
import com.grounders.port.persistence.TicketDAO;

@Service
public class TicketServiceImpl implements TicketService{
	
	@Inject
	private TicketDAO dao;
	
	@Override
	public List<TicketVO> detail (String id, String period) throws Exception {
		return dao.detail(id, period);
	}
	
	@Override
	public void update(Integer ticketNo) throws Exception {
		dao.update(ticketNo);
	}

	@Override
	public void insert(TicketVO vo) throws Exception {
		dao.insert(vo);
	}

	@Override
	public List<TicketVO> seatSelect() throws Exception {
		return dao.seatSelect();
	}
	
	@Override
	public int getCount(String id) throws Exception {
		return dao.getCount(id);
	}
	
	@Override
	public int getCancelCount(String id) throws Exception {
		return dao.getCancelCount(id);
	}

	@Override
	public TicketVO gameInfo(Integer gameNo) throws Exception {
		return dao.gameInfo(gameNo);
	}

	@Override
	public List<TicketVO> homeGameInfo() throws Exception {
		return dao.homeGameInfo();
	}
}
