<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>JSP</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<nav class="navbar navbar-expand-md sticky-top">
	<button class="navbar-toggler btn btn-dark" type="button" data-toggle="collapse" data-target="#collapsiblebar">
		<span class="navbar-toggler-icon text-dark" ></span>
	</button>
	<div class="collapse" id="collapsiblebar">
		<a class="navbar-brand nav-link" href="home" style="color:#FFFFFF;font-family:fascinate;font-weight:bold;font-size:3vw;text-shadow:0 -3px red, 3px 3px blue, -3px 3px green;">
			<img class="rounded-circle" src="image/mio.png" alt="logo" style="width:35%;"/>
			MIO WORLD
		</a>
		<ul class="navbar-nav nav">
			<li class="nav-item">
				<a class="nav-link" href="home">
					<i class="fas fa-home"></i>Home
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="intro">
					<i class="fas fa-cat"></i>Info
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="navigator">
					<i class="fas fa-dog"></i>Relative
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link disabled" href="#">
					<i class="fas fa-hammer"></i>Construction...
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="table">
					<i class="fas fa-book"></i>Table
				</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdownMenu" data-toggle="dropdown">more</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="userPage">my page</a><!-- 화면 전환 -->
					<a class="dropdown-item" href="customerServices">고객센터</a><!-- toggle버튼 고려 -->
				</div>
			</li>
			<sec:authorize access="isAnonymous()">
				<li class="nav-item">
					<a class="nav-link" href="loginView" id="loginView">Log in</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="joinForm" >Sign-Up</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item">
					<a class="nav-link" href="logoutView">로그아웃</a>
				</li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGE')">
				<li class="nav-item">
					<a class="nav-link" href="managerPage">관리자</a>
				</li>
			</sec:authorize>
		</ul>
	</div>
</nav>

<div id="mainRegion" class="container mt-3">
	<h3 id="linfo" class="text-center multiEffect text-warning"></h3>
	<h3 class="text-center text-info threeDEffect">로그인</h3>
	<div id="div1" class="text-center text-danger mb-3"></div>
	<!-- 로그인 관련 메세지를 서버에서 받아 작성 -->
	<form id="frm1" name="frm1" method="post" action="login">
		<!-- csrf를 방지하기 위한 헤더 부분을 숨겨서 추가 -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />		
		<div class="form-group">
			<label for="Id">아이디</label>
			<input type="text" class="form-control" id="id" name="id" required>
		</div>
	
		<div class="form-group">
			<label for="Password">비밀번호</label>
			<input type="password" class="form-control" id="pw" name="pw" required>
		</div>

		<!-- 로그아웃 안하고 접속 단절후  일정시간 로그인 없이 재접속 -->
		<div class="form-group form-check">
			<input type="checkbox" class="form-check-input" id="rememberMe" name="remember-me" checked>
			<label class="form-check-label" for="rememberMe" aria-describedby="rememberMeHelp">remember-me</label>			
		</div>
		
		<button type="submit" class="btn btn-success">로그인</button>&nbsp;&nbsp;&nbsp;		  
		<a id="lJoinView" href="joinView" class="btn btn-danger">회원가입</a>	
	</form>
</div>

<script>
$(document).ready(function(){ 
	$("#loginView").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#loginView").attr("href"),
			type : "GET",
			date : "",
			success : function(data) {				
				$("#mainRegion").html(data);
				$("#hjumbo").text("회원가입창으로 ajax와 암호화를 사용합니다.");
			},
			error : function() {				
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}			
		});
	});	
	
	$("#ljoinView").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#lloginView").attr("href"),
			type : "GET",
			date : "",
			success : function(data) {				
				$("#mainRegion").html(data);
				$("#hjumbo").text("회원가입창으로 ajax와 암호화를 사용합니다.");
			},
			error : function() {				
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}			
		});
	});	
});
</script>
</body>
</html>