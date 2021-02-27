<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<script>
function loginBtn(){
	var sabun = $("#sabun").val();
	var formdate =$("form[name=userLoginFm]").serializeObject();
	
	$.ajax({
		url : 'userLoginFm.do',
		type : 'POST',
		contentType : "application/json;charset=utf-8",
		dataType : 'json',
		data : jsondata,
		success : function(result){
			alert("로그인 성공");
			
		},
		error : function(error){
			alert("ERROR :: " + error);
		}
	})
}

</script>
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
                <div class="login">
                    <form id="userLoginFm" name="userLoginFm" method="post">
                        <div class="input">
                            <input type="text" name="user_sabun" id="user_sabun" placeholder="사번을 입력해주세요.">
                            <label for="id" class="hide">사번</label>
                            <input type="password" name="password" id="password" placeholder="패스워드를 입력해주세요." maxlength="16">
                            <label for="pw" class="hide">패스워드</label>
                        </div>
                        <a href="#" class="btn-login" title="로그인" id="btnLogin">LOGIN</a>
                    </form>
                </div>
                <div class="login-check">
                    <input type="checkbox" name="" id="idsave">
                    <label for="idsave">사번 저장</label>
                    <input type="checkbox" name="" id="loginsecu">
                    <label for="loginsecu">로그인 보안</label>
                </div>
                <p class="login-guid">*사번 또는 비밀번호를 찾을 시 관리자에게 문의주세요.</p>
                <div class="copy">
                    Copyright © HCNC Corp. All rights Reserved.
                </div>
            </div>
        </div>
    </div>
</body>

</html>

