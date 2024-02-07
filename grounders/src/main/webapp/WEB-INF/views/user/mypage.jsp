<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/nhstyle.css"/>
<link rel="stylesheet" href="${path}/resources/css/custom.css"/>
<link rel="stylesheet" href="${path}/resources/css/loginstyle.css"/>
<script type="text/javascript" src="${path}/resources/js/mypage.js"></script>
<script type="text/javascript" src="${path}/resources/js/daum.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<br><br><br>
    <div class="container">
        <section class="subSec">
        <div class="row">
            <div class="col-md-5">
                <div class="cbox profile">
                    <div class="profileTop">
                        <img src="${path}/resources/img/person_icon.png" class="w-50" alt="프로필 아이콘"/>
                        <p>
                            <i class="h4">${member.name }</i><br>
                            <span>${member.id }</span><br>
                            <b>${member.point } P</b><br><br>
                        </p>

                        <div class=" pContent d-flex flex-column justify-content-between">
                            <a href="${path }/ticket/detail" class="t-18">예매내역</a>
                            <a href="#" class="t-18">보안설정</a>
                            <a href="#" class="t-18">이력관리</a>
                        </div>  
                        
                    </div>

                    <div class="profileBt">
                        <div class="btMenu d-flex justify-content-between">
                            <a href="${path }/user/signout">로그아웃</a>
                            <a href="#">고객센터</a>
                            <a href="#">한국어</a>
                        </div>
                        
                        <img src="${path }/resources/img/logo.png" alt="로고" style="width:50%">
                        
                    </div>

                </div>
            </div>


            <div class="col-md-7">
                <div class="cbox info">
                    <form name="mypage" method="post" class="form">
                    <div class="infoBody">
                        <div class="text-center">
                            <h1 class="h4 mb-4">
                            내 정보
                            </h1>
                        </div>
                        

                            <div class="form-group mb-4 d-flex justify-content-between">
                                <input type="text" name="id" class="form-style" style="color:#888" value="${member.id } &nbsp;&nbsp;&nbsp;(아이디는 변경불가)" autocomplete="off" readonly>
                                <i class="input-icon"><img src="${path}/resources/img/id.png" class="" alt="아이디"/></i>
                            </div>  
                            <div class="form-group mb-4">
                                <input type="password" name="pw" class="form-style" placeholder="비밀번호" autocomplete="off">
                                <i class="input-icon"><img src="${path}/resources/img/pwd.png" class="" alt="비밀번호"/></i>
                            </div>
                            <div class="form-group mb-4">
                                <input type="password" name="pwRe" class="form-style" placeholder="비밀번호 확인" autocomplete="off">
                                <i class="input-icon"><img src="${path}/resources/img/pwd.png" alt="비밀번호 확인"/></i>
                            </div> 
                            <div class="form-group mb-4">
                                <input type="text" name="name" class="form-style" value="${member.name }" autocomplete="off">
                                <i class="input-icon"><img src="${path}/resources/img/id.png" alt="이름"/></i>
                            </div> 
                            <div class="form-group mb-4 d-flex justify-content-around radioArea">
                            
                            	<c:if test="${member.gender == '남자'}">
                            		<input type="radio" value="남자" id="man" name="gender" checked/>
	                                <label for="man">남자</label>
	                                <input type="radio" value="여자" id="w" name="gender"/>
	                                <label for="w">여자</label>
                            	</c:if>
                            	
                            	<c:if test="${member.gender == '여자'}">
                            		<input type="radio" value="남자" id="man" name="gender"/>
	                                <label for="man">남자</label>
	                                <input type="radio" value="여자" id="w" name="gender" checked/>
	                                <label for="w">여자</label>
                            	</c:if>
                                
                            </div>
                            <div class="form-group mb-4">
                                <input type="text" name="tel" class="form-style" value="${member.tel }" autocomplete="off">
                                <i class="input-icon"><img src="${path}/resources/img/tel.png" alt="전화번호"/></i>
                            </div> 
                            <div class="form-group mb-4">
                                <input type="email" name="email" class="form-style" value="${member.email }" autocomplete="off">
                                <i class="input-icon"><img src="${path}/resources/img/email.png" alt="이메일"/></i>
                            </div>
                            
                            <div class="form-group mb-4 d-flex">
                                <input type="text" name="addr1" class="form-style address_input_1 me-4" value="${member.addr1 }" readonly>
                                <a class="btn-dupl text-center cbtn" onclick="go_daum_address()">주소 검색</a>
                            </div>
                            <div class="form-group mb-4">
                                <input type="text" name="addr2" class="form-style address_input_2" value="${member.addr2 }" readonly>
                            </div>
                            <div class="form-group mb-4">
                                <input type="text" name="addr3" class="form-style address_input_3" value="${member.addr3 }">
                            </div>
                            
                            
                            <div class="form-group mb-4">
                                <input type="text" class="form-style" 
                                value="<fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd"/> &nbsp;&nbsp;&nbsp;(가입한 지 ${member.wgap}일째)" 
                                readonly>
                                <i class="input-icon"><img src="${path}/resources/img/date.png" alt="가입날짜"/></i>
                            </div>
                            <div class="form-group mb-4">
                                <input type="text" class="form-style" value="${member.point } P" readonly>
                                <i class="input-icon"><img src="${path}/resources/img/coin.png" alt="포인트"/></i>
                            </div>

                            <input type="button" class="cbtn btn-user btn-block" onclick="check()" value="수정하기"/>
                            
                    </div>
                </form>
                </div>
            </div>
            
        </div>
    </section>
    </div>
    <br><br><br>
    
    <script>
	    var msg = "<c:out value='${msg}'/>";
	    if(msg != null && msg != ''){
	    	alert(msg);
	    }
	    
    </script>
   
<%@ include file="../include/footer.jsp" %>