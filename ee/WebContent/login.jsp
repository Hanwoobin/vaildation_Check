<%@page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<html>
<head>
<title>login</title>
</head>
<body>
	<div class="jumbotron">
		<div class="display-4">
			<p class="text-success">Login</p>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<%
				String error = request.getParameter("error");
			if (error != null) {
				out.println("<div class ='alert alert-danger'>");
				out.println("아이디또는 비밀번호가 잘못됬습니다.");
				out.println("</div>");
			}
			%>
			<form action="login_check.jsp" method="POST">
				<p>
					ID : <input type="text" name="ID" placeholder="ID를 입력해주세요">
				</p>
				<p>
					Password : <input type="password" name="password"
						placeholder="password를 입력해주세요">
				</p>
				<button class = "btn btn-dark"type="submit">로그인</button>
			</form>
			<button class = "btn btn-dark" onclick="location.href='main.jsp'">돌아가기</button>
			<button class = "btn btn-dark" onclick="location.href='createAccount.jsp'">회원가입</button>
		</div>
	</div>
</body>
</html>