package com.grounders.port.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.grounders.port.domain.BoardVO;
import com.grounders.port.domain.Page;
import com.grounders.port.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController { 
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	/*=============================================  공지사항  =============================================*/
	@GetMapping("/notice")
	public void noticeList(Model model, @RequestParam(value ="num",defaultValue="1")int num,
			String searchType,String keyword) throws Exception{
		logger.info("get noticeList");
		
		Page page = new Page();
		page.setNum(num);
		 
		 //page.setCount(service.searchCount(searchType, keyword));
		 
		// 검색 타입과 검색어
		//page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<BoardVO> noticeList = null;
		if(searchType != null && keyword != null) {
			page.setCount(service.searchCount(searchType, keyword));
			noticeList = service.noticeListPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		}else { 
			page.setCount(service.noticeCount());
			logger.info(Integer.toString(page.getCount()));
			noticeList = service.noticeList(page.getDisplayPost(), page.getPostNum());
			logger.info(Integer.toString(page.getEndPageNum()));
		}
		
		
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		model.addAttribute("searchType",searchType);
		model.addAttribute("keyword",keyword); 
		
		//page.setCount(service.eventCount()); 
		//List<BoardVO> eventList = service.eventListPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		//model.addAttribute("eventList",eventList);
		
		
	}
	
	// 공지사항 글쓰기 GET
	@GetMapping("/noticeWrite") 
	public void noticewrite() throws Exception {
		logger.info("get write"); 
	}
	
	// 공지사항 글쓰기 POST
	@PostMapping("/noticeWrite") 
	public String noticeWrite(BoardVO vo) throws Exception{
		logger.info("post noticeWrite");
		
		service.noticeWrite(vo);
		
		return "redirect:/board/notice?num=1"; 
	}
		
	// 공지사항 상세페이지
	@GetMapping("/noticeView")
	public void noticeView(@RequestParam("seq") int seq, Model model) throws Exception {
		logger.info("get noticeView");
	   
		BoardVO vo = service.noticeView(seq);
	   
		model.addAttribute("noticeView", vo);
	}
  
	// 공지사항 수정 GET
	@GetMapping("/noticeModify") 
	public void noticeModify(@RequestParam("seq")int seq, Model model) throws Exception { 
		logger.info("get noticeModify"); 
		BoardVO vo = service.noticeView(seq); 
		model.addAttribute("noticeModify", vo); 
	}
	
	// 공지사항 수정 POST
	@PostMapping("/noticeModify")
	public String noticeModify(BoardVO vo) throws Exception {
		logger.info("post noticeModify");
		service.noticeUpdate(vo);
		return "redirect:/board/noticeView?seq=" + vo.getSeq();
	}
   
	// 공지사항 삭제 GET
	@GetMapping("/noticeDelete")
	public void noticeDelete(@RequestParam("seq")int seq, Model model) throws Exception {
		logger.info("get noticeDelete");
		BoardVO vo = service.noticeView(seq);
		model.addAttribute("noticeDelete", vo);
	}
   
	// 공지사항 삭제 POST
	@PostMapping("/noticeDelete")
	public String noticeDelete(@RequestParam("seq")int seq) throws Exception {	
		logger.info("post noticeDelete");
		service.noticeDelete(seq);
		return "redirect:/board/notice";
	}
  
	/*=============================================  이벤트  =============================================*/
	// 이벤트 글쓰기 GET
	@GetMapping("/eventWrite") 
	public void eventwrite() throws Exception {
		logger.info("get write"); 
	}
		
	// 이벤트 글쓰기 POST
	@PostMapping("/eventWrite") 
	public String eventWrite(BoardVO vo) throws Exception{
		logger.info("post eventWrite");
		
		service.eventWrite(vo);
		
		return "redirect:/board/notice?num=1"; 
	} 
	   
	// 이벤트 상세페이지
	@GetMapping("/eventView")
	public void eventView(@RequestParam("seq") int seq, Model model) throws Exception {
		logger.info("get eventView");
	   
		BoardVO vo = service.eventView(seq);
	   
		model.addAttribute("eventView", vo);
	}

	// 이벤트 수정 GET
	@GetMapping("/eventModify") 
	public void eventModify(@RequestParam("seq")int seq, Model model) throws Exception { 
		logger.info("get noticeModify"); 
		BoardVO vo = service.eventView(seq); 
		model.addAttribute("eventModify", vo); 
	}
	
	// 이벤트 수정 POST
	@PostMapping("/eventModify")
	public String eventModify(BoardVO vo) throws Exception {
		logger.info("post eventModify");
		service.eventUpdate(vo);
		return "redirect:/board/eventView?seq=" + vo.getSeq();	
	}
   
	// 이벤트 삭제 GET
	@GetMapping("/eventDelete")
	public void eventDelete(@RequestParam("seq")int seq, Model model) throws Exception {
		logger.info("get eventDelete");
		BoardVO vo = service.eventView(seq);
		model.addAttribute("eventDelete", vo);
	}
   
	// 이벤트 삭제 POST
	@PostMapping("/eventDelete")
	public String eventDelete(@RequestParam("seq")int seq) throws Exception {
		logger.info("post eventDelete");
		service.eventDelete(seq);
		return "redirect:/board/notice";
	}
		  	
	/*=============================================  커뮤니티  =============================================*/
	//커뮤니티 목록
	/*
	 * @GetMapping("/list") public void list(Model model) throws Exception{
	 * logger.info("get list");
	 * 
	 * List<BoardVO> list = service.list(); model.addAttribute("list", list);
	 * 
	 * // 조회수 많은 순으로 4개 보이도록 List<Map<String, Object>> listView =
	 * service.boardListView(); model.addAttribute("listView", listView); }
	 */
	
	@GetMapping("/list")
	public void list(Model model, @RequestParam(value ="num", required = false, defaultValue = "1")int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception{
		
		logger.info("get list");
		
		Page page = new Page();
		 
		page.setCount(service.searchCount(searchType, keyword));
		 
		// 검색 타입과 검색어
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		page.setNum(num);
		page.setCount(service.listCount());  		
		
		List<BoardVO> List = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		model.addAttribute("list",List);		
		
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		// 조회수 많은 순으로 4개 보이도록
		List<Map<String, Object>> listView = service.boardListView();
		model.addAttribute("listView", listView);
	}
	
	
	
	
	/*게시물 목록 + 페이징 추가*/
//	@GetMapping("/list")
//	public void list(Model model, @RequestParam("num")int num) throws Exception{
//		logger.info("get list");
//		
//		Page page = new Page();
//		page.setNum(num);
//		page.setCount(service.count());  
//		
//		List<BoardVO> list = null; 
//		list = service.list(page.getDisplayPost(), page.getPostNum());
//		
//		model.addAttribute("list", list);   
//		model.addAttribute("page", page);
//		model.addAttribute("select", num);
//	}
	
	// 커뮤니티 글쓰기 GET
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET) 
	public void writeView() throws Exception { 
		logger.info("boardWrite");		  
	}
	
	// 커뮤니티 글쓰기 POST
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception { 
		logger.info("boardWrite"); 
		service.pwrite(boardVO, mpRequest);
		  
		return "redirect:/board/list"; 
	}
	
	// 커뮤니티 글 상세
	@RequestMapping(value = "/boardView", method = RequestMethod.GET) 
	public void boardView(@RequestParam("seq")int seq, HttpSession session, Model model) throws Exception { 
		logger.info("boardView");
      
		
		
		BoardVO vo = service.boardView(seq, session);
		model.addAttribute("boardView", vo);
		
		Map<String, Object> map = service.selectFileList(seq);
		model.addAttribute("file", map);
      
//		조회할때마다 조회수 증가시키려면 이렇게 해야함
//		int viewCnt = 0; service.viewCntUpdate(seq);
//		model.addAttribute("viewCnt",viewCnt);
		 
	}
		
	// 커뮤니티 글 수정 GET
	@GetMapping("/boardModify") 
	public void boardModify(@RequestParam("seq")int seq, Model model, HttpSession session) throws Exception { 
		logger.info("get boardModify"); 
		BoardVO vo = service.boardView(seq, session); 
		model.addAttribute("boardModify", vo); 
		
		Map<String, Object> map = service.selectFileList(seq);
		model.addAttribute("file", map);
	}
		  
	// 커뮤니티 글 수정 POST
	@PostMapping("/boardModify")
	public String boardModify(BoardVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("post boardModify");
		
		String orgFileName = vo.getOrgFileName();
		if (orgFileName == null) orgFileName = "";
		
		String storedFileName = vo.getStoredFileName();
		
		// 수정된 파일 정보
	    MultipartFile newFile = mpRequest.getFile("photo");  // "newFile"은 파일 업로드 폼의 input 태그의 name 속성 값입니다.
	    // 새로운 파일명 얻기
	    String newFileName = newFile.getOriginalFilename();
	    if (newFileName == null) newFileName = "";
	    
	    String updateAt = "N";
	    if (orgFileName.equals(newFileName)) {
	    	updateAt = "N";
	    }
	    else if (orgFileName != "" && newFileName == "") {
	    	updateAt = "N";	
    		int seq = vo.getSeq();	    		
    		service.deleteFile(seq, storedFileName);
	    } else {
	    	updateAt = "Y";
	    }
		
		service.boardUpdate(vo, updateAt, storedFileName, mpRequest);
		
		return "redirect:/board/list";
   }
		   
	// 커뮤니티 글 삭제	   
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam("seq")int seq, @RequestParam("storedFileName")String storedFileName) throws Exception {
		logger.info("post delete");
		
		service.deleteFile(seq, storedFileName);
		service.boardDelete(seq);
		
		return "redirect:/board/list";
	}
	
}
