<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "include/header.jsp" %>
<link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
<link rel="stylesheet" href="${path}/resources/css/nhstyle.css"/>
<link rel="stylesheet" href="${path}/resources/css/custom.css"/>
<script src='${path}/resources/js/mainJS.js'></script>

    
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <section class="firstSec mainSec">
                    <div class="swiper main mt-5">
                        <!-- Additional required wrapper -->
                        <div class="swiper-wrapper">
	                        <!-- Slides -->
	                        <div class="swiper-slide mainS1"></div>
	                        <div class="swiper-slide mainS2"></div>
                        </div>
                        <!-- If we need pagination -->
                        <div class="swiper-pagination"></div>
                    </div>
                </section>

                <section class="secondSec mainSec">
                    <div class="titleText">
                        <p>프로야구</p>
                        <h3>KBL리그경기 빠른예매</h3>
                    </div>
                    

                    <div class="parents">
                    <form method="post">
                        <div class="child1 child d-flex">
                            <div class="text-group">
                                <h5>날짜 선택</h5>
                                <p>원하는 날짜 선택</p>
                            </div>
                            
                            <ul class="date d-flex justify-content-between">
                                <li>일<input type="checkbox" id="28" name="gameDate" value="28"/>
                                    <label for="28" class="dateLabel">28</label>
                                </li>
                                <li>월<span>29</span></li>
                                <li>화<span>30</span></li>
                                <li>수<span>1</span></li>
                                <li>목<span>2</span></li>
                                <li>금<span>3</span></li>
                                <li>토<span>4</span></li>
                            </ul>
                        	
                        </div>

                        <div class="child2 child">
                            <div class="text-group">
                                <h5>경기 선택</h5>
                                <p>진행 중인 경기</p>
                            </div>
                            <div class="game-group">
	                            <c:forEach var="gameInfo" items="${gameInfo }" begin="0" end="2">
	                            	<div class="game g1 d-flex justify-content-between align-items-center">
	                                
		                                <div class="gameInfo">
		                                	<c:if test="${gameInfo.gameNo == 1 }">
		                                		<div class="gameImg"><img src="${path }/resources/img/game.png" alt="경기이미지1"></div>
		                                	</c:if>
		                                	<c:if test="${gameInfo.gameNo == 2 }">
		                                		<div class="gameImg dvsl"><img src="${path }/resources/img/dvsl.png" alt="경기이미지1"></div>
		                                	</c:if>
		                                    
		                                    <p class="d-flex flex-column">
		                                    <span>${gameInfo.stadium }</span>
		                                    <b>${gameInfo.gameName }</b>
		                                    <span><fmt:formatDate value="${gameInfo.gameDate }" pattern="yyyy.MM.dd HH:mm"/></span>
		                                    </p>
		                                </div>
		                                <div class="gameSd">
		                                    <button class="cbtn gamebtn" name="gameNo" value="${gameInfo.gameNo }" type="submit">경기 예매하기</button>
		                                </div>
		                            </div>
	                            </c:forEach>
							</div>
                        </div>
					</form>
                    </div> <!-- parents div -->
                    

                </section> <!--두번째 섹션 끘-->

                <section class="thirdSec mainSec">
                    
                    <div class="contents">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="titleText">
                                        <p class="text-light">경기일정</p>
                                        <h3>오픈 임박 경기 예매</h3>
                                    </div>
                                </div>

                                <div class="col-md-7">
                                    <div class="rightBanner d-flex flex-column justify-content-between">
                                        
                                        <c:forEach var="gameInfo" items="${gameInfo }" begin="0" end="1">
                                        <a href="${path }/ticket/order?gameNo=${gameInfo.gameNo}">
                                        <div class="game game1">
                                            <div class="gameImg">
                                                <img src="${path }/resources/img/서브배너.png" alt="서브배너이미지"/>
                                            </div>
                                            <div class="gameInfo">
                                            	<span>예매시작</span>
                                            	<p class="d-flex flex-column">
                                                    <i>오늘 <fmt:formatDate value="${gameInfo.startDate }" pattern="HH:mm"/></i>
                                                    <b>${gameInfo.gameName }</b>
                                                    
                                                    <span><fmt:formatDate value="${gameInfo.gameDate }" pattern="yyyy.MM.dd HH:mm"/></span>
                                                    <span>${gameInfo.stadium }</span>
                                                </p>
                                            </div>
                                        </div>
                                        </a>
                                        
                                        </c:forEach>
                                        
                                        <div class="game game3">
                                            <div class="gameImg">
                                                <img src="${path }/resources/img/서브배너.png" alt="서브배너이미지"/>
                                            </div>
                                            <div class="gameInfo">
                                                <span>예매시작</span>
                                                <p class="d-flex flex-column">
                                                    <i>오늘 12:34</i>
                                                    <b>플레이오프 2차전M LG트윈스 vs KIA타이거즈</b>
                                                    
                                                    <span>2023.05.04 (토) 14:00</span>
                                                    <span> 잠실야구장</span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--col-md-7-->
                            </div><!--row-->
                        </div><!--container-->
                    </div> <!--contents-->
                </section>

                <section class="fourthSec mainSec">
                    <div class="titleText">
                        <p>프로야구</p>
                        <h3>KBL구단현황</h3>
                    </div>

                    <div class="swiper club">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <div class="card">
                                    <a href="https://www.lgtwins.com/" target="_blank">
                                        <div class="club-img lg">
                                        </div>
                                        
                                        <div class="card-body">
                                            <p class="card-text t-25">LG트윈스</p>
                                        </div>
                                     </a>   
                                </div>
                            </div>
                            
                            <div class="swiper-slide">
                                <div class="card">
                                    <a href="https://www.ktwiz.co.kr/" target="_blank">
                                        <div class="club-img ktWiz"></div>
                                        
                                        <div class="card-body">
                                            <p class="card-text t-25">kt WIZ</p>
                                        </div>
                                    </a>    
                                </div>
                            </div>

                            <div class="swiper-slide">
                                <div class="card">
                                    <a href="https://www.ssglanders.com/main" target="_blank">
                                        <div class="club-img ssg"></div>
                                        
                                        <div class="card-body">
                                            <p class="card-text t-25">SSG랜더스</p>
                                        </div>
                                    </a>    
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="card">
                                    <a href="https://www.ncdinos.com/" target="_blank">
                                        <div class="club-img nc">
                                        </div>
                                        
                                        <div class="card-body">
                                            <p class="card-text t-25">NC다이노스</p>
                                        </div>
                                     </a>   
                                </div>
                            </div>

                            <div class="swiper-slide">
                                <div class="card">
                                    <a href="https://www.doosanbears.com/" target="_blank">
                                        <div class="club-img bears">
                                        </div>
                                        
                                        <div class="card-body">
                                            <p class="card-text t-25">두산베어스</p>
                                        </div>
                                    </a>    
                                </div>
                            </div>

                            <div class="swiper-slide">
                                <div class="card">
                                    <a href="https://tigers.co.kr/" target="_blank">
                                        <div class="club-img kia"></div>
                                        
                                        <div class="card-body">
                                            <p class="card-text t-25">KIA 타이거즈</p>
                                        </div>
                                    </a>    
                                </div>
                            </div>

                        </div><!--swiper-wrapper-->
                        <!-- pagination progress -->
                        <div class="swiper-pagination"></div>
                    </div><!--swiper-->

                </section>

                <section class="fifthSec mainSec">
                    <div class="bannerImg">
                        <img src="${path }/resources/img/banner.png" alt="">
                    </div>
                </section>
                  
                <section class="sixthSec mainSec">
                    <div class="titleText">
                        <h3 class="">공지사항</h3>
                    </div>

                    <div class="swiper notice">
                        <div class="swiper-wrapper">
                        	<c:forEach items="${noticeList}" var="noticeList" begin="0" end="9">
                        		<div class="swiper-slide">
		                            <div class="card">
		                                <div class="card-body">
		                                    <p class="card-title t-25"><a href="${path}/board/noticeView?seq=${noticeList.seq}">${noticeList.title }</a></p>
		                                    <p class="card-text t-18"><a href="${path}/board/noticeView?seq=${noticeList.seq}">${noticeList.content }</a></p>
		                                    <p class="card-text">
		                                    <fmt:formatDate value="${noticeList.writeDate}" pattern="yyyy-MM-dd" /></p>
		                                </div>
		                            </div>
			                        
								</div>
	                    	</c:forEach>
                        
                        </div>
                        <!-- pagination progress -->
                        <div class="swiper-pagination"></div>
                    </div>

                </section>
            </div>
        </div>
    </div>


    <br><br><br><br><br><br><br><br><br><br><br>

<%@ include file = "include/footer.jsp" %>