<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
    <div class="sub-main-wrap">
        <%@ include file="../layout/leftMenu.jsp"%>
        <div class="sub-container-wrap">
            <div class="main-title">
                <div class="navi">
                    <ul>
                        <li>
                            <a href="#" title="홈 바로가기">
                                <img src="../../resources/img/common/ico-home.png" alt="home"><span>Dashboard</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <%@ include file="../layout/sub-header.jsp"%>
            </div><!--//main-title-->
            
            <div class="sub-container">
                <div class="top-cont-wrap">
                    <div class="waitrev-box boxsize">
                        <dl>
                            <dt>검토 대기 중</dt>
                            <dd>현재 검토 대기 중인 항목의 수 입니다.</dd>
                            <dd>20<span>건</span></dd>
                        </dl>
                    </div>
                    <div class="waitaprvl-box boxsize">
                        <dl>
                            <dt>승인 대기 중</dt>
                            <dd>현재 승인 대기 중인 항목의 수 입니다.</dd>
                            <dd>10<span>건</span></dd>
                        </dl>
                    </div>
                    <div class="aplctform-box">
                        <p><img src="../../resources/img/common/ico-application.png" alt="신청서작성 아이콘"></p>
                        <p><a href="#" title="신청서 작성">신청서 작성</a></p>
                        <!--신청서 작성 SELECT 박스-->
                        <div class="application-box">
                            <p class="text-tail-img"></p>
                            <ul>
                                <li><a href="/leaveApplication.do" title="연차신청">연차신청</a></li>
                                <li><a href="#" title="명함신청">명함신청</a></li>
                                <li><a href="#" title="닫기" class="application-cancel">닫기</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="sub-section-wrap main-dashboard">
                    <div class="col-1 wp50">
                        <section>
                            <div class="section-tit">
                                <h3>검토대기현황</h3>
                                <div class="btn-more">
                                    <ul>
                                        <li><a href="#" title=" 검토대기현황 더보기" class=""><img src="../../resources/img/common/btn-more.png" alt="더보기"></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="table-wrap scro-y-auto hp94">
                                <table class="table-type01">
                                    <caption>검토대기현황 테이블</caption>
                                    <colgroup>
                                        <col class="wp20">
                                        <col class="wp20">
                                        <col class="wauto">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>작성일</th>
                                            <th>작성자</th>
                                            <th>제목</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>2020-02-12</td>
                                            <td>이상복</td>
                                            <td>휴가신청서</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                    <div class="col-2 wp50">
                        <section>
                            <div class="section-tit">
                                <h3>승인대기현황</h3>
                                <div class="btn-more">
                                    <ul>
                                        <li><a href="#" title=" 승인대기현황 더보기" class=""><img src="../../resources/img/common/btn-more.png" alt="더보기"></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="table-wrap scro-y-auto hp94">
                                <table class="table-type01">
                                    <caption>승인대기현황 테이블</caption>
                                    <colgroup>
                                        <col class="wp20">
                                        <col class="wp20">
                                        <col class="wauto">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>작성일</th>
                                            <th>작성자</th>
                                            <th>제목</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>2020-02-12</td>
                                            <td>이상복</td>
                                            <td>휴가신청서</td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
            </div><!--//sub-container-->
            <%@ include file="../layout/footer.jsp"%>
        </div>
    </div><!--//sub-main-wrap-->
</body>

</html>