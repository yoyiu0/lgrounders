<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file = "../include/header.jsp" %>


<link rel="stylesheet" href="${path}/resources/css/loginstyle.css"/>
<script type="text/javascript" src="${path}/resources/js/signup.js"></script>
<script type="text/javascript" src="${path}/resources/js/daum.js"></script>
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="container">
	<div class="row justify-content-center">
		<div class="card o-hidden border-0 shadow-lg my-5">
		
			<div class="card-body p-0">
				<div class="row">
					<!-- 배경이미지 -->
					<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
					
					<!-- input -->
					<div class="col-lg-6 h-850 row align-items-center">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 mb-4">
								회원가입
								</h1>
							</div>
							
							<form name="signup" method="post">

								<div class="form-group mb-3 d-flex justify-content-between">
									<input type="text" name="id" class="form-style id-w" id="id" placeholder="아이디">
									<i class="input-icon"><img src="${path}/resources/img/id.png" class="" alt="아이디"/></i>
									<a class="btn-dupl text-center cbtn" onclick="fn_idChk()">중복확인</a>
									<input type="hidden" name="idChk" id="idChk" value="N"/>
								</div>  
								
								<div class="form-group mb-3">
									<input type="password" name="pw" class="form-style" placeholder="비밀번호" autocomplete="off">
									<i class="input-icon"><img src="${path}/resources/img/pwd.png" class="" alt="비밀번호"/></i>
								</div>
								
								<div class="form-group mb-3">
									<input type="password" name="pwRe" class="form-style" placeholder="비밀번호 확인" autocomplete="off">
									<i class="input-icon"><img src="${path}/resources/img/pwd.png" alt="비밀번호 확인"/></i>
								</div> 
								
								<div class="form-group mb-3">
									<input type="text" name="name" class="form-style" placeholder="이름">
									<i class="input-icon"><img src="${path}/resources/img/id.png" alt="이름"/></i>
								</div> 
								
								<div class="form-group mb-3 d-flex justify-content-around">
									<input type="radio" value="남자" name="gender" checked/>
									<label>남자</label>
									<input type="radio" value="여자" name="gender"/>
									<label>여자</label>
								</div>
								
								<div class="form-group mb-5">
									<input type="text" name="tel" class="form-style" placeholder="전화번호">
									<i class="input-icon"><img src="${path}/resources/img/tel.png" alt="전화번호"/></i>
								</div> 
								
								<div class="form-group mb-3">
									<input type="email" name="email" class="form-style mail_input" placeholder="이메일">
									<i class="input-icon"><img src="${path}/resources/img/email.png" alt="이메일"/></i>
								</div>
								
								<div class="mb-5">
									<div class="form-group d-flex justify-content-between mail_check_input_box">
										<input 
										type="text"
										placeholder="인증번호" 
										class="form-style-addr id-w mail_check_input" 
										disabled="disabled"/>
										<a class="btn-dupl text-center cbtn mail_check_button">인증메일 전송</a>
									</div>
								</div>
								
								<div class="form-group mb-3 d-flex justify-content-between">
									<input type="text" name="addr1" placeholder="우편번호" class="form-style-addr id-w address_input_1" readonly="readonly">
									<a class="btn-dupl text-center cbtn" onclick="go_daum_address()">주소 검색</a>
								</div>
								<div class="form-group mb-3">
									<input type="text" name="addr2" placeholder="주소" class="form-style-addr address_input_2" readonly="readonly">
								</div> 
								<div class="form-group mb-5">
									<input type="text" name="addr3" placeholder="상세주소" class="form-style-addr address_input_3" readonly="readonly">
								</div> 
	
								<input type="hidden" name="emailChk" id="emailChk" value=""/>
								<input type="button" class="btn-user btn-block cbtn" value="가입하기" onclick="check()"/>
								
							</form>
							
						</div>
					
					</div>
				</div>
			</div>
		
		</div>
		
	</div>

</div>    
