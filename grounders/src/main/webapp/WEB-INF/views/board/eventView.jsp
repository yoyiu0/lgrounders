<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
            
    <header></header>    
           
      <body>  
        <div class="container mt-5">
            <div class="row justify-content-center">
            	<form method="POST" autocomplete="off">
                                                                                            
                        <header class="mb-4">                         
                            <div class="text-muted mb-2"><a>${eventView.id}</a> | <a>${eventView.writeDate}</a></div>
                            <h3 class="fw-bolder mb-1">${eventView.title}</h3>
                        </header>
                        
                        <hr>
                                                
                        <section class="mb-5">                          
                        	<!-- (서울=연합뉴스) 장현구 기자 = 불운한 자유계약선수(FA)였던 내야수 서건창(34)이 고향 팀 KIA 타이
                        	<br><br>
                        	거즈에서 새 출발 한다.
							<br><br>
							프로야구 KIA는 서건창과 연봉 5천만원, 옵션 7천만원을 합쳐 총액 1억2천만원에 계약했다고 15일 발
							<br><br>
							표했다.
							<br><br>
							지난 시즌 후 스스로 LG 트윈스를 떠난 서건창은 KIA에서 명예 회복을 다짐한다.
							<br><br>
							광주일고를 졸업하고 2008년 LG에 육성 선수로 입단해 넥센 히어로즈(현 키움) 소속이던 2012년부
							<br><br>
							터 본격적으로 1군에서 뛴 서건창은 KBO리그를 대표하는 교타자로 활약
							<br><br>
							했다.
							<br><br>
							지난해까지 1천256경기에 출전해 통산 타율 0.297, 안타 1천365개, 타점 491개, 도루 229개를 기록했다.
							<br><br>
							특히 2014시즌 꿈의 200안타를 넘어 역대 단일 시즌 최다 안타인 201개를 터뜨리고 그해 최우수선수
							<br><br>
							에 올라 인생 최고의 순간을 만끽했다. -->
							${eventView.content}
                        </section>
                     		
                        <hr>

                  <div class="d-flex justify-content-end">
				      	<div class="btn-group my-5">	      		
				      		<a class="btn btn-outline-secondary btn-user px-5 py-3" href="${contextPath}/board/eventModify?seq=${eventView.seq}">수정하기</a>
				      		<a class="btn btn-outline-secondary btn-user px-5 py-3" href="${contextPath}/board/eventDelete?seq=${eventView.seq}">삭제하기</a>
				      		<a class="btn btn-outline-secondary btn-user px-5 py-3" href="${contextPath}/board/notice?num=1">목록으로</a>
				      	</div>
					  </div>
					 </form>     
                </div>               
            </div>        
        </body>        
                
        <footer></footer>                    
    
</html>
