<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<link rel="stylesheet" href="${path}/resources/css/custom.css"/>
<link rel="stylesheet" href="${path}/resources/css/nhstyle.css"/>
<!-- Header - set the background image for the header in the line below-->
<header class="main-title py-5 bg-image-full" style="background-image: url('${path}/resources/img/title2.jpg')">
    <div class="text-center my-5">
        <h1 class="text-white fs-3 fw-bolder">예매 내역 조회</h1>
    </div>
</header>



<div class="event-schedule-area-two bg-color pad100">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <section>
                    <div class="section-title d-flex flex-column justify-content-between">
                        <span>· 당일 경기는 취소 불가</span>
                        <span>· 카드결제 취소 처리의 경우 환불 접수 후 실제 취소 승인은 카드사 사정에 따라 처리 기간이 상이할 수 있습니다.</span>
                        <span>· 현장구매한 티켓은 매표소 방문 시에만 취소 가능합니다. (결제한 카드 및 영수증 지참 필수)</span>
                    </div>
                </section>
                </div><!-- /.col end-->
                
            </div><!-- row end-->
            
            <div class="row">
                <div class="col-lg-12">
                    <section>
                    <ul class="nav custom-tab" >
                        <li class="nav-item" role="presentation">
                           <a class="nav-link active" data-bs-target=#home data-bs-toggle="tab">
                           예매내역 조회
                           </a>
                        </li>
                        <li class="nav-item" role="presentation">
                           <a class="nav-link" data-bs-target=#cancel data-bs-toggle="tab">
                           취소내역 조회
                           </a>
                        </li>
                     </ul>

                     <form class="form">
                        <div class="period d-flex justify-content-around align-items-center">
                            <span>조회 기간</span>
                            <button class="cbtn btn btn-outline-secondary p-btn" name="period" value="all">전체</button>
                            <button class="cbtn btn btn-outline-secondary p-btn" name="period" value="7">7일</button>
                            <button class="cbtn btn btn-outline-secondary p-btn" name="period" value="1">1개월</button>
                            <button class="cbtn btn btn-outline-secondary p-btn" name="period" value="3">3개월</button>
                        </div>
                    </form>

                    <div class="tab-content">
                    
                        <div class="tab-pane fade active show" id="home" role="tabpanel">
                            <div class="line t-20">
                            총 ${count}건
                            </div>
                            
                            	
	                            <div class="table-responsive">
	                                <table class="table">
	                                    <tbody>
	                                    	<c:forEach items="${detail}" var="detail">
	                                    	<form method="post" role="form">
	                                    		<c:if test="${detail.cancel == 1}">
	                                    		
			                                        <tr class="inner-box d-flex justify-content-between align-items-center">
			                                        
			                                            <td class="d-flex align-items-center">
			                                            	<c:if  test="${detail.gameNo ==1 }">
												            	<div class="event-img">
			                                                    <img src="${path }/resources/img/game1.jpg" alt="" />
			                                                	</div>
												            </c:if>
												            <c:if  test="${detail.gameNo ==2 }">
												            	<div class="event-img">
			                                                    <img src="${path }/resources/img/game2.jpg" alt="" />
			                                                	</div>
											            	</c:if>
			                                            
			                                                
				                                                <div class="event-wrap ps-5">
				                                                	
				                                                    <h5 class="">
					                                                    <a href="#">${detail.gameName}</a>
				                                                    </h5>
				                                                    <div class="meta">
				                                                        <div>
				                                                            <span class="">
				                                                            <fmt:formatDate value="${detail.gameDate}" pattern="yyyy.MM.dd HH:mm"/>
				                                                            </span>
				                                                        </div>
				                                                        <div>
				                                                            <span class="">장소 : ${detail.stadium}</span>
				                                                        </div>
				                                                        <div class="mt-3">
				                                                            <span class="">예매 좌석 :  
				                                                            <!-- <b>A2</b> (총 <b>1</b>매) -->
				                                                            	<b>${detail.seat1}</b>
				                                                            	<b>${detail.seat2}</b>
				                                                            	<b>${detail.seat3}</b>
				                                                            </span>
				                                                        </div>
				                                                        <div>
				                                                            <span class="">예매 번호 : ${detail.ticketNo}</span>
				                                                        </div>
				                                                        <div>
				                                                            <span class="">결제 금액 : 
				                                                            <fmt:formatNumber value="${detail.price}" pattern="###,### 원"/></span>
				                                                        </div>
				                                                        <div>
				                                                            <span class="">결제 일자 : 
				                                                            <fmt:formatDate value="${detail.buyDate}" pattern="yyyy-MM-dd hh:mm"/></span>
				                                                        </div>
				                                                        <div>
				                                                            <span class="">현재 상태 : <b>${detail.state}</b></span>
				                                                        </div>
				                                                    </div>
				                                                    
				                                                </div>
			                                            </td>
			                                            <td>
			                                                <div class="primary-btn">
			                                                <input type="hidden" name="ticketNo" value="${detail.ticketNo}"/>
			                                                	<input type="submit" class="form-control cbtn" id="detail"  value="예매취소"/>
			                                                </div>
			                                            </td>
			                                            
			                                        </tr>
			                                       
		                                        </c:if>
		                                        </form>
		                                        
	                                        </c:forEach>
	                                        
	                                    </tbody>
	                                </table>
	                            </div>
                            
                        </div> <!--home-->

                        <div class="tab-pane fade " id="cancel" role="tabpanel">
                            <div class="line t-20">
                            총 ${cancelCount }건
                            </div>
                            
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <c:forEach items="${detail}" var="detail">
                                    		<c:if test="${detail.cancel == 0}">
		                                        <tr class="inner-box d-flex justify-content-between align-items-center">
		                                            <td class="d-flex align-items-center">
		                                                <c:if  test="${detail.gameNo ==1 }">
												            	<div class="event-img">
			                                                    <img src="${path }/resources/img/game1.jpg" alt="" />
			                                                	</div>
												            </c:if>
												            <c:if  test="${detail.gameNo ==2 }">
												            	<div class="event-img">
			                                                    <img src="${path }/resources/img/game2.jpg" alt="" />
			                                                	</div>
											            	</c:if>
		                                                <div class="event-wrap ps-5">
		                                                    <h5 class="">
				                                                    <a href="#">${detail.gameName}</a>
			                                                </h5>
		                                                    <div class="meta">
		                                                        <div>
		                                                            <span class="">
		                                                            <fmt:formatDate value="${detail.gameDate}" pattern="yyyy.MM.dd HH:mm"/>
		                                                            </span>
		                                                        </div>
		                                                        <div>
		                                                            <span class="">${detail.stadium}</span>
		                                                        </div>
		                                                        <div class="mt-3">
		                                                            <span class="">예매 좌석 :  
			                                                            <!-- <b>A2</b> (총 <b>1</b>매) -->
			                                                            	<b>${detail.seat1}</b>
			                                                            	<b>${detail.seat2}</b>
			                                                            	<b>${detail.seat3}</b>
			                                                            </span>
		                                                        </div>
		                                                        <div>
		                                                            <span class="">예매 번호 : ${detail.ticketNo}</span>
		                                                        </div>
		                                                        <div>
		                                                            <span class="">결제 금액 : <fmt:formatNumber value="${detail.price}" pattern="###,### 원"/></span>
		                                                        </div>
		                                                        <div>
		                                                            <span class="">결제 일자 : 
		                                                            <fmt:formatDate value="${detail.buyDate}" pattern="yyyy.MM.dd HH:mm"/></span>
		                                                        </div>
		                                                        <div>
		                                                            <span class="">현재 상태 : <b>${detail.state}</b></span>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </td>
		                                            <td>
		                                                <div class="primary-btn">
		                                                    
		                                                </div>
		                                            </td>
		                                        </tr>
	                                        </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div> <!--cancel-->
                    </div>
                    <div class="primary-btn text-center">
                        <br><br><br><br>
                    </div>
                </section>
                </div>
                <!-- /col end-->
            </div>
            <!-- /row end-->
        </div>
        <br><br><br><br><br><br><br><br>
    </div>

<%@ include file="../include/footer.jsp" %>