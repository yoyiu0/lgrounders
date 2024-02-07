<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/order.css"/>

<script>
$(document).ready(function() {
	$("section.order-next").hide();
	//좌석 체크
   	let seatArray = [];
  	//object 생성
	let data = {};
	
  	//TicketVO형의 seatList를 불러와서 data 오브젝트의 속성으로 넣어주고
  	//그 data 오브젝트를 array에 넣어줌
    <c:forEach items="${seatList }" var="seatList" varStatus="status">
    	data = {};
    	data.seat1 = "${seatList.seat1 }";
    	data.seat2 = "${seatList.seat2 }";
    	data.seat3 = "${seatList.seat3 }";
    	data.gameNo = "${seatList.gameNo }";
    	
    	seatArray.push(data);
    	
    </c:forEach>
	
	
	$(".locationBtn").click(function(){
		let locationVal = $(this).val();
        $("input[name='location']").attr("value", locationVal);
        if(locationVal == "A"){
        	$(".locationText").text("1루석 (A)");
        }else if(locationVal == "B"){
        	$(".locationText").text("3루석 (B)");
        }else if(locationVal == "C"){
        	$(".locationText").text("외야석 (C)");
        }
        
        
		$("section.order-next").show();
		$("section.order-prev").hide();
		
		//DB에서 받아온 좌석들만 disabled 해줘야함
		$("input[name=seatChk]").attr("disabled",true);
		
	    
		//seatArray의 길이만큼 반복
	    for(var i=0; i<seatArray.length; i++){
	    	//seatArray의 gameNo값과 현재 고객이 선택한 gameNo값이 같다면 괄호 안 실행
	    	if(seatArray[i].gameNo == $("input[name=gameNo]").val()){
	    		//좌석 array의 seat 앞 location(1루,3루,외야)과 현재 고객이 선택한 location값이 같다면 괄호 안 실행
	    		if(seatArray[i].seat1.substring(0,1) == $("input[name=location]").val()){
	        		
	    			//value로 checkbox disabled함, label에도 disabled 클래스 추가
	    			$("input[name=seatChk][value="+seatArray[i].seat1.substring(2)+"]").prop("checked",true);
	        		$("input[name=seatChk][value="+seatArray[i].seat1.substring(2)+"]").attr("disabled",true);
	            	$("label[for="+seatArray[i].seat1.substring(2)+"]").addClass("disabled");
	            	
	            	//seat2가 비어있지 않다면
	            	if(seatArray[i].seat2 != null && seatArray[i].seat2 != ''){
	            		$("input[name=seatChk][value="+seatArray[i].seat2.substring(2)+"]").prop("checked",true);
	            		$("input[name=seatChk][value="+seatArray[i].seat2.substring(2)+"]").attr("disabled",true);
	                	$("label[for="+seatArray[i].seat2.substring(2)+"]").addClass("disabled");
	            	}
	            	if(seatArray[i].seat3 != null && seatArray[i].seat3 != ''){
	            		$("input[name=seatChk][value="+seatArray[i].seat3.substring(2)+"]").prop("checked",true);
	            		$("input[name=seatChk][value="+seatArray[i].seat3.substring(2)+"]").attr("disabled",true);
	            		$("label[for="+seatArray[i].seat3.substring(2)+"]").addClass("disabled");
	            	}
	            	
	        	}
	    	}
	    }//end for
		
		
	});
	
	
	

    $(".positionBtn").click(function(){
    	$("input[name=seatChk]").prop("checked",false);
   		$("input[name=seatChk]").attr("disabled",false);
    	$("label").removeClass("active");
    	
    	
    	for(var i=0; i<seatArray.length; i++){
	    	//seatArray의 gameNo값과 현재 고객이 선택한 gameNo값이 같다면 괄호 안 실행
	    	if(seatArray[i].gameNo == $("input[name=gameNo]").val()){
	    		//좌석 array의 seat 앞 location(1루,3루,외야)과 현재 고객이 선택한 location값이 같다면 괄호 안 실행
	    		if(seatArray[i].seat1.substring(0,1) == $("input[name=location]").val()){
	        		
	    			//value로 checkbox disabled함, label에도 disabled 클래스 추가
	    			
	        		$("input[name=seatChk][value="+seatArray[i].seat1.substring(2)+"]").attr("disabled",true);
	            	$("label[for="+seatArray[i].seat1.substring(2)+"]").addClass("disabled");
	            	
	            	//seat2가 비어있지 않다면
	            	if(seatArray[i].seat2 != null && seatArray[i].seat2 != ''){
	            		
	            		$("input[name=seatChk][value="+seatArray[i].seat2.substring(2)+"]").attr("disabled",true);
	                	$("label[for="+seatArray[i].seat2.substring(2)+"]").addClass("disabled");
	            	}
	            	if(seatArray[i].seat3 != null && seatArray[i].seat3 != ''){
	            		
	            		$("input[name=seatChk][value="+seatArray[i].seat3.substring(2)+"]").attr("disabled",true);
	            		$("label[for="+seatArray[i].seat3.substring(2)+"]").addClass("disabled");
	            	}
	            	
	        	}
	    	}
	    }//end for
        

    	
    });
	
	
});
</script>

