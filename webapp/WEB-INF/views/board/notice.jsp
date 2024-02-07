<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file = "../include/header.jsp" %>
 <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
 <link rel="stylesheet" href="${path}/resources/css/boardstyle.css"/>
 




<header class="main-title py-5 bg-image-full" style="background-image: url('${path}/resources/img/title2.jpg')">
    <div class="text-center my-5">
        <h1 class="text-white fs-3 fw-bolder">공지사항 / 이벤트</h1>

    </div>
</header>


 
    <div class="event-schedule-area-two bg-color pad100">
        <div class="container">
            <div class="row">
                
            
            
            <div class="row my-5" id="noti">
                <div class="col-lg-12">
                    <ul class="nav custom-tab">
                    
                        
	                        <li class="nav-item tab-list" role="presentation">
	                           <a class="nav-link active aleft" data-bs-target=#home data-bs-toggle="tab">
	                           공지사항
	                           </a>
	                        </li>
	                        <li class="nav-item" role="presentation">
	                           <a class="nav-link aright" data-bs-target=#profile data-bs-toggle="tab">
	                           이벤트
	                           </a>
	                        </li>
	                        
                     </ul>



                    <div class="tab-content">
                        <div class="tab-pane active show" id="home" role="tabpanel">
                        
                            <div class="table-responsive mt-3">
						
                            	<!-- 공지사항탭 -->
						       <table class="table">
						        	<colgroup>
										<col style="width:5%"/>
										<col style="width:75%"/>
										<col style="width:20%"/>
									</colgroup>
<!-- 									<tr>
										<th>글 제목</th>
										<th>작성일자</th>
									</tr> -->
									<c:forEach items="${noticeList}" var="noticeList">
										<tr>
											<td>${noticeList.seq}</td>
											<td><a class="atag box" href="${path}/board/noticeView?seq=${noticeList.seq}">
													${noticeList.title} </a></td>
											<td class="noticeWriteDate"><fmt:formatDate value="${noticeList.writeDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</table>
								
								
								<div class="d-flex justify-content-between bottomContainer">
								
									<div class="searchForm">
										<form>
											<div class="input-group my-5">
												<select name="searchType" class="form-select">
													<option value="title"
														<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
													<option value="content"
														<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
													<option value="title_content"
														<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
													<option value="writer"
														<c:if test="${searchType eq 'writer'}">selected</c:if>>
														작성자
													</option>
												</select> <input type="text" name="keyword" value="${page.keyword}"
													class="form-control" /> <input type="submit" id="searchBtn"
													value="검색" class="btn btn-outline-secondary">
											</div>
										</form>
									</div>
														
									<div class="btn-group my-3 writeButton">
										<a href="${path}/board/noticeWrite" class="btn btn-outline-secondary noticeWrite">글쓰기</a>
									</div>
									
								</div>


								<div class="d-flex justify-content-center">
									<ul class="pagination my-5">
										<c:if test="${page.prev}">
											<li class="page-item"><a
												href="${path}/board/notice?num=${page.startPageNum - 1}"
												class="page-link">[이전]</a></li>
										</c:if>
								
										<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
											<li class="page-item">

											<c:if test="${select != num}">
												
												<c:choose>
													<c:when test="${keyword != null and keyword != ''}">
														<a
															href="${path}/board/notice?num=${num}&searchType=${searchType}&keyword=${keyword}"
															class="page-link">${num}</a>
													</c:when>
													<c:otherwise>
														<a
															href="${path}/board/notice?num=${num}"
															class="page-link">${num}</a>
													</c:otherwise>
												</c:choose>
												
													
											</c:if> 
											<c:if test="${select == num}">
													<li class="page-item"><a class="page-link"><b>${num}</b></a></li>
											</c:if></li>
										</c:forEach>
								
										<c:if test="${page.next}">
											<c:choose>
												<c:when test="${keyword != null and keyword != ''}">
													<li class="page-item"><a
													href="${path}/board/notice?num=${page.endPageNum + 1}&searchType=${searchType}&keyword=${keyword}"
													class="page-link">[다음]</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a
												href="${path}/board/notice?num=${page.endPageNum + 1}"
												class="page-link">[다음]</a></li>
												</c:otherwise>
											</c:choose>
											
										</c:if>
									</ul>
									</div>

							</div>
