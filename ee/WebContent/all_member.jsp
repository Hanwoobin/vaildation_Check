<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="./conn_db.jsp"%>

<html>
<head>
<title>전체 회원 명단</title>
<script type ="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 회원을 삭제합니다!!")== true)
			location.href = "./deleteMember.jsp?id=" +id;
		else
			return;
	}
</script>
</head>
<body>
	<button onclick="location.href='./main.jsp'">메인페이지</button>
	<table border="1">
		<tr>
			<td>ID</td>
			<td>password</td>
			<td>name</td>
			<td>email</td>
			<td>성별</td>
			<td>삭제/수정</td>
		</tr>
		<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from e2_user";
		
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();
		
		while(rs.next()) {%>
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("password") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("gender") %></td>
			<td><button onclick="deleteConfirm('<%=rs.getString("id")%>')">삭제</button>
				<button onclick="location.href = 'update.jsp?id=<%=rs.getString("id")%>'">수정</button>
			</td>
		</tr>
		<%
		
		}
		%>
	</table>
</body>
</html>