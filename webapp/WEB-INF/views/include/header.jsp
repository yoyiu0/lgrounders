<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Grounders</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path }/resources/css/nav1.css" rel="stylesheet" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- 제이쿼리 라이브러리 연결 -->
        <script src="${path }/resources/js/jquery-3.7.1.js"></script>
        <!-- gsap 플러그인 연결 -->
        <script src="${path }/resources/js/gsap.min.js"></script>
        <!-- 사용자 정의 js 연결 -->
        <script src="${path }/resources/js/spring.js"></script>
        <!-- Bootstrap core JS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Swiper css, JS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <!-- 폰트!! -->
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="main-navbar navbar navbar-expand-lg">
            <div class="container">
            <a class="logoImg" href="${path }/">
                <div class="logo">
                
                    <img src="${path }/resources/img/logo.png" alt="" width="200" height="100%" class="d-inline-block align-text-top">
                 
                </div>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="navCenter collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-automb-lg-0 mar" >
                        <li class="nav-item">
                            <a class="nav-link" href="${path }/ticket/detail">예매내역</a>
                        </li>
                        <li class="nav-item tog">
                            <a class="nav-link aTitle" href="#">티켓구매</a>
                            <ul class="sub">
                                <li class="list-group-item"><a class="subCon text-decoration-none"href="${path }/ticket/order?gameNo=1">플레이오프 2차전 LG트윈스 vs KIA타이거즈</a></li>
                                <li class="list-group-item"><a class="subCon text-decoration-none" href="${path }/ticket/order?gameNo=2">두산베어스 vs 삼성라이온즈</a></li>
                            </ul>
                        </li>
                        <li class="nav-item tog">
                            <a class="nav-link aTitle" href="#!">커뮤니티</a>
                            <ul class="sub">
                                <li class="list-group-item"><a class="subCon text-decoration-none" href="${path }/board/list?num=1">자유게시판</a></li>
                                <li class="list-group-item"><a class="subCon text-decoration-none" href="${path }/board/notice?num=1">공지사항 / 이벤트</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="navbar-nav endUl end-0">
                    	<c:if test="${member == null }">
	                    	<li class="nav-item end"><a class="nav-link" href="${path }/user/signin">로그인</a></li>
	                        <div class="line"></div>
	                        <li class="nav-item end"><a class="nav-link" href="${path }/user/signup">회원가입</a></li>
                    	</c:if>
                    	<c:if test="${member != null }">
                    		<li class="nav-item end"><a class="nav-link" href="${path }/user/mypage">마이페이지</a></li>
	                        <div class="line"></div>
	                        <li class="nav-item end"><a class="nav-link" href="${path }/user/signout" onclick="alert('로그아웃 되었습니다.')">로그아웃</a></li>
                    	</c:if>
                    
                        
                    </ul>
                </div>
                
            </div>
            <div class="sub_bg"></div>
        </nav>