<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<script>
$(document).ready(function(){
	//로그인한 유저의 권한을 확인 후 관리자가 아니면 이전페이지로  //관리자는 = 1, 일반사용자 = 0 
	if(${grade} != 1){//임시로 0으로 함
		alert("페이지에 권한이 없습니다.");
		//swal("경고!", "페이지에 권한이 없습니다.", "error");
		location.href= history.back();
	}
});

//::::::사번코드 생성 스크립트
function uuidv4() {
	  return 'Hxxxxxxx'.replace(/[xy]/g, 
	function(c) {
	    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
	    return v.toString(16);
	  });
	}
	
function show_uuid(){
	document.getElementById('sabun').value = uuidv4();
}
function formReset(){
	var sabun = $("#sabun").val("");
	var password = $("#password").val("");
	var userNm = $("#user_nm").val("");
	var birthNum = $("#birth_num").val("");
	var email = $("#email").val("");
	var phoneNum = $("#phonenum").val("");
	var userPosition = $("#user_position").val("선택");
	var teamNm = $("#team_nm").val("선택");
}
//::::::사용자 등록 스크립트
function userInsert(){
	var sabun = $("#sabun").val();
	var userNm = $("#user_nm").val();
	var password = $("#password").val();
	var userPosition = $("#user_position").val();
	var teamNm = $("#team_nm").val();
	
	var pw = $("#sabun").val();
	var formdate =$("form[name=userInsertFm]").serializeObject();
	formdate.password = pw + "1"+ "!";
	var jsondata = JSON.stringify(formdate);
	
	if(sabun == "" || userPosition == "" || teamNm == "" || userNm == ""){
		swal("경고!", "필수 기입란 입니다.", "error");
		return;
	}
	
	$.ajax({
		url : 'userInsertfm.do',
		type : 'POST',
		contentType : "application/json;charset=utf-8",
		dataType : 'json',
		data : jsondata,
		success : function(result){
			swal("확인!", "등록 완료 되었습니다.", "success");
			formReset();
		},
		error : function(error){
			alert("ERROR :: " + error);
		}
	})
	location.reload();
}

//::::::사용자정보 수정 스크립트
function userUpdate(){
	
	var sabun = $("#sabun").val();
	var userNm = $("#user_nm").val();
	var userPosition = $("#user_position").val();
	var teamNm = $("#team_nm").val();
	var email = $("#email").val();
	var phonenum = $("#phonenum").val();
	if(sabun == "" || userPosition == "" || teamNm == "" || userNm == "" || email == "" || phonenum == ""){
		swal("경고!", "사용자를 선택해주십시오.", "error");
		return false;
	}
	
	var formdate =$("form[name=userInsertFm]").serializeObject();
	var jsondata = JSON.stringify(formdate);
	
	$.ajax({
		url : 'userUpdatefm.do',
		type : 'POST',
		contentType : "application/json;charset=utf-8",
		dataType : 'json',
		data : jsondata,
		success : function(result){
			
			$("#btnUserInsert").show();
			$("#password").attr('readonly', true);
			$("#password").css("background", "#f5f5f5");
			swal("확인!", "수정 하였습니다.", "success");
			formReset();
		},
		error : function(error){
			alert("ERROR :: " + error);
		}
	})
	location.reload();
}

//::::::사용자삭제 스크립트
function userDelete(){
	var sabun = $("#sabun").val();
	var userNm = $("#user_nm").val();
	var password = $("#password").val();
	var userPosition = $("#user_position").val();
	var teamNm = $("#team_nm").val();
	
	if(sabun == "" || userPosition == "" || teamNm == "" || userNm == ""){
		swal("경고!", "사용자를 선택해주십시오.", "error");
		return false;
	}
	
	var formdate =$("form[name=userInsertFm]").serializeObject();
	var jsondata = JSON.stringify(formdate);
	
	$.ajax({
		url : 'userDeletefm.do',
		type : 'POST',
		contentType : "application/json;charset=utf-8",
		dataType : 'json',
		data : jsondata,
		success : function(result){
			swal("확인!", "삭제 하였습니다.", "success");
			$("#btnUserInsert").show();
			$("#password").attr('readonly', true);
			$("#password").css("background", "#f5f5f5");
			formReset();
		},
		error : function(error){
			alert("ERROR :: " + error);
		}
	})
	location.reload();
}

//::::::패스워드 초기화
function pwdReset(){
	
	var sabun = $("#sabun").val();
	var formdate =$("form[name=userInsertFm]").serializeObject();
	formdate.password = sabun + "1" + "!";
	var jsondata = JSON.stringify(formdate);
	
	if(sabun == ""){
		swal("경고!", "사용자를 선택해주십시오.", "error");
		return false;
	}
	
	$.ajax({
		url : 'userPwdResetfm.do',
		type : 'POST',
		contentType : "application/json;charset=utf-8",
		dataType : 'json',
		data : jsondata,
		success : function(result){
			swal("확인!", "패스워드를 초기화 하였습니다.", "success");
			$("#btnUserInsert").show();
			$("#password").attr('readonly', true);
			$("#password").css("background", "#f5f5f5");
			formReset();
		},
		error : function(error){
			alert("ERROR :: " + error);
		}
	})
	
}

