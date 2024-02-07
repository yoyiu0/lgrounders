<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
    	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />                
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/minstyle.css" rel="stylesheet" />
    </head>
  <body>
  
        <header></header>
                
        <div class="container mt-5">        	
	            <div class="row justify-content-center">
	            	<form method="POST"  enctype="multipart/form-data">             				                                
	                    <h3 class="fw-bolder mb-1 mb-4">글 제목</h3>                                                
							  <div class="mb-3 mt-3">							    
							    <textarea rows="1" cols="" class="form-control" name="title" placeholder="글 제목을 작성해주세요.">${boardModify.title}</textarea>						    
							  </div>												
	
	                        <hr>
	                                    
	                    <h3 class="fw-bolder mb-1 mb-4">글 내용</h3>                        	                        
							  <div class="mb-3 mt-3">						    						    			    
							    <textarea rows="7" cols="" class="form-control" name="content" placeholder="내용을 작성해주세요.">${boardModify.content}</textarea>
							  </div>							    
	
	                        <hr>
	                   						
	                    <h3 class="fw-bolder mb-1 mb-4">첨부파일</h3>                        	                        
	                            <div class="mb-3 mt-3">						    
	                                <input type="file" name="photo" class="form-control" onchange="click()"/>		
	                                <input type="hidden" name="orgFileName" value="${file.ORG_FILE_NAME}"/>
	                                <input type="hidden" name="storedFileName" value="${file.STORED_FILE_NAME}"/>    
	                            </div>         

						<script>  
						    // Get a reference to our file input
						    const fileInput = document.querySelector('input[type="file"]');
	
						    // Create a new File object
						    var fileName = "<c:out value='${file.ORG_FILE_NAME}'/>";
						    const myFile = new File(['Hello World!'], fileName, {
						        type: 'text/plain',
						        lastModified: new Date(),
						    });
	
						    // Now let's create a DataTransfer to get a FileList
						    const dataTransfer = new DataTransfer();
						    dataTransfer.items.add(myFile);
						    fileInput.files = dataTransfer.files;
						    
						    /* function click() {
						    	const fileInput = document.querySelector('input[type="file"]');
						    	
						    	fileInput.setAttribute('name', "Y");
						    	
						    	const inputName = fileInput.getAttribute('name');

						    	  // 결과 출력 (예시로 콘솔에 출력)
						    	  console.log('Name Attribute:', inputName);
						    	
						    } */
						</script>
	                             
	                        <hr>
							
						<input type="text" value="${member.id}" name="id" style="display: none"/>
								                                                           
	                    <div class="d-flex justify-content-end">
					      	<div class="btn-group my-5">	      		
					      		<a class="btn btn-outline-secondary btn-user px-5 py-3" href="${path}/board/list">목록으로</a>
					      		<%-- <a class="btn btn-outline-secondary btn-user px-5 py-3" href="${contextPath}/board/boardView">글 등록하기</a> --%>
					      		<input type="submit" class="btn btn-outline-secondary btn-user px-5 py-3" value="글 등록하기"/>	      		
					      	</div>
						  </div>      
					</form>                     	
	                </div>                               
            </div>       
        
        <%@ include file = "../include/footer.jsp" %>
        
    </body>
</html>
