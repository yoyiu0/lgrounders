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
    <!-- <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script> -->
  <body>
  
        <header></header>
                
        <div class="container mt-5">        	
	            <div class="row justify-content-center">
	            	<form method="POST" autocomplete="off">             				                                
	                      <header class="mb-4">						  
						  <div class="text-muted mb-2">
						    <a>${boardView.id}</a> | <a><fmt:formatDate value="${boardView.writeDate}" pattern="yyyy-MM-dd"/></a>
						  </div>
						  <div class="row d-flex justify-content-between align-items-end">
						  	<div class="col-sm-8">
						    <h3 class="fw-bolder mb-1">${boardView.title}</h3>
						    </div>
							<c:if test="${member.id == boardView.id}">
							    <div class="text-right col-sm-2">
							      <a class="btn text-muted" href="${path}/board/boardModify?seq=${boardView.seq}">수정</a> | <a class="btn text-muted" href="${path}/board/boardDelete?seq=${boardView.seq}&storedFileName=${file.STORED_FILE_NAME}">삭제</a>						     
							    </div>
						    </c:if>
						  </div>						  						 						 
						  
						</header>
                        
                        <hr>
                                                
                        <div class="mb-4">
                        	<c:if test="${file.STORED_FILE_NAME != null and file.STORED_FILE_NAME != ''}">
								<%-- <a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br> --%>
								<%-- <div class="select_img"><img class="img-fluid rounded" src= "../../../resources/boardImg/${file.STORED_FILE_NAME}"/></div> --%>
								<div class="select_img"><img class="img-fluid rounded" src= "${path}/resources/boardImg/${file.STORED_FILE_NAME}"/></div>
							</c:if>
						</div>
												
                        <section class="mb-5">                          
                        	${boardView.content}							
                        </section>
                     
                        <hr>
                        
                   <div class="text-center my-5">                   
                   		<a class="btn btn-outline-secondary btn-user btn-block px-5 py-3" href="${path}/board/list">목록으로</a>
                   </div>
					</form>                     	
	                </div>                               
            </div>       
        
        <%@ include file = "../include/footer.jsp" %>
        
    </body>
</html>

























