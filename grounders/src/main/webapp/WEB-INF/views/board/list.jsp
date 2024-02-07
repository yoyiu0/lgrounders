<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file = "../include/header.jsp" %>
 <link rel="stylesheet" href="${path}/resources/css/boardstyle.css"/>
<header class="main-title py-5 bg-image-full" style="background-image: url('${path}/resources/img/title2.jpg')">
    <div class="text-center my-5">
        <h1 class="text-white fs-3 fw-bolder">자유 게시판</h1>
    </div>
</header>
    <div class="event-schedule-area-two bg-color pad100">
        <div class="container">
            <div class="row">
            <div class="row my-5" id="noti">
                <div class="col-lg-12">

<div class="container mt-5 text-center" id="boardlist">
   <div class="row">
      <div class="col-md-12">
   <div class="container mt-5 d-flex justify-content-between scrollable-container">
       <c:forEach items="${listView}" var="listView"  begin="0" end="3">
   
       <div class="custom-rectangle">
           <div class="rectangle-image">
               <c:if test="${listView.STORED_FILE_NAME != ''}">
               	<%-- <a href="${path}/board/boardView?seq=${list.seq}"><img src="https://via.placeholder.com/240x246.05" alt="Image" class="img-fluid"></a> --%>
               	<a href="${path}/board/boardView?seq=${listView.seq}">
               		<img class="img2" src= "${path}/resources/boardImg/${listView.STORED_FILE_NAME}" alt="Image" style="width:240px; height:240px;">
             	</a>
               </c:if>
               <c:if test="${empty listView.STORED_FILE_NAME}">
       			<a href="${path}/board/boardView?seq=${listView.seq}">
       				<img class="img2" src= "${path}/resources/img/photo_no.jpg" alt="logo" class="my-auto mx-auto" style="width:100%;">
      			</a>
               </c:if>
           </div>
           <div>
               <h3><a class="atag" href="${path}/board/boardView?seq=${listView.seq}">${listView.title}</a></h3>
           </div>
           <div>
               <p class="">조회수: ${listView.viewCnt}</p>
           </div>
           <div class="author-info">
               <p>${listView.id} | <fmt:formatDate value="${listView.writeDate}"
                           pattern="yyyy-MM-dd" /></p>
           </div>
       </div>
   
      </c:forEach>
   </div>




   <!-- <div class="container mt-3">정렬 기능 배우면 추가할 위치</div> -->

    <div id="blist" class="container">
    
    <c:forEach items="${list}" var="list">
           <div class="row d-flex justify-content-center">
           
                 <div class="col-md-3 firstcol">
               <div class="thumbnail-container">
               <a href="${path}/board/boardView?seq=${list.seq}">
               	<c:if test="${list.storedFileName != ''}">
                   <%-- <a href="${path}/board/boardView?seq=${list.seq}"><img src="https://via.placeholder.com/88x96" alt="썸네일" class="thumbnail"></a> --%>
                   	<img src= "${path}/resources/boardImg/${list.storedFileName}" alt="thumbnail" style="width:88px; height:96px;" alt="썸네일" class="thumbnail">
                </c:if>   
               	<c:if test="${empty list.storedFileName}">
	       			<img class="img2" src= "${path}/resources/img/photo2.jpg" alt="thumbnail" style="width:88px; height:96px;" alt="썸네일" class="my-auto mx-auto" style="width:100%;">
               </c:if>
               </a>
               </div>
               </div>
               <div class="col-md-6 secondcol">
                   <div class="list-item secondcolinner">
                       <%-- <span class="rounded-pill-bg">
                           <span class="px-2 recommendpill">추천수: ${list.likeCnt}</span>
                       </span> --%>
                       <div class="title listTitle mb-3">
                          <a class="atag" href="${path}/board/boardView?seq=${list.seq}">${list.title}</a>
                       </div>
                       <div class="text-muted">조회수: ${list.viewCnt}</div>
                   </div>
               </div>
               <div class="col-md-3 thirdcol">
                   <div class="list-item thirdcol">
                       <div class="text-muted">${list.id}</div>
                       <div class="text-muted"><fmt:formatDate value="${list.writeDate}"
                        pattern="yyyy-MM-dd" /></div>
                   </div>
               </div>
           </div>
        
        <hr>
    </c:forEach>
      
        
    </div>

	<c:if test="${member.id != null}">
		<div class="d-flex justify-content-end">
			<div class="btn-group my-3 writeButton">
				<a href="${path}/board/boardWrite" class="btn btn-outline-primary">글쓰기</a>
			</div>
		</div>
	</c:if>

      
        
      <div class="d-flex justify-content-between">
                           <ul class="pagination my-5">
                              <c:if test="${page.prev}">
                                 <li class="page-item"><a
                                    href="${path}/board/list?num=${page.startPageNum - 1}${page.searchTypeKeyword}"
                                    class="page-link">[이전]</a></li>
                              </c:if>

                              <c:forEach begin="${page.startPageNum}"
                                 end="${page.endPageNum}" var="num">
                                 <li class="page-item"><c:if test="${select != num}">
                                       <a
                                          href="${path}/board/list?num=${num}${page.searchTypeKeyword}"
                                          class="page-link">${num}</a>
                                    </c:if> <c:if test="${select == num}">
                                       <li class="page-item"><a class="page-link"><b>${num}</b></a></li>
                                    </c:if></li>
                              </c:forEach>

                              <c:if test="${page.next}">
                                 <li class="page-item"><a
                                    href="${path}/board/list?num=${page.endPageNum + 1}${page.searchTypeKeyword}"
                                    class="page-link">[다음]</a></li>
                              </c:if>
                           </ul>
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
                                       <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
                                 </select> <input type="text" name="keyword" value="${page.keyword}"
                                    class="form-control" /> <input type="submit" id="searchBtn"
                                    value="검색" class="btn btn-outline-success">
                              </div>
                           </form>
                        </div>
      
     

      </div>
   </div>
</div>










              

                        

                     </div>
</div>
<script>

 document.getElementById("searchBtn").onclick = function () {
    
  let searchType = document.getElementsByName("searchType")[0].value;
  let keyword =  document.getElementsByName("keyword")[0].value;
  
  console.log(searchType)
  console.log(keyword)
  
  location.href = "./list?num=1" + "&amp;searchType=" + searchType + "&amp;keyword=" + keyword;
 };
</script>



                     </div>
                        </div>
                    </div>
        
                        
                        
                        
                        
 

   <script>
   
    document.getElementById("searchBtn").onclick = function () {
       
     let searchType = document.getElementsByName("searchType")[0].value;
     let keyword =  document.getElementsByName("keyword")[0].value;
     
     console.log(searchType)
     console.log(keyword)
     
     location.href = "./list?num=1" + "&amp;searchType=" + searchType + "&amp;keyword=" + keyword;
    };
   </script>
<%@ include file = "../include/footer.jsp" %>
  
 
 
 
 
 