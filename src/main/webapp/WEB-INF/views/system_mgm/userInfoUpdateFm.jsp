<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<script>
	$(function(){
		//변경할 패스워드확인 스크립트
		$("#pwdChange2").keyup(function(){
			
			var pwdChange = $("#pwdChange").val();
			var pwdChange2 = $("#pwdChange2").val();
			
			if(pwdChange != pwdChange2){
				$("#pwd3").html("<b class='red' style='font-size:12px; color: red; margin-left: 4px; font-weight:400;'>변경 패스워드 불일치</b>");
				$("#pwd4").html("<b class='red' style='font-size:12px; color: red; margin-left: 4px; font-weight:400;'>변경 패스워드 불일치</b>");
			}else{
				$("#pwd3").html("<b style='font-size:12px; color: green; margin-left: 4px; font-weight:400;'>변경 패스워드 일치</b>");
				$("#pwd4").html("<b style='font-size:12px; color: green; margin-left: 4px; font-weight:400;'>변경 패스워드 일치</b>");
			}
			
			if(pwdChange.length < 9){
				$("#pwd3").html("<b class='red' style='font-size:11px; color: red; margin-left: 4px; font-weight:400;'>변경 패스워드는 9자리 이상입니다.</b>");
				$("#pwdChange").focus();
			}
			if(pwdChange2.length <= 9){
				$("#pwd3").html("<b class='red' style='font-size:11px; color: red; margin-left: 4px; font-weight:400;'>변경 패스워드는 9자리 이상입니다.</b>");
			}
		})
		
		//현재 패스워드 검사
		$("#pwd").focusout(function(){
			
			var pwd = $("#pwd").val();
			if(pwd == ""){
				swal("경고", "필수 기입란 입니다.", "error");
			}
			
			$.ajax({
				url : 'pwdInspection.do',
				type : 'POST',
				data : {
					sabun : $("#sabun").val(),
					pwd : $("#pwd").val()
				},
				success : function(data){
					var pwdResult = data.result;
					if(pwdResult == 0){
						$("#pwd2").html("<b class='red' style='font-size:12px; color: red; margin-left: 4px; font-weight:400;'>패스워드 불일치</b>");
					}else if(pwdResult == 1){
						$("#pwd2").html("<b style='font-size:12px; color: green; margin-left: 4px; font-weight:400;'>패스워드 일치</b>");
					}
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n\n"+"message:"+request.responseText+"\n\n"+"error:"+error);
					console.log(error);
				}
			})
		})
	});
	
	function pwdUpdate(){
		var pwdChange = $("#pwdChange").val();
		var pwdChange2 = $("#pwdChange2").val();
		
		if($("#pwd2 > b, #pwd3 > b, #pwd4 > b").hasClass('red')){
			swal("경고", "패스워드를 확인하십시오.", "error");
			return false;
		}
		
		if(pwdChange == "" || pwdChange2 == ""){
			swal("경고", "필수기입란 입니다.", "error");
			return false;
		}
		
		$.ajax({
			url : 'pwdChange.do',
			type : 'POST',
			data : {
				sabun : $("#sabun").val(),
				pwd   : $("#pwdChange").val()
			},
			success : function(result){
				var pwd = $("#pwd").val("");
				var pwdChange = $("#pwdChange").val("");
				var pwdChange2 = $("#pwdChange2").val("");
				
				$(".pwdChangeFm").hide();
				
				swal("성공", "패스워드를 변경하였습니다.", "success");
				
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n\n"+"message:"+request.responseText+"\n\n"+"error:"+error);
				console.log(error);
			}
		})
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
                            <a href="#" title="시스템관리">시스템관리</a>
                        </li>
                        <li>
                            <a href="#" title="사용자현황">사용자현황</a>
                        </li>
                    </ul>
                </div>
                <%@ include file="../layout/sub-header.jsp"%>
            </div>
            <!--//main-title-->
            <div class="sub-container">
                <div class="sub-section-wrap chyr-Prvcy">
                	
                <form id="" name="" method="POST">
                    <div class="">
						<section class="wp100">
                            <div class="section-tit">
                                <h3>개인정보변경</h3>
                            </div>
							<div class="table-wrap">
                            	<form id="" name="" method="post">
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
                                            <th>사번</th>
                                            <td>${sabun}</td>
                                            <th>전화번호</th>
                                            <td>${phone_num}</td>
                                        </tr>
                                        <tr>
                                        	<th>이름</th>
                                            <td>${user_name}</td>
                                            <th>직위</th>
                                            <td>${user_position}</td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td>${bir_day}</td>
                                            <th>부서명</th>
                                            <td>${team_nm }</td>
                                        </tr>
                                        <tr>
                                            <th>이메일</th>
                                            <td colspan="3">${email}@sbTeck.com</td>
                                        </tr>
                                    </tbody>
                                </table>
                                </form>
                            </div>           	             
                        </section>                        
                    </div>
                    </form>
                    <div class="btn-box">
                    <ul>
                        <li><a href="#" title="패스워드 변경" id="btn-choose" class="">패스워드 변경</a></li>
                    </ul>
                </div>
                </div>
            </div>
            <!--//sub-container-->
            <%@ include file="../layout/footer.jsp"%>
        </div>
    </div>
    <!--//sub-main-wrap-->
</body>

</html>
<div class="modal-wrap chyr-Prvcy-modal pwdChangeFm" id="modal">
            <div class="modal-bg"></div>
            <div class="modal-container">
                <div class="modal-header">
                    <h4>패스워드 변경</h4>
                    <a href="#" title="닫기" class="btn-close" id="btn-close"></a>
                </div>
                <div class="modal-contents">
                   <p class="pw-txt">* 패스워드 변경시 9자리 이상 설정하여야 합니다.</p>
                    <div class="modal-contents-box">
                        <div class="table-wrap">
                        	<form action="" name="">
	                            <table class="table-type01">
	                                <caption>패스워드 변경 테이블</caption>
	                                <colgroup>
	                                    <col class="w200">
	                                    <col class="w400">
	                                </colgroup>
	                                <tbody>
	                                    <tr>
	                                        <th>사번</th>
	                                        <td>${sabun}
	                                        	<input type="hidden" id="sabun" name="sabun" value="${sabun}">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>이름</th>
	                                        <td>${user_name}</td>
	                                    </tr>
	                                    <tr>
	                                        <th>현재 패스워드</th>
	                                        <td><input type="password" class="w230" name="pwd" id="pwd"><span id="pwd2"></span></td>
	                                    </tr>
	                                    <tr>
	                                        <th>변경 패스워드</th>
	                                        <td><input type="password" class="w230" name="pwdChange" id="pwdChange"><span id="pwd3"></span></td>
	                                    </tr>
	                                    <tr>
	                                        <th>변경 패스워드 확인</th>
	                                        <td><input type="password" class="w230" id="pwdChange2"><span id="pwd4"></span></td>
	                                    </tr>                                    
	                                </tbody>
	                            </table>
                            </form>
                        </div>
                    </div>
                    <div class="modal-btn-box">
                        <ul>
                            <li>
                                <a href="javascript:pwdUpdate()" title="수정" class="btn-enroll">수정</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div> <!-- //modal-picture-->
