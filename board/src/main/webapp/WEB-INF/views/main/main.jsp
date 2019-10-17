<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<style>
		ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		li { float: left; }
		li a {
			display: inline;
			color: white;
			padding: 8px;
			text-decoration: none;
			text-align: center;
			font-weight: bold;
		}
		li a:hover {
			background-color: white;
			color: black;
			cursor:none;
		    animation-duration: 1s;
		    animation-name: slidein1;
		}

		@keyframes slidein1 {
		    0% {
		        color: white;
		        background-color: black;
		    }
		  
		    100% {
		        color: black;
		        background-color: white;
		    }
		}
	</style>
    <title>
        Jaeyeon KIM
    </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">
    <script 
    src="https://cdnjs.cloudflare.com/ajax/libs/intense-images/1.0.7/intense.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/common/style.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/js/common/style.js"></script>
    <script>
	    function goBoardList() {
	
	    		location.href="/board/boardList";
	    	
	    }
	    
	    function goDataList() {
	    	
	    		location.href="/data/dataList";
	    }
    </script>
</head>
<body>
    <div id="jaeyeonKim">Jaeyeon KIM</div>
    	<ul>
		<li><a onclick="goBoardList()">자유 게시판</a></li>
		<li><a onclick="goDataList()">자료실</a></li>
		</ul>
        <div class="container">
            <div class="box" id="one">
                <div class="photo1" data-image="photo-01.jpg"
                onclick="profileClick()">
                    <div id="profile">PROFILE</div>
                </div>
            </div>
            <div class="box" id="two">
                <div class="photo2" data-image="photo-02.jpg"
                onclick="studyClick()">
                    <div id="study">STUDY</div>
                </div>
            </div>
            <div class="box" id="three">
                <div class="photo3" data-image="photo-03.jpg"
                onclick="goalClick()">
                    <div id="goal">PLAN</div>
            </div>
        </div>
    </div>
    
    <div id="cursor"></div>
</body>
</html>