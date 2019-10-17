<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료 목록</title>
<!-- 공통 CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/common.css"/>
<!-- 공통 JavaScript -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){	
	checkAdmin();
	getDataList();
});		

function goMain() {
	location.href="/main/main";
}

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
		$("#login").html("");
		$("#root").val(1);
	}
	
	else {
		$("#logout").html("");
		$("#root").val(0);
	}
	
}


function goLogin() {
	location.href="/goLogin?board=2";
}

function goLogout() {

	$.ajax({	
		
	    url		:"/admin/noAdmin",
        success : function(obj) {
        	noAdminCallback(obj);				
        },	       
        error 	: function(xhr, status, error) {}
        
     });
}

function noAdminCallback(obj) {
	
	if(obj != null) {
		var result = obj.result;
		
		if(result == "SUCCESS") {
			alert("로그아웃 성공.");

			location.href="/data/dataList";
			
		}
		else {
			alert("로그아웃 실패")
			return;
		}
	}
}
	
	/** 게시판 - 상세 페이지 이동 */
	function goDataDetail(dataSeq){				
		location.href = "/data/dataDetail?dataSeq="+ dataSeq;
	}
		
	/** 게시판 - 작성 페이지 이동 */
	function goDataWrite(){		
		var root = $("#root").val();
		
		if(root == 1) {

			location.href = "/data/dataWrite";
		}
		else {
			alert("자료 업로드는 관리자만 가능합니다.");
			return;
		}
		
	}

	/** 게시판 - 목록 조회  */
	function getDataList(currentPageNo){
				
		if(currentPageNo === undefined){
			currentPageNo = "1";
		}
		
		$("#current_page_no").val(currentPageNo);
		
		$.ajax({	
			
		    url		:"/data/getDataList",
		    data    : $("#dataForm").serialize(),
	        dataType:"JSON",
	        cache   : false,
			async   : true,
			type	:"POST",	
	        success : function(obj) {
	        	getDataListCallback(obj);				
	        },	       
	        error 	: function(xhr, status, error) {}
	        
	     });
	}
	
	/** 게시판 - 목록 조회  콜백 함수 */
	function getDataListCallback(obj){
		var state = obj.state;
		
		if(state == "SUCCESS"){
			
			var data = obj.data;			
			var list = data.list;
			var listLen = list.length;		
			var totalCount = data.totalCount;
			var pagination = data.pagination;
				
			var str = "";
			
			if(listLen >  0){
				
				for(var a=0; a<listLen; a++){
					
					var dataSeq		= list[a].data_seq; 
					var dataSubject 	= list[a].data_subject; 
					var dataContent 	= list[a].data_content; 
					var dataHits 		= list[a].data_hits;
					var delYn 			= list[a].del_yn; 
					var insDate 		= list[a].ins_date; 
					var updDate 		= list[a].upd_date;
					
					
					str += "<tr>";
				
						str += "<td >"+ dataSeq +"</td>";
										
						str += "<td onclick='javascript:goDataDetail("+ dataSeq +");' style='cursor:pointer'>";
					
						
						str += dataSubject +"</td>";
											
						str += "<td>"+ dataHits +"</td>";	
						str += "<td>"+ insDate +"</td>";	
						str += "</tr>";
						
					
					
				} 
				
			} else {
				
				str += "<tr>";
				str += "<td colspan='5'>등록된 글이 존재하지 않습니다.</td>";
				str += "<tr>";
			}
			
			$("#tbody").html(str);
			$("#total_count").text(totalCount);
			$("#pagination").html(pagination);
			
		} else {
			alert("관리자에게 문의하세요.");
			return;
		}		
	}
	
</script>
</head>
<body>
<div id="wrap">
	<div id="container">
		<div class="inner">		
			<h2>자료실</h2>			
			<a id="login" onclick="goLogin()" style="cursor : pointer">관리자 로그인</a>
			<a id="logout" onclick="goLogout()" style="cursor : pointer">관리자 로그아웃</a>
			<a id="main" onclick="goMain()" style="cursor : pointer">홈으로</a>
			<input type="hidden" id="root" name="root" value="0"/>
			<form id="dataForm" name="dataForm">
				<input type="hidden" id="function_name" name="function_name" value="getDataList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
				
				<div class="page_info">
					<span class="total_count"><strong>전체</strong> : <span id="total_count" class="t_red">0</span>개</span>
				</div>
			
				<table width="100%" class="table01">
					<colgroup>
						<col width="10%" />
						<col width="25%" />
						<col width="10%" />
						<col width="15%" />
						<col width="20%" />
					</colgroup>
					<thead>		
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="tbody">
					
					</tbody>	
				</table>
			</form>			
			<div class="btn_right mt15">
				<button type="button" class="btn black mr5" onclick="javascript:goDataWrite();" style='cursor:pointer'>작성하기</button>
			</div>
		</div>
		
		<div id="pagination"></div>
			
	</div>
</div>
</body>
</html>