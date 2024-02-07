<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
 
<header class="main-title py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1600x900')">
    <div class="text-center my-5">
        <h1 class="text-white fs-3 fw-bolder">공지사항 / 이벤트</h1>

    </div>
</header>
        <div class="container mt-5">
            <div class="row justify-content-center">
            	<form method="POST" autocomplete="off">
                                                                                            
                        <header class="mb-4">                         
                            <div class="text-muted mb-2"><a>${noticeView.seq}</a> | <a>
                            <fmt:formatDate value="${noticeView.writeDate}" pattern="yyyy-MM-dd" />
                            </a></div>
                            <h3 class="fw-bolder mb-1">${noticeView.title}</h3>
                        </header>
                        
                        <hr>
                                                
                        <section class="mb-5" style="white-space: pre-line;">                          
							${noticeView.content}
                        </section>
                     		
                        <hr>

                  <div class="d-flex justify-content-end">
				      	<div class="btn-group my-5">	      		
				      		<a class="btn btn-outline-secondary btn-user px-5 py-3" href="${contextPath}/board/notice?num=1">목록으로</a>
				      	</div>
					  </div>
					 </form>     
                </div>               
            </div>        
        </body>        
                
<%@ include file = "../include/footer.jsp" %>               
    
</html>
