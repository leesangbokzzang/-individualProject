<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<script>
// function loginBtn(){
// 	var sabun = $("#sabun").val();
// 	var formdate =$("form[name=userLoginFm]").serializeObject();
	
// 	$.ajax({
// 		url : 'userLoginFm.do',
// 		type : 'POST',
// 		contentType : "application/json;charset=utf-8",
// 		dataType : 'json',
// 		data : jsondata,
// 		success : function(result){
// 			alert("로그인 성공");
			
// 		},
// 		error : function(error){
// 			alert("ERROR :: " + error);
// 		}
// 	})
// }



</script>
<!-- 로그인 접속 실패시 뜨는 안내문 -->
<c:if test="${param.ng != null}">
	<c:if test="${param.ng == '1'}">
		<script type="text/javascript">
			alert("로그인 실패! \n 비밀번호를 확인하세요");
		</script>
	</c:if>
	<c:if test="${param.ng == '3'}">
		<script type="text/javascript">
			alert("로그인 실패! \n 아이디가 없거나 또는 아이디를 확인하세요");
		</script>
	</c:if>
</c:if>

<div class="main-wrap">
        <div class="login-wrap">
            <div class="left-box">
                <h1>HAPS 결재시스템</h1>
                <p>HCNC APPROVAL SYSTEM</p>
                <div class="logo">
                    <img src="../../resources/img/common/hcnc-logo-w.png" class="logo" alt="hcnc 로고">
                </div>
            </div>
            <div class="right-box">
                <h2>로그인</h2>
            <form action="userLoginFm.do" id="userLoginFm" method="post">
                <div class="login">
                        <div class="input">
                            <input type="text" name="user_sabun" id="user_sabun" placeholder="사번을 입력해주세요." style="padding: 9px 5px; margin-bottom: 18px;" value="${cookie.user_id.value}">
                            <label for="id" class="hide">사번</label>
                            <input type="password" name="password" id="password" placeholder="패스워드를 입력해주세요." maxlength="16">
                            <label for="pw" class="hide">패스워드</label>
                        </div>
                        <a href="javascript:document.getElementById('userLoginFm').submit();" class="btn-login" title="로그인">LOGIN</a>
                </div>
                <div class="login-check">
                	<c:if test="${cookie.user_id.value != null}">
                		<input type="checkbox" name="idsave" id="idsave" checked="checked">
                		 <label for="idsave">사번 저장</label>
               		</c:if>
               		<c:if test="${cookie.user_id.value == null}">
                		<input type="checkbox" name="idsave" id="idsave">
                		 <label for="idsave">사번 저장</label>
               		</c:if>
                </div>
            </form>
                <p class="login-guid">*사번 또는 비밀번호를 찾을 시 관리자에게 문의주세요.</p>
                <div class="copy">
                    Copyright © HCNC Corp. All rights Reserved.
                </div>
            </div>
        </div>
    </div>
</body>

</html>

