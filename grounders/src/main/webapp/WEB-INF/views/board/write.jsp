<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<br>
<br>
<div class="container">
	<div class="row">
		<div class="col-md-12">
		<h1 class="my-5">게시글 작성하기</h1>
		
<%-- 		<div class="form-group">
			<label>작성자</label>
			<input class="form-control" name="title" value="${successUser}"/>
		</div> --%>
		
	<form>
		<div class="form-group">
			<label>아이디</label>
			<input class="form-control" name="id"/>
		</div>
		
		
		<div class="form-group">
			<label>제목</label>
			<input class="form-control" name="title"/>
		</div>
		
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" name="obardPw"></textarea>
		</div>
		
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" name="content"></textarea>
		</div>
		
		<div class="d-flex justify-content-end">
		<div class="btn-group my-5">
			<input type="submit" class="btn btn-success" value="글 등록하기"/>
			<a class="btn btn-primary" href="${path}/list">목록으로</a>
		</div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
	
		
		</form>
		</div>
	</div>
</div>

