package com.grounders.port.service;

import java.util.List;

import com.grounders.port.domain.TicketVO;

public interface TicketService {

	public List<TicketVO> detail(String id, String period) throws Exception;

	public void update(Integer ticketNo) throws Exception;

	//티켓 구매
	public void insert(TicketVO vo) throws Exception;
	
	//좌석만 select
	public List<TicketVO> seatSelect() throws Exception;

	public int getCount(String id) throws Exception;

	public int getCancelCount(String id) throws Exception;
	
	public TicketVO gameInfo(Integer gameNo) throws Exception;
	
	//홈에 보일 gameInfo
	public List<TicketVO> homeGameInfo() throws Exception;
}
