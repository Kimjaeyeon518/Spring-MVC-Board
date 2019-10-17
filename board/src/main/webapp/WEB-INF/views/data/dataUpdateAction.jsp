<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%	
	String dataSeq = request.getParameter("dataSeq");		
%>
<%	
	String root = request.getParameter("root");		
%>

<c:set var="root" value="<%=root%>"/> <!--관리자 확인-->
<c:set var="dataSeq" value="<%=dataSeq%>"/> <!-- 게시글 번호 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 수정</title>
  <script 
        src="https://cdnjs.cloudflare.com/ajax/libs/intense-images/1.0.7/intense.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="/js/common/style.js"></script>
<script type="text/javascript" src="https://ajax.go	ogleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script>

	$(document).ready(function(){		
		
	});
	


function updateAction(){
	
	$.ajax({	
	
	    url		:"/data/getdataPw",
	    data    : $("#dataForm").serialize(),
        dataType: "JSON",
        cache   : false,
		async   : true,
		type	:"POST",	
        success : function(obj) {
        	updateActionCallback(obj);				
        },	       
        error 	: function(xhr, status, error) {}
        
     });
}

/** 게시판 - 목록 조회  콜백 함수 */
function updateActionCallback(obj){
		
		var password		= obj.data_pw;	
		var input_pw = $("#input_pw").val();
		if(password == input_pw) {
			var dataSeq = $("#data_seq").val();
			
			location.href = "/data/dataUpdate?dataSeq="+ dataSeq + "&root=${root}";
		}
		else {
			alert("비밀번호가 일치하지 않습니다!");
			return;
		}
		
}

function goDataDetail(dataSeq){				
	location.href = "/data/dataDetail?dataSeq="+ dataSeq + "&root=${root}";
}


</script>
</head>
<body>
		<h2>비밀번호</h2>	
	<div class="panel-body">
        <fieldset>
     		<form id="dataForm" name="dataForm">
	            <div class="form-group">
	            
	            	 <input type="hidden" id="data_seq"		name="data_seq"	value="${dataSeq}"/> <!-- 게시글 번호 -->
	                 <input id="input_pw" type="password" class="form-control" placeholder="Password" name="input_pw"/>
	            </div>
            </form>
                <button type="submit" class="btn btn-lg btn-success btn-block" onclick="javascript:updateAction()">비밀번호 확인</button>
                <button type="submit" class="btn btn-lg btn-success btn-block" onclick="javascript:goDataDetail(${dataSeq})">돌아가기</button>
        </fieldset>
</div>

</body>
</html>