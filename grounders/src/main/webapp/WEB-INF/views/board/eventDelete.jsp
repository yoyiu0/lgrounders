<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="container">
<div class="row">
<div class="col-lg-12">
<div class="h100"></div>
<h1 class="my-3">${noticeDelete.title} 글을 정말 삭제하시겠습니까?</h1>
<form  role="form" method="post" autocomplete="off">
  <p>
  <label for="seq">글번호</label>
  <input type="text" id="seq" name="seq" value="${noticeDelete.seq}" readonly="readonly"/>
  </p>
  <p>정말로 삭제 하시겠습니까?</p>
  
  <div class="d-flex justify-content-end my-5">
		<div class="d-flex justify-content-end">
			<div class="btn-group my-5">
				<input type="submit"
					class="btn btn-outline-secondary btn-user px-5 py-3"
					onclick="${contextPath}/board/notice/num=1" value="예">
				<button type="button"
					class="btn btn-outline-secondary btn-user px-5 py-3"
					onclick="history.back()">아니오
				</button>
			</div>
		</div>

	</div>

</form>
</div>
</div>
</div>

<%@ include file="../include/footer.jsp" %>


