package com.grounders.port.service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.grounders.port.domain.BoardVO;
import com.grounders.port.persistence.BoardDAO;

import kr.co.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;		
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public int count() throws Exception{
		return dao.count();
	}
	
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
	 return dao.searchCount(searchType, keyword);
	}
	
	/*=============================================  공지사항  =============================================*/
	@Override
	public List<BoardVO> noticeList(int displayPost, int postNum) throws Exception {
		return dao.noticeList(displayPost, postNum);
	}
	
	@Override
	public int noticeCount() throws Exception {
	 return dao.noticeCount();
	}
	
	@Override
	public List<BoardVO> noticeListPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return dao.noticeListPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	@Override
	public void noticeWrite(BoardVO vo) throws Exception {
		dao.noticeWrite(vo);
	}
	
	@Override
	public BoardVO noticeView (int seq) throws Exception {		
		return dao.noticeView(seq);
	}
	
	@Override
	public void noticeUpdate(BoardVO vo) throws Exception {
		dao.noticeUpdate(vo);
		
	}
	
	@Override
	public void noticeDelete(int seq) throws Exception {
		 dao.noticeDelete(seq);
		
	}
	/*=============================================  이벤트  =============================================*/
	@Override
	public int eventCount() throws Exception {
		return dao.eventCount();
	}
	
	@Override
	public List<BoardVO> eventListPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return dao.eventListPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 이벤트 글작성
	@Override
	public void eventWrite(BoardVO vo) throws Exception {
		dao.eventWrite(vo);
	}
	
	// 이벤트 상세페이지
	@Override
	public BoardVO eventView (int seq) throws Exception {		
		return dao.eventView(seq);
	}
	
	
	// 이벤트 업데이트
	@Override
	public void eventUpdate(BoardVO vo) throws Exception {
		dao.eventUpdate(vo);
	}
	
	// 이벤트 삭제
	@Override
	public void eventDelete(int seq) throws Exception {
		 dao.eventDelete(seq);
	}
	/*=============================================  커뮤니티  =============================================*/
	
	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	}
	
   @Override
   public BoardVO read(int seq) throws Exception {
      
      return dao.read(seq);
   }
   
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void boardWrite(BoardVO vo) throws Exception {
		dao.boardWrite(vo);
	}	
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO boardView (int seq, HttpSession session) throws Exception {
      
	   Set<Integer> viewedPostNumbers = (Set<Integer>) session.getAttribute("viewedPostNumbers");
      
	   if (viewedPostNumbers == null) {
		   viewedPostNumbers = new HashSet<>();
	   }
      
	   if (!viewedPostNumbers.contains(seq)) {
		   dao.viewCntUpdate(seq);
		   viewedPostNumbers.add(seq);
	   }
      
	   session.setAttribute("viewedPostNumbers", viewedPostNumbers);
	   return dao.boardView(seq);
	}
	
	@Override
	public void boardUpdate(BoardVO vo, String updateAt, String storedFileName, MultipartHttpServletRequest mpRequest) throws Exception {
		
		if (updateAt == "Y") {
			deleteFile(vo.getSeq(), storedFileName);
			Map<String,Object> map = fileUtils.parseInsertFileInfo(vo, mpRequest); 
			dao.insertFile(map); 
		}
		
		dao.boardUpdate(vo);
		
	}
	
	@Override
	public void boardDelete(int seq) throws Exception {
		 dao.boardDelete(seq);
		
	}
	
	@Override
	public void pwrite(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.boardWrite(boardVO);
		
		Map<String,Object> map = fileUtils.parseInsertFileInfo(boardVO, mpRequest); 
		
		if (map != null) {
			dao.insertFile(map);
		}
	}
	
	@Override
	public Map<String, Object> selectFileList(int seq) throws Exception {
		return dao.selectFileList(seq);
	}

	@Override
	public void deleteFile(int seq, String storedFileName) throws Exception {
		fileUtils.deleteFile(storedFileName);
		
		dao.deleteFile(seq);
		
	}

	@Override
	public List<Map<String, Object>> boardListView() throws Exception {
		
		return dao.boardListView();
	}
   
	@Override
	public int listCount() throws Exception {
	 return dao.listCount();
	}
	
	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
}