<script src="${path }/resources/js/orderscript.js"></script>


        <!-- Header - set the background image for the header in the line below-->
<header class="main-title py-5 bg-image-full" style="background-image: url('${path}/resources/img/title2.jpg')">
    <div class="text-center my-5">
        <h1 class="text-white fs-3 fw-bolder">경기예매</h1>
    </div>
</header>
<!-- Content section-->
<section class="py-6">
    <div class="container my-5">
        <div class="row row1 justify-content-center">
            <div class="col-xl-4 gameImg">
            	<c:if  test="${gameInfo.gameNo ==1 }">
            	<div class="h-100 img-fluid" style="background-image: url(${path}/resources/img/poster.jpg)">
                    <!-- Put anything you want here! The spacer below with inline CSS is just for demo purposes!-->
                </div>
            	</c:if>
            	<c:if  test="${gameInfo.gameNo ==2 }">
            	<div class="h-100 img-fluid" style="background-image: url(${path}/resources/img/poster2.jpg)">
                    <div style="height: 5rem"></div>
                </div>
            	</c:if>
                
            </div>
            <div class="col-xl-8">
                <h2 class="fw-bolder">
                ${gameInfo.gameName }
                
                </h2>
                <hr>
                <div class="bd-highlight container1">
                    <div class="me-4 bd-highlight col-5">
                        <div class="d-flex flex-row">
                            <p class="lead green-text">예매시작</p>
                            <p class="textEnd">
                            <fmt:formatDate value="${gameInfo.startDate }" pattern="yyyy.MM.dd HH:mm"/>
                            </p>
                        </div>
                        <div class="d-flex flex-row">
                            <p class="lead gray-text">장소</p>
                            <p class="plus textEnd">${gameInfo.stadium }</p>
                        </div>
                        <div class="d-flex flex-row">
                            <p class="lead gray-text textW">가격</p>
                            <p class="mb-0 plus textEnd">1석 10,000원</p>
                        </div>
                    </div>

                    <hr>
                    <div class="p-3 bd-highlight col-5 card2">
                        <div class="d-flex flex-row">
                            <p class="lead green-text">경기일정</p>
                            <p class="textEnd">
                                <fmt:formatDate value="${gameInfo.gameDate }" pattern="yyyy.MM.dd HH:mm"/></p>
                        </div>
                        <div class="d-flex flex-row">
                            <p class="lead gray-text">이용연령</p>
                            <p class="textEnd">
                            	<c:if test="${gameInfo.age == 0}">
                            		전체이용가
                            	</c:if>
                            
                            </p>
                        </div>
                        <div class="d-flex flex-row">
                            <p class="lead gray-text">혜택</p>
                            <p class="plus textEnd">무이자할부</p>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</section>

  <section class="order-tab order-prev" id="order-tab">      
    <div class="container">
        <div class="order-pad row justify-content-center tab">
            <div class="col-9 bd-highlight container1">
                <div class="col-4 order-c">
                    <div>
                        <div class="mini-title">
                            <p class="fw-bolder text-center">관람구역 선택</p>
                        </div>
                        <div class="place">
                            <div class="textPlace text-center">
                                <div class="bleacher">
                                    <p>외야석</p>
                                </div>
                                <div class="base">
                                    <p class="base3">3루석</p>
                                    <p class="base1">1루석</p>
                                </div>
                            </div>
                            <div class="placeImg img-fluid bg-image-full mx-auto">
                                <img src="${path}/resources/img/place.png">
                            </div>
                        </div>
                        <div class="baseSub">
                            <p>1루석 / 3루석 / 외야석 중에 선택</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="PlaceDate">
                        <p class="fBold">경기일정</p>
                        <p>05.28 (일) 14:00</p>
                    </div>
                    <div class="order-button">
                        <button type="button" class="btn d-flex flex-row justify-content-center locationBtn" name="location" value="A">
                            <p class="SeatB">1루석</p>
                            <p>1루 내야 출입구 이용</p>
                        </button>
                        <button type="button" class="btn d-flex flex-row justify-content-center locationBtn" name="location" value="B">
                            <p class="SeatB">3루석</p>
                            <p>3루 내야 출입구 이용</p>
                        </button>
                        <button type="button" class="btn d-flex flex-row justify-content-center locationBtn" name="location" value="C">
                            <p class="SeatB">외야석</p>
                            <p>1루/3루 외야 출입구 이용</p>
                        </button>
                    </div>
                    <div class="baseSub2">
                        <p>위치 선택 후 좌석 선택하기를 눌러주세요</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <p class="lead gray-text">예매내역</p>
                <div class="midFlex">
                    <div class="d-flex">
                        <p class="arenaT">관람구역</p>
                        <p class="arenaS">선택 전</p>
                    </div>
                    <div class="d-flex second">
                        <p class="arenaT">관람위치</p>
                        <p class="arenaS">선택 전</p>
                    </div>
                </div>
                <div class="d-flex">
                    <p class="pw1">인원 수 선택</p>
                    <select disabled="true">
                         <option></option>
                         <option value="1">1</option>
                         <option value="2">2</option>
                         <option value="3">3</option>
                     </select>
                </div>
                <div>
                    <p class="pw">배정좌석</p>
                    <div class="d-flex">
                        <input class="form-control assignSeat_input" name="ai1" type="text" placeholder="선택 전" aria-label="default input example" >
                        <input class="form-control assignSeat_input" name="ai2" type="text" placeholder="선택 전" aria-label="default input example" >
                        <input class="form-control assignSeat_input" name="ai3" type="text" placeholder="선택 전" aria-label="default input example" >
                    </div>
                </div>
            </div>
        </div>
    </div>
  </section> 