//::::::사용자 현황팝업창에서 확인버튼 스크립트
function userChkOK(){
	var checkbox = $("input[name=userChekBox]:checked"); //체크된 checkbox
	var tr;
	var td;
	checkbox.each(function(i){
		tr = checkbox.parent().parent(); //체크박스인풋의 부모에 부모요소인 tr선택
		td = tr.children() // tr에 바로다음에 자식요소 td
	});
	var sabun = td.eq(1).text(); //td중에 2번째 td값인 sabun td값 
	
	var formdate =$("form[name=userSabunFm]").serializeObject();
	formdate.userSabun = sabun;
	var jsondata = JSON.stringify(formdate);
	
	$.ajax({
		url : 'userSabunfm.do',
		type : 'POST',
		contentType : "application/json;charset=utf-8",
		dataType : 'json',
		data : jsondata,
		success : function(result){
			$("#sabun").val(result.result[0].SABUN);
			$("#password").val(result.result[0].PASSWORD);
			$("#phonenum").val(result.result[0].PHONENUM);
			$("#user_nm").val(result.result[0].USER_NM);
			$("#birth_num").val(result.result[0].BIRTH_NUM);
			$("#email").val(result.result[0].EMAIL);
			$("#user_position").val(result.result[0].USER_POSITION);
			$("#team_nm").val(result.result[0].TEAM_NM);
			
			$("input[name=userChekBox]").attr('checked', false);//체크해제
			$("#password").attr('readonly', false);
			$("#password").css("background", "#fff");
			$(".modal-wrap2").hide(); //사용자현황 팝업닫기
			$("#btnUserInsert").hide();
		},
		error : function(error){
			alert("ERROR :: " + error);
			console.log(error);
		}
	})
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
                            <a href="#" title="시스템관리">
                                시스템관리
                            </a>
                        </li>
                        <li>
                            <a href="#" title="사용자현황">
                                사용자현황
                            </a>
                        </li>
                        <li>
                            <a href="#" title="사용자관리(관리자용)">
                                사용자관리(관리자용)
                            </a>
                        </li>
                    </ul>
                </div>
                <%@ include file="../layout/sub-header.jsp"%>
            </div>
            <!--//main-title-->
            <div class="sub-container">
                <div class="sub-section-wrap user-mgm-adm">
                    <div class="col-1">
                        <section class="wp100">
                            <div class="section-tit">
                                <h3>사용자관리</h3>
                            </div>
                            <div class="table-wrap">
                            	<form id="userInsertFm" name="userInsertFm" method="post">
                                <table class="table-type02">
                                    <caption>사용자관리 테이블</caption>
                                    <colgroup>
                                        <col class="wp10">
                                        <col class="wp40">
                                        <col class="wp10">
                                        <col class="wp40">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><span class="impor">*</span>사번</th>
                                            <td>
                                                <label for="" class="hide">사번</label>
                                                <input type="text" class="wp40" id="sabun" name="sabun"/>
                                                <a href="javascript:show_uuid()" title="사번생성" class="comm-btn" onclick="show_uuid();">사번생성</a>
                                            </td>
                                            <th>전화번호</th>
                                            <td>
                                            	<label for="" class="hide">전화번호</label>
                                                <input type="text" maxlength="12" id="phonenum" name="phonenum" class="num wp35" placeholder="' - ' 뺴고 입력해주세요.">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>비밀번호
                                            </th>
                                            <td>
                                                <input type="password" readonly="" class="readonly wp40 fs13" id="password" name="password"><span class="passwd-msg">
                                                    <img src="../../resources/img/sub/btn-passwdmsg.png" alt="초기비밀번호 안내메세지">
                                                    <p class="msg-box">사용자의 초기비밀번호는 <strong>"사번 + 1 + ! "</strong> 입니다.</p>
                                                </span>
                                                
                                            </td>
                                            <th>
                                                <sapn class="impor">*</sapn>직위
                                            </th>
                                            <td>
                                                <label for="" class="hide">직위선택</label>
                                                <select name="user_position" id="user_position" class="wp35">
                                                    <option>선택</option>
                                                    <c:forEach var="getPositionFGVal" items="${getPositionFG}">
                                                    	<option value = "${getPositionFGVal.CODE}">${getPositionFGVal.DC}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><span class="impor">*</span>이름</th>
                                            <td>
                                                <label for="" class="hide">이름</label>
                                                <input type="text" class="wp40" id="user_nm" name="user_nm">
                                                <a href="#" title="검색" id="btn-nmsearch" class="comm-btn">검색</a>
                                            </td>
                                            <th><span class="impor">*</span>부서명</th>
                                            <td>
                                                <label for="" class="hide">부서명선택</label>
                                                <select name="team_nm" id="team_nm" class="wp35">
                                                    <option>선택</option>
                                                    <c:forEach var="getTeamFGVal" items="${getTeamFG}">
                                                    	<option value = "${getTeamFGVal.DC}">${getTeamFGVal.DC}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td>
                                                <label for="" class="hide">생년월일</label>
                                                <input type="text" id="birth_num" name="birth_num" class="datapicker wp40">
                                            </td>
                                            <th>이메일</th>
                                            <td>
                                                <label for="" class="hide">E-mail</label>
                                                <input type="text" class="wp35" id="email" name="email">
                                                @hcnc.co.kr
                                            </td>
                                        </tr>
                                        <!-- <tr>
                                            <th><sapn class="impor">*</sapn>Sign</th>
                                            <td>
                                                <fieldset>
                                                    <div class="file-box">
                                                        <label for="" class="hide">첨부</label>
                                                        <input type="text" class="upload-nm wp50" placeholder="파일선택" value="" disabled="disabled">
                                                        <label for="ex_filename" class="file-nm">파일선택</label>
                                                        <input type="file" id="ex_filename" name="" class="upload-hd">
                                                    </div>
                                                </fieldset>
                                            </td>
                                        </tr> -->
                                    </tbody>
                                </table>
                                </form>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="btn-box">
                    <ul>
                        <li><a href="javascript:pwdReset()" title="패스워드 초기화" class="bg-mint">패스워드 초기화</a></li>
                        <li><a href="javascript:userUpdate()" title="수정" class="">수정</a></li>
                        <li><a href="javascript:userDelete()" title="삭제" class="">삭제</a></li>
                        <li id="btnUserInsert"><a href="javascript:userInsert()" title="등록" class="bg-blue">등록</a></li>
                    </ul>
                </div>
            </div>
            <!--//sub-container-->
            <footer>
                <div class="sub-footer">
                    Copyright © HCNC Corp. All rights Reserved.
                </div>
            </footer>
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
                                <li><a href="#" title="검토자 선택"><img src="../../resources/img/sub/btn-modal-right.png" alt="검토자 선택"></a></li>
                                <li><a href="#" title="승인자 선택"><img src="../../resources/img/sub/btn-modal-right.png" alt="승인자 선택"></a></li>
                                <li><a href="#" title="참조자 선택"><img src="../../resources/img/sub/btn-modal-right.png" alt="참조자 선택"></a></li>
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
        
        <!--이름 검색 박스-->
        <div class="modal-wrap2" id="modal2">
            <div class="modal-bg"></div>
            <div class="modal-container">
                <div class="modal-header">
                    <h4>사용자 현황</h4>
                    <a href="#" title="닫기" class="btn-close" id="btn-close"></a>
                </div>
                <div class="modal-contents">
                    <div class="modal-contents-box">
                        <div class="table-wrap scro-y h400">
                        	<form action="userSabunFm" name="userSabunFm" method="post">
                            <table class="table-type01">
                                <caption>사용자 이름 검색 테이블</caption>
                                <colgroup>
                                    <col class="wp8">
                                    <col class="wp20">
                                    <col class="wp20">
                                    <col class="wp10">
                                    <col class="wp20">
                                    <col class="wauto">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>선택</th>
                                        <th>사번</th>
                                        <th>이름</th>
                                        <th>직위</th>
                                        <th>부서</th>
                                        <th>전화번호</th>
                                    </tr>
                                </thead>
                                <tbody>
	                                	<c:forEach var="getUserListSelect" items="${getUserList}">
	                                   		<tr>
		                                        <td>
		                                            <label for="check02-1" class="hide"></label>
		                                            <input type="checkbox" name="userChekBox" onclick="NoMultiChk(this)">
		                                        </td>
		                                        <td><input type="hidden" name="userSabun" value=""/>${getUserListSelect.SABUN}</td>
		                                        <td>${getUserListSelect.USER_NM}</td>
		                                        <td>${getUserListSelect.USER_POSITION}</td>
		                                        <td>${getUserListSelect.TEAM_NM}</td>
		                                        <td>${getUserListSelect.PHONENUM}</td>
		                                    </tr>
	                                   	</c:forEach>
                                   	
                                </tbody>
                            </table>
                            </form>
                        </div>
                    </div>
                    <div class="modal-btn-box">
                        <ul>
                            <li>
                                <a href="javascript:userChkOK()" title="확인" class="btn-enroll">확인</a>
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
