<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<%	
	String board = request.getParameter("board");		
%>
<c:set var="board" value="<%=board%>"/> <!-- 게시글 번호 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
  <script 
        src="https://cdnjs.cloudflare.com/ajax/libs/intense-images/1.0.7/intense.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://ajax.go	ogleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script>

	$(document).ready(function(){		
		
	});
	
	function goBack() {
		var board = $("#board").val();
		
		if(board==1) {

			location.href="/board/boardList";
			
		}
		
		else {
			location.href="data/dataList";
		}
	}

	function login(){
	
		$.ajax({	
		
		    url		:"/rootLogin",
		    data    : $("#loginForm").serialize(),
	        dataType: "JSON",
	        cache   : false,
			async   : true,
			type	:"POST",	
	        success : function(obj) {
				loginInfoCallback(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
	}

	/** 게시판 - 목록 조회  콜백 함수 */
	function loginInfoCallback(obj){
		
			var input_id = $("#input_id").val();
			var input_pw = $("#input_pw").val();
			
			if(input_id == obj.login_id && input_pw == obj.login_pw) {
				rootAdmin();
			}
			else {
				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			}
			
	}
	
	function rootAdmin() {
		
		$.ajax({	
			
		    url		:"/admin/rootAdmin",
	        success : function(obj) {
	        	rootAdminCallback(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
		
	}
	
	function rootAdminCallback(obj) {
		
		var board = $("#board").val();
		
		if(obj != null) {
			var result = obj.result;
			
			if(result == "SUCCESS") {

				if(board == 1) location.href="/board/boardList";
				if(board == 2) location.href="/data/dataList";
			}
			else {
				alert("관리자 로그인 실패!")
				return;
			}
		}
	}
	

</script>
</head>
<body>
	<div class="panel-body">
        <form id="loginForm" name="loginForm" action="/rootLogin" enctype="multipart/form-data" method="post" onsubmit="return false;">
                <input id="input_id" type="text" class="form-control" placeholder="ID" name="input_id"/>
                <input id="input_pw" type="password" class="form-control" placeholder="Password" name="input_pw"/>
        </form>
        <input type="hidden" id="board" name="board" value="${board}"/>
        <div class="btn_right mt15">
        	<button type="submit" class="btn btn-lg btn-success btn-block" onclick="javascript:login()">로그인</button>
            <button type="submit" class="btn btn-lg btn-success btn-block" onclick="javascript:goBack()">돌아가기</button>
		</div>
	</div>
</body>
</html>