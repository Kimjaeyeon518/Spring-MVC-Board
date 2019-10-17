<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료글 상세</title>
<%	
	String dataSeq = request.getParameter("dataSeq");		
%>
<c:set var="dataSeq" value="<%=dataSeq%>"/> <!-- 게시글 번호 -->

<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>
<script src="/js/common/style.js"></script>
<!-- 공통 JavaScript -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){		
		getDataDetail();		
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
		
	}
	
	/** 게시판 - 목록 페이지 이동 */
	function goDataList(){				
		location.href = "/data/dataList";
	}
	
	/** 게시판 - 수정 페이지 이동 */
	
	function goDataUpdateAction(){
		
		location.href = "/data/dataUpdateAction?dataSeq="+ ${dataSeq};
	}
	
	/** 게시판 - 답글 페이지 이동 */
	function goDataReply(){
		
		var dataSeq = $("#data_seq").val();
		
		location.href = "/data/dataReply?dataSeq="+ ${dataSeq};
	}
	
	/** 게시판 - 첨부파일 다운로드 */
	function fileDownload(fileNameKey, fileName, filePath){
			
		location.href = "/data/fileDownload?fileNameKey="+fileNameKey+"&fileName="+fileName+"&filePath="+filePath;
	}
	
	/** 게시판 - 상세 조회  */
	function getDataDetail(dataSeq){
		
		var dataSeq = $("#data_seq").val();

		if(dataSeq != ""){
			
			$.ajax({	
				
			    url		: "/data/getDataDetail",
			    data    : $("#dataForm").serialize(),
		        dataType: "JSON",
		        cache   : false,
				async   : true,
				type	: "POST",	
		        success : function(obj) {
		        	getDataDetailCallback(obj);				
		        },	       
		        error 	: function(xhr, status, error) {}
		        
		     });
		} else {
			alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
		}			
	}
	
	/** 게시판 - 상세 조회  콜백 함수 */
	function getDataDetailCallback(obj){
		
		var str = "";
		
		if(obj != null){								
							
			var dataSeq		= obj.data_seq; 
			var dataSubject 	= obj.data_subject; 
			var dataContent 	= obj.data_content; 
			var dataHits 		= obj.data_hits;
			var delYn 			= obj.del_yn; 
			var insDate 		= obj.ins_date; 
			var updDate 		= obj.upd_date;
			var files			= obj.files;		
			var filesLen		= files.length;
						
			str += "<tr>";
			str += "<th>제목</th>";
			str += "<td>"+ dataSubject +"</td>";
			str += "<th>조회수</th>";
			str += "<td>"+ dataHits +"</td>";
			str += "</tr>";		
			str += "<tr>";
			str += "<th>작성자</th>";
			str += "<td>관리자</td>";
			str += "<th>작성일시</th>";
			str += "<td>"+ insDate +"</td>";
			str += "</tr>";		
			str += "<tr>";
			str += "<th>내용</th>";
			str += "<td colspan='3'>"+ dataContent +"</td>";
			str += "</tr>";
			
			if(filesLen > 0){
			
				for(var a=0; a<filesLen; a++){
					
					var dataSeq	= files[a].data_seq;
					var fileNo 		= files[a].file_no;
					var fileNameKey = files[a].file_name_key;
					var fileName 	= files[a].file_name;
					var filePath 	= files[a].file_path;
					var fileSize 	= files[a].file_size;
					var remark 		= files[a].remark;
					var delYn 		= files[a].del_yn;
					var insDate 	= files[a].ins_date;
					var updDate 	= files[a].upd_date;
					
					console.log("fileName : " + fileName);
					
					str += "<th>첨부파일</th>";
					//str += "<td onclick='javascript:fileDownload(\"" + fileNameKey + "\", \"" + fileName + "\", \"" + filePath + "\");' style='cursor:Pointer'>"+ fileName +"</td>";
					str += "<td><a href='/data/fileDownload?fileNameKey="+encodeURI(fileNameKey)+"&fileName="+encodeURI(fileName)+"&filePath="+encodeURI(filePath)+"'>" + fileName + "</a></td>";
					str += "</tr>";
				}	
			}			
			
		} else {
			
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}		
		
		$("#tbody").html(str);
	}
	
	/** 게시판 - 삭제  */
	function deleteData(){

		var dataSeq = $("#data_seq").val();
		var root = $("#root").val();
		
		if(root == 0) {
			alert("삭제는 관리자만 할 수 있습니다.");
			return;
		} 
		
		else {
			var yn = confirm("게시글을 삭제하시겠습니까?");		
			
			if(yn){
				
				$.ajax({	
					
				    url		: "/data/deleteData",
				    data    : $("#dataForm").serialize(),
			        dataType: "JSON",
			        cache   : false,
					async   : true,
					type	: "POST",	
			        success : function(obj) {
			        	deleteDataCallback(obj);				
			        },	       
			        error 	: function(xhr, status, error) {}
			        
			     });
			}
		}
	}
	
	/** 게시판 - 삭제 콜백 함수 */
	function deleteDataCallback(obj){
	
		if(obj != null){		
			
			var result = obj.result;
			
			if(result == "SUCCESS"){				
				alert("게시글 삭제를 성공하였습니다.");				
				goDataList();				
			} else {				
				alert("게시글 삭제를 실패하였습니다.");	
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
			<h2>자료글 상세</h2>	
			<input type="hidden" id="root" name="root" value="0"/>
			<form id="dataForm" name="dataForm">		
				<table width="100%" class="table01">
				    <colgroup>
				        <col width="15%">
				        <col width="35%">
				        <col width="15%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
				       
				    </tbody>
				</table>		
				<input type="hidden" id="data_seq"		name="data_seq"	value="${dataSeq}"/> <!-- 게시글 번호 -->
				<input type="hidden" id="search_type"	name="search_type" 	value="S"/> <!-- 조회 타입 - 상세(S)/수정(U) -->
			</form>
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goDataList();">목록으로</button>
				<button type="button" class="btn black mr5" onclick="javascript:goDataUpdateAction();">수정하기</button>
				<button type="button" class="btn black" onclick="javascript:deleteData();">삭제하기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>