package com.grounders.port.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.grounders.port.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "grounders_board";
	
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace+".count");
	}
	
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
	  
		HashMap<String, Object> data = new HashMap<String, Object>();
	  
		data.put("searchType", searchType);
		data.put("keyword", keyword);
	  
		return sql.selectOne(namespace + ".noticeSearchCount", data); 
	 }
	
	/*=============================================  공지사항  =============================================*/
	@Override
	public List<BoardVO> noticeList(int displayPost, int postNum) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		  
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".noticeList",data);	
	}
	
	// 게시물 총 갯수
	@Override
	public int noticeCount() throws Exception {
		return sql.selectOne(namespace + ".noticeCount"); 
	}
	
	@Override
	public List<BoardVO> noticeListPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		  
		data.put("searchType", searchType);
		data.put("keyword", keyword);
				
		return sql.selectList(namespace + ".noticePageSearch", data);	
	}
	
	@Override
	public void noticeWrite(BoardVO vo) throws Exception {
		sql.insert(namespace + ".noticeWrite", vo);
	}
	
	@Override
	public BoardVO noticeView(int seq) throws Exception {
		return sql.selectOne(namespace + ".noticeView", seq);
	}
	
	@Override
	public void noticeUpdate(BoardVO vo) throws Exception {
		sql.update(namespace+".noticeUpdate", vo);
		
	}
	
	@Override
	public void noticeDelete(int seq) throws Exception {
		 sql.delete(namespace+".noticeDelete", seq);
		
	}
	
	/*=============================================  이벤트  =============================================*/
	
	// 게시물 총 갯수
	@Override
	public int eventCount() throws Exception {
		return sql.selectOne(namespace + ".eventCount"); 
	}
	
	@Override
	public List<BoardVO> eventListPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		  
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".eventPageSearch", data);	
	}
	
	// 이벤트 글작성
	@Override
	public void eventWrite(BoardVO vo) throws Exception {
		sql.insert(namespace + ".eventwrite", vo);
	}
	
	// 이벤트 상세페이지
	@Override
	public BoardVO eventView(int seq) throws Exception {
		return sql.selectOne(namespace + ".eventview", seq);
	}
	
	// 이벤트 업데이트
	@Override
	public void eventUpdate(BoardVO vo) throws Exception {
		sql.update(namespace + ".eventUpdate", vo);
	}

	// 이벤트 삭제
	@Override
	public void eventDelete(int seq) throws Exception {
		 sql.delete(namespace+".eventDelete", seq);
	}
	
	/*=============================================  커뮤니티  =============================================*/
	
	@Override
	public void write(BoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}
	
	@Override
	public BoardVO read(int bno) throws Exception {
		return sql.selectOne(namespace + ".read", bno);
	}
	
	@Override
	public List<BoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");	
	}
	
	@Override
	public void boardWrite(BoardVO vo) throws Exception {
		sql.insert(namespace + ".boardWrite", vo);
	}
	
	@Override
	public BoardVO boardView(int seq) throws Exception {
		return sql.selectOne(namespace + ".boardview", seq);
	}
	
   @Override
   public void viewCntUpdate(int num) throws Exception {
      sql.update(namespace + ".viewCntUpdate", num);
   }
	
	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		sql.update(namespace+".boardUpdate", vo);
	}	
	
	@Override
	public void boardDelete(int seq) throws Exception {
		 sql.delete(namespace+".boardDelete", seq);
	}
	
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sql.insert(namespace+".insertFile", map);
	}
	
	@Override
	public Map<String, Object> selectFileList(int seq) throws Exception {
		return sql.selectOne(namespace+".selectFileList", seq);
	}

	@Override
	public void deleteFile(int seq) throws Exception {
		sql.delete(namespace + ".deleteFile", seq);
		
	}

	@Override
	public List<Map<String, Object>> boardListView() throws Exception {
		return sql.selectList(namespace+".boardListView");
	}
		
	// 게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return sql.selectOne(namespace + ".listCount"); 
	}
	
	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		  
		data.put("searchType", searchType);
		data.put("keyword", keyword);
				
		return sql.selectList(namespace + ".listPageSearch", data);	
	}
	
}
