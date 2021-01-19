
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="conn_db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<%
				if (session.getAttribute("name") != null) {
			%>
			<p class="display-4">
				어서오세요
				<%=session.getAttribute("name")%>님!
			</p>
			<button class="btn btn-info"
				onclick="location.href = './updateUser.jsp?id=<%=session.getAttribute("id")%>'"
				style="float: right; margin-right: 10px;">회원수정</button>
			<button class="btn btn-info"
				onclick="location.href = './deleteUser.jsp'"
				style="float: right; margin-right: 10px;">회원탈퇴</button>
			<button class="btn btn-info" onclick="location.href = 'logout.jsp'"
				style="float: right; margin-right: 10px;">로그아웃</button>
			<button class="btn btn-dark" onclick="location.href='./myself.jsp'"
				style="float: right; margin-right: 10px;">내 정보</button>
			<%
				if (session.getAttribute("GT").equals("2")) {
			%>
			<button class="btn btn-dark"
				onclick="location.href ='all_member.jsp'">전체 회원 보기</button>
			<%
				}

			} else {
			%>
			<button class="btn btn-info" type="button"
				onclick="location.href='createAccount.jsp'"
				style="float: right; margin-right: 10px;">회원가입</button>
			<button type="button" class="btn btn-info"
				onclick="location.href='login.jsp'"
				style="float: right; margin-right: 10px">로그인</button>
			<%
				}
			%>
		</div>
	</div>
	<div class="container"></div>
</body>
</html>