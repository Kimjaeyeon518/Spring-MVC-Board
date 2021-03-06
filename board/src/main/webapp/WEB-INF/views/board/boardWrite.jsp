<%@page import="com.fasterxml.jackson.databind.annotation.JsonPOJOBuilder.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%	
	String boardSeq = request.getParameter("boardSeq");		
%>
<c:set var="boardSeq" value="<%=boardSeq%>"/> <!-- 게시글 번호 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>

<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		checkAdmin();
	});
	
	function checkAdmin() {
		
		$.ajax({	
			
		    url		:"/admin/checkAdmin",
	        success : function(obj) {
	        	checkAdminCallback(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
		
	}
	
	function checkAdminCallback(obj) {

		var admin = obj.admin;
		
		if(admin == 1) {
			$("#root").val(1);
		}
		
		else {
			$("#root").val(0);
		}
		
		var root = $("#root").val();
		
		if(root == 1) {
			$("#board_writer").val("관리자");
			$("#board_writer").attr("readonly", true);
		}
		
	}
	
		
	/** 게시판 - 목록 페이지 이동 */
	function goBoardList(){				
		location.href = "/board/boardList";
	}
	
	/** 게시판 - 작성  */
	function insertBoard(){
		var boardSubject = $("#board_subject").val();
		var boardContent = $("#board_content").val();
		var boardPw = $("#board_pw").val();
		var boardWriter = $("#board_writer").val();
		
		if ($('input[name=sec_y]').is(":checked")) {
		    $('input[name=sec_yn]').val(1);
		} else {
		    $('input[name=sec_yn]').val(0);
		}
		
		if (boardSubject == ""){			
			alert("제목을 입력해주세요.");
			$("#board_subject").focus();
			return;
		}
		
		if (boardWriter == ""){			
			alert("작성자를 입력해주세요.");
			$("#board_writer").focus();
			return;
		}
		
		if (boardWriter == "관리자"){			
			alert("유효하지 않은 작성자명입니다.");
			$("#board_writer").focus();
			return;
		}
		
		if (boardContent == ""){			
			alert("내용을 입력해주세요.");
			$("#board_content").focus();
			return;
		}
			
		if (boardPw == ""){			
			alert("비밀번호을 입력해주세요.");
			$("#board_pw").focus();
			return;
		}
		
		var yn = confirm("게시글을 등록하시겠습니까?");		
		if(yn){
				
			$.ajax({	
				
			    url		: "/board/insertBoard",
			    data    : $("#boardForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
		        async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	insertBoardCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		    });
		}
	
			
	}
	
	/** 게시판 - 작성 콜백 함수 */
	function insertBoardCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 등록을 성공하였습니다.");				
				goBoardList();				 
			} else {				
				alert("게시글 등록을 실패하였습니다.");	
				return;
			}
		}
	}
	
</script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div class="inner">		
				<h2>게시글 작성</h2>	
				<input type="hidden" id="root" name="root" value=""/>
				<form id="boardForm" name="boardForm" action="/board/insertBoard" enctype="multipart/form-data" method="post" onsubmit="return false;">
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input id="board_subject" name="board_subject" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th>작성자<span class="t_red">*</span></th>
							<td><input id="board_writer" name="board_writer" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th>비밀번호<span class="t_red">*</span></th>
							<td><input id="board_pw" name="board_pw" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><textarea id="board_content" name="board_content" cols="10" rows="5" class="textarea01"></textarea></td>
						</tr>
						<tr>
							<th>비밀글<span class="t_red"></span></th>
							<td><input type="checkbox" name="sec_y" id="sec_y"/></td>
							<td><input type="hidden" name="sec_yn" id="sec_yn"/></td>
						</tr>
				    </tbody>
				</table>
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:insertBoard();">등록하기</button>
			</div>
		</div>
	</div>
</div>
<div id="cursor"></div>
</body>
</html>