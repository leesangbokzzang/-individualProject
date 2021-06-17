<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<script>

 
$(document).ready(function(){
	var colNames =  ['사번', '이름', '부서', '전화번호'];
	var colModel =         
	                [{name:'bbsMgtNo',       index:'bbsMgtNo',      align:'center', width: '10%'},
	                {name:'bbsNum',         index:'bbsNum',        align:'left',   width:'12%'},
	                {name:'bbsTitle',       index:'bbsTitle',      align:'center', width:'12%'},
	                {name:'bbsHit',         index:'bbsHit',        align:'center', width:'12%'}];
	
	jQuery("#list").jqGrid({
		url : '/jqGridList.do',
		mtype: 'POST',
        height: 250,
        autowidth: true,
        colNames: colNames,
        colModel: colModel,
        rowNum : 10,
    });
	
	$('#list').jqGrid('sortableRows', {disabled:false});
});
        
   function userSearchList(){
	   var userNm = $("#userNm").val();
	   alert("click");
	  $("#list").clearGridData();
	  
	  jQuery('#list').jqGrid("setGridParam",{
		 url :'/jqGridList.do',
		 mtype : 'POST',
		 postData : {userNm : userNm},
		 
	  });
	  
	  jQuery("#list").trigger("reloadGrid");
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
                	
                	이름검색<input type="text" name="userNm" id="userNm" class="w120"/><a href="javascript:userSearchList()">검색</a>
                <form id="" name="" method="POST">
                    <div class="">
						<section class="wp100">
                            <div class="section-tit">
                                <h3>사용자 현황</h3>
                            </div>
							 <table id="list"></table>             	             
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

