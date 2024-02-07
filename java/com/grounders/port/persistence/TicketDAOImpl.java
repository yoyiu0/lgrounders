package com.grounders.port.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.grounders.port.domain.TicketVO;

@Repository
public class TicketDAOImpl implements TicketDAO{

	@Inject
	private SqlSession sql;
	
	private static String namespace = "grounders_ticket";
	
	@Override
	public List<TicketVO> detail(String id, String period) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("id", id);
		data.put("period", period);
		
		return sql.selectList(namespace + ".inDepth", data);
	}
	
	@Override
	public void update(Integer ticketNo) throws Exception {
		sql.update(namespace + ".update", ticketNo);
	}

	@Override
	public void insert(TicketVO vo) throws Exception {
		sql.insert(namespace+".buy", vo);
		
	}

	@Override
	public List<TicketVO> seatSelect() throws Exception {
		return sql.selectList(namespace+".seatSelect");
	}
	
	
	@Override
	public int getCount(String id) throws Exception {
		return sql.selectOne(namespace + ".ticketCount",id);
	}
	
	@Override
	public int getCancelCount(String id) throws Exception {
		return sql.selectOne(namespace + ".cancelCount",id);
	}

	@Override
	public TicketVO gameInfo(Integer gameNo) throws Exception {
		return sql.selectOne(namespace+".gameInfo",gameNo);
	}

	@Override
	public List<TicketVO> homeGameInfo() throws Exception {
		return sql.selectList(namespace+".homeGameInfo");
	}
	
}
