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
                                <img src="../../resources/img/common/ico-home.png" alt="home">
                            </a>
                        </li>
                        <li>
                            <a href="#" title="작성">
                                작성
                            </a>
                        </li>
                        <li>
                            <a href="#" title="결재양식">
                                결재양식
                            </a>
                        </li>
                        <li>
                            <a href="#" title="휴가신청서 작성">
                                휴가신청서
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="user-wrap">
                    <ul>
                        <li><img src="../../resources/img/common/icon-user.png" alt="user-icon"></li>
                        <li>
                            <p>디자인팀</p>
                            <p>이상복</p>
                        </li>
                        <li><a href="#" title="로그아웃"><img src="../../resources/img/common/ico-logout.png" alt="로그아웃"></a></li>
                    </ul>
                </div>
            </div>
            <!--//main-title-->
            <div class="sub-container">
                <div class="sub-section-wrap leave-app">
                    <div class="col-1">
                        <section>
                            <div class="section-tit">
                                <h3>휴가신청서</h3>
                            </div>
                            <div class="table-wrap">
                                <table class="table-type02">
                                    <caption>휴가신청서 테이블</caption>
                                    <colgroup>
                                        <col class="wp15">
                                        <col class="wp30">
                                        <col class="wp15">
                                        <col class="wp30">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>소속</th>
                                            <td>디자인팀</td>
                                            <th>사번</th>
                                            <td>19-20190916</td>
                                        </tr>
                                        <tr>
                                            <th>성명</th>
                                            <td>한서연</td>
                                            <th>담당업무</th>
                                            <td>
                                                <label for="" class="hide"></label>
                                                <input type="text">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>직위</th>
                                            <td>대리</td>
                                            <th>업무인수자</th>
                                            <td>강길동</td>
                                        </tr>
                                        <tr>
                                            <th>종류</th>
                                            <td colspan="3">
                                                <div class="btn-radio">
                                                    <input type="radio" name="test" id="test01" checked="">
                                                    <label for="test01">연차</label>
                                                    <input type="radio" name="test" id="test02">
                                                    <label for="test02">월차</label>
                                                    <input type="radio" name="test" id="test03">
                                                    <label for="test03">반차,지각</label>
                                                    <input type="radio" name="test" id="test04">
                                                    <label for="test04">훈련,교육</label>
                                                    <input type="radio" name="test" id="test05">
                                                    <label for="test05">경조</label>
                                                    <input type="radio" name="test" id="test06">
                                                    <label for="test06">기타(생휴)</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>사유</th>
                                            <td colspan="3">
                                                <label for="" class="hide">사유란</label>
                                                <textarea class="h70"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>기간</th>
                                            <td colspan="3">
                                                <label for="" class="hide">시작일</label>
                                                <input type="date" id="regDate1" name="regDate1" onchange="call()" class="w140">
                                                <span>~</span>
                                                <label for="" class="hide">종료일</label>
                                                <input type="date" id="regDate2" name="regDate2" onchange="call()" class="w140">
                                                <label for="" class="hide">총 일수</label>
                                                <input type="text" id="days" name="" class="w46 mg-l10 ta-c readonly" readonly="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>비상 연락망</th>
                                            <td colspan="3">
                                            	<label for="" class="hide">비상 연락망</label>
                                                <input type="text" maxlength="12" class="num w180" placeholder="' - ' 뺴고 입력해주세요.">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="leave-app-txt">
                                    <p>위와 같이 휴가를 신청 하오니 재가하여 주시기 바랍니다.</p>
                                    <ul>
                                        <li>년</li>
                                        <li>월</li>
                                        <li>일</li>
                                    </ul>
                                </div>
                            </div>
                        </section>
                        <section>
                            <div class="section-tit">
                                <h3>검토/승인자</h3>
                                <div class="btn-box">
                                    <ul>
                                        <li><a href="#" title="저장" class="bg-blue" id="btn-choose">검토/승인자 선택</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="table-wrap">
                                <table class="table-type01">
                                    <caption>검토/승인자 테이블</caption>
                                    <colgroup>
                                        <col class="wp30">
                                        <col class="wp30">
                                        <col class="wp30">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>작성자</th>
                                            <th>검토자</th>
                                            <th>승인자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>한서연대리</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="h70"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>2020. 02. 03</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="btn-box">
                    <ul>
                        <li><a href="#" title="취소" class="">취소</a></li>
                        <li><a href="#" title="작성완료" class="bg-blue">작성완료</a></li>
                    </ul>
                </div>
            </div>
            <!--//sub-container-->
            <%@ include file="../layout/footer.jsp"%>
        </div>
        
        <div class="modal-wrap" id="modal">
            <div class="modal-bg"></div>
            <div class="modal-container">
                <div class="modal-header">
                    <h4>검토 / 승인자 선택</h4>
                    <a href="#" title="닫기" class="btn-close" id="btn-close"></a>
                </div>
                <div class="modal-contents">
                    <div class="modal-contents-box">
                        <div class="table-wrap scro-y h400 wp45">
                            <table class="table-type01">
                                <caption>검토/승인자 테이블</caption>
                                <colgroup>
                                    <col class="wp15">
                                    <col class="wp75">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>선택</th>
                                        <th>성명</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-1" name="">
                                        </td>
                                        <td>
                                            <label for="check01-1">이영우대표</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-2" name="">
                                        </td>
                                        <td>
                                            <label for="check01-2">김대근 부사장</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-3" name="">
                                        </td>
                                        <td>
                                            <label for="check01-3">나창연 부사장</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-4" name="">
                                        </td>
                                        <td>
                                            <label for="check01-4">최대규 전무</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-5" name="">
                                        </td>
                                        <td>
                                            <label for="check01-5">최상오 전무</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-6" name="">
                                        </td>
                                        <td>
                                            <label for="check01-6">한동환 전무</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-7" name="">
                                        </td>
                                        <td>
                                            <label for="check01-7">길용남 상무</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-8" name="">
                                        </td>
                                        <td>
                                            <label for="check01-8" class="hide">박진환 상무</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-9" name="">
                                        </td>
                                        <td>
                                            <label for="check01-9" class="hide">손정호 상무</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-9" name="">
                                        </td>
                                        <td>
                                            <label for="check01-9"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-9" name="">
                                        </td>
                                        <td>
                                            <label for="check01-9"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-9" name="">
                                        </td>
                                        <td>
                                            <label for="check01-9"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-9" name="">
                                        </td>
                                        <td>
                                            <label for="check01-9"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="check01-9" name="">
                                        </td>
                                        <td>
                                            <label for="check01-9"></label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-selectbtn-box">
                            <ul>
                                <li><a href="#" title="검토자 선택"><img src="img/sub/btn-modal-right.png" alt="검토자 선택"></a></li>
                                <li><a href="#" title="승인자 선택"><img src="img/sub/btn-modal-right.png" alt="승인자 선택"></a></li>
                                <li><a href="#" title="참조자 선택"><img src="img/sub/btn-modal-right.png" alt="참조자 선택"></a></li>
                            </ul>
                        </div>
                        <div class="modal-selectname-box">
                            <div class="modal-selectname-reviewer">
                                <h3>검토자</h3>
                                <ul>
                                    <li>권수복 부장<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                </ul>
                            </div>
                            <div class="modal-selectname-approver">
                                <h3>승인자</h3>
                                <ul>
                                    <li>김진호 이사<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                </ul>
                            </div>
                            <div class="modal-selectname-referrer">
                                <h3>참조자</h3>
                                <ul class="scro-y">
                                    <li>이영우 대표<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>김대근 부사장<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>나창연 부사장<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>최대규 전무<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>한동환 전무<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>최상오 전무<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="modal-btn-box">
                        <ul>
                            <li>
                                <a href="#" title="확인" class="btn-enroll">확인</a>
                            </li>
                            <li>
                                <a href="#" title="취소" class="btn-cancel" id="btn-cancel">취소</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> <!-- //modal-picture-->
    </div>
    <!--//sub-main-wrap-->
</body>

</html>