</div>
<script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  console.log(searchType)
  console.log(keyword)
  
  location.href = "./notice?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 };
</script>


							</div>
                        </div>
                    </div>
        
                        
                        
                        
                        
                        <div class="tab-pane fade " id="profile" role="tabpanel">
                                          
                              <div id="blist" class="container">
<%-- 
								<!-- 이벤트탭 -->
						       <table class="table">
						        	<colgroup>
										<col style="width:10%"/>
										<col style="width:70%"/>
										<col style="width:20%"/>
									</colgroup>
<!-- 									<tr>
										<th>글 번호</th>
										<th>글 제목</th>
										<th>작성일자</th>
									</tr>
									 -->
									<c:forEach items="${eventList}" var="eventList">
										<tr>
											<td>${eventList.seq}</td>
											<td><a class="atag" href="${path}/board/eventView?seq=${eventList.seq}">
													${eventList.title} </a></td>
											<td class="eventWriteDate"><fmt:formatDate value="${eventList.writeDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</table>
							 --%>
							 
	<div id="event">
	    <c:forEach items="${eventList}" var="eventList">
	        	<div class="row d-flex justify-content-center">
	        	
	           		<div class="col-md-3 firstcol">
		            <div class="thumbnail-container">
		                <a href="${path}/board/eventView?seq=${eventList.seq}"><img src="https://via.placeholder.com/88x96" alt="썸네일" class="thumbnail"></a>
		            </div>
		            </div>
		            <div class="col-md-6 secondcol">
		                <div class="list-item secondcolinner">
		                    <div class="title listTitle">
		                    	<a class="atag" href="${path}/board/eventView?seq=${eventList.seq}">${eventList.title} </a>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-3 thirdcol">
		                <div class="list-item thirdcol">
		                    <div class="text-muted"><fmt:formatDate value="${eventList.writeDate}"
									pattern="yyyy-MM-dd" /></div>
		                </div>
		            </div>
	        	</div>
	        
	        <hr>
	    </c:forEach>
    </div>
							
															
<div class="d-flex justify-content-end">
	<div class="btn-group my-3 writeButton">
		<a href="${path}/board/eventWrite" class="btn btn-outline-primary">글쓰기</a>
	</div>
</div>
		
							
<%-- 
<div class="d-flex justify-content-between">
<ul class="pagination my-5">
<c:if test="${page.prev}">
 <li class="page-item"><a href="${path}/board/notice?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="page-link">[이전]</a></li>
</c:if>

<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
 <li class="page-item">
 
  <c:if test="${select != num}">
   <a href="${path}/board/notice?num=${num}${page.searchTypeKeyword}" class="page-link">${num}</a>
  </c:if>    
  
  <c:if test="${select == num}">
    <li class="page-item"><a class="page-link"><b>${num}</b></a></li>
  </c:if>
    
 </li>
</c:forEach>

<c:if test="${page.next}">
  <li class="page-item"> <a href="${path}/board/notice?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="page-link">[다음]</a></li>
</c:if>
</ul>
<form>
	<div class="input-group my-5">
	 <select name="searchType" class="form-select">
	     <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
	     <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
	     <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
	     <option value="writer" <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
	 </select>
	 
	 <input type="text" name="keyword" value="${page.keyword}" class="form-control"/>
	 
	 <input type="submit" id="searchBtn" value="검색" class="btn btn-outline-success">
	</div>
</form>
</div>
 --%>
</div>
</div>
<script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  console.log(searchType)
  console.log(keyword)
  
  location.href = "./notice?num=1" + "&amp;searchType=" + searchType + "&amp;keyword=" + keyword;
 };
</script>

									
							</div>      
                                          
                                          
           <!--              <div class="table-responsive">
						</div>              
						<table class="table">
           				</table> -->
                                 
                    </div>

                </div>
                <!-- /col end-->
            </div>
            <!-- /row end-->
        </div>
    </div>
</div>
</div>











   
<%@ include file = "../include/footer.jsp" %>
  
 
 
 
 
 