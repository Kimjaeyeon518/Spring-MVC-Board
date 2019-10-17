<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료글 수정</title>
<%	
	String dataSeq = request.getParameter("dataSeq");		
%>
<c:set var="dataSeq" value="<%=dataSeq%>"/> <!-- 게시글 번호 -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>	
	
	$(document).ready(function() {
		getDataDetail();
	});
	
	function goDataList() {
		location.href="/data/dataList";
	}
	
	
	function getDataDetail(dataSeq) {
		
		var dataSeq = $("#data_seq").val();
		
		if(dataSeq != "") {
			
			$.ajax({
				type:"POST",
				url:"/data/getDataDetail",
				data: $("#dataForm").serialize(),
				dataType:"JSON",
				cache:false,
				async:true,
				success: function(obj) {
					getDataDetailCallback(obj);
				},
				error: function(xhr, status, error) {}
			});
		}
		else {
			alert("오류가 발생하였습니다.\n 관리자에게 문의하세요.");
		}
		
	}
	
	function getDataDetailCallback(obj) {

		var str = "";
		
		if(obj != null) {
			
				var dataSeq = obj.data_seq;
				var dataSubject = obj.data_subject;
				var dataContent = obj.data_content;
				var dataHits = obj.data_hits;
				var delYn = obj.del_yn;
				var insDate = obj.ins_date;
				var updDate = obj.upd_date;
				var files			= obj.files;		
				var filesLen		= files.length;
				
				
				$("#data_subject").val(dataSubject);
				$("#data_content").val(dataContent);
				
				if(filesLen > 0){
					
					var str="";
					
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
				
				$("#file_body").html(str);
		}
		
		else {
			alert("등록된 글이 존재하지 않습니다.");
			return;
		}
	}
	
	function updateData() {
		
		var dataSubject = $("#data_subject").val();
		var dataContent = $("#data_content").val();
		
		if(dataSubject == "") {
			alert("제목을 입력해주세요.");
			$("#data_subject").focus();
			return;
		}
		
		if(dataContent == "") {
			alert("내용을 입력해주세요.");
			$("#data_content").focus();
			return;
		}
	
		
		var yn = confirm("게시글을 수정하시겠습니까?");
		
		if(yn) {
			$.ajax({
				type:"POST",
				url:"/data/updateData",
				data: $("#dataForm").serialize(),
				dataType:"JSON",
				cache:false,
				async:true,
				success: function(obj) {
					updateDataCallback(obj);
				},
				error: function(xhr, status, error) {}
			});
		}
	}
	
	function updateDataCallback(obj) {
		
		if(obj != null) {
			var result = obj.result;
			
			if(result == "SUCCESS") {
				alert("게시글 수정을 성공하였습니다.");
				goDataList();
			}
			else {
				alert("게시글 수정을 실패하였습니다.")
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
				<h2>자료글 수정</h2>	
			<form id="dataForm" name="dataForm">
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span>표시는 필수입력 항목입니다.</strong></caption>
					<colgroup>
						<col width="20%"/>
						<col width="*"/>
					</colgroup>
					
					<tbody id="tbody">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input id="data_subject" name="data_subject" value="" class="tbox01"/></td>
						</tr>
						<tr>
							<th>작성자<span class="t_red"></span></th>
							<td readonly="readonly">관리자</td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td colspan="3"><textarea id="data_content" name="data_content" cols="50" rows="5" class="textarea01"></textarea></td>
						</tr>
					</tbody>
				</table>	
				<input type="hidden" id="data_seq" name="data_seq" value="${dataSeq}"/>
				<input type="hidden" id="search_type" name="search_type" value="U"/>
			</form>
				<table>
					<tbody >
						<tr>
							<th><span class="t_red"></span></th>
							<td id="file_body" colspan="3"></td>
						</tr>
					</tbody>
				</table>	
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goDataList();">목록으로</button>
				<button type="button" class="btn black" onclick="javascript:updateData();">수정하기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>