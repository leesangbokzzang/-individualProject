<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<script>
	$(function(){
		//::현재날짜 구하기
		var today = new Date();
		var year  = today.getFullYear();
		var month = today.getMonth()+1;
		var day   = today.getDate();
		
		$("#reviewdate").html(year + "." + month + "." + day);
		$("#revappro").val(year + "." + month + "." + day);
	});
	
	//::검토결재 버튼 스크립트
	function reviewOK(){
		
		alert("전송");
		var user_name = $("#user_name").val();
		var user_position = $("#user_position").val();
		var review_cont = $("#review_cont").val();
		
		var formdate =$("form[name=reviewOkFm]").serializeObject();
		var jsondata = JSON.stringify(formdate);
		
		$.ajax({
			url : '/reviewOkFm.do',
			type : 'POST',
			contentType : "application/json;charset=utf-8",
			dataType : 'json',
			data : jsondata,
			success : function(result){
				swal("확인!", "검토결재 완료하였습니다.", "success");
			},
			error : function(error){
				alert("ERROR :: " + error);
			}
		});
	}
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
                        <li>
                            <a href="#" title="검토대기(상세)">검토대기(상세)</a>
                        </li>
                    </ul>
                </div>
                <%@ include file="../layout/sub-header.jsp"%>
            </div>
            <!--//main-title-->
            <div class="sub-container">
                <div class="sub-section-wrap leave-app">
                <form id="reviewOkFm" name="reviewOkFm" method="POST">
                	<input type="hidden" name="idx" value="${reviewVO.idx}"/>
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
                                            <td>${reviewVO.TEAM_NM}</td>
                                            <th>사번</th>
                                            <td>${reviewVO.sabun}</td>
                                        </tr>
                                        <tr>
                                            <th>성명</th>
                                            <td>${reviewVO.USER_NM}</td>
                                            <th>담당업무</th>
                                            <td>${reviewVO.assigned_tsk}</td>
                                        </tr>
                                        <tr>
                                            <th>직위</th>
                                            <td>${reviewVO.user_position}</td>
                                            <th>업무인수자</th>
                                            <td>${reviewVO.bsns_tkvr}</td>
                                        </tr>
                                        <tr>
                                            <th>종류</th>
                                            <td colspan="3">${reviewVO.vacation_type}</td>
                                        </tr>
                                        <tr>
                                            <th>사유</th>
                                            <td colspan="3">${reviewVO.vacation_cont}</td>
                                        </tr>
                                        <tr>
                                            <th>기간</th>
                                            <td colspan="3">
                                                ${reviewVO.vacation_stt}
                                                <span>~</span>
                                                ${reviewVO.vacation_end}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>비상 연락망</th>
                                            <td colspan="3">${reviewVO.emrgn_num}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                        <section>
                            <div class="section-tit">
                                <h3>검토/승인자</h3>
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
                                            <td>${reviewVO.USER_NM} ${reviewVO.user_position}</td>
                                            <td id="reviewer_person">
                                            	${user_name} ${user_position}
                                            	<input type="hidden" id="user_name" name="user_name" value="${user_name} ${user_position}" /> 
<%--                                             	<input type="hidden" id="user_position" name="user_position" value="${user_position}" />  --%>
													<input type="hidden" id="revappro" name="revappro"/>
                                            	<input type="hidden" name="reviewaiting" value="Y"/>
                                            </td>
                                            <td id="approver_person"></td>
                                        </tr>
                                        <tr>
                                        	<td>${reviewVO.regdate}</td>
                                        	<td id="reviewdate">
                                        		
                                        	</td>
                                        	<td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="reviewopin-box">
                                <div class="section-tit">
                                    <h3>검토의견</h3>
                                </div>
                                <div class="textarea-box">
                                    <textarea id="review_cont" name="review_cont"></textarea>
                                </div>
                            </div>
                        </section>
                    </div>
                    </form>
                </div>
                <div class="btn-box">
                    <ul>
                        <li><a href="javascript:revReturn()" title="반려" class="bg-blue">반려</a></li>
                        <li><a href="javascript:reviewOK()" title="결재" class="">결재</a></li>
                    </ul>
                </div>
            </div>
            <!--//sub-container-->
            <%@ include file="../layout/footer.jsp"%>
        </div>
    </div>
    <!--//sub-main-wrap-->
</body>

</html>

