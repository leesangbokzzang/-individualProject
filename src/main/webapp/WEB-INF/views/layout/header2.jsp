<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
    response.setHeader("Cache-Control","no-store");   
    response.setHeader("Pragma","no-cache");   
    response.setDateHeader("Expires",0);   
 
    if (request.getProtocol().equals("HTTP/1.1")) {
        response.setHeader("Cache-Control", "no-cache"); 
    }
    
%> 

	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>HCNC 결재시스템</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<link rel="stylesheet" type="text/css" href="../resources/css/import.css" id="lightCss"/>
<!-- 	<link rel="stylesheet" type="text/css" href="../resources/dark/dark.css" id="darkCss"/> -->
    <script src="../resources/js/jquery-1.9.1.js"></script>
    <script src="../resources/js/script.js"></script>
    <script src="../resources/js/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    
    
    <!-- datepicker 외부링크 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--      <link rel="stylesheet" href="/resources/demos/style.css"> -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
    	
    </style>
    <script>
    	//웹모드 체크 보내기
    	var cnt = 0;
    	$(function(){
    		var modeChek = $("#md_3").val();
        	$("#md_3").on('click', function(){
        		$.ajax({
        			url : 'webMode.do',
        			type : 'POST',
        			data : {webmode : modeChek},
        			success : function(){
        				if($("#md_3").is(":checked")== true){
        	  				  var ls = document.createElement('link');
        	  				  ls.rel="stylesheet";
        	  				  ls.href="../resources/dark/dark.css";
        	  				  document.getElementsByTagName('head')[0].appendChild(ls);
        	  				  $("#lightCss").remove();
          				}else if($("#md_3").is(":checked")== false){
     	  					var ls = document.createElement('link');
   	    				    ls.rel="stylesheet";
   	    				    ls.href="../resources/css/import.css";
   	    				    document.getElementsByTagName('head')[0].appendChild(ls);
   	    				    $("#darkCss").remove();
          				}
        			},
        			error : function(xhr){
        				xhr.status+", "+ xhr.statusText;
        				alert(modeChek);
        			}
        		})
        	});
        	
        	if($("#md_3").is(":checked")== true){
				if(cnt == 0){
				  var ls = document.createElement('link');
				  ls.rel="stylesheet";
				  ls.href="../resources/dark/dark.css";
				  document.getElementsByTagName('head')[0].appendChild(ls);
				  $("#lightCss").remove();
				  cnt = 1;
 			}
			}else if($("#md_3").is(":checked")== false){
				if(cnt == 1){	
  					var ls = document.createElement('link');
    				  ls.rel="stylesheet";
    				  ls.href="../resources/css/import.css";
    				  document.getElementsByTagName('head')[0].appendChild(ls);
    				  $("#darkCss").remove();
  					cnt=0;
  				}
			}
    	})
    </script>
    <script>
    /*json 형식 변환 object*/
    jQuery.fn.serializeObject = function() {
 	var obj = null;
     try {
         if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
             var arr = this.serializeArray();
             if(arr){
             	obj = {};
             	jQuery.each(arr, function() {
             		obj[this.name] = this.value;
             	});
             }
         }
     }catch(e) {
        	alert(e.message);
     }finally {}
     	return obj;

     };
     
     $(function(){
    	 
    	 //사용자현황
    	 $( "#birth_num" ).datepicker();
    	 
    	 //휴가신청서 
    	 $( "#regDate1" ).datepicker();
    	 $( "#regDate2" ).datepicker();
    	 
    	 
     })
     
     $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'

        });
     
     
     
    </script>
</head>

<body>

	
