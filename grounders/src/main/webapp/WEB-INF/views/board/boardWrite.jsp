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
	
		
			<div class="container mt-5">        	
	            <div class="row justify-content-center">
	            	<form name="writeForm" method="post" enctype="multipart/form-data">             				                                
	                   <h3 class="fw-bolder mb-1 mb-4">글 제목</h3>                                                
							  <div class="mb-3 mt-3">
							    <input type="text" class="form-control" id="title" placeholder="글 제목을 작성해주세요." name="title"/>						    
							  </div>												
	
	                        <hr>
	                                    
	                    <h3 class="fw-bolder mb-1 mb-4">글 내용</h3>                        	                        
							  <div class="mb-3 mt-3">						    						    			    
							    <textarea rows="7" cols="" class="form-control" name="content" placeholder="내용을 작성해주세요."></textarea>
							  </div>							    
	
	                        <hr>
	                   
	                    <h3 class="fw-bolder mb-1 mb-4">첨부파일</h3>                        	                        
	                            <div class="mb-3 mt-3">						    
	                                <input type="file" name="photo" class="form-control"/>						    
	                            </div>							
	                     
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