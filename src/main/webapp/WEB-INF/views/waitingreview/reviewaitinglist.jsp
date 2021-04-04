<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<script>
	
</script>
  <div class="sub-main-wrap">
    <%@ include file="../layout/leftMenu.jsp"%>
        <div class="sub-container-wrap">
            <div class="main-title">
                <div class="navi">
                    <ul>
                        <li>
                            <a href="#" title="홈 바로가기">
                                <img src="../../resources/img/common/ico-home.png" alt="home">
                            </a>
                        </li>
                        <li>
                            <a href="#" title="검토">검토</a>
                        </li>
                        <li>
                            <a href="#" title="검토대기">검토대기</a>
                        </li>
                    </ul>
                </div>
                <%@ include file="../layout/sub-header.jsp"%>
            </div>
            <!--//main-title-->
            <div class="sub-container">
                <div class="sub-section-wrap review-wait">
                <form id="" name="" method="POST">
                    <div class="col-1">
						<section class="wp100">
                            <div class="section-tit">
                                <h3>검토대기</h3>
                                <dl>
                                    <dt>검토자 |</dt>
                                    <dd> ${user_name} ${user_position}</dd>
                                </dl>
                            </div>
                            <div class="table-wrap">
                                <table class="table-type01">
                                    <caption>검토대기 테이블</caption>
                                    <colgroup>
                                        <col class="wp20">
                                        <col class="wp20">
                                        <col class="wp20">
                                        <col class="wp20">
                                        <col class="wp20">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>작성일</th>
                                            <th>신청구분</th>
                                            <th>부서</th>
                                            <th>신청자</th>
                                            <th>결재자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="reviewList" items="${reviewList}">
                                        	<tr>
                                        		<td>${reviewList.regdate}</td>
                                        		<td>휴가신청서</td>
                                        		<td>${reviewList.team_nm}</td>
                                        		<td>${reviewList.sabun}</td>
                                        		<td>${reviewList.approv}</td>
                                        	</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-paging btn-pageing-bg">
                            	<ul>
                            		<c:if test="${ageMaker.prev}">
                            			<li>
                                        	<a href="<c:url value='reviewaitinglist.do?page=${pageMaker.startPage-1}'/>" title="이전"><img src="../resources/img/sub/btn-prev.png" alt="이전"></a>
                                    	</li>
                            		</c:if>
                            		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
                            			<li>
                                        	<a href="<c:url value='reviewaitinglist.do?page=${pageNum}'/>" title="더보기">${pageNum}</a>
                                   		 </li>
                            		</c:forEach>
                            		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                            			<li>
                                       		<a href="reviewaitinglist.do?page=${pageMaker.endPage+1}" title="다음"><img src="../resources/img/sub/btn-next.png" alt="다음"></a>
                                    	</li>
                            		</c:if>
                            	</ul>
                            </div>
                        </section>                        
                    </div>
                    </form>
                </div>
            </div>
            <!--//sub-container-->
            <%@ include file="../layout/footer.jsp"%>
        </div>
    </div>
    <!--//sub-main-wrap-->
</body>

</html>

