<%@page import="com.fasterxml.jackson.databind.annotation.JsonPOJOBuilder.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>

<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>
<script src="/js/common/style.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/common/jquery.form.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		
	});
		
	/** 게시판 - 목록 페이지 이동 */
	function goDataList(){				
		location.href = "/data/dataList?root=${root}";
	}
	
	/** 게시판 - 작성  */
	function insertData(){
		var dataSubject = $("#data_subject").val();
		var dataContent = $("#data_content").val();
		var dataPw = $("#data_pw").val();
		
		if (dataSubject == ""){			
			alert("제목을 입력해주세요.");
			$("#data_subject").focus();
			return;
		}
		
		if (dataContent == ""){			
			alert("내용을 입력해주세요.");
			$("#data_content").focus();
			return;
		}
			
		if (dataPw == ""){			
			alert("비밀번호을 입력해주세요.");
			$("#data_pw").focus();
			return;
		}
		
		
		var yn = confirm("게시글을 등록하시겠습니까?");		
		if(yn){
			
			
				$("#dataForm").ajaxForm({
			    
					url		: "/data/insertData",
					enctype	: "multipart/form-data",
					cache   : false,
			        async   : true,
					type	: "POST",
					success : function(obj) {
				    	insertDataCallback(obj);				
				    },	       
				    error 	: function(xhr, status, error) {
				    	alert("파일을 첨부해주세요.");
						$("#files[0]").focus();
						return;
				    }
				    
			    }).submit();
			}
		
			
	}
	
	/** 게시판 - 작성 콜백 함수 */
	function insertDataCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 등록을 성공하였습니다.");				
				goDataList();				 
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
			<form id="dataForm" name="dataForm" action="/data/insertData" enctype="multipart/form-data" method="post" onsubmit="return false;">
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input id="data_subject" name="data_subject" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><textarea id="data_content" name="data_content" cols="10" rows="5" class="textarea01"></textarea></td>
						</tr>
						<tr>
							<th>비밀번호<span class="t_red">*</span></th>
							<td><input id="data_pw" name="data_pw" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td><input type="file" id="files[0]" name="files[0]" value=""></td>
						</tr>
				    </tbody>
				</table>
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goDataList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:insertData();">등록하기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>