<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<script>
	$(function(){
		
		//현재날짜 구하기
		var today = new Date();
		var year  = today.getFullYear();
		var month = today.getMonth()+1;
		var day   = today.getDate();
		
		$("#year_txt").html(year+" 년");
		$("#month_txt").html(month+" 월");
		$("#day_txt").html(day+" 일");
		
	});
	
	//검토자선택 스크립트
	function reviewer_sel(){
		var checkbox = $("input[name=userChekBox]:checked"); //체크된 checkbox
		var tr;
		var td;
		checkbox.each(function(i){
			tr = checkbox.parent().parent(); //체크박스인풋의 부모에 부모요소인 tr선택
			td = tr.children() // tr에 바로다음에 자식요소 td
		});
		var sel_name = td.eq(1).text();
		
		var sessionName = "<c:out value='${sabun}'/>";
		var user_sabun =  td.eq(2).val();
		if(sessionName == user_sabun){
			swal("경고!", "자신을 선택할 수 없습니다.", "error");
			return false;
		}
		
		var name_label = "<li>"+sel_name+" <input type='hidden' value='"+user_sabun+"' class='label-sabun'/><a href='javascript:label_delete(1)' title='삭제'><img src='../../resources/img/sub/btn-selectname-delete.png' alt='삭제'></a></li>";
		$(".modal-selectname-reviewer > ul").html(name_label);
	}
	
	//승인자선택 스크립트
	function approver_sel(){
		var checkbox = $("input[name=userChekBox]:checked"); //체크된 checkbox
		var tr;
		var td;
		checkbox.each(function(i){
			tr = checkbox.parent().parent(); //체크박스인풋의 부모에 부모요소인 tr선택
			td = tr.children() // tr에 바로다음에 자식요소 td
		});
		var sel_name = td.eq(1).text();
		
		var sessionName = "<c:out value='${sabun}'/>";
		var user_sabun = td.eq(2).val();
		if(sessionName == user_sabun){
			swal("경고!", "자신을 선택할 수 없습니다.", "error");
			return false;
		}
		
		var name_label = "<li>"+sel_name+" <input type='hidden' value='"+user_sabun+"' class='label-sabun'/><a href='javascript:label_delete(2)' title='삭제'><img src='../../resources/img/sub/btn-selectname-delete.png' alt='삭제'></a></li>";
		$(".modal-selectname-approver > ul").html(name_label);
	}
	
	//검토자, 승인자 삭제 스크립트	
	function label_delete(num){
		if(num == 1){ //num이 1이면 reviewer label 삭제
			$(".modal-selectname-reviewer > ul").html("");
		}else if(num == 2){ //num이 2이면 approver label 삭제
			$(".modal-selectname-approver > ul").html("");
		}
	}
	
	// 검토/승인자 선택 모달창에서 확인버튼 스크립트
	function selOkSend(){
		if($(".modal-selectname-reviewer > ul").html() == ""){
			swal("경고!", "검토자를 선택하십시오", "error");
			return false;
		}else if($(".modal-selectname-approver > ul").html() == ""){
			swal("경고!", "승인자를 선택하십시오", "error");
			return false;
		}
		
		var label1 = $(".modal-selectname-reviewer > ul > li").text();
		var label11 = $(".modal-selectname-reviewer > ul > li > .label-sabun").val();
		var label2 = $(".modal-selectname-approver > ul > li").text();
		var label22 = $(".modal-selectname-approver > ul > li > .label-sabun").val();
		
		$("#reviewer_person").html(label1+"<input type='hidden' value='"+label11+"' id='reviewer_sabun' name='reviewers'/>");
		$("#approver_person").html(label2+"<input type='hidden' value='"+label22+"' id='approver_sabun' name='approver'/>");
 	    $(".modal-wrap").hide();
 	   	$(".modal-selectname-reviewer > ul").html("");
		$(".modal-selectname-approver > ul").html("");
		
	}
	
	//::::::checkbox중복방지
	function NoMultiChk(chk){
	    var obj = document.getElementsByName("userChekBox");
	    for(var i=0; i < obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	//작성완료 스크립트
	function vacation_insert(){
		
		var assigned_tsk =  $("#assigned_tsk").val();
		var bsns_tkvr    =  $("#bsns_tkvr").val();
		var vacation_cont = $("#vacation_cont").val();
		var regDate1 = $("#regDate1").val();
		var regDate2 = $("#regDate2").val();
		var emrgn_num = $("#emrgn_num").val();
		var reviewer_sabun = $("#reviewer_sabun").val();
		var approver_sabun = $("#approver_sabun").val();
		
		if(assigned_tsk == "" || bsns_tkvr == "" ||vacation_cont == "" ||regDate1 == "" ||regDate2 == "" ||emrgn_num == "" ||reviewer_sabun == "" ||approver_sabun == "" ){
			swal("경고!", "필수 기입란 입니다.", "error");
			return false;
		}
		
		var formdate =$("form[name=vacationSendFm]").serializeObject();
		var jsondata = JSON.stringify(formdate);
		
		$.ajax({
			url : 'vacationSendFm.do',
			type: 'POST',
			contentType : "application/json;charset=utf-8",
			dataType : 'json',
			data : jsondata,
			success : function(){
				$("#assigned_tsk").val("");
				$("#bsns_tkvr").val("");
				$("[name=vacation_type]").removeAttr("checked");
				$("#vacation_cont").val("");
				$("#regDate1").val("");
				$("#regDate2").val("");
				$("#emrgn_num").val("");
				$("#reviewer_sabun").val("");
				$("#approver_sabun").val("");
				$("#days").val("");
				$("#reviewer_person").html("");
				$("#approver_person").html("");
				swal("확인!", "휴가신청서 작성 완료하였습니다.", "success");
			},
			error : function(xhr){
				alert("ERROR : " +xhr.status+","+ xhr.statusText);
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
                            <a href="#" title="작성">작성</a>
                        </li>
                        <li>
                            <a href="#" title="결재양식">결재양식</a>
                        </li>
                        <li>
                            <a href="#" title="휴가신청서 작성">휴가신청서</a>
                        </li>
                    </ul>
                </div>
                <%@ include file="../layout/sub-header.jsp"%>
            </div>
            <!--//main-title-->
            <div class="sub-container">
                <div class="sub-section-wrap leave-app">
                <form id="vacationSendFm" name="vacationSendFm" method="POST">
                	<input type="hidden" name="sabun" value="${sabun}">
                	<input type="hidden" name="position" value="${user_position}">
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
                                            <td>${team_nm}</td>
                                            <th>사번</th>
                                            <td>${sabun}</td>
                                        </tr>
                                        <tr>
                                            <th>성명</th>
                                            <td>${user_name}</td>
                                            <th>담당업무</th>
                                            <td>
                                                <label for="" class="hide"></label>
                                                <input type="text" name="assigned_tsk" id="assigned_tsk">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>직위</th>
                                            <td>${user_position}</td>
                                            <th>업무인수자</th>
                                            <td><input type="text" id="bsns_tkvr" name="bsns_tkvr"></td>
                                        </tr>
                                        <tr>
                                            <th>종류</th>
                                            <td colspan="3">
                                                <div class="btn-radio">
                                                    <input type="radio" name="vacation_type" id="test01" value="연차"/>
                                                    <label for="test01">연차</label>
                                                    <input type="radio" name="vacation_type" id="test02" value="월차"/>
                                                    <label for="test02">월차</label>
                                                    <input type="radio" name="vacation_type" id="test03" value="반차"/>
                                                    <label for="test03">반차</label>
                                                    <input type="radio" name="vacation_type" id="test04" value="훈련,교육"/>
                                                    <label for="test04">훈련,교육</label>
                                                    <input type="radio" name="vacation_type" id="test05" value="경조"/>
                                                    <label for="test05">경조</label>
                                                    <input type="radio" name="vacation_type" id="test06" value="기타"/>
                                                    <label for="test06">기타(생휴)</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>사유</th>
                                            <td colspan="3">
                                                <label for="" class="hide">사유란</label>
                                                <textarea class="h70" id="vacation_cont" name="vacation_cont"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>기간</th>
                                            <td colspan="3">
                                                <label for="" class="hide">시작일</label>
                                                <input type="text" id="regDate1" name="vacation_stt" onchange="call()" class="w140 datapicker">
                                                <span>~</span>
                                                <label for="" class="hide">종료일</label>
                                                <input type="text" id="regDate2" name="vacation_end" onchange="call()" class="w140 datapicker">
                                                <label for="" class="hide">총 일수</label>
                                                <input type="text" id="days" name="" class="w46 mg-l10 ta-c readonly" readonly="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>비상 연락망</th>
                                            <td colspan="3">
                                            	<label for="" class="hide">비상 연락망</label>
                                                <input type="text" id="emrgn_num" name="emrgn_num" maxlength="12" class="num w180" placeholder="' - ' 빼고 입력해주세요.">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="leave-app-txt">
                                    <p>위와 같이 휴가를 신청 하오니 재가하여 주시기 바랍니다.</p>
                                    <ul>
                                        <li id="year_txt"></li>
                                        <li id="month_txt"></li>
                                        <li id="day_txt"></li>
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
                                            <td>${user_name} ${user_position}</td>
                                            <td id="reviewer_person"></td>
                                            <td id="approver_person"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                    </form>
                </div>
                <div class="btn-box">
                    <ul>
                        <li><a href="#" title="취소" class="">취소</a></li>
                        <li><a href="javascript:vacation_insert()" title="작성완료" class="bg-blue">작성완료</a></li>
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
                                	<c:forEach var="getUserListSelect" items="${getUserList}">
	                                   		<tr>
		                                        <td>
		                                            <label for="check02-1" class="hide"></label>
		                                            <input type="checkbox" name="userChekBox" onclick="NoMultiChk(this)">
		                                        </td>
		                                        <td>
		                                        	${getUserListSelect.USER_NM} ${getUserListSelect.USER_POSITION}
		                                        </td>
		                                        <input type="hidden" name="user_sabun" value="${getUserListSelect.SABUN}" id="user_sabun">
		                                    </tr>
	                                 </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-selectbtn-box">
                            <ul>
                                <li><a href="javascript:reviewer_sel()" title="검토자 선택"><img src="../../resources/img/sub/btn-modal-right.png" alt="검토자 선택"></a></li>
                                <li><a href="javascript:approver_sel()" title="승인자 선택"><img src="../../resources/img/sub/btn-modal-right.png" alt="승인자 선택"></a></li>
                                <!-- <li><a href="javascript:referrer_sel()" title="참조자 선택"><img src="../../resources/img/sub/btn-modal-right.png" alt="참조자 선택"></a></li> -->
                            </ul>
                        </div>
                        <div class="modal-selectname-box">
                            <div class="modal-selectname-reviewer">
                                <h3>검토자</h3>
                                <ul></ul>
                            </div>
                            <div class="modal-selectname-approver">
                                <h3>승인자</h3>
                                <ul></ul>
                            </div>
                            <!-- <div class="modal-selectname-referrer">
                                <h3>참조자</h3>
                                <ul class="scro-y">
                                    <li>이영우 대표<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>김대근 부사장<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>나창연 부사장<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>최대규 전무<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>한동환 전무<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                    <li>최상오 전무<a href="#" title="삭제"><img src="../../resources/img/sub/btn-selectname-delete.png" alt="삭제"></a></li>
                                </ul>
                            </div> -->
                        </div>
                    </div>
                    <div class="modal-btn-box">
                        <ul>
                            <li>
                                <a href="javascript:selOkSend()" title="확인" class="btn-enroll">확인</a>
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

