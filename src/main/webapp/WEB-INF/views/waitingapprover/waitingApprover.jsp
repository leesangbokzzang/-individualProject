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
		
		$("#approverdate").html(year + "." + month + "." + day);
		$("#aprvlAprvl").val(year + "." + month + "." + day);
	});
	
	//::검토결재 버튼 스크립트
	function reviewOK(){
		
		var approver_cont = $("#approver_cont").val();
		
		if(approver_cont == ""){
			swal("경고","승인의견을 작성해주십시오.", "error");
			return false;
		}
		
		var user_name = $("#user_name").val();
		var user_position = $("#user_position").val();
		
		
		var formdate =$("form[name=approverFm]").serializeObject();
		var jsondata = JSON.stringify(formdate);
		
		$.ajax({
			url : '/approverOkFm.do',
			type : 'POST',
			contentType : "application/json;charset=utf-8",
			dataType : 'json',
			data : jsondata,
			success : function(result){
				swal("확인!", "승인결재 완료하였습니다.", "success");
				$("#approver_cont").val("");
			},
			error : function(error){
				alert("ERROR :: " + error);
			}
		});
	}
	
	function revReturn(){
		var approver_cont = $("#approver_cont").val();
		
		if(approver_cont == ""){
			swal("경고","승인의견을 작성해주십시오.", "error");
			return false;
		}	
		
		var formdate =$("form[name=approverFm]").serializeObject();
		var jsondata = JSON.stringify(formdate);
		
		$.ajax({
			url : '/approverNoFm.do',
			type : 'POST',
			contentType : "application/json;charset=utf-8",
			dataType : 'json',
			data : jsondata,
			success : function(result){
				swal("확인!", "승인반려 하였습니다", "success");
				$("#approver_cont").val("");
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
                <form id="approverFm" name="approverFm" method="POST">
                	<input type="hidden" name="idx" value="${approverVO.idx}"/>
                    <div class="col-1">
                        <section>
                            <div class="section-tit">
                                <h3>승인대기(상세)</h3>
                            </div>
                            <div class="table-wrap">
                                <table class="table-type02">
                                    <caption>승인대기(상세) 테이블</caption>
                                    <colgroup>
                                        <col class="wp15">
                                        <col class="wp30">
                                        <col class="wp15">
                                        <col class="wp30">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>소속</th>
                                            <td>${approverVO.TEAM_NM}</td>
                                            <th>사번</th>
                                            <td>${approverVO.sabun}</td>
                                        </tr>
                                        <tr>
                                            <th>성명</th>
                                            <td>${approverVO.USER_NM}</td>
                                            <th>담당업무</th>
                                            <td>${approverVO.assigned_tsk}</td>
                                        </tr>
                                        <tr>
                                            <th>직위</th>
                                            <td>${approverVO.user_position}</td>
                                            <th>업무인수자</th>
                                            <td>${approverVO.bsns_tkvr}</td>
                                        </tr>
                                        <tr>
                                            <th>종류</th>
                                            <td colspan="3">${approverVO.vacation_type}</td>
                                        </tr>
                                        <tr>
                                            <th>사유</th>
                                            <td colspan="3">${approverVO.vacation_cont}</td>
                                        </tr>
                                        <tr>
                                            <th>기간</th>
                                            <td colspan="3">
                                                ${approverVO.vacation_stt}
                                                <span>~</span>
                                                ${approverVO.vacation_end}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>비상 연락망</th>
                                            <td colspan="3">${approverVO.emrgn_num}</td>
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
                                            <td>${approverVO.USER_NM} ${approverVO.user_position}</td>
                                            <td id="reviewer_person">${approverVO.reviewers}</td>
                                            <td id="approver_person">
                                            	${user_name} ${user_position}
                                            	<input type="hidden" id="user_name" name="user_name" value="${user_name} ${user_position}" /> 
												<input type="hidden" id="aprvlAprvl" name="aprvlAprvl"/>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>${approverVO.regdate}</td>
                                        	<td>${approverVO.revappro}</td>
                                        	<td id="approverdate"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="reviewopin-box">
                                <div class="section-tit">
                                    <h3>승인의견</h3>
                                </div>
                                <div class="textarea-box">
                                    <textarea id=approver_cont name="approver_cont"></textarea>
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

