<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="./conn_db.jsp"%>

<html>
<head>
<title>전체 회원 명단</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 회원을 삭제합니다!!") == true)
			location.href = "./deleteMember.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<body>
	<div class="jumbotron"></div>
	<div class="text-center">
		<button class="btn btn-success" onclick="location.href='./main.jsp'">메인페이지</button>
		<div class="container">
			<table border="1" style="width:100%; text-align: center;">
				<tr>
					<td>ID</td>
					<td>password</td>
					<td>name</td>
					<td>email</td>
					<td>성별</td>
					<td>회원등급</td>
					<td>삭제/수정</td>
				</tr>
				<%
					PreparedStatement pstmt = null;
				ResultSet rs = null;

				String sql = "select * from e2_user";

				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					String GT = null;

					if (rs.getString("GT").equals("2")) {
						GT = "관리자";
					} else if (rs.getString("GT").equals("3")) {
						GT = "휴먼회원";
					} else {
						GT = "일반회원";
					}
				%>
				<tr>
					<td><%=rs.getString("id")%></td>
					<td><%=rs.getString("password")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("gender")%></td>
					<td><%=GT%></td>
					<td><button class = "btn btn-danger"style ="width: 48%;" onclick="deleteConfirm('<%=rs.getString("id")%>')">삭제</button>
						<button class = "btn btn-info" style ="width: 48%;"
							onclick="location.href = 'update.jsp?id=<%=rs.getString("id")%>'">수정</button>
					</td>
				</tr>
				<%
					}
				%>
			</table>

		</div>
	</div>
</body>
</html>