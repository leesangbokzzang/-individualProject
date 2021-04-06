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
                            <a href="#" title="승인">승인</a>
                        </li>
                        <li>
                            <a href="#" title="승인대기">승인대기</a>
                        </li>
                    </ul>
                </div>
                <%@ include file="../layout/sub-header.jsp"%>
            </div>
            <!--//main-title-->
            <div class="sub-container">
                <div class="sub-section-wrap approval-wait">
                <form id="" name="" method="POST">
                    <div class="col-1">
						<section class="wp100">
                            <div class="section-tit">
                                <h3>승인대기</h3>
                                <dl>
                                    <dt>승인자 |</dt>
                                    <dd> ${user_name} ${user_position}</dd>
                                </dl>
                            </div>
                            <div class="table-wrap">
                                <table class="table-type01">
                                    <caption>승인대기 테이블</caption>
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
                                    <c:choose>
                                    	<c:when test="${empty approverList}">
                                    		<td colspan="5">승인 대기중인 목록이 없습니다.</td>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="approverList" items="${approverList}">
	                                        	<tr>
	                                        		<td>${approverList.regdate}</td>
	                                        		<td>휴가신청서</td>
	                                        		<td>${approverList.team_nm}</td>
	                                        		<td>${approverList.sabun}</td>
	                                        		<td>${approverList.approv}</td>
	                                        	</tr>
                                        	</c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                                        
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-paging btn-pageing-bg">
                            	<ul>
                            		<c:choose>
                            			<c:when test="${empty pageMaker}">
                            				
                            			</c:when>
                            			<c:otherwise>
                            				<c:if test="${ageMaker.prev}">
                            			<li>
                                        	<a href="<c:url value='/approverWaitinglist.do?page=${pageMaker.startPage-1}'/>" title="이전"><img src="../resources/img/sub/btn-prev.png" alt="이전"></a>
                                    	</li>
	                            		</c:if>
	                            		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
	                            			<li>
	                                        	<a href="<c:url value='/approverWaitinglist.do?page=${pageNum}'/>" title="더보기">${pageNum}</a>
	                                   		 </li>
	                            		</c:forEach>
	                            		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	                            			<li>
	                                       		<a href="/approverWaitinglist.do?page=${pageMaker.endPage+1}" title="다음"><img src="../resources/img/sub/btn-next.png" alt="다음"></a>
	                                    	</li>
	                            		</c:if>
                            			</c:otherwise>
                            		</c:choose>
                            		
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

