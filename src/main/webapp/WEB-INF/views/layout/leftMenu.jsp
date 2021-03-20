<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#md_1:checked + label.green,
#md_2:checked + label.green,
#md_3:checked + label.green {
  background: #3b79b6;
}
#md_1:checked + label.green:after,
#md_2:checked + label.green:after,
#md_3:checked + label.green:after {
  background: rgb(207,207,207);
}
#md_1:checked + label:after,
#md_2:checked + label:after,
#md_3:checked + label:after {
  left: calc(100% - 20px);
}
#md_1 + label,
#md_2 + label,
#md_3 + label {
  background: #ddd;
  border-radius: 20px;
  height: 10px;
}
#md_1 + label:after,
#md_2 + label:after,
#md_3 + label:after {
  background: #464d52;
  border-radius: 50%;
  top: -5px;
  box-shadow: 0px 0px 3px #aaa;
}
#md_3{
  display: none;
}
#md_3 + label {
  display: inline-block;
  width: 40px;
  height: 20px;
  position: relative;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  margin: 0px 20px;
  box-sizing: border-box;
}
#md_3 + label:after {
  content: '';
  display: block;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 20px;
  height: 20px;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  cursor: pointer;
}
</style>
<%-- <%@ include file="header.jsp"%> --%>
<div class="lnb-wrap">
            <div class="lnb-logo">
                <p>
                    <h1><a href="/main.do" title="홈 바로가기" style="font-size: 28px">상복텍 결재시스템</a></h1>
<!--                         <img src="../../resources/img/common/hcnc-logo2.png" alt="HCNC 로고"> -->
                    
                </p>
            </div>
            <div class="lnb-top-box">
                <p>Dashboard</p>
            </div>
            <div class="lnb-menu">
                <ul>
                    <li class="">
                        <a href="#" title="작성" class="lnb-dep1 on">작성</a>
                        <ul class="lnb-dep2 ">
                            <li><a href="#" title="결재현황">결재현황</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" title="검토" class="lnb-dep1">검토</a>
                        <ul class="lnb-dep2">
                            <li><a href="#" title="검토대기">검토대기</a></li>
                            <li><a href="#" title="검토현황">검토현황</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" title="승인" class="lnb-dep1">승인</a>
                        <ul class="lnb-dep2">
                            <li><a href="#" title="승인대기">승인대기</a></li>
                            <li><a href="#" title="승인현황">승인현황</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" title="시스템관리" class="lnb-dep1">시스템관리</a>
                        <ul class="lnb-dep2">
                            <li><a href="userStatus.do" title="사용자현황">사용자현황</a></li>
                            <li><a href="#" title="개인정보변경">개인정보변경</a></li>
                            <li><a href="#" title="코드관리">코드관리</a></li>
                        </ul>
                    </li>
                    <li style="display:flex; justify-content: space-between; margin-top: 8px;">
                    	<p style="color: #bdbdbd; font-weight:bold;">다크모드</p>
                    	<div style="padding-top: 5px;">
                    		<c:if test="${cookie.mode_dark.value == null}">
		                		<input type="checkbox" id="md_3" name="webmode">
	                    		<label for="md_3" class="green"></label>
		               		</c:if>
		               		<c:if test="${cookie.mode_dark.value != null}">
		                		<input type="checkbox" id="md_3" name="webmode" checked="checked">
	                    		<label for="md_3" class="green"></label>
		               		</c:if>
                    	</div>
                    </li>
                </ul>
                <div class="mail-box">
                    <p>Postmaster@sbTeck.com</p>
                </div>
            </div>
        </div>
        <!--//lnb-menu-->