<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*"  %>
<% 
	//컨텍스트명 알아내기
	String myctx=request.getContextPath();
	//System.out.println("myctx="+myctx); //==> "/MyWeb"
	UserVO loginUser=(UserVO)session.getAttribute("loginUser");
	
	boolean isLogin=(loginUser==null)?false:true;
			
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>homepage</title>
    <!-- layout.css파일을 참조하세요 -->
    <link rel="stylesheet" type="text/css" href="<%=myctx%>/css/layout.css">
    <!-- http://localhost:9090/css/layout.css -->
    <!-- "webapps/ROOT" ===>"/" -->
    
</head>
<body>
    <div id="wrap">
        <!-- 헤더: 로고이미지, 검색폼, 목차 등 -->
        <header>
            <!-- header -->
            <a href="main.jsp">
                <img src="<%=myctx%>/images/logo.png">
            </a>
        </header>
        <div class="cls"></div>
        <!-- 네비게이션바: 메뉴 -->
        <nav>
            <!-- nav -->
            <ul>
                <li><a href="<%=myctx%>/main.jsp">HOME</a></li>
             
                <%
                if(!isLogin){//로그인 하지 않았다면
                %>
                	<li><a href="<%=myctx%>/member/join.jsp">Signup</a></li>
               		 <li><a href="<%=myctx%>/login/login.jsp">Signin</a></li>
                <%}else{  //로그인 했다면 %>
                	<li><a href="<%=myctx%>/login/logout.jsp">Logout</a></li>
                <%} %>
                <li><a href="<%=myctx%>/board/list.jsp">Board</a></li>
                <li><a href="<%=myctx%>/member/list.jsp">Users</a>
                
                <% if(isLogin){ %>
                <li style="background-color:#19376D;border-radius:5px">
                <a href="#" style='color:white'><%=loginUser.getUserid()%>님 로그인 중</a>
                <% }%>
            </ul>
        </nav>
        <div class="cls"></div>
        <!-- article : 주로 컨텐츠가 들어감 -->
        <article>