<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/resources/css/boardstyle.css"/>

<div class="container-fluid text-center" id="header">
    <!-- ... (기존 코드 유지) ... -->
</div>

<div class="event-schedule-area-two bg-color pad100">
    <div class="container">
        <div class="row">
            <div class="row my-5" id="noti">
                <div class="col-lg-12">
                    <ul class="nav custom-tab">
                        <!-- ... (기존 코드 유지) ... -->
                    </ul>

                    <div class="tab-content">
                        <!-- 공지사항 탭 -->
                        <div class="tab-pane active show" id="home" role="tabpanel">
                            <div class="table-responsive">
                                <table class="table">
                                    <colgroup>
                                        <col style="width:5%"/>
                                        <col style="width:75%"/>
                                        <col style="width:20%"/>
                                    </colgroup>
                                    <!-- ... (기존 코드 유지) ... -->
                                    <c:forEach items="${noticeList}" var="notice">
                                        <tr>
                                            <td>${notice.seq}</td>
                                            <td><a href="${path}/board/read?seq=${notice.seq}">${notice.title}</a></td>
                                            <td class="noticeWriteDate"><fmt:formatDate value="${notice.writeDate}" pattern="yyyy-MM-dd" /></td>
                                        </tr>
                                    </c:forEach>
                                </table>

                                <!-- 페이징 -->
                                <br><br>
                                <div class="pagination-container mb-5">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination pg">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach var="pageNumber" begin="1" end="5">
                                                <li class="page-item"><a class="page-link" href="#">${pageNumber}</a></li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>

                        <!-- 이벤트 탭 -->
                        <div class="tab-pane fade" id="profile" role="tabpanel">
                            <div id="blist" class="container">
                                <table class="table">
                                    <colgroup>
                                        <col style="width:10%"/>
                                        <col style="width:70%"/>
                                        <col style="width:20%"/>
                                    </colgroup>
                                    <!-- ... (기존 코드 유지) ... -->
                                    <c:forEach items="${eventList}" var="event">
                                        <tr>
                                            <td>${event.seq}</td>
                                            <td><a href="${path}/board/read?seq=${event.seq}">${event.title}</a></td>
                                            <td class="eventWriteDate"><fmt:formatDate value="${event.writeDate}" pattern="yyyy-MM-dd" /></td>
                                        </tr>
                                    </c:forEach>
                                </table>

                                <!-- 페이징 -->
                                <br><br>
                                <div class="pagination-container mb-5">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination pg">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach var="pageNumber" begin="1" end="5">
                                                <li class="page-item"><a class="page-link" href="#">${pageNumber}</a></li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>