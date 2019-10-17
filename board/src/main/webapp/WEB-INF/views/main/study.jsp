<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%	
	String root = request.getParameter("root");		
%>

<c:set var="root" value="<%=root%>"/> <!-- 게시글 번호 -->

        <title>
            STUDY 
        </title>
            <link rel="stylesheet" href="/css/common/style.css">
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="/js/common/style.js"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 

            <script src="https://code.jquery.com/jquery-1.11.3.js"></script> 

            <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
    <div class="profileHeader">
        <h2 id="title" data-title="STUDY">STUDY</h2>
        <div class="profileContainer">
            <div class="language">
                <p>Language :JAVA, HTML5, CSS3, Javascript, JQuery, JSP & Servlet, Spring</p>
            </div>
            <div class="project">
                <p>Project 1 : The World's Hardest Game - C#, Database</p>
                <p>Project 2 : 'Danggo' web page(login + validation, notice, inquiry etc) - HTML5, CSS3, Javascript, Jquery, Ajax</p>
            </div>
            <div class="home__slider"> 
                <div class="bxslider" id="slide1"> 
                    <div><img src="/css/common/1.PNG" alt="그림3"></div> 
                    <div><img src="/css/common/2.PNG" alt="그림4"></div>
                </div> 
            </div> 
            <div class="home__slider"> 
                <div class="bxslider" id="slide1"> 
                    <div><img src="/css/common/3.PNG" alt="그림3"></div> 
                    <div><img src="/css/common/4.PNG" alt="그림4"></div>
                </div> 
            </div> 
        </div>
        <button class="studybackbtn"></button>
        <div id="cursor"></div>
    </div>
</body>
</html>
