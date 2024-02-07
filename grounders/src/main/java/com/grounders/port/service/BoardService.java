package com.grounders.port.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.grounders.port.domain.BoardVO;

public interface BoardService {
	
	//게시글 총 갯수 (페이징할때사용)
	public int count() throws Exception;
	
	public int searchCount(String searchType, String keyword) throws Exception;
		
	/*=============================================  공지사항  =============================================*/
	public List<BoardVO> noticeList(int displayPost, int postNum) throws Exception;
	
	//공지사항 총 갯수
	public int noticeCount() throws Exception;
	
	public List<BoardVO> noticeListPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	public void noticeWrite(BoardVO vo) throws Exception;	
	
	public BoardVO noticeView(int seq) throws Exception;
		
	public void noticeUpdate(BoardVO vo) throws Exception;
	   
	public void noticeDelete(int seq) throws Exception;
		
	/*=============================================  이벤트  =============================================*/
	//이벤트 총 갯수
	public int eventCount() throws Exception;
		
	public List<BoardVO> eventListPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	//이벤트 글작성
	public void eventWrite(BoardVO vo) throws Exception;
	
	//이벤트 상세페이지
	public BoardVO eventView(int seq) throws Exception;
	
	//이벤트 업데이트
	public void eventUpdate(BoardVO vo) throws Exception;
	
	//이벤트 삭제
	public void eventDelete(int seq) throws Exception;
		
	/*=============================================  커뮤니티  =============================================*/
	
	public void write(BoardVO vo) throws Exception;

	public BoardVO read(int seq) throws Exception;
	
	public List<BoardVO> list() throws Exception;

	public void boardWrite(BoardVO vo) throws Exception;
	
	public BoardVO boardView(int seq, HttpSession session) throws Exception;
	
	public void boardUpdate(BoardVO vo, String updateAt, String storedFileName, MultipartHttpServletRequest mpRequest) throws Exception;
   
	public void boardDelete(int seq) throws Exception;
   
	public void pwrite(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception;
   
	public Map<String, Object> selectFileList(int seq) throws Exception;

	public void deleteFile(int seq, String storedFileName) throws Exception;

	public List<Map<String, Object>> boardListView() throws Exception;
	
	//커뮤니티 총 갯수
	public int listCount() throws Exception;
	
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
}
