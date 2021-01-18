<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file = "conn_db.jsp"%>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<title>회원가입</title>
<script type = "text/javascript"src="./resource/idCheck.js" ></script>
</head>
<body>
	<div class = "jumbotron">
		<div class = "display-3">회원가입</div>
	</div>
	<div class = "container">
		<div class = "text-center">
		<% 
		String error = request.getParameter("error");
		if(error != null) {
			out.println("<div class = 'alert alert-danger'>");
			out.println("다시 입력해주세요.");
			out.println("</div>");
		}
		
		%>
		
		
			<form action = "create_check.jsp" method="POST"name = "createForm">
				<p>ID : <input type ="text" name = "id" placeholder="ID를 입력해주세요">
						<input type ="button" value ="ID중복체크" onclick="idCheck()">
				</p>
				<p>password : <input type ="password" name = "password"placeholder="Password를 입력해주세요"></p>
				<p>이름 : <input type ="text" name = "name" placeholder="이름을 입력해주세요"></p>
				<p>email : <input type = "email" name = "email" placeholder="email을 적어주세요"></p>
				<p>성별 : <input type = "radio" name = "gender" value ="남자">남자
						<input type = "radio" name = "gender" value = "여자">여자</p>
				<button class = "btn btn-info" onclick="check()">회원가입</button>
			</form>
			<button class = "btn btn-dark" onclick="location.href='./main.jsp'">돌아가기</button>
		</div>
	
	</div>
</body>
</html>