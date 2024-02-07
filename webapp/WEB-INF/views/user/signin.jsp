<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file = "../include/header.jsp" %>

<link rel="stylesheet" href="${path}/resources/css/loginstyle.css"/>

<script>

	function check() {
		if (document.signin.id.value.trim() == '') {
		 	alert('아이디를 입력해 주세요.');
		 	return false;
			}
		
		if (document.signin.pw.value.trim() == '') {
		 	alert('비밀번호를 입력해 주세요.');
		 	return false;
			}
		
		document.signin.submit();
	}
	
</script>


<div class="container">
	<div class="row justify-content-center">
		<div class="card o-hidden border-0 shadow-lg my-5">
		
			<div class="card-body p-0">
				<div class="row">
					<!-- 배경이미지 -->
					<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
					
					<!-- input -->
					<div class="col-lg-6 row align-items-center">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 mb-5">
								로그인
								</h1>
							</div>
							
							<form name="signin" method="post">
																	
								<div class="form-group mb-3">
									<input type="text" name="id" class="form-style" placeholder="아이디를 입력해주세요." autocomplete="off">
									<i class="input-icon"><img src="${path}/resources/img/id.png" alt="아이디"/></i>
								</div>  
								<div class="form-group mb-5">
									<input type="password" name="pw" class="form-style" placeholder="비밀번호를 입력해주세요." autocomplete="off">
									<i class="input-icon"><img src="${path}/resources/img/pwd.png" alt="비밀번호"/></i>
								</div>
								
								<p class="mb-3">
									<input type="button" class="btn-user btn-block" value="로그인" onclick="check()"/>
								</p>
								
							</form>
							
							<div class="text-center mb-3">
								<a class="small mx-3" href="#">
								아이디 찾기
								</a>
								|
								<a class="small mx-3" href="#">
								비밀번호 찾기
								</a>
							</div>
							
						</div>
					
					</div>
				</div>
			</div>
		
		</div>
		
	</div>

</div>    