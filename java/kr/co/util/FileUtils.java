package kr.co.util;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.grounders.port.controller.BoardController;
import com.grounders.port.domain.BoardVO;

@Component("fileUtils")
public class FileUtils {
	
	private static final String workspace = "D:\\springcode\\new\\workspace\\grounders";	/* 현재 프로젝트 워크스페이스 경로로 수정해서 실행해주세요! */
	
	private static final String filePath = workspace + "\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\grounders\\resources\\boardImg\\";
	
	
	public Map<String, Object> parseInsertFileInfo(BoardVO boardVO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		/*
		 * String projectPath = System.getProperty("user.dir");
		 * 
		 * System.out.println("프로젝트 경로: " + projectPath);
		 */
		
		/*
			Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
	    */
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		Map<String, Object> map = null;
		
		int seq = boardVO.getSeq();
		
		// 지정된 filePath 경로에 대한 File 객체를 생성하고
		File file = new File(filePath);
		
		// 해당 디렉토리가 존재하지 않으면 mkdirs() 메서드를 사용하여 디렉토리를 생성합니다.
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = originalFileName;
				
				// 중복 이름 확인 및 파일 저장
		        int count = 1;
		        while (new File(filePath + storedFileName).exists()) {
		            // 같은 이름의 파일이 이미 존재하면 count를 늘려서 파일 이름에 숫자를 붙임
		        	// "(\\.[^\\.]+)$": 정규 표현식으로, 파일 확장자를 찾기 위해 사용됩니다.
		        	// "_" + count + "$1": 찾은 확장자 앞에 밑줄과 count 변수의 값을 붙여줍니다.
		            storedFileName = originalFileName.replaceFirst("(\\.[^\\.]+)$", "_" + count + "$1");
		            count++;
		        }
								
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				
				// 파일 정보를 Map에 저장하여 리스트에 추가
				map = new HashMap<String, Object>();
				map.put("BNO", seq);
				map.put("ORG_FILE_NAME", originalFileName);
				map.put("STORED_FILE_NAME", storedFileName);
				map.put("FILE_SIZE", multipartFile.getSize());
			}
		}
		
		return map;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public void deleteFile(String storedFileName) throws Exception {
		
		// 삭제할 파일의 경로를 지정합니다.
        String deletePath = filePath + storedFileName;  // 실제 파일 경로로 변경하세요.
        
        // 파일 경로를 Path 객체로 변환합니다.
        Path path = Paths.get(deletePath);

        try {
            // 파일이 존재하는지 확인합니다.
            if (Files.exists(path)) {
                // 파일 삭제 메서드를 호출합니다.
                Files.delete(path);
                System.out.println("파일이 성공적으로 삭제되었습니다.");
            } else {
                System.out.println("파일이 존재하지 않습니다.");
            }
        } catch (Exception e) {
            System.err.println("파일 삭제 중 오류 발생: " + e.getMessage());
        }
	}
	
	public void updateFile(String storedFileName) throws Exception {
		
	}
	
}
	
	
	
	