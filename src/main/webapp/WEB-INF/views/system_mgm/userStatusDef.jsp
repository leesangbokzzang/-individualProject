<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<script>
	$(function(){
		searchName();
	})
	function searchName(){
		
		$.ajax({
			url : '/userStatusSearch.do',
			type : 'POST',
			data : {
				sear_nm : $("#sear_nm").val()
			},
			success : function(result){
				console.log(result);
				var date = result.userStatusList;
				var output ="";
				$.each(date, function(index, item){
					output += '<tr>';
					output += '<td>'+item.SABUN +'</td>';
					output += '<td>'+item.USER_NM +'</td>';
					output += '<td>'+item.position+'</td>';
					output += '<td>'+item.TEAM_NM+'</td>';
					output += '<td>'+item.PHONENUM+'</td>';
					output += '</tr>';
					
				});
				$(".search_List").html(output);
				
// 				var output2 = "";
// 				$.each(result, function(index, item){
// 					output2 += '<span>';
// 				  	output2 += '<a href="/userStatusSearch.do?num='+item+'">'+ item +'</a>';
// 				  	output2 += '</span>';
// 				});
// 				$(".btn-paging").html(output2);
				
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
                <div class="sub-section-wrap user-sttus">
                	<section>
                		<div style="display: flex;" class="searchBox">
	                		<dl>
	                			<dt>이름</dt>
	                			<dd><input type="text" name="sear_nm" id="sear_nm" class=""></dd>
	                		</dl>
	                		<div class="btn-box">
			                    <ul>
			                        <li><a href="javascript:searchName()" title="검색">검색</a></li>
			                    </ul>
			                </div>
		                </div>
                	</section>
                <form id="" name="" method="POST">
                    <div class="">
						<section class="wp100">
                            <div class="section-tit">
                                <h3>사용자현황</h3>
                                
                            </div>
                            <div class="table-wrap">
                                <table class="table-type01">
                                    <caption>사용자현황 테이블</caption>
                                    <colgroup>
                                        <col class="wp20">
                                        <col class="wp20">
                                        <col class="wp20">
                                        <col class="wp20">
                                        <col class="wp20">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>사번
                                                <a class="btn-up1">
                                                    <img src="../../resources/img/common/btn-list-up.png" alt="오름차순">
                                                </a>
                                                <a class="btn-down1">
                                                    <img src="../../resources/img/common/btn-list-down.png" alt="내림차순">
                                                </a>
                                            </th>
                                            <th>이름
                                                <a class="btn-up2">
                                                    <img src="../../resources/img/common/btn-list-down.png" alt="내림차순">
                                                </a>
                                                <a class="btn-down2">
                                                    <img src="../../resources/img/common/btn-list-up.png" alt="내림차순">
                                                </a>
                                            </th>
                                            <th>직위</th>
                                            <th>부서</th>
                                            <th>전화번호</th>
                                        </tr>
                                    </thead>
                                    <tbody class="search_List">
                                    	<!--<c:forEach var="userStatusList" items="${userStatusList}">
                                    		<tr>
                                    			<td>${userStatusList.SABUN}</td>
                                    			<td>${userStatusList.USER_NM}</td>
                                    			<td>${userStatusList.position}</td>
                                    			<td>${userStatusList.TEAM_NM}</td>
                                    			<td>${userStatusList.PHONENUM}</td>
                                    		</tr>
                                    	</c:forEach>-->
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-paging btn-pageing-bg">
<!--                             	<ul> -->
<%--                             		<c:if test="${pageMaker.prev}"> --%>
<!--                             			<li> -->
<%--                                         	<a href="<c:url value='/userStatusDef.do?page=${pageMaker.startPage-1}'/>" title="이전"><img src="../resources/img/sub/btn-prev.png" alt="이전"></a> --%>
<!--                                     	</li> -->
<%--                             		</c:if> --%>
<%--                             		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum"> --%>
<!--                             			<li> -->
<%--                                         	<a href="<c:url value='/userStatusDef.do?page=${pageNum}'/>" title="더보기">${pageNum}</a> --%>
<!--                                    		 </li> -->
<%--                             		</c:forEach> --%>
<%--                             		<c:if test="${pageMaker.next && pageMaker.endPage > 0}"> --%>
<!--                             			<li> -->
<%--                                        		<a href="/userStatusDef.do?page=${pageMaker.endPage+1}" title="다음"><img src="../resources/img/sub/btn-next.png" alt="다음"></a> --%>
<!--                                     	</li> -->
<%--                             		</c:if> --%>
<!--                             	</ul> -->
                            </div>
						<c:forEach begin="1" end="${pageNum}" var="num">
						  <span>
						  	<a href="/userStatusSearch.do?num=${num}">${num}</a>
						  </span>
						</c:forEach>
                        </section>                        
                    </div>
                    </form>
                </div>
            </div>
            <!--//sub-container-->
            <%@ include file="../layout/footer.jsp"%>
        </div>
    </div>
    <!--//sub-main-wrap-->
</body>

</html>