<!-- Content section-->
<form method="post">


<section class="order-tab order-next">
            <div class="container">
                <div class="order-pad row justify-content-center tab2">
                    <div class="col-9 bd-highlight container1">
                        <div class="col-4 order-c order2">
                            <div>
                                <div class="mini-title">
                                    <p class="fw-bolder text-center">경기장 위치</p>
                                </div>
                                <div class="text-center">
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <div class="but-title frontS">앞 좌석</div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <input type="checkbox" id="1" name="seatChk" value="1"/>
                                                <label for="1" class="seat greenChk"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="2" name="seatChk" value="2"/>
                                                <label for="2" class="seat greenChk"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="3" name="seatChk" value="3"/>
                                                <label for="3" class="seat greenChk"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="4" name="seatChk" value="4"/>
                                                <label for="4" class="seat greenChk"></label>
                                            </td>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="marginR">
                                                <div class="but-title middleS">중간</div>
                                            </td>
                                            <td></td>
                                            <td>
                                                <input type="checkbox" id="5" name="seatChk" value="5"/>
                                                <label for="5" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="6" name="seatChk" value="6"/>
                                                <label for="6" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="7" name="seatChk" value="7"/>
                                                <label for="7" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="8" name="seatChk" value="8"/>
                                                <label for="8" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="9" name="seatChk" value="9"/>
                                                <label for="9" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="10" name="seatChk" value="10"/>
                                                <label for="10" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="11" name="seatChk" value="11"/>
                                                <label for="11" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="12" name="seatChk" value="12"/>
                                                <label for="12" class="seat"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="but-titleM middleS">중간</div>
                                            </td>
                                            <td></td>
                                            <td>
                                                <input type="checkbox" id="13" name="seatChk" value="13"/>
                                                <label for="13" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="14" name="seatChk" value="14"/>
                                                <label for="14" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="15" name="seatChk" value="15"/>
                                                <label for="15" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="16" name="seatChk" value="16"/>
                                                <label for="16" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="17" name="seatChk" value="17"/>
                                                <label for="17" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="18" name="seatChk" value="18"/>
                                                <label for="18" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="19" name="seatChk" value="19"/>
                                                <label for="19" class="seat"></label>
                                            </td>
                                            <td>
                                                <input type="checkbox" id="20" name="seatChk" value="20"/>
                                                <label for="20" class="seat"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                        <td colspan="2">
                                            <div class="but-title backS">뒷 좌석</div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <input type="checkbox" id="21" name="seatChk" value="21"/>
                                            <label for="21" class="seat greenChk"></label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="22" name="seatChk" value="22"/>
                                            <label for="22" class="seat greenChk"></label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="23" name="seatChk" value="23"/>
                                            <label for="23" class="seat greenChk"></label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="24" name="seatChk" value="24"/>
                                            <label for="24" class="seat greenChk"></label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="25" name="seatChk" value="25"/>
                                            <label for="25" class="seat greenChk"></label>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="26" name="seatChk" value="26"/>
                                            <label for="26" class="seat greenChk"></label>
                                        </td>
                                        <td colspan="2"></td>
                                    </tr>
                                    </table>
                                </div>
                                <p class="textB">앞 / 중간 / 뒤 중에 선택</p>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="PlaceDate">
                                <p class="fBold">경기일정</p>
                                <p>05.28 (일) 14:00</p>
                            </div>
                            <div class="order-button">
                                <button type="button" value="F" class="btn btn-outline-primary row justify-content-center positionBtn btnF" >
                                    <div class="d-flex">
                                        <p class="fw-bolder">앞</p>
                                        <p>경기장에 가장 가까운 좌석</p>
                                    </div>
                                </button>
                                <button type="button" value="M" class="btn btn-outline-primary row justify-content-center positionBtn btnM" >
                                    <div class="d-flex">
                                        <p class="fw-bolder">중간</p>
                                        <p>경기장 중간 위치 좌석</p>
                                    </div>
                                </button>
                                <button type="button" value="B" class="btn btn-outline-primary row justify-content-center positionBtn btnB" >
                                    <div class="d-flex">
                                        <p class="fw-bolder">뒤</p>
                                        <p>경기장에서 가장 먼 좌석</p>
                                    </div>
                                </button>
                            </div>
                            <p>인원수 부터 선택하신 후 좌석을 선택해주세요</p>
                        </div>
                    </div>
                    <div class="col-lg-3 marginB">
                        <p class="lead gray-text">예매내역</p>
                        <div class="midFlex">
                            <div class="d-flex">
                                <p>관람구역</p>
                                <p class="locationText">선택 전</p>
                            </div>
                            <div class="d-flex">
                                <p>관람위치</p>
                                <p class="positionText">선택 전</p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <p>인원 수 선택</p>
                            <select name="people" id="peopleSelect">
                                <option></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                        </div>
                        <div>
                            <p class="pw">배정좌석</p>
                            <div class="d-flex">
                                <input class="form-control assignSeat_input" name="ai1" type="text" placeholder="선택 전" aria-label="default input example" >
                                <input class="form-control assignSeat_input" name="ai2" type="text" placeholder="선택 전" aria-label="default input example" >
                                <input class="form-control assignSeat_input" name="ai3" type="text" placeholder="선택 전" aria-label="default input example" >
                            </div>
                        </div>
                        <div class="btn-group mt-5">
                        	<button type="submit" class="btn cbtn btn-secondary orderBtn" onclick="alert('예매 완료!')">예매하기</button>
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>
  		<input type="hidden" name="gameNo" value="${gameNo}">
        <input type="hidden" name="location">
        <input type="hidden" name="position">
        <input type="hidden" name="people">
        <input type="hidden" name="seat1">
        <input type="hidden" name="seat2">
        <input type="hidden" name="seat3">

 </form>

<!-- 상세설명 -->
<section class="py-6">
    <div class="container my-5">
        <div class="border-0 row row1 justify-content-center card">
            <div class="col-xl-12">
                <ul class="nav custom-tab my-7" >
                    <li class="nav-item" role="presentation">
                       <a class="nav-link active" data-bs-target=#match data-bs-toggle="tab">
                        경기정보
                       </a>
                    </li>
                    <li class="nav-item" role="presentation">
                       <a class="nav-link" data-bs-target=#sale data-bs-toggle="tab">
                       판매정보
                       </a>
                    </li>
                </ul>


                <div class="tab-content">
                    <div class="tab-pane fade active show" id="match" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr class="inner-box d-flex justify-content-between align-items-center">
                                        <td class="row justify-content-center">
                                            <div class="notice-tx-1">
                                                <h3>예매안내</h3>
                                                <p>예매 마감 시간 : 경기 시작 후 30분까지 가능<br>
                                                    (현장 판매에 한해, 경기 종료 전까지 티켓 구매 가능)<br>
                                                    <br>
                                                    예매 취소 : 경기 시작 1일 전 마감<br>
                                                    (티켓 취소 수수료는 규정을 따름)
                                                </p>
                                            </div>
                                            <div class="notice-tx-1">
                                                <h3>공지사항</h3>
                                                <p class="p1">※ 공연 예매 전 반드시 팝업 차단을 해제해 주세요.</p>
                                                <p class="p2">[무통장 입금 관련 안내]</p>
                                                <p class="p1">- 본 경기는 원활한 예매 진행을 위해 예매 시 무통장 입금 결제가 제한됩니다.</p>
                                                <p class="p2">[휠체어석 예매 안내]</p>
                                                <p>- 휠체어석(장애인석) 예매는 오전 9시부터 티켓 고객센터(1544-0000)를 통해 전화 예매로만 가능합니다.<br>
                                                    (전화 예매 가능 시간: 평일 9시~18시)<br>
                                                  - 공연 당일 예매자 본인의 실물 신분증과 장애인 등록증(또는 복지카드) 확인이 이루어지며, 미지참 시 입장이 불가합니다.<br>
                                                    (복지카드를 소지하고 계시더라도 휠체어를 이용하지 않는 관객은 휠체어석 이용이 불가합니다.)<br>
                                                  - 휠체어석 예매 티켓은 현장 수령만 가능하며, 공연 당일 예매자 본인(휠체어석 이용자)이 직접 티켓을 수령해야 합니다.<br>
                                                    (대리수령 및 양도불가)
                                                </p>
                                            </div>
                                            <div class="notice-tx-1">
                                                <h3>상세정보</h3>
                                                <div class="order-img">
                                                	<c:if test="${gameInfo.gameNo == 1 }">
                                                	<img src="${path}/resources/img/sub2.jpg" alt="" />
                                                	</c:if>
                                                	<c:if test="${gameInfo.gameNo == 2 }">
                                                	<img src="${path}/resources/img/sub.jpg" alt="" />
                                                	</c:if>
                                                    
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade " id="sale" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr class="inner-box justify-content-between">
                                        <td class="row justify-content-center">
                                            <div class="notice-tx-1">
                                                <h3>상품관련정보</h3>
                                                <table class="ground-table table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td class="table-back">
                                                                <p class="td-p">주최/기획</p>
                                                            </td>
                                                            <td>
                                                                <p>(주)그라운더즈 </p>
                                                            </td>
                                                            <td class="table-back">
                                                                <p class="td-p">고객문의</p>
                                                            </td>
                                                            <td>
                                                                <p class="td-p">1588-0000</p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table-back">
                                                                <p class="td-p">관람등급</p>
                                                            </td>
                                                            <td>
                                                                <p>전체관람가</p>
                                                            </td>
                                                            <td class="table-back">
                                                                <p class="td-p">경기장소</p>
                                                            </td>
                                                            <td>
                                                                <p>잠실야구장</p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table-back">
                                                                <p class="td-p">예매수수료</p>
                                                            </td>
                                                            <td>
                                                                <p>좌석별상이</p>
                                                            </td>
                                                            <td class="table-back">
                                                                <p class="td-p">배송료</p>
                                                            </td>
                                                            <td>
                                                                <p>현장수령 무료</p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table-back">
                                                                <p class="td-p">현장예매</p>
                                                            </td>
                                                            <td colspan="3">
                                                                <p>티켓 현장 예매 시 1인 4매까지 구입가능, 현장 예매 문의는 각 구단쪽으로 문의</p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table-back">
                                                                <p class="td-p">예매취소 조건</p>
                                                            </td>
                                                            <td colspan="3">
                                                                <p>· 문화상품권 사용 불가합니다.<br>
                                                                ·티켓교환 및 경기장 입장은 2시간 전부터 가능합니다.<br>
                                                                <br>
                                                                예매 취소 : 경기당일 시작 4시간 전까지 가능 (※ 예매한 티켓의 현장 환불 및 취소 불가)
                                                                <br>
                                                                </p>
                                                                <table class="ground-table table table-bordered">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p">우천으로 인한 경기 취소</p>
                                                                            </td>
                                                                            <td class="table-back">
                                                                                <p class="td-p">환불범위</p>        
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <p>경기 진행 후 5회 이전 취소</p>
                                                                            </td>
                                                                            <td>
                                                                                <p>전액 환불</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <p>경기 진행 후 5회 이후 취소</p>
                                                                            </td>
                                                                            <td>
                                                                                <p>경기성립으로 환불 불가</p>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <p>
                                                                우천취소 결정 : KBO에서 강수량 등 확인하여 경기시작 3시간전부터 경기시작전까지 전 우천 취소여부 결정<br>
                                                                경기시작 2~3시간 전에 KBO 홈페이지에 우천취소 공지 됩니다.
                                                                </p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table-back">
                                                                <p class="td-p">예매취소조건</p>
                                                            </td>
                                                            <td colspan="3">
                                                                <p>
                                                                    · 문화상품권 사용 불가합니다.<br>
                                                                    ·티켓교환 및 경기장 입장은 2시간 전부터 가능합니다.<br>
                                                                    <br>
                                                                    예매 취소 : 경기당일 시작 4시간 전까지 가능 (※ 예매한 티켓의 현장 환불 및 취소 불가)<br>
                                                                </p>
                                                                <div class="d-flex align-items-center">
                                                                    <p class="fw-bold">LG트윈스</p>
                                                                    <p>(트윈스샵 02-418-8005)</p>
                                                                </div>
                                                                <table class="table table-bordered">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="table-back align-middle" rowspan="2">
                                                                                <p class="td-p taj">좌석명</p>
                                                                            </td>
                                                                            <td class="table-back" colspan="2">
                                                                                <p class="td-p taj">입장권가격</p>
                                                                            </td>
                                                                            <td class="table-back" colspan="2">
                                                                                <p class="td-p taj">LG트윈스 성인회원</p>
                                                                            </td>
                                                                            <td class="table-back" colspan="2">
                                                                                <p class="td-p taj">LG트윈스 어린이회원</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back2">주중</td>
                                                                            <td class="table-back2">주말</td>
                                                                            <td class="table-back2">주중</td>
                                                                            <td class="table-back2">주말</td>
                                                                            <td class="table-back2">주중</td>
                                                                            <td class="table-back2">주말</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">프리미엄석</p>
                                                                            </td>
                                                                            <td colspan="2" class="align-middle">70,000원</td>
                                                                            <td rowspan="3" colspan="2" class="align-middle">동일가격</td>
                                                                            <td rowspan="2" colspan="2" class="align-middle">동일가격</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">테이블석</p>
                                                                            </td>
                                                                            <td class="align-middle">40,000원</td>
                                                                            <td class="align-middle">45,000원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">익사이팅존</p>
                                                                            </td>
                                                                            <td class="align-middle">20,000원</td>
                                                                            <td class="align-middle">25,000원</td>
                                                                            <td colspan="2" class="align-middle">어린이 입장 제한</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">블루석</p>
                                                                            </td>
                                                                            <td class="align-middle">15,000원</td>
                                                                            <td class="align-middle">17,000원</td>
                                                                            <td class="align-middle">13,000원</td>
                                                                            <td class="align-middle">15,000원</td>
                                                                            <td class="align-middle">7,500원</td>
                                                                            <td class="align-middle">8,500원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">레드석</p>
                                                                            </td>
                                                                            <td class="align-middle">12,000원</td>
                                                                            <td class="align-middle">14,000원</td>
                                                                            <td class="align-middle">10,000원</td>
                                                                            <td class="align-middle">12,000원</td>
                                                                            <td class="align-middle">6,000원</td>
                                                                            <td class="align-middle">7,000원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">네이비석</p>
                                                                            </td>
                                                                            <td class="align-middle">10,000원</td>
                                                                            <td class="align-middle">12,000원</td>
                                                                            <td class="align-middle">8,000원</td>
                                                                            <td class="align-middle">10,000원</td>
                                                                            <td class="align-middle">5,000원</td>
                                                                            <td class="align-middle">6,000원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">그린석(외야)</p>
                                                                            </td>
                                                                            <td class="align-middle">7,000원</td>
                                                                            <td class="align-middle">8,000원</td>
                                                                            <td class="align-middle">5,000원</td>
                                                                            <td class="align-middle">6,000원</td>
                                                                            <td colspan="2" class="align-middle">무료입장</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>

                                                                <p class="fw-bold dosuan">두산베어스</p>
                                                                <table class="table table-bordered">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td class="table-back align-middle" rowspan="2">
                                                                                <p class="td-p taj">좌석명</p>
                                                                            </td>
                                                                            <td class="table-back align-middle" colspan="2">
                                                                                <p class="td-p taj">입장권가격</p>
                                                                            </td>
                                                                            <td class="table-back align-middle" colspan="2">
                                                                                <p class="td-p taj">군경/청소년</p>
                                                                            </td>
                                                                            <td class="table-back align-middle" colspan="2">
                                                                                <p class="td-p taj">어린이,장애자,유공자,경로자</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back2">주중</td>
                                                                            <td class="table-back2">주말/공휴일</td>
                                                                            <td class="table-back2">주중</td>
                                                                            <td class="table-back2">주말/공휴일</td>
                                                                            <td class="table-back2">주중</td>
                                                                            <td class="table-back2">주말/공휴일</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">VIP석</p>
                                                                            </td>
                                                                            <td colspan="2" class="align-middle">60,000원</td>
                                                                            <td colspan="4" rowspan="6" class="align-middle">동일가격</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">테이블석</p>
                                                                            </td>
                                                                            <td class="align-middle">40,000원</td>
                                                                            <td class="align-middle">45,000원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">익사이팅존</p>
                                                                            </td>
                                                                            <td class="align-middle">20,000원</td>
                                                                            <td class="align-middle">25,000원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">블루석</p>
                                                                            </td>
                                                                            <td class="align-middle">15,000원</td>
                                                                            <td class="align-middle">17,000원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">레드석</p>
                                                                            </td>
                                                                            <td class="align-middle">12,000원</td>
                                                                            <td class="align-middle">14,000원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">네이비석</p>
                                                                            </td>
                                                                            <td class="align-middle">10,000원</td>
                                                                            <td class="align-middle">12,000원</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="table-back">
                                                                                <p class="td-p taj">외야석(자유석)</p>
                                                                            </td>
                                                                            <td class="align-middle">7,000원</td>
                                                                            <td class="align-middle">8,000원</td>
                                                                            <td class="align-middle">5,000원</td>
                                                                            <td class="align-middle">6,000원</td>
                                                                            <td class="align-middle">3,000원</td>
                                                                            <td class="align-middle">4,000원</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <p>
                                                                    ※ 장애인 휠체어 이용시 레드석(홈경기시 1루 : 101.102블럭, 원정경기시 3루 : 121.122블록) 이용가능<br>
                                                                    예약 후 맨 뒷자리쪽 휠체어 좌석 이용</p>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                  </table>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>               
        </div>
    </div>
    	
</section>


<script>
/*function next(){
	//XMLHttpRequest object
	const xhttp = new XMLHttpRequest();
	
	//Define a callback function id find
	xhttp.onload = function(){
		document.getElementById("order-tab").innerHTML = this.responseText;
	}
	//요청 보내기 부분
	xhttp.open("GET","/ticket/order_next",true);
	xhttp.send();
}*/
</script>


<%@ include file = "../include/footer.jsp" %>
